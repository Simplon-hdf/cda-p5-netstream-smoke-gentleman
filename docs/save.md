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

