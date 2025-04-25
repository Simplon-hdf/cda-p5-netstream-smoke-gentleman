# cda-p5-netstream-smoke-gentleman



## Requêtes avancées 

Fonction pour lister les films selon les réalisateurs : 

```sql
CREATE OR REPLACE FUNCTION listFilmsRealisateur(
    inputFirstName VARCHAR,
    inputLastName VARCHAR
)
RETURNS TABLE(title TEXT, release_date DATE)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT m.title, m.release_date
    FROM movies m
    INNER JOIN directors d ON m.director_id = d.id
    WHERE d.first_name = inputFirstName
       OR d.last_name = inputLastName;
END;
$$;
```
Opérations CRUD pour ajouter un acteur au sein d'un film avec des procédures stockées : 

```sql
-- Procédure pour ajouter un nouvel acteur à un film
CREATE OR REPLACE PROCEDURE add_actor_to_movie(
    actorFirstName VARCHAR,
    actorLastName VARCHAR,
    actorDOB DATE,
    movieTitle VARCHAR
)
LANGUAGE plpgsql
AS $$
DECLARE
    actorId UUID;
    movieId UUID;
BEGIN
    -- Vérifier si l'acteur existe déjà
    SELECT id INTO actorId
    FROM actors
    WHERE first_name_actor = actorFirstName AND last_name_actor = actorLastName AND date_of_birth = actorDOB;

    -- Si l'acteur n'existe pas, le créer
    IF actorId IS NULL THEN
        INSERT INTO actors (first_name_actor, last_name_actor, date_of_birth)
        VALUES (actorFirstName, actorLastName, actorDOB)
        RETURNING id INTO actorId;
    END IF;

    -- Récupérer l'ID du film
    SELECT id INTO movieId
    FROM movies
    WHERE title = movieTitle;

    -- Vérifier si le film existe
    IF movieId IS NULL THEN
        RAISE EXCEPTION 'Le film % n''existe pas.', movieTitle;
    END IF;

    -- Ajouter l'acteur au film (via un personnage générique)
    INSERT INTO movies_characters (movie_id, character_id, character_type)
    VALUES (movieId, gen_random_uuid(), 'Generic Character');
END;
$$;

-- Procédure pour lire les acteurs d'un film
CREATE OR REPLACE PROCEDURE get_actors_by_movie(
    movieTitle VARCHAR
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Afficher les acteurs associés au film
    PERFORM
    (
        SELECT a.first_name_actor, a.last_name_actor, a.date_of_birth
        FROM actors a
        INNER JOIN character_actors ca ON a.id = ca.actor_id
        INNER JOIN movies_characters mc ON ca.character_id = mc.character_id
        INNER JOIN movies m ON mc.movie_id = m.id
        WHERE m.title = movieTitle
    );
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
    WHERE id = actorId;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'L''acteur avec l''ID % n''existe pas.', actorId;
    END IF;
END;
$$;

-- Procédure pour supprimer un acteur d'un film
CREATE OR REPLACE PROCEDURE delete_actor_from_movie(
    actorId UUID,
    movieTitle VARCHAR
)
LANGUAGE plpgsql
AS $$
DECLARE
    movieId UUID;
BEGIN
    -- Récupérer l'ID du film
    SELECT id INTO movieId
    FROM movies
    WHERE title = movieTitle;

    -- Vérifier si le film existe
    IF movieId IS NULL THEN
        RAISE EXCEPTION 'Le film % n''existe pas.', movieTitle;
    END IF;

    -- Supprimer l'association entre l'acteur et le film
    DELETE FROM movies_characters
    WHERE movie_id = movieId
    AND character_id IN (
        SELECT character_id
        FROM character_actors
        WHERE actor_id = actorId
    );

    -- Supprimer l'acteur si plus aucune association n'existe
    DELETE FROM actors
    WHERE id = actorId
    AND NOT EXISTS (
        SELECT 1
        FROM character_actors
        WHERE actor_id = actorId
    );
END;
$$;

```

