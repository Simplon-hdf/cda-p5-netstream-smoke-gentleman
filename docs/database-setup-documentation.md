# Documentation d'installation et de configuration de la base de données NetStream

## Installation de PostgreSQL

### Sous Linux (Ubuntu/Debian)
```bash
# Mise à jour des dépôts
sudo apt update

# Installation de PostgreSQL
sudo apt install postgresql postgresql-contrib

# Vérifier le statut du service
sudo systemctl status postgresql
```

### Sous macOS (avec Homebrew)
```bash
# Installation via Homebrew
brew install postgresql

# Démarrer le service
brew services start postgresql
```

### Sous Windows
1. Téléchargez l'installateur depuis [le site officiel de PostgreSQL](https://www.postgresql.org/download/windows/)
2. Exécutez l'installateur et suivez les instructions
3. Laissez le port par défaut (5432) sauf si vous avez des contraintes spécifiques
4. Définissez un mot de passe pour l'utilisateur `postgres`

## Configuration de la base de données NetStream

### 1. Création de la base de données

Connectez-vous à PostgreSQL et créez une base de données dédiée :

```bash
# Connexion à PostgreSQL avec l'utilisateur postgres
sudo -u postgres psql

# Dans PostgreSQL, créer la base de données
CREATE DATABASE netstream;

# Créer un administrateur pour la base de données
CREATE ROLE netstream_admin WITH LOGIN PASSWORD 'secret';

# Accorder les privilèges à l'administrateur
GRANT ALL PRIVILEGES ON DATABASE netstream TO netstream_admin;

# Quitter PostgreSQL
\q
```

### 2. Initialisation de la structure

Après avoir créé la base de données, importez le schéma :

```bash
# Naviguer vers le dossier du projet
cd /chemin/vers/cda-p5-netstream-smoke-gentleman

# Exécuter le script SQL pour créer la structure de la base de données
psql -U netstream_user -d netstream -f sql/netstream_database.sql
```

### 3. Jeu de données de test

Pour charger un jeu de données de test :

```bash
psql -U netstream_user -d netstream -f sql/database-fixtures.sql
```

## Vérification de l'installation

Pour vérifier que l'installation fonctionne correctement :

```bash
# Se connecter à la base
psql -U netstream_user -d netstream

# Lister les tables
\dt

# Tester une requête simple
SELECT count(*) FROM movies;

# Quitter
\q
```

## 📚 Ressources additionnelles

- [Documentation officielle PostgreSQL](https://www.postgresql.org/docs/)
- [Guide des bonnes pratiques PostgreSQL](https://wiki.postgresql.org/wiki/Main_Page)
- [Tutoriels SQL](https://www.postgresqltutorial.com/)

---
