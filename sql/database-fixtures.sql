-- ===============================================
-- CREATION DE L'EXTENSION pgcrypto
-- ===============================================
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- ===============================================
-- INSERTION DES RÉALISATEURS
-- ===============================================
INSERT INTO directors (first_name_director, last_name_director) VALUES
  ('Christopher', 'Nolan'),
  ('Quentin', 'Tarantino'),
  ('Sofia', 'Coppola'),
  ('Steven', 'Spielberg'),
  ('James', 'Cameron'),
  ('Greta', 'Gerwig'),
  ('Denis', 'Villeneuve'),
  ('Martin', 'Scorsese'),
  ('Patty', 'Jenkins'),
  ('Francis Ford', 'Coppola'),
  ('Ridley', 'Scott'),
  ('Alfred', 'Hitchcock');

-- ===============================================
-- INSERTION DES FILMS
-- ===============================================
INSERT INTO movies (title, length, release_date, director_id) VALUES
  ('Inception', 148, '2010-07-16', (SELECT director_id FROM directors WHERE last_name_director = 'Nolan')),
  ('Pulp Fiction', 154, '1994-10-14', (SELECT director_id FROM directors WHERE last_name_director = 'Tarantino')),
  ('Lost in Translation', 102, '2003-10-03', (SELECT director_id FROM directors WHERE last_name_director = 'Coppola' AND first_name_director = 'Sofia')),
  ('Jurassic Park', 127, '1993-06-11', (SELECT director_id FROM directors WHERE last_name_director = 'Spielberg')),
  ('Avatar', 162, '2009-12-18', (SELECT director_id FROM directors WHERE last_name_director = 'Cameron')),
  ('Lady Bird', 94, '2017-09-01', (SELECT director_id FROM directors WHERE last_name_director = 'Gerwig')),
  ('Dune', 155, '2021-10-22', (SELECT director_id FROM directors WHERE last_name_director = 'Villeneuve')),
  ('The Irishman', 209, '2019-09-27', (SELECT director_id FROM directors WHERE last_name_director = 'Scorsese')),
  ('Wonder Woman', 141, '2017-06-02', (SELECT director_id FROM directors WHERE last_name_director = 'Jenkins')),
  ('The Dark Knight', 152, '2008-07-18', (SELECT director_id FROM directors WHERE last_name_director = 'Nolan')),
  ('Interstellar', 169, '2014-11-07', (SELECT director_id FROM directors WHERE last_name_director = 'Nolan')),
  ('Kill Bill: Vol. 1', 111, '2003-10-10', (SELECT director_id FROM directors WHERE last_name_director = 'Tarantino')),
  ('The Godfather', 175, '1972-03-24', (SELECT director_id FROM directors WHERE last_name_director = 'Coppola' AND first_name_director = 'Francis Ford')),
  ('E.T. the Extra-Terrestrial', 115, '1982-06-11', (SELECT director_id FROM directors WHERE last_name_director = 'Spielberg')),
  ('Titanic', 195, '1997-12-19', (SELECT director_id FROM directors WHERE last_name_director = 'Cameron')),
  ('Sicario', 121, '2015-09-18', (SELECT director_id FROM directors WHERE last_name_director = 'Villeneuve')),
  ('Arrival', 116, '2016-11-11', (SELECT director_id FROM directors WHERE last_name_director = 'Villeneuve')),
  ('Goodfellas', 146, '1990-09-19', (SELECT director_id FROM directors WHERE last_name_director = 'Scorsese')),
  ('Gladiator', 155, '2000-05-05', (SELECT director_id FROM directors WHERE last_name_director = 'Scott')),
  ('Alien', 117, '1979-05-25', (SELECT director_id FROM directors WHERE last_name_director = 'Scott')),
  ('Psycho', 109, '1960-06-22', (SELECT director_id FROM directors WHERE last_name_director = 'Hitchcock')),
  ('Spider-Man', 121, '2002-05-03', (SELECT director_id FROM directors WHERE last_name_director = 'Nolan')),
  ('Amazing Spider-Man', 136, '2012-07-03', (SELECT director_id FROM directors WHERE last_name_director = 'Villeneuve')),
  ('Spider-Man: No Way Home', 148, '2021-12-17', (SELECT director_id FROM directors WHERE last_name_director = 'Scott'));

