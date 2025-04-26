# Politique de rétention

Cette page indique les mesures prises pour assurer la sécurité des données en cas d'incidents.

## Les risques

Les risques que notre base de données peut rencontrer sont multiples :
- Une mauvaise manipulation des données (suppression accidentelle de la base de données, erreur dans une requête).
- Problème technique (corruption ou panne matérielle).
- Acte criminel (base de données volée et bloquée avec un ransomware).

Pour ces raisons, une politique de rétention va être mise en place.

## Les mesures

La base de données sera sauvegardée tous les jours à 2 heures du matin. Un fichier log indiquera le succès ou l’échec de ces sauvegardes. Chaque sauvegarde sera conservée pendant 7 jours, puis supprimée.

La sauvegarde se fera grâce à un script qui sera exécuté tous les jours à 2h00.

### Script de sauvegarde

Voici le script de sauvegarde à exécuter automatiquement :

```bash
#!/bin/bash

# Configuration
BACKUP_DIR="path"
DB_NAME="netstream"
DB_USER="netstream_admin"
LOG_FILE="$BACKUP_DIR/backup.log"
DATE=$(date +%F_%H-%M-%S)
FILE="${DB_NAME}_$DATE.backup"

# Sauvegarde
echo "[$(date)] DÉBUT de la sauvegarde" >> "$LOG_FILE"
if pg_dump -U "$DB_USER" -d "$DB_NAME" -F c -f "$BACKUP_DIR/Netstream-$DATE.backup" >> "$LOG_FILE" 2>&1; then
    echo "[$(date)] ✅ Sauvegarde réussie : $FILE" >> "$LOG_FILE"
else
    echo "[$(date)] ❌ ÉCHEC de la sauvegarde" >> "$LOG_FILE"
fi

# Suppression des fichiers de plus de 7 jours
find "$BACKUP_DIR" -name "*.backup" -mtime +7 -exec rm {} \; >> "$LOG_FILE"

```

Il faudra modifier les permissions du fichier pour qu'il soit exécutable.

Le mot de passe de l'utilisateur sera conservé dans le fichier .pgpass

>nano .pgpass

Ajoutez la ligne en remplaçant les informations

>hostname:port:database:username:password

## Cron

Le script sera exécuté automatiquement tous les jours à 2h00 grâce à cron avec la ligne:

> 0 2 * * * path/script.sh

## Restauration

En cas de problème on peut restoré une ancienne sauvegarde avec

> pg_restore -U User -d netstream path_to_backup

