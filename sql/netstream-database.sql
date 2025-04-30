-- Création de la table des réalisateurs
CREATE TABLE IF NOT EXISTS directors(
    director_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    first_name_director VARCHAR(120) NOT NULL,
    last_name_director VARCHAR(120) NOT NULL,
    created_at_director TIMESTAMP DEFAULT NOW(),
    updated_at_director TIMESTAMP
);

-- Création de la table des films
CREATE TABLE IF NOT EXISTS movies(
    movie_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    title VARCHAR(200) NOT NULL,
    length INT NOT NULL,
    release_date DATE NOT NULL,
    created_at_movie TIMESTAMP DEFAULT NOW(),
    updated_at_movie TIMESTAMP,
    director_id uuid NOT NULL,
    FOREIGN KEY (director_id) REFERENCES directors(director_id),
    CONSTRAINT unique_movie UNIQUE (title, length, release_date, director_id)
);

-- Création de la table des personnages
CREATE TABLE IF NOT EXISTS characters(
    character_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    name_character VARCHAR(120) NOT NULL,
    created_at_character TIMESTAMP DEFAULT NOW(),
    updated_at_character TIMESTAMP
);

-- Création de la table des acteurs
CREATE TABLE IF NOT EXISTS actors(
    actor_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    first_name_actor VARCHAR(120) NOT NULL,
    last_name_actor VARCHAR(120) NOT NULL,
    date_of_birth DATE NOT NULL,
    created_at_actor TIMESTAMP DEFAULT NOW(),
    updated_at_actor TIMESTAMP,
    CONSTRAINT unique_actor UNIQUE (first_name_actor, last_name_actor, date_of_birth)
);

-- Création de la table des spectateurs
CREATE TABLE IF NOT EXISTS spectators(
    spectator_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    first_name_spectator VARCHAR(120) NOT NULL,
    last_name_spectator VARCHAR(120) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at_spectator TIMESTAMP DEFAULT NOW(),
    updated_at_spectator TIMESTAMP
);

-- Création de la table d'association entre films et personnages
CREATE TABLE IF NOT EXISTS movies_characters(
    movie_id uuid NOT NULL,
    character_id uuid NOT NULL,
    character_type VARCHAR(50) NOT NULL,
    created_at_movie_character TIMESTAMP DEFAULT NOW(),
    updated_at_movie_character TIMESTAMP,
    PRIMARY KEY (movie_id, character_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id) ON DELETE CASCADE,
    FOREIGN KEY (character_id) REFERENCES characters(character_id) ON DELETE CASCADE
);

-- Création de la table d'association entre acteurs et personnages
CREATE TABLE IF NOT EXISTS characters_actors(
    actor_id uuid NOT NULL,
    character_id uuid NOT NULL,
    created_at_character_actor TIMESTAMP DEFAULT NOW(),
    updated_at_character_actor TIMESTAMP,
    PRIMARY KEY (actor_id, character_id),
    FOREIGN KEY (actor_id) REFERENCES actors(actor_id) ON DELETE CASCADE,
    FOREIGN KEY (character_id) REFERENCES characters(character_id) ON DELETE CASCADE
);

-- Création de la table d'association entre spectateurs et films favoris
CREATE TABLE IF NOT EXISTS movies_spectators(
    spectator_id uuid NOT NULL,
    movie_id uuid NOT NULL,
    created_at_movie_spectator TIMESTAMP DEFAULT NOW(),
    updated_at_movie_spectator TIMESTAMP,
    PRIMARY KEY (spectator_id, movie_id),
    FOREIGN KEY (spectator_id) REFERENCES spectators(spectator_id) ON DELETE CASCADE,
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id) ON DELETE CASCADE
);

-- Création de la table d'association entre spectateurs et personnages favoris
CREATE TABLE IF NOT EXISTS spectators_characters(
    spectator_id uuid NOT NULL,
    character_id uuid NOT NULL,
    created_at_spectator_character TIMESTAMP DEFAULT NOW(),
    updated_at_spectator_character TIMESTAMP,
    PRIMARY KEY (spectator_id, character_id),
    FOREIGN KEY (spectator_id) REFERENCES spectators(spectator_id) ON DELETE CASCADE,
    FOREIGN KEY (character_id) REFERENCES characters(character_id) ON DELETE CASCADE
);

-- Création de la table d'association entre les films et les acteurs
CREATE TABLE IF NOT EXISTS movies_actors(
    movie_id uuid NOT NULL,
    actor_id uuid NOT NULL,
    created_at_movie_actor TIMESTAMP DEFAULT NOW(),
    updated_at_movie_actor TIMESTAMP,
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id) ON DELETE CASCADE,
    FOREIGN KEY (actor_id) REFERENCES actors(actor_id) ON DELETE CASCADE
);

-- Création de la table des archives
CREATE TABLE IF NOT EXISTS archives(
    archive_id uuid PRIMARY KEY not null,
    archive_date TIMESTAMP DEFAULT NOW(),
    modified_field VARCHAR(50) NOT NULL,
    old_value VARCHAR(50) NOT NULL,
    new_value VARCHAR(50) NOT NULL,
    spectator_id uuid NOT NULL
);