-- ===============================================
-- INSERTION DES PERSONNAGES
-- ===============================================
INSERT INTO characters (name_character) VALUES
  ('Dom Cobb'),
  ('Vincent Vega'),
  ('Charlotte'),
  ('Dr. Alan Grant'),
  ('Ellie Sattler'),
  ('Jake Sully'),
  ('Neytiri'),
  ('Christine McPherson'),
  ('Paul Atreides'),
  ('Frank Sheeran'),
  ('Diana Prince'),
  ('Chani Kynes'),
  ('Jimmy Hoffa'),
  ('Bruce Wayne'),
  ('The Joker'),
  ('Joseph Cooper'),
  ('Beatrix Kiddo'),
  ('Vito Corleone'),
  ('Michael Corleone'),
  ('Elliott'),
  ('Jack Dawson'),
  ('Rose DeWitt Bukater'),
  ('Kate Macer'),
  ('Louise Banks'),
  ('Henry Hill'),
  ('Maximus Decimus Meridius'),
  ('Ellen Ripley'),
  ('Norman Bates'),
  ('Marion Crane'),
  ('Spider-Man'),
  ('Mary Jane Watson'),
  ('Gwen Stacy'),
  ('Harry Osborn');

-- ===============================================
-- INSERTION DES ACTEURS
-- ===============================================
INSERT INTO actors (first_name_actor, last_name_actor, date_of_birth) VALUES
  ('Leonardo', 'DiCaprio', '1974-11-11'),
  ('John', 'Travolta', '1954-02-18'),
  ('Scarlett', 'Johansson', '1984-11-22'),
  ('Sam', 'Neill', '1947-09-14'),
  ('Laura', 'Dern', '1967-02-10'),
  ('Sam', 'Worthington', '1976-08-02'),
  ('Zoe', 'Saldana', '1978-06-19'),
  ('Saoirse', 'Ronan', '1994-04-12'),
  ('Timothée', 'Chalamet', '1995-12-27'),
  ('Robert', 'De Niro', '1943-08-17'),
  ('Gal', 'Gadot', '1985-04-30'),
  ('Zendaya', 'Coleman', '1996-09-01'),
  ('Al', 'Pacino', '1940-04-25'),
  ('Christian', 'Bale', '1974-01-30'),
  ('Heath', 'Ledger', '1979-04-04'),
  ('Matthew', 'McConaughey', '1969-11-04'),
  ('Uma', 'Thurman', '1970-04-29'),
  ('Marlon', 'Brando', '1924-04-03'),
  ('Henry', 'Thomas', '1971-09-09'),
  ('Kate', 'Winslet', '1975-10-05'),
  ('Emily', 'Blunt', '1983-02-23'),
  ('Amy', 'Adams', '1974-08-20'),
  ('Ray', 'Liotta', '1954-12-18'),
  ('Russell', 'Crowe', '1964-04-07'),
  ('Sigourney', 'Weaver', '1949-10-08'),
  ('Anthony', 'Perkins', '1932-04-04'),
  ('Janet', 'Leigh', '1927-07-06'),
  ('Tobey', 'Maguire', '1975-06-27'),
  ('Andrew', 'Garfield', '1983-08-20'),
  ('Tom', 'Holland', '1996-06-01'),
  ('Kirsten', 'Dunst', '1982-04-30'),
  ('Emma', 'Stone', '1988-11-06'),
  ('James', 'Franco', '1978-04-19'),
  ('Dane', 'DeHaan', '1986-02-06');

