# Politique de rétention

Cette page indique les mesures prises pour assurer la sécurité des donnée en cas d'accidents.

## les risques

Les risque notre base de donnée peut rencontré sont multiple:
- une mauvaise manipulation de données(Suppression accidentelle de la base de donnée, erreur dans une requete)
- problème technique (corruption ou panne matérielle)
- Acte criminel (base de donnée volé et bloqué avec un ransomware)

Pour c'est raison une politique de rétention va etre mise en place

## les mesures

La base de donnée sera sauvegarder tous les jours à 2 heures du matin, un fichier log indiquera le succée ou échec de ses sauvegardes, chaque sauvegarde sera garder 7 jours puis supprimer

La sauvegarde se fera grace à un script qui sera executé tous les jour à 2h00

```
#!/bin/bash

# Configuration
BACKUP_DIR="/home/exiz/Desktop/stupid-test"
DB_NAME="netstream"
DB_USER="netstream_admin"
LOG_FILE="$BACKUP_DIR/backup.log"
DATE=$(date +%F_%H-%M-%S)
FILE="${DB_NAME}_$DATE.backup"

# Sauvegarde
echo "[$(date)] DÉBUT sauvegarde" >> "$LOG_FILE"
 if pg_dump -U "$DB_USER" -d "$DB_NAME" -F c -f "$BACKUP_DIR/Netstream-$DATE.backup" >> "$LOG_FILE" 2>&1; then
     echo "[$(date)] ✅ Sauvegarde réussie : $FILE" >> "$LOG_FILE"
 else
     echo "[$(date)] ❌ ÉCHEC sauvegarde" >> "$LOG_FILE"
fi

# Suppression des fichiers de plus de 7 jours

find "$BACKUP_DIR" -name "*.backup" -mtime +7 -exec rm {} \; >> "$LOG_FILE"
```

