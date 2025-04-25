-- Insertion des réalisateurs
INSERT INTO directors (id, first_name_director, last_name_director) VALUES
(gen_random_uuid(), 'Christopher', 'Nolan'),
  (gen_random_uuid(), 'Quentin', 'Tarantino'),
  (gen_random_uuid(), 'Sofia', 'Coppola'),
  (gen_random_uuid(), 'Steven', 'Spielberg'),
  (gen_random_uuid(), 'James', 'Cameron'),
  (gen_random_uuid(), 'Greta', 'Gerwig'),
  (gen_random_uuid(), 'Denis', 'Villeneuve'),
  (gen_random_uuid(), 'Martin', 'Scorsese'),
  (gen_random_uuid(), 'Patty', 'Jenkins');

-- Insertion des films
INSERT INTO movies (id, title, length, release_date, director_id) VALUES
  (gen_random_uuid(), 'Inception', 148, '2010-07-16', (SELECT id FROM directors WHERE last_name_director = 'Nolan')),
  (gen_random_uuid(), 'Pulp Fiction', 154, '1994-10-14', (SELECT id FROM directors WHERE last_name_director = 'Tarantino')),
  (gen_random_uuid(), 'Lost in Translation', 102, '2003-10-03', (SELECT id FROM directors WHERE last_name_director = 'Coppola')),
  (gen_random_uuid(), 'Jurassic Park', 127, '1993-06-11', (SELECT id FROM directors WHERE last_name_director = 'Spielberg')),
  (gen_random_uuid(), 'Avatar', 162, '2009-12-18', (SELECT id FROM directors WHERE last_name_director = 'Cameron')),
  (gen_random_uuid(), 'Lady Bird', 94, '2017-09-01', (SELECT id FROM directors WHERE last_name_director = 'Gerwig')),
  (gen_random_uuid(), 'Dune', 155, '2021-10-22', (SELECT id FROM directors WHERE last_name_director = 'Villeneuve')),
  (gen_random_uuid(), 'The Irishman', 209, '2019-09-27', (SELECT id FROM directors WHERE last_name_director = 'Scorsese')),
  (gen_random_uuid(), 'Wonder Woman', 141, '2017-06-02', (SELECT id FROM directors WHERE last_name_director = 'Jenkins'));


-- Insertion des personnages
INSERT INTO characters (id, name_character) VALUES
  (gen_random_uuid(), 'Dom Cobb'),
  (gen_random_uuid(), 'Vincent Vega'),
  (gen_random_uuid(), 'Charlotte'),
  (gen_random_uuid(), 'Dr. Alan Grant'),
  (gen_random_uuid(), 'Ellie Sattler'),
  (gen_random_uuid(), 'Jake Sully'),
  (gen_random_uuid(), 'Neytiri'),
  (gen_random_uuid(), 'Christine McPherson'),
  (gen_random_uuid(), 'Paul Atreides'),
  (gen_random_uuid(), 'Frank Sheeran'),
  (gen_random_uuid(), 'Diana Prince'),
  (gen_random_uuid(), 'Chani Kynes'),
  (gen_random_uuid(), 'Jimmy Hoffa');

-- Insertion des acteurs
INSERT INTO actors (id, first_name_actor, last_name_actor, date_of_birth) VALUES
  (gen_random_uuid(), 'Leonardo', 'DiCaprio', '1974-11-11'),
  (gen_random_uuid(), 'John', 'Travolta', '1954-02-18'),
  (gen_random_uuid(), 'Scarlett', 'Johansson', '1984-11-22'),
  (gen_random_uuid(), 'Sam', 'Neill', '1947-09-14'),
  (gen_random_uuid(), 'Laura', 'Dern', '1967-02-10'),
  (gen_random_uuid(), 'Sam', 'Worthington', '1976-08-02'),
  (gen_random_uuid(), 'Zoe', 'Saldana', '1978-06-19'),
  (gen_random_uuid(), 'Saoirse', 'Ronan', '1994-04-12'),
  (gen_random_uuid(), 'Timothée', 'Chalamet', '1995-12-27'),
  (gen_random_uuid(), 'Robert', 'De Niro', '1943-08-17'),
  (gen_random_uuid(), 'Gal', 'Gadot', '1985-04-30'),
  (gen_random_uuid(), 'Zendaya', 'Coleman', '1996-09-01'),
  (gen_random_uuid(), 'Al', 'Pacino', '1940-04-25');