-- ===============================================
-- LIEN ENTRE LES PERSONNAGES ET LES ACTEURS
-- ===============================================
INSERT INTO characters_actors (actor_id, character_id) VALUES
  ((SELECT actor_id FROM actors WHERE last_name_actor = 'DiCaprio'), (SELECT character_id FROM characters WHERE name_character = 'Dom Cobb')),
  ((SELECT actor_id FROM actors WHERE last_name_actor = 'Travolta'), (SELECT character_id FROM characters WHERE name_character = 'Vincent Vega')),
  ((SELECT actor_id FROM actors WHERE last_name_actor = 'Johansson'), (SELECT character_id FROM characters WHERE name_character = 'Charlotte')),
  ((SELECT actor_id FROM actors WHERE last_name_actor = 'Neill'), (SELECT character_id FROM characters WHERE name_character = 'Dr. Alan Grant')),
  ((SELECT actor_id FROM actors WHERE last_name_actor = 'Dern'), (SELECT character_id FROM characters WHERE name_character = 'Ellie Sattler')),
  ((SELECT actor_id FROM actors WHERE last_name_actor = 'Worthington'), (SELECT character_id FROM characters WHERE name_character = 'Jake Sully')),
  ((SELECT actor_id FROM actors WHERE last_name_actor = 'Saldana'), (SELECT character_id FROM characters WHERE name_character = 'Neytiri')),
  ((SELECT actor_id FROM actors WHERE last_name_actor = 'Ronan'), (SELECT character_id FROM characters WHERE name_character = 'Christine McPherson')),
  ((SELECT actor_id FROM actors WHERE last_name_actor = 'Chalamet'), (SELECT character_id FROM characters WHERE name_character = 'Paul Atreides')),
  ((SELECT actor_id FROM actors WHERE last_name_actor = 'De Niro'), (SELECT character_id FROM characters WHERE name_character = 'Frank Sheeran')),
  ((SELECT actor_id FROM actors WHERE last_name_actor = 'Gadot'), (SELECT character_id FROM characters WHERE name_character = 'Diana Prince')),
  ((SELECT actor_id FROM actors WHERE last_name_actor = 'Coleman'), (SELECT character_id FROM characters WHERE name_character = 'Chani Kynes')),
  ((SELECT actor_id FROM actors WHERE last_name_actor = 'Pacino'), (SELECT character_id FROM characters WHERE name_character = 'Jimmy Hoffa')),
  ((SELECT actor_id FROM actors WHERE last_name_actor = 'Bale'), (SELECT character_id FROM characters WHERE name_character = 'Bruce Wayne')),
  ((SELECT actor_id FROM actors WHERE last_name_actor = 'Ledger'), (SELECT character_id FROM characters WHERE name_character = 'The Joker')),
  ((SELECT actor_id FROM actors WHERE last_name_actor = 'McConaughey'), (SELECT character_id FROM characters WHERE name_character = 'Joseph Cooper')),
  ((SELECT actor_id FROM actors WHERE last_name_actor = 'Thurman'), (SELECT character_id FROM characters WHERE name_character = 'Beatrix Kiddo')),
  ((SELECT actor_id FROM actors WHERE last_name_actor = 'Brando'), (SELECT character_id FROM characters WHERE name_character = 'Vito Corleone')),
  ((SELECT actor_id FROM actors WHERE last_name_actor = 'Pacino'), (SELECT character_id FROM characters WHERE name_character = 'Michael Corleone')),
  ((SELECT actor_id FROM actors WHERE last_name_actor = 'Thomas'), (SELECT character_id FROM characters WHERE name_character = 'Elliott')),
  ((SELECT actor_id FROM actors WHERE last_name_actor = 'DiCaprio'), (SELECT character_id FROM characters WHERE name_character = 'Jack Dawson')),
  ((SELECT actor_id FROM actors WHERE last_name_actor = 'Winslet'), (SELECT character_id FROM characters WHERE name_character = 'Rose DeWitt Bukater')),
  ((SELECT actor_id FROM actors WHERE last_name_actor = 'Blunt'), (SELECT character_id FROM characters WHERE name_character = 'Kate Macer')),
  ((SELECT actor_id FROM actors WHERE last_name_actor = 'Adams'), (SELECT character_id FROM characters WHERE name_character = 'Louise Banks')),
  ((SELECT actor_id FROM actors WHERE last_name_actor = 'Liotta'), (SELECT character_id FROM characters WHERE name_character = 'Henry Hill')),
  ((SELECT actor_id FROM actors WHERE last_name_actor = 'Crowe'), (SELECT character_id FROM characters WHERE name_character = 'Maximus Decimus Meridius')),
  ((SELECT actor_id FROM actors WHERE last_name_actor = 'Weaver'), (SELECT character_id FROM characters WHERE name_character = 'Ellen Ripley')),
  ((SELECT actor_id FROM actors WHERE last_name_actor = 'Perkins'), (SELECT character_id FROM characters WHERE name_character = 'Norman Bates')),
  ((SELECT actor_id FROM actors WHERE last_name_actor = 'Leigh'), (SELECT character_id FROM characters WHERE name_character = 'Marion Crane')),
  ((SELECT actor_id FROM actors WHERE last_name_actor = 'Maguire'), (SELECT character_id FROM characters WHERE name_character = 'Spider-Man')),
  ((SELECT actor_id FROM actors WHERE last_name_actor = 'Garfield'), (SELECT character_id FROM characters WHERE name_character = 'Spider-Man')),
  ((SELECT actor_id FROM actors WHERE last_name_actor = 'Holland'), (SELECT character_id FROM characters WHERE name_character = 'Spider-Man')),
  ((SELECT actor_id FROM actors WHERE last_name_actor = 'Dunst'), (SELECT character_id FROM characters WHERE name_character = 'Mary Jane Watson')),
  ((SELECT actor_id FROM actors WHERE last_name_actor = 'Stone'), (SELECT character_id FROM characters WHERE name_character = 'Gwen Stacy')),
  ((SELECT actor_id FROM actors WHERE last_name_actor = 'Franco'), (SELECT character_id FROM characters WHERE name_character = 'Harry Osborn')),
  ((SELECT actor_id FROM actors WHERE last_name_actor = 'DeHaan'), (SELECT character_id FROM characters WHERE name_character = 'Harry Osborn'));

