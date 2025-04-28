# ⚙️ Choix du SGBDR pour le projet

---

## 📝 Introduction
Le choix d'un **Système de Gestion de Bases de Données Relationnelles (SGBDR)** est une étape clé pour assurer la **pérennité** et les **performances** du projet. Ce document présente les **critères de sélection** et justifie le choix du SGBDR adapté à ce projet.

---

## Contexte du projet
- **Exigences clés :**
  - Manipulation de données relationnelles (utilisateurs, transactions, procédures).
  - Performances stables avec des charges modérées à élevées.
  - Support des requêtes complexes (jointures, agrégations).
  - Evolutivité pour accompagner la croissance du projet.

---

## Critères de sélection
Pour sélectionner le SGBDR idéal, plusieurs critères ont été évalués :
1. **Performances** : Temps de réponse pour les opérations CRUD.
2. **Fiabilité** : Support des transactions ACID.
3. **Flexibilité** : Gestion des types de données variés (JSON, textuel, etc.).
4. **Évolutivité** : Aptitude du SGBDR à s'adapter à une augmentation des volumes de données et des charges de travail, tout en maintenant des performances optimales.
5. **Communauté et support** : Documentation, outils et communauté active.
6. **Coût** : Logiciel libre ou licences abordables.
7. **Sécurité** : Protection des données, gestion des accès et conformité aux standards.

---

## Analyse des options
### 1. PostgreSQL
- **Avantages :**
  - Excellentes performances pour les requêtes complexes.
  - Transactions ACID robustes.
  - Support avancé des types de données (JSONB, XML, tableaux multidimensionnels, types composites, UUID).
  - Très évolutif (réplication, partitions).
  - Communauté active et nombreuses extensions disponibles.
  - **Sécurité** :
    - Système de rôles et privilèges très granulaire
    - Support natif du chiffrement SSL/TLS
    - Authentification forte (SCRAM-SHA-256, GSSAPI, etc.)
    - Row-level security pour le contrôle d'accès précis
    - Mises à jour de sécurité régulières
- **Inconvénients :**
  - Peut être plus complexe à configurer pour des utilisateurs débutants.
  - Consommation mémoire potentiellement plus élevée.

### 2. MySQL/MariaDB
- **Avantages :**
  - Performances solides pour des besoins standards.
  - Large adoption et support par de nombreux hébergeurs.
  - MariaDB offre des améliorations open-source basées sur MySQL.
  - **Sécurité** :
    - Authentification des connexions par plugin
    - Système de privilèges par utilisateur
    - Support du chiffrement des données au repos
- **Inconvénients :**
  - Moins performant pour des requêtes complexes ou des charges élevées.
  - Fonctionnalités moins avancées que PostgreSQL (JSON, transactions).
  - **Sécurité** :
    - Contrôle d'accès moins granulaire que PostgreSQL
    - Historique de vulnérabilités plus important
    - Configuration par défaut moins sécurisée

### 3. SQLite (option légère)
- **Avantages :**
  - Aucun besoin de serveur (base de données embarquée).
  - Simple à configurer et léger.
  - **Sécurité** :
    - Pas d'accès réseau (sécurité par isolement)
    - Possibilité de chiffrer la base entière
- **Inconvénients :**
  - Non adapté à des charges élevées ou des données complexes.
  - Fonctionnalités limitées comparées à PostgreSQL/MySQL.
  - **Sécurité** :
    - Absence de gestion des utilisateurs et des droits
    - Dépendance à la sécurité du système de fichiers hôte
    - Vulnérable aux corruptions en cas d'accès concurrent

### 4. MongoDB (NoSQL pour comparaison)
- **Avantages :**
  - Flexible pour des données non relationnelles.
  - Bonne gestion des données semi-structurées (JSON).
  - **Sécurité** :
    - Support du chiffrement TLS/SSL
    - Authentification SCRAM
    - Contrôle d'accès basé sur les rôles
- **Inconvénients :**
  - Pas adapté à des données fortement relationnelles.
  - Manque de support natif des transactions ACID (selon les versions).
  - **Sécurité** :
    - Historique de problèmes de sécurité par défaut (anciennes versions)
    - Complexité de configuration pour un environnement sécurisé
    - Attaques spécifiques aux bases NoSQL (NoSQL injection)

---

## Justification du choix
**PostgreSQL** a été retenu comme le SGBDR principal pour ce projet pour les raisons suivantes :
1. **Performances et évolutivité** : PostgreSQL est capable de gérer des charges croissantes ainsi que des requêtes complexes grâce à son moteur robuste.
2. **Fiabilité** : Prise en charge complète des transactions ACID, essentielle pour assurer la cohérence et l'intégrité des données.
3. **Évolution future** : Les fonctionnalités avancées (réplication, partitionnement) garantissent une évolutivité à long terme.
4. **Sécurité** : PostgreSQL offre de nombreuses fonctionnalités de sécurité avancées, notamment :
   - Gestion fine des permissions avec système de rôles et privilèges hiérarchiques
   - Authentification forte (SCRAM-SHA-256, certificats SSL/TLS)
   - Chiffrement des communications client-serveur
   - Prise en charge du chiffrement au niveau des colonnes
   - Journalisation détaillée des activités (audit trail)
   - Protection contre les injections SQL via les requêtes préparées
   - Support des schémas pour l'isolation logique des données
   - Mise à jour régulière des correctifs de sécurité par une communauté réactive

---

## Conclusion
Le choix de PostgreSQL comme SGBDR pour ce projet repose sur sa capacité à répondre aux besoins actuels tout en offrant des perspectives de croissance. Il s'agit d'un choix stratégique qui garantit robustesse, flexibilité et performances pour accompagner l'évolution du projet. Les aspects sécurité ont été particulièrement pris en compte, PostgreSQL offrant le meilleur compromis entre protection des données, contrôle d'accès et conformité aux standards modernes de sécurité.

---

