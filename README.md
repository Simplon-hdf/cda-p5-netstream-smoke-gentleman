# cda-p5-netstream-smoke-gentleman

## Requêtes SQL

```
SELECT title, release_date from movies 
ORDER BY release_date DESC;

```

```
SELECT first_name_actor, last_name_actor, EXTRACT(YEAR FROM AGE(CURRENT_DATE, date_of_birth)) AS age from actors
 WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, date_of_birth)) > 30;

```

```
SELECT first_name_actor, last_name_actor from actors
    INNER JOIN character_actors ON character_actors.actor_id = actors.id
        INNER JOIN characters ON characters.id = character_actors.character_id
            INNER JOIN movies_characters ON movies_characters.character_id = characters.id
                INNER JOIN movies ON movies.id = movies_characters.movie_id
WHERE title = 'Dune' and character_type = 'principal';
```

```
SELECT title from movies
    INNER JOIN movies_characters ON movies_characters.movie_id = movies.id
        INNER JOIN characters ON characters.id = movies_characters.character_id
            INNER JOIN character_actors ON character_actors.character_id = characters.id
                INNER JOIN actors ON actors.id = character_actors.actor_id
                    WHERE first_name_actor = 'Robert' and last_name_actor = 'De Niro';

```

```
INSERT INTO movies (title, length, release_date, director_id) VALUES
  ('Inception', 148, '2010-07-16', (SELECT id FROM directors WHERE last_name_director = 'Nolan')),
```

```
INSERT INTO actors (first_name_actor, last_name_actor, date_of_birth) VALUES
  ('Leonardo', 'DiCaprio', '1974-11-11'),
```