-- ===============================================
-- LIEN ENTRE LES FILMS ET LES PERSONNAGES
-- ===============================================
INSERT INTO movies_characters (movie_id, character_id, character_type) VALUES
  ((SELECT movie_id FROM movies WHERE title = 'Dune'), (SELECT character_id FROM characters WHERE name_character = 'Paul Atreides'), 'principal'),
  ((SELECT movie_id FROM movies WHERE title = 'Dune'), (SELECT character_id FROM characters WHERE name_character = 'Chani Kynes'), 'secondaire'),
  ((SELECT movie_id FROM movies WHERE title = 'Wonder Woman'), (SELECT character_id FROM characters WHERE name_character = 'Diana Prince'), 'principal'),
  ((SELECT movie_id FROM movies WHERE title = 'The Irishman'), (SELECT character_id FROM characters WHERE name_character = 'Frank Sheeran'), 'principal'),
  ((SELECT movie_id FROM movies WHERE title = 'The Irishman'), (SELECT character_id FROM characters WHERE name_character = 'Jimmy Hoffa'), 'secondaire'),
  ((SELECT movie_id FROM movies WHERE title = 'Inception'), (SELECT character_id FROM characters WHERE name_character = 'Dom Cobb'), 'principal'),
  ((SELECT movie_id FROM movies WHERE title = 'Pulp Fiction'), (SELECT character_id FROM characters WHERE name_character = 'Vincent Vega'), 'principal'),
  ((SELECT movie_id FROM movies WHERE title = 'Lost in Translation'), (SELECT character_id FROM characters WHERE name_character = 'Charlotte'), 'principal'),
  ((SELECT movie_id FROM movies WHERE title = 'Jurassic Park'), (SELECT character_id FROM characters WHERE name_character = 'Dr. Alan Grant'), 'principal'),
  ((SELECT movie_id FROM movies WHERE title = 'Jurassic Park'), (SELECT character_id FROM characters WHERE name_character = 'Ellie Sattler'), 'secondaire'),
  ((SELECT movie_id FROM movies WHERE title = 'Avatar'), (SELECT character_id FROM characters WHERE name_character = 'Jake Sully'), 'principal'),
  ((SELECT movie_id FROM movies WHERE title = 'Avatar'), (SELECT character_id FROM characters WHERE name_character = 'Neytiri'), 'secondaire'),
  ((SELECT movie_id FROM movies WHERE title = 'Lady Bird'), (SELECT character_id FROM characters WHERE name_character = 'Christine McPherson'), 'principal'),
  ((SELECT movie_id FROM movies WHERE title = 'The Dark Knight'), (SELECT character_id FROM characters WHERE name_character = 'Bruce Wayne'), 'principal'),
  ((SELECT movie_id FROM movies WHERE title = 'The Dark Knight'), (SELECT character_id FROM characters WHERE name_character = 'The Joker'), 'principal'),
  ((SELECT movie_id FROM movies WHERE title = 'Interstellar'), (SELECT character_id FROM characters WHERE name_character = 'Joseph Cooper'), 'principal'),
  ((SELECT movie_id FROM movies WHERE title = 'Kill Bill: Vol. 1'), (SELECT character_id FROM characters WHERE name_character = 'Beatrix Kiddo'), 'principal'),
  ((SELECT movie_id FROM movies WHERE title = 'The Godfather'), (SELECT character_id FROM characters WHERE name_character = 'Vito Corleone'), 'principal'),
  ((SELECT movie_id FROM movies WHERE title = 'The Godfather'), (SELECT character_id FROM characters WHERE name_character = 'Michael Corleone'), 'secondaire'),
  ((SELECT movie_id FROM movies WHERE title = 'E.T. the Extra-Terrestrial'), (SELECT character_id FROM characters WHERE name_character = 'Elliott'), 'principal'),
  ((SELECT movie_id FROM movies WHERE title = 'Titanic'), (SELECT character_id FROM characters WHERE name_character = 'Jack Dawson'), 'principal'),
  ((SELECT movie_id FROM movies WHERE title = 'Titanic'), (SELECT character_id FROM characters WHERE name_character = 'Rose DeWitt Bukater'), 'principal'),
  ((SELECT movie_id FROM movies WHERE title = 'Sicario'), (SELECT character_id FROM characters WHERE name_character = 'Kate Macer'), 'principal'),
  ((SELECT movie_id FROM movies WHERE title = 'Arrival'), (SELECT character_id FROM characters WHERE name_character = 'Louise Banks'), 'principal'),
  ((SELECT movie_id FROM movies WHERE title = 'Goodfellas'), (SELECT character_id FROM characters WHERE name_character = 'Henry Hill'), 'principal'),
  ((SELECT movie_id FROM movies WHERE title = 'Gladiator'), (SELECT character_id FROM characters WHERE name_character = 'Maximus Decimus Meridius'), 'principal'),
  ((SELECT movie_id FROM movies WHERE title = 'Alien'), (SELECT character_id FROM characters WHERE name_character = 'Ellen Ripley'), 'principal'),
  ((SELECT movie_id FROM movies WHERE title = 'Psycho'), (SELECT character_id FROM characters WHERE name_character = 'Norman Bates'), 'principal'),
  ((SELECT movie_id FROM movies WHERE title = 'Psycho'), (SELECT character_id FROM characters WHERE name_character = 'Marion Crane'), 'secondaire');

