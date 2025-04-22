# Dictionnaire de Données

## Films

| Attribut     | Type           | Description                               | Exemple                              |
| ------------ | -------------- | ----------------------------------------- | ------------------------------------ |
| movie_id     | Alphanumérique | Identifiant unique du film                | 4f9a2b18-7c7b-4c8a-bc90-9e0b1e2d4a5f |
| title        | Alphanumérique | Nom du film                               | Spider-man                           |
| length       | entier         | Durée du film en minute                   | 125                                  |
| release_date | date           | Date de sortie du film                    | 20-10-2002                           |
| director_id  | Alphanumérique | Identifiant unique du réalisateur associé | 4f9a2b18-7c7b-4c8a-bc90-9e0b1e2d4a5f |

## Acteurs

| Attribut         | Type           | Description                    | Exemple                              |
| ---------------- | -------------- | ------------------------------ | ------------------------------------ |
| actor_id         | Alphanumérique | Identifiant unique de l'acteur | 4f9a2b18-7c7b-4c8a-bc90-9e0b1e2d4a5f |
| first_name_actor | Alphanumérique | prénom de l'acteur             | Tom                                  |
| last_name_actor  | Alphanumérique | nom de l'acteur                | Holland                              |
| date_of_birth    | date           | date de naissance              | 01-06-1996                           |

## Rôles

| Attribut         | Type           | Description                | Exemple                              |
| ---------------- | -------------- | -------------------------- | ------------------------------------ |
| character_id     | Alphanumérique | Identifiant unique du rôle | 4f9a2b18-7c7b-4c8a-bc90-9e0b1e2d4a5f |
| character_name   | Alphanumérique | nom du rôle                | Spider-man                           |
| character_status | Alphanumérique | type de rôle               | Principal                            |

## Réalisateurs

| Attribut            | Type           | Description                       | Exemple                              |
| ------------------- | -------------- | --------------------------------- | ------------------------------------ |
| director_id         | Alphanumérique | Identifiant unique du réalisateur | 4f9a2b18-7c7b-4c8a-bc90-9e0b1e2d4a5f |
| first_name_director | Alphanumérique | prénom du réalisateur             | Tom                                  |
| last_name_director  | Alphanumérique | nom du réalisateur                | Holland                              |