-- Création d'un utilisateur
CREATE USER netstream
  WITH PASSWORD 'secret';

-- Création de la base de données avec cet utilisateur comme propriétaire
CREATE DATABASE netstream
  WITH OWNER = netstream;

-- Connection à la base de données
\connect netstream

-- Création d'un schéma
CREATE SCHEMA netstream_schema
  AUTHORIZATION netstream;

-- Définir le schéma par défaut
SET search_path TO netstream_schema;

-- Table des réalisateurs
CREATE TABLE IF NOT EXISTS directors(
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    first_name_director VARCHAR(120) NOT NULL,
    last_name_director VARCHAR(120) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP
);

-- Table des films
CREATE TABLE IF NOT EXISTS movies(
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    title VARCHAR(200) NOT NULL,
    length INT NOT NULL,
    release_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,
    director_id uuid NOT NULL,
    FOREIGN KEY (director_id) REFERENCES directors(id)
);

-- Table des personnages
CREATE TABLE IF NOT EXISTS characters(
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    name_character VARCHAR(120) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP
);

-- Table des acteurs
CREATE TABLE IF NOT EXISTS actors(
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    first_name_actor VARCHAR(120) NOT NULL,
    last_name_actor VARCHAR(120) NOT NULL,
    date_of_birth DATE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP
);

-- Table des spectateurs
CREATE TABLE IF NOT EXISTS spectators(
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    first_name_spectator VARCHAR(120) NOT NULL,
    last_name_spectator VARCHAR(120) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP
);

-- Table d'association entre films et personnages
CREATE TABLE IF NOT EXISTS movies_characters(
    movie_id uuid NOT NULL,
    character_id uuid NOT NULL,
    character_type VARCHAR(50) NOT NULL,
    PRIMARY KEY (movie_id, character_id),
    FOREIGN KEY (movie_id) REFERENCES movies(id) ON DELETE CASCADE,
    FOREIGN KEY (character_id) REFERENCES characters(id) ON DELETE CASCADE
);

-- Table d'association entre acteurs et personnages
CREATE TABLE IF NOT EXISTS character_actors(
    actor_id uuid NOT NULL,
    character_id uuid NOT NULL,
    PRIMARY KEY (actor_id, character_id),
    FOREIGN KEY (actor_id) REFERENCES actors(id) ON DELETE CASCADE,
    FOREIGN KEY (character_id) REFERENCES characters(id) ON DELETE CASCADE
);

-- Table d'association entre spectateurs et films favoris
CREATE TABLE IF NOT EXISTS movies_spectators(
    spectator_id uuid NOT NULL,
    movie_id uuid NOT NULL,
    PRIMARY KEY (spectator_id, movie_id),
    FOREIGN KEY (spectator_id) REFERENCES spectators(id) ON DELETE CASCADE,
    FOREIGN KEY (movie_id) REFERENCES movies(id) ON DELETE CASCADE
);

-- Table d'association entre spectateurs et personnages favoris
CREATE TABLE IF NOT EXISTS spectators_characters(
    spectator_id uuid NOT NULL,
    character_id uuid NOT NULL,
    PRIMARY KEY (spectator_id, character_id),
    FOREIGN KEY (spectator_id) REFERENCES spectators(id) ON DELETE CASCADE,
    FOREIGN KEY (character_id) REFERENCES characters(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS archives(
    id uuid PRIMARY KEY DEFAULT,
    archive_date TIMESTAMP DEFAULT NOW(),
    modified_field VARCHAR(50) NOT NULL,
    old_value VARCHAR(50) NOT NULL,
    new_value VARCHAR(50) NOT NULL,
    spectator_id uuid NOT NULL
)