-- ===============================================
-- LIEN ENTRE LES FILMS ET LES ACTEURS
-- ===============================================
INSERT INTO movies_actors (movie_id, actor_id) VALUES
  ((SELECT movie_id FROM movies WHERE title = 'Spider-Man'), (SELECT actor_id FROM actors WHERE last_name_actor = 'Maguire')),
  ((SELECT movie_id FROM movies WHERE title = 'Spider-Man'), (SELECT actor_id FROM actors WHERE last_name_actor = 'Dunst')),
  ((SELECT movie_id FROM movies WHERE title = 'Spider-Man'), (SELECT actor_id FROM actors WHERE last_name_actor = 'Franco')),
  ((SELECT movie_id FROM movies WHERE title = 'Amazing Spider-Man'), (SELECT actor_id FROM actors WHERE last_name_actor = 'Garfield')),
  ((SELECT movie_id FROM movies WHERE title = 'Amazing Spider-Man'), (SELECT actor_id FROM actors WHERE last_name_actor = 'Stone')),
  ((SELECT movie_id FROM movies WHERE title = 'Amazing Spider-Man'), (SELECT actor_id FROM actors WHERE last_name_actor = 'DeHaan')),
  ((SELECT movie_id FROM movies WHERE title = 'Spider-Man: No Way Home'), (SELECT actor_id FROM actors WHERE last_name_actor = 'Holland')),
  ((SELECT movie_id FROM movies WHERE title = 'Spider-Man: No Way Home'), (SELECT actor_id FROM actors WHERE last_name_actor = 'Maguire')),
  ((SELECT movie_id FROM movies WHERE title = 'Spider-Man: No Way Home'), (SELECT actor_id FROM actors WHERE last_name_actor = 'Garfield')),
  ((SELECT movie_id FROM movies WHERE title = 'Inception'), (SELECT actor_id FROM actors WHERE last_name_actor = 'DiCaprio')),
  ((SELECT movie_id FROM movies WHERE title = 'Inception'), (SELECT actor_id FROM actors WHERE last_name_actor = 'Ronan')),
  ((SELECT movie_id FROM movies WHERE title = 'Pulp Fiction'), (SELECT actor_id FROM actors WHERE last_name_actor = 'Travolta')),
  ((SELECT movie_id FROM movies WHERE title = 'Pulp Fiction'), (SELECT actor_id FROM actors WHERE last_name_actor = 'Thurman')),
  ((SELECT movie_id FROM movies WHERE title = 'Lost in Translation'), (SELECT actor_id FROM actors WHERE last_name_actor = 'Johansson')),
  ((SELECT movie_id FROM movies WHERE title = 'Jurassic Park'), (SELECT actor_id FROM actors WHERE last_name_actor = 'Neill')),
  ((SELECT movie_id FROM movies WHERE title = 'Jurassic Park'), (SELECT actor_id FROM actors WHERE last_name_actor = 'Dern')),
  ((SELECT movie_id FROM movies WHERE title = 'Avatar'), (SELECT actor_id FROM actors WHERE last_name_actor = 'Worthington')),
  ((SELECT movie_id FROM movies WHERE title = 'Avatar'), (SELECT actor_id FROM actors WHERE last_name_actor = 'Saldana')),
  ((SELECT movie_id FROM movies WHERE title = 'Lady Bird'), (SELECT actor_id FROM actors WHERE last_name_actor = 'Ronan')),
  ((SELECT movie_id FROM movies WHERE title = 'The Dark Knight'), (SELECT actor_id FROM actors WHERE last_name_actor = 'Bale')),
  ((SELECT movie_id FROM movies WHERE title = 'The Dark Knight'), (SELECT actor_id FROM actors WHERE last_name_actor = 'Ledger')),
  ((SELECT movie_id FROM movies WHERE title = 'Alien'), (SELECT actor_id FROM actors WHERE last_name_actor = 'Weaver')),
  ((SELECT movie_id FROM movies WHERE title = 'Psycho'), (SELECT actor_id FROM actors WHERE last_name_actor = 'Perkins')),
  ((SELECT movie_id FROM movies WHERE title = 'Psycho'), (SELECT actor_id FROM actors WHERE last_name_actor = 'Leigh'));

