# 📽️ cda-p5-netstream-smoke-gentleman

Ce projet concerne la création de la base de données de **Netstream**, de sa conception à sa mise en place.

---

## 📋 Sommaire

- [📜 Règles de gestion](.docs/business-rules.md)
- [📖 Lexique](.docs/data-glossary.md)
- [📚 Dictionnaire de données](.docs/data-dictionary.md)
- [🖼️ MCD](.docs/MCD.png)
- [🖼️ MLD](.docs/MLD.png)
- [🖼️ MPD](.docs/MPD.png)
- [⚙️ Choix du SGBDR](.docs/database-engine-selection.md)
- [💾 Politique de sauvegarde](.docs/save.md)
- [🛠️ Les requêtes SQL](#requêtes-SQL)
- [🚀 Les requêtes avancées](#requêtes-avancées)

---

## 🛠️ Requêtes SQL

### 🎬 Les titres et dates de sortie des films du plus récent au plus ancien

```sql
SELECT title, release_date from movies
ORDER BY release_date DESC;

```

### 👩‍🎤 Les noms, prénoms et âges des acteurs/actrices de plus de 30 ans dans l'ordre alphabétique

```sql
SELECT first_name_actor, last_name_actor, EXTRACT(YEAR FROM AGE(CURRENT_DATE, date_of_birth)) AS age from actors
 WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, date_of_birth)) > 30;

```

### ⭐ La liste des acteurs/actrices principaux pour un film donné

```sql
SELECT first_name_actor, last_name_actor FROM actors
     INNER JOIN movies_actors ON actors.actor_id = movies_actors.actor_id 
     INNER JOIN character_actors ON character_actors.actor_id = actors.actor_id 
             INNER JOIN characters ON characters.character_id = character_actors.character_id
                 INNER JOIN movies_characters ON movies_characters.character_id = characters.character_id
                     INNER JOIN movies ON movies.movie_id = movies_characters.movie_id
 WHERE title = 'Psycho' AND character_type = 'principal' AND movies_actors.movie_id = movies.movie_id;
```

### 🎥 La liste des films pour un acteur/actrice donné

```sql
SELECT title from movies
    INNER JOIN movies_actors ON movies.movie_id = movies_actors.movie_id
        INNER JOIN actors ON actors.actor_id = movies_actors.actor_id
WHERE first_name_actor = 'Andrew' and last_name_actor = 'Garfield';

```

### ➕ Ajouter un film

```sql
INSERT INTO movies (title, length, release_date, director_id)
 VALUES (
   'Spider-Man: Homecoming',
   133,
   '2017-07-07',
   (SELECT director_id FROM directors WHERE last_name_director = 'Scott')
 )
 ON CONFLICT (title, length, release_date, director_id)
 DO NOTHING;
```
### ➕ Ajouter un acteur/actrice

```sql
INSERT INTO actors (first_name_actor, last_name_actor, date_of_birth)
VALUES ('Jim', 'Carrey', '1962-01-17')
ON CONFLICT (first_name_actor, last_name_actor, date_of_birth)
DO NOTHING;
```

### ✏️ Modifier un film

```sql
UPDATE movies
  SET length = 175
  WHERE title = 'Inception' AND length = 148 AND release_date = '2010-07-16';
```

### ❌ Supprimer un acteur/actrice

```sql
DELETE FROM actors
WHERE first_name_actor = 'Leonardo'
  AND last_name_actor = 'DiCaprio'
  AND date_of_birth = '1974-11-11';
```
### 🕒 Afficher les 3 derniers acteurs/actrices ajouté(e)s

```sql
SELECT * from actors
 ORDER BY created_at DESC
 LIMIT 3;
```
---

## 🚀 Requêtes avancées

### 🎞️ Fonction pour lister les films selon les réalisateurs :

```sql
CREATE OR REPLACE FUNCTION listFilmsRealisateur(
     inputFirstName VARCHAR,
     inputLastName VARCHAR
 )
 RETURNS TABLE(title VARCHAR(200), release_date DATE)
 LANGUAGE plpgsql
 AS $$
 BEGIN
     RETURN QUERY
     SELECT m.title, m.release_date
     FROM movies m
     INNER JOIN directors d ON m.director_id = d.director.id
     WHERE d.first_name_director = inputFirstName
        OR d.last_name_director = inputLastName;
 END;
 $$;

```
### 🎭 Opérations CRUD pour ajouter un acteur au sein d'un film avec des procédures stockées :

```sql
-- Procédure pour ajouter un nouvel acteur à un film
CREATE OR REPLACE PROCEDURE add_actor_to_movie(
     actorFirstName VARCHAR,
     actorLastName VARCHAR,
     actorDOB DATE,
     movieTitle VARCHAR,
     movieReleaseDate DATE,
     movieLength INT
 )
 LANGUAGE plpgsql
 AS $$
 DECLARE
     actorId UUID;
     movieId UUID;
     characterId UUID;
 BEGIN
     -- Vérifier si l'acteur existe déjà
     SELECT actor_id INTO actorId
     FROM actors
     WHERE first_name_actor = actorFirstName AND last_name_actor = actorLastName AND date_of_birth = actorDOB;
 
     -- Si l'acteur n'existe pas, le créer
     IF actorId IS NULL THEN
         INSERT INTO actors (first_name_actor, last_name_actor, date_of_birth)
         VALUES (actorFirstName, actorLastName, actorDOB)
         RETURNING actor_id INTO actorId;
     END IF;
 
     -- Récupérer l'ID du film avec le titre, la date de sortie et la durée pour le différencier
     SELECT movie_id INTO movieId
     FROM movies
     WHERE title = movieTitle
       AND release_date = movieReleaseDate
       AND length = movieLength;
 
     -- Vérifier si le film existe
     IF movieId IS NULL THEN
         RAISE EXCEPTION 'Le film % avec la date % et la durée % n''existe pas.', movieTitle, movieReleaseDate, movieLength;
     END IF;
 
     -- Ajouter l'association entre l'acteur et le personnage générique
     INSERT INTO movies_actors (actor_id, movie_id)
     VALUES (actorId, movieId);
 
END;
$$;


-- Procédure pour lire les acteurs d'un film
CREATE OR REPLACE FUNCTION get_actors_by_movie(
     movieTitle VARCHAR,
     movieLength INT,
     movieReleaseDate DATE
 )
 RETURNS TABLE(first_name_actor VARCHAR, last_name_actor VARCHAR, date_of_birth DATE)
 LANGUAGE plpgsql
 AS $$
 BEGIN
     -- Retourner les acteurs associés au film avec les critères supplémentaires
     RETURN QUERY
     SELECT a.first_name_actor, a.last_name_actor, a.date_of_birth
     FROM actors a
     INNER JOIN movies_actors ma ON a.actor_id = ma.actor_id
        INNER JOIN movies m ON ma.movie_id = m.movie_id
     WHERE m.title = movieTitle
       AND m.length = movieLength
       AND m.release_date = movieReleaseDate;
END;
$$;



-- Procédure pour mettre à jour les informations d'un acteur
CREATE OR REPLACE PROCEDURE update_actor(
    actorId UUID,
    newFirstName VARCHAR,
    newLastName VARCHAR,
    newDOB DATE
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE actors
    SET first_name_actor = newFirstName,
        last_name_actor = newLastName,
        date_of_birth = newDOB,
        updated_at = NOW()
    WHERE actor_id = actorId;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'L''acteur avec l''ID % n''existe pas.', actorId;
    END IF;
END;
$$;

-- Procédure pour supprimer un acteur d'un film
CREATE OR REPLACE PROCEDURE delete_actor_from_movie(
    actorId UUID,
    movieTitle VARCHAR,
    movieLength INT,
    movieReleaseDate DATE
)
LANGUAGE plpgsql
AS $$
DECLARE
    movieId UUID;
BEGIN
    -- Récupérer l'ID du film
    SELECT movie_id INTO movieId
    FROM movies
    WHERE title = movieTitle
    AND release_date = movieReleaseDate
    AND length = movieLength;
 

    -- Vérifier si le film existe
    IF movieId IS NULL THEN
        RAISE EXCEPTION 'Le film % n''existe pas.', movieTitle;
    END IF;

    -- Supprimer l'association entre l'acteur et le film
    DELETE FROM movies_actors
    WHERE movie_id = movieId
    AND actors_id IN (
        SELECT actors_id
        FROM movie_actors
        WHERE actor_id = actorId
    );
END;
$$;

-- Cette fonction permet de conserver un historique des modifications apportées aux utilisateurs

CREATE OR REPLACE FUNCTION log_spectator_updates()
RETURNS TRIGGER AS $$
DECLARE
    old_row jsonb := to_jsonb(OLD);
    new_row jsonb := to_jsonb(NEW);
BEGIN
    INSERT INTO archives (id, archive_date, modified_field, old_value, new_value, spectator_id)
    SELECT
        gen_random_uuid(),
        NOW(),
        col.column_name,
        old_row ->> col.column_name,
        new_row ->> col.column_name,
        NEW.id
    FROM information_schema.columns col
    WHERE col.table_name = 'spectators'
      AND old_row ->> col.column_name IS DISTINCT FROM new_row ->> col.column_name;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


-- Création du trigger qui s'active après chaque modification d'un spectateur

CREATE TRIGGER track_spectator_updates
AFTER UPDATE ON spectators
FOR EACH ROW
EXECUTE FUNCTION log_spectator_updates();

```