-- Lien entre les personnages et les acteurs
INSERT INTO character_actors (actor_id, character_id) VALUES
  ((SELECT id FROM actors WHERE last_name_actor = 'DiCaprio'), (SELECT id FROM characters WHERE name_character = 'Dom Cobb')),
  ((SELECT id FROM actors WHERE last_name_actor = 'Travolta'), (SELECT id FROM characters WHERE name_character = 'Vincent Vega')),
  ((SELECT id FROM actors WHERE last_name_actor = 'Johansson'), (SELECT id FROM characters WHERE name_character = 'Charlotte')),
  ((SELECT id FROM actors WHERE last_name_actor = 'Neill'), (SELECT id FROM characters WHERE name_character = 'Dr. Alan Grant')),
  ((SELECT id FROM actors WHERE last_name_actor = 'Dern'), (SELECT id FROM characters WHERE name_character = 'Ellie Sattler')),
  ((SELECT id FROM actors WHERE last_name_actor = 'Worthington'), (SELECT id FROM characters WHERE name_character = 'Jake Sully')),
  ((SELECT id FROM actors WHERE last_name_actor = 'Saldana'), (SELECT id FROM characters WHERE name_character = 'Neytiri')),
  ((SELECT id FROM actors WHERE last_name_actor = 'Ronan'), (SELECT id FROM characters WHERE name_character = 'Christine McPherson')),
  ((SELECT id FROM actors WHERE last_name_actor = 'Chalamet'), (SELECT id FROM characters WHERE name_character = 'Paul Atreides')),
  ((SELECT id FROM actors WHERE last_name_actor = 'De Niro'), (SELECT id FROM characters WHERE name_character = 'Frank Sheeran')),
  ((SELECT id FROM actors WHERE last_name_actor = 'Gadot'), (SELECT id FROM characters WHERE name_character = 'Diana Prince')),
  ((SELECT id FROM actors WHERE last_name_actor = 'Pacino'), (SELECT id FROM characters WHERE name_character = 'Jimmy Hoffa'));


INSERT INTO movies_characters (movie_id, character_id, character_type) VALUES
  ((SELECT id FROM movies WHERE title = 'Dune'), (SELECT id FROM characters WHERE name_character = 'Paul Atreides'), 'principal'),
  ((SELECT id FROM movies WHERE title = 'Dune'), (SELECT id FROM characters WHERE name_character = 'Chani Kynes'), 'secondaire'),
  ((SELECT id FROM movies WHERE title = 'Wonder Woman'), (SELECT id FROM characters WHERE name_character = 'Diana Prince'), 'principal'),
  ((SELECT id FROM movies WHERE title = 'The Irishman'), (SELECT id FROM characters WHERE name_character = 'Frank Sheeran'), 'principal'),
  ((SELECT id FROM movies WHERE title = 'The Irishman'), (SELECT id FROM characters WHERE name_character = 'Jimmy Hoffa'), 'secondaire');




-- Insertion des spectateurs
INSERT INTO spectators (id, first_name_spectator, last_name_spectator, email, password_hash) VALUES
  (gen_random_uuid(), 'Alice', 'Smith', 'alice.smith@example.com', 'hashed_password_1'),
  (gen_random_uuid(), 'Bob', 'Johnson', 'bob.johnson@example.com', 'hashed_password_2'),
  (gen_random_uuid(), 'Eve', 'Williams', 'eve.williams@example.com', 'hashed_password_3'),
  (gen_random_uuid(), 'Jean', 'Dupont', 'jean.dupont@example.com', 'hashed_password_1'),
  (gen_random_uuid(), 'Marie', 'Curie', 'marie.curie@example.com', 'hashed_password_2'),
  (gen_random_uuid(), 'Luc', 'Martin', 'luc.martin@example.com', 'hashed_password_3'),
  (gen_random_uuid(), 'Sophie', 'Durand', 'sophie.durand@example.com', 'hashed_password_4'),
  (gen_random_uuid(), 'Paul', 'Morel', 'paul.morel@example.com', 'hashed_password_5'),
  (gen_random_uuid(), 'Claire', 'Bernard', 'claire.bernard@example.com', 'hashed_password_6');