-- ===============================================
-- INSERTION DES SPECTATEURS
-- ===============================================
INSERT INTO spectators (first_name_spectator, last_name_spectator, email, password_hash) VALUES
  ('Alice', 'Smith', 'alice.smith@example.com', crypt('hashed_password_1', gen_salt('bf'))),
  ('Bob', 'Johnson', 'bob.johnson@example.com', crypt('hashed_password_2', gen_salt('bf'))),
  ('Eve', 'Williams', 'eve.williams@example.com', crypt('hashed_password_3', gen_salt('bf'))),
  ('Jean', 'Dupont', 'jean.dupont@example.com', crypt('hashed_password_4', gen_salt('bf'))),
  ('Marie', 'Curie', 'marie.curie@example.com', crypt('hashed_password_5', gen_salt('bf'))),
  ('Luc', 'Martin', 'luc.martin@example.com', crypt('hashed_password_6', gen_salt('bf'))),
  ('Sophie', 'Durand', 'sophie.durand@example.com', crypt('hashed_password_7', gen_salt('bf'))),
  ('Paul', 'Morel', 'paul.morel@example.com', crypt('hashed_password_8', gen_salt('bf'))),
  ('Claire', 'Bernard', 'claire.bernard@example.com', crypt('hashed_password_9', gen_salt('bf'))),
  ('Thomas', 'Lefebvre', 'thomas.lefebvre@example.com', crypt('hashed_password_10', gen_salt('bf'))),
  ('Julie', 'Dubois', 'julie.dubois@example.com', crypt('hashed_password_11', gen_salt('bf'))),
  ('François', 'Petit', 'francois.petit@example.com',crypt( 'hashed_password_12', gen_salt('bf'))),
  ('Laura', 'Moreau', 'laura.moreau@example.com', crypt('hashed_password_13', gen_salt('bf'))),
  ('Alexandre', 'Blanc', 'alexandre.blanc@example.com', crypt('hashed_password_14', gen_salt('bf'))),
  ('Émilie', 'Roux', 'emilie.roux@example.com', crypt('hashed_password_15', gen_salt('bf')));

-- ===============================================
-- LIEN ENTRE LES FILMS ET LES SPECTATEURS (FAVORIS)
-- ===============================================
INSERT INTO movies_spectators (spectator_id, movie_id) VALUES
  ((SELECT spectator_id FROM spectators WHERE email = 'alice.smith@example.com'), (SELECT movie_id FROM movies WHERE title = 'Inception')),
  ((SELECT spectator_id FROM spectators WHERE email = 'luc.martin@example.com'), (SELECT movie_id FROM movies WHERE title = 'Pulp Fiction')),
  ((SELECT spectator_id FROM spectators WHERE email = 'marie.curie@example.com'), (SELECT movie_id FROM movies WHERE title = 'Lost in Translation')),
  ((SELECT spectator_id FROM spectators WHERE email = 'marie.curie@example.com'), (SELECT movie_id FROM movies WHERE title = 'Jurassic Park')),
  ((SELECT spectator_id FROM spectators WHERE email = 'marie.curie@example.com'), (SELECT movie_id FROM movies WHERE title = 'Avatar')),
  ((SELECT spectator_id FROM spectators WHERE email = 'luc.martin@example.com'), (SELECT movie_id FROM movies WHERE title = 'Lady Bird')),
  ((SELECT spectator_id FROM spectators WHERE email = 'jean.dupont@example.com'), (SELECT movie_id FROM movies WHERE title = 'Avatar')),
  ((SELECT spectator_id FROM spectators WHERE email = 'jean.dupont@example.com'), (SELECT movie_id FROM movies WHERE title = 'Jurassic Park')),
  ((SELECT spectator_id FROM spectators WHERE email = 'jean.dupont@example.com'), (SELECT movie_id FROM movies WHERE title = 'Dune')),
  ((SELECT spectator_id FROM spectators WHERE email = 'jean.dupont@example.com'), (SELECT movie_id FROM movies WHERE title = 'Wonder Woman')),
  ((SELECT spectator_id FROM spectators WHERE email = 'marie.curie@example.com'), (SELECT movie_id FROM movies WHERE title = 'The Irishman')),
  ((SELECT spectator_id FROM spectators WHERE email = 'luc.martin@example.com'), (SELECT movie_id FROM movies WHERE title = 'Dune')),
  ((SELECT spectator_id FROM spectators WHERE email = 'luc.martin@example.com'), (SELECT movie_id FROM movies WHERE title = 'The Irishman')),
  ((SELECT spectator_id FROM spectators WHERE email = 'alice.smith@example.com'), (SELECT movie_id FROM movies WHERE title = 'The Dark Knight')),
  ((SELECT spectator_id FROM spectators WHERE email = 'alice.smith@example.com'), (SELECT movie_id FROM movies WHERE title = 'Interstellar')),
  ((SELECT spectator_id FROM spectators WHERE email = 'bob.johnson@example.com'), (SELECT movie_id FROM movies WHERE title = 'Kill Bill: Vol. 1')),
  ((SELECT spectator_id FROM spectators WHERE email = 'bob.johnson@example.com'), (SELECT movie_id FROM movies WHERE title = 'Pulp Fiction')),
  ((SELECT spectator_id FROM spectators WHERE email = 'eve.williams@example.com'), (SELECT movie_id FROM movies WHERE title = 'Lost in Translation')),
  ((SELECT spectator_id FROM spectators WHERE email = 'eve.williams@example.com'), (SELECT movie_id FROM movies WHERE title = 'Lady Bird')),
  ((SELECT spectator_id FROM spectators WHERE email = 'thomas.lefebvre@example.com'), (SELECT movie_id FROM movies WHERE title = 'The Godfather')),
  ((SELECT spectator_id FROM spectators WHERE email = 'thomas.lefebvre@example.com'), (SELECT movie_id FROM movies WHERE title = 'Goodfellas')),
  ((SELECT spectator_id FROM spectators WHERE email = 'julie.dubois@example.com'), (SELECT movie_id FROM movies WHERE title = 'Titanic')),
  ((SELECT spectator_id FROM spectators WHERE email = 'julie.dubois@example.com'), (SELECT movie_id FROM movies WHERE title = 'E.T. the Extra-Terrestrial')),
  ((SELECT spectator_id FROM spectators WHERE email = 'francois.petit@example.com'), (SELECT movie_id FROM movies WHERE title = 'Alien')),
  ((SELECT spectator_id FROM spectators WHERE email = 'francois.petit@example.com'), (SELECT movie_id FROM movies WHERE title = 'Gladiator')),
  ((SELECT spectator_id FROM spectators WHERE email = 'laura.moreau@example.com'), (SELECT movie_id FROM movies WHERE title = 'Psycho')),
  ((SELECT spectator_id FROM spectators WHERE email = 'laura.moreau@example.com'), (SELECT movie_id FROM movies WHERE title = 'Arrival')),
  ((SELECT spectator_id FROM spectators WHERE email = 'alexandre.blanc@example.com'), (SELECT movie_id FROM movies WHERE title = 'Dune')),
  ((SELECT spectator_id FROM spectators WHERE email = 'alexandre.blanc@example.com'), (SELECT movie_id FROM movies WHERE title = 'Sicario')),
  ((SELECT spectator_id FROM spectators WHERE email = 'emilie.roux@example.com'), (SELECT movie_id FROM movies WHERE title = 'Wonder Woman')),
  ((SELECT spectator_id FROM spectators WHERE email = 'emilie.roux@example.com'), (SELECT movie_id FROM movies WHERE title = 'Avatar'));