-- Lien entre les films et les spectateurs (favoris)
INSERT INTO movies_spectators (spectator_id, movie_id) VALUES
  ((SELECT id FROM spectators WHERE email = 'alice.smith@example.com'), (SELECT id FROM movies WHERE title = 'Inception')),
  ((SELECT id FROM spectators WHERE email = 'bob.johnson@example.com'), (SELECT id FROM movies WHERE title = 'Pulp Fiction')),
  ((SELECT id FROM spectators WHERE email = 'eve.williams@example.com'), (SELECT id FROM movies WHERE title = 'Lost in Translation')),
  ((SELECT id FROM spectators WHERE email = 'john.doe@example.com'), (SELECT id FROM movies WHERE title = 'Jurassic Park')),
  ((SELECT id FROM spectators WHERE email = 'john.doe@example.com'), (SELECT id FROM movies WHERE title = 'Avatar')),
  ((SELECT id FROM spectators WHERE email = 'jane.smith@example.com'), (SELECT id FROM movies WHERE title = 'Lady Bird')),
  ((SELECT id FROM spectators WHERE email = 'emily.brown@example.com'), (SELECT id FROM movies WHERE title = 'Avatar')),
  ((SELECT id FROM spectators WHERE email = 'emily.brown@example.com'), (SELECT id FROM movies WHERE title = 'Jurassic Park')),
  ((SELECT id FROM spectators WHERE email = 'jean.dupont@example.com'), (SELECT id FROM movies WHERE title = 'Dune')),
  ((SELECT id FROM spectators WHERE email = 'jean.dupont@example.com'), (SELECT id FROM movies WHERE title = 'Wonder Woman')),
  ((SELECT id FROM spectators WHERE email = 'marie.curie@example.com'), (SELECT id FROM movies WHERE title = 'The Irishman')),
  ((SELECT id FROM spectators WHERE email = 'luc.martin@example.com'), (SELECT id FROM movies WHERE title = 'Dune')),
  ((SELECT id FROM spectators WHERE email = 'luc.martin@example.com'), (SELECT id FROM movies WHERE title = 'The Irishman'));

-- Lien entre les personnages et les spectateurs (favoris)
INSERT INTO spectators_characters (spectator_id, character_id) VALUES
  ((SELECT id FROM spectators WHERE email = 'alice.smith@example.com'),
   (SELECT id FROM characters WHERE name_character = 'Dom Cobb')),
  ((SELECT id FROM spectators WHERE email = 'bob.johnson@example.com'),
   (SELECT id FROM characters WHERE name_character = 'Vincent Vega')),
  ((SELECT id FROM spectators WHERE email = 'eve.williams@example.com'),
   (SELECT id FROM characters WHERE name_character = 'Charlotte')),
  ((SELECT id FROM spectators WHERE email = 'jean.dupont@example.com'),
   (SELECT id FROM characters WHERE name_character = 'Dr. Alan Grant')),
  ((SELECT id FROM spectators WHERE email = 'marie.curie@example.com'),
   (SELECT id FROM characters WHERE name_character = 'Jake Sully')),
  ((SELECT id FROM spectators WHERE email = 'luc.martin@example.com'),
   (SELECT id FROM characters WHERE name_character = 'Christine McPherson')),
  ((SELECT id FROM spectators WHERE email = 'sophie.durand@example.com'),
   (SELECT id FROM characters WHERE name_character = 'Neytiri')),
  ((SELECT id FROM spectators WHERE email = 'paul.morel@example.com'),
   (SELECT id FROM characters WHERE name_character = 'Ellie Sattler')),
  ((SELECT id FROM spectators WHERE email = 'jean.dupont@example.com'),
   (SELECT id FROM characters WHERE name_character = 'Paul Atreides')),
  ((SELECT id FROM spectators WHERE email = 'claire.bernard@example.com'),
   (SELECT id FROM characters WHERE name_character = 'Diana Prince')),
  ((SELECT id FROM spectators WHERE email = 'marie.curie@example.com'),
   (SELECT id FROM characters WHERE name_character = 'Frank Sheeran')),
  ((SELECT id FROM spectators WHERE email = 'luc.martin@example.com'),
   (SELECT id FROM characters WHERE name_character = 'Chani Kynes')),
  ((SELECT id FROM spectators WHERE email = 'sophie.durand@example.com'),
   (SELECT id FROM characters WHERE name_character = 'Jimmy Hoffa'));