-- ===============================================
-- LIEN ENTRE LES PERSONNAGES ET LES SPECTATEURS (FAVORIS)
-- ===============================================
INSERT INTO spectators_characters (spectator_id, character_id) VALUES
  ((SELECT spectator_id FROM spectators WHERE email = 'alice.smith@example.com'), (SELECT character_id FROM characters WHERE name_character = 'Dom Cobb')),
  ((SELECT spectator_id FROM spectators WHERE email = 'bob.johnson@example.com'), (SELECT character_id FROM characters WHERE name_character = 'Vincent Vega')),
  ((SELECT spectator_id FROM spectators WHERE email = 'eve.williams@example.com'), (SELECT character_id FROM characters WHERE name_character = 'Charlotte')),
  ((SELECT spectator_id FROM spectators WHERE email = 'jean.dupont@example.com'), (SELECT character_id FROM characters WHERE name_character = 'Dr. Alan Grant')),
  ((SELECT spectator_id FROM spectators WHERE email = 'marie.curie@example.com'), (SELECT character_id FROM characters WHERE name_character = 'Jake Sully')),
  ((SELECT spectator_id FROM spectators WHERE email = 'luc.martin@example.com'), (SELECT character_id FROM characters WHERE name_character = 'Christine McPherson')),
  ((SELECT spectator_id FROM spectators WHERE email = 'sophie.durand@example.com'), (SELECT character_id FROM characters WHERE name_character = 'Neytiri')),
  ((SELECT spectator_id FROM spectators WHERE email = 'paul.morel@example.com'), (SELECT character_id FROM characters WHERE name_character = 'Ellie Sattler')),
  ((SELECT spectator_id FROM spectators WHERE email = 'jean.dupont@example.com'), (SELECT character_id FROM characters WHERE name_character = 'Paul Atreides')),
  ((SELECT spectator_id FROM spectators WHERE email = 'claire.bernard@example.com'), (SELECT character_id FROM characters WHERE name_character = 'Diana Prince')),
  ((SELECT spectator_id FROM spectators WHERE email = 'marie.curie@example.com'), (SELECT character_id FROM characters WHERE name_character = 'Frank Sheeran')),
  ((SELECT spectator_id FROM spectators WHERE email = 'luc.martin@example.com'), (SELECT character_id FROM characters WHERE name_character = 'Chani Kynes')),
  ((SELECT spectator_id FROM spectators WHERE email = 'sophie.durand@example.com'), (SELECT character_id FROM characters WHERE name_character = 'Jimmy Hoffa')),
  ((SELECT spectator_id FROM spectators WHERE email = 'alice.smith@example.com'), (SELECT character_id FROM characters WHERE name_character = 'Bruce Wayne')),
  ((SELECT spectator_id FROM spectators WHERE email = 'alice.smith@example.com'), (SELECT character_id FROM characters WHERE name_character = 'Joseph Cooper')),
  ((SELECT spectator_id FROM spectators WHERE email = 'bob.johnson@example.com'), (SELECT character_id FROM characters WHERE name_character = 'Beatrix Kiddo')),
  ((SELECT spectator_id FROM spectators WHERE email = 'thomas.lefebvre@example.com'), (SELECT character_id FROM characters WHERE name_character = 'Vito Corleone')),
  ((SELECT spectator_id FROM spectators WHERE email = 'thomas.lefebvre@example.com'), (SELECT character_id FROM characters WHERE name_character = 'Henry Hill')),
  ((SELECT spectator_id FROM spectators WHERE email = 'julie.dubois@example.com'), (SELECT character_id FROM characters WHERE name_character = 'Jack Dawson')),
  ((SELECT spectator_id FROM spectators WHERE email = 'julie.dubois@example.com'), (SELECT character_id FROM characters WHERE name_character = 'Rose DeWitt Bukater')),
  ((SELECT spectator_id FROM spectators WHERE email = 'julie.dubois@example.com'), (SELECT character_id FROM characters WHERE name_character = 'Elliott')),
  ((SELECT spectator_id FROM spectators WHERE email = 'francois.petit@example.com'), (SELECT character_id FROM characters WHERE name_character = 'Ellen Ripley')),
  ((SELECT spectator_id FROM spectators WHERE email = 'francois.petit@example.com'), (SELECT character_id FROM characters WHERE name_character = 'Maximus Decimus Meridius')),
  ((SELECT spectator_id FROM spectators WHERE email = 'laura.moreau@example.com'), (SELECT character_id FROM characters WHERE name_character = 'Norman Bates')),
  ((SELECT spectator_id FROM spectators WHERE email = 'laura.moreau@example.com'), (SELECT character_id FROM characters WHERE name_character = 'Louise Banks')),
  ((SELECT spectator_id FROM spectators WHERE email = 'alexandre.blanc@example.com'), (SELECT character_id FROM characters WHERE name_character = 'Paul Atreides')),
  ((SELECT spectator_id FROM spectators WHERE email = 'alexandre.blanc@example.com'), (SELECT character_id FROM characters WHERE name_character = 'Kate Macer')),
  ((SELECT spectator_id FROM spectators WHERE email = 'emilie.roux@example.com'), (SELECT character_id FROM characters WHERE name_character = 'Diana Prince')),
  ((SELECT spectator_id FROM spectators WHERE email = 'emilie.roux@example.com'), (SELECT character_id FROM characters WHERE name_character = 'Neytiri'));
