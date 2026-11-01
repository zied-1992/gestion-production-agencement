# Architecture technique – Principes initiaux

- **Projet :** Gestion de production – Agencement
- **Version :** 0.1 – principes à valider
- **Statut :** conception initiale, choix techniques non définitifs

## 1. Objectif

Définir une architecture mobile multi-utilisateurs, multi-appareils, compatible avec Android et iOS, permettant le travail simultané en ligne et la saisie hors ligne avec synchronisation automatique.

## 2. Principe général

L'architecture envisagée comporte quatre éléments :

1. **Application mobile Flutter** : interface et logique métier sur Android et iOS.
2. **Base locale SQLite** : conservation des données nécessaires à l'utilisation hors ligne et des opérations en attente de synchronisation.
3. **Backend central** : authentification, contrôle des permissions, logique métier, API et accès partagé aux données.
4. **Base centrale PostgreSQL et stockage cloud** : données communes, documents et photos.

Le choix du fournisseur backend et du moteur de synchronisation reste ouvert.

## 3. Utilisation multi-utilisateurs

- Chaque personne se connecte avec son compte individuel.
- Plusieurs utilisateurs peuvent consulter et saisir des données au même moment.
- Les données communes sont centralisées sur le serveur.
- Les droits sont vérifiés côté serveur, pas uniquement dans l'interface mobile.
- L'auteur d'une saisie est identifié automatiquement.
- L'équipe affectée à une opération reste distincte de l'utilisateur qui a enregistré la saisie.
- Les connexions depuis plusieurs appareils sont autorisées.

## 4. Fonctionnement hors ligne

L'application doit permettre au minimum la consultation des données préalablement synchronisées et l'enregistrement local des saisies de production.

Chaque opération locale en attente de synchronisation doit disposer :
- d'un identifiant unique généré côté appareil ;
- de l'identité de l'utilisateur connecté ;
- d'une date/heure de création ;
- d'un état de synchronisation ;
- d'une clé d'idempotence pour empêcher la création de doublons lors des nouvelles tentatives.

Lorsque la connexion revient, les opérations en attente sont transmises au serveur. L'application doit afficher leur état : en attente, synchronisation en cours, synchronisé ou erreur à traiter.

## 5. Concurrence et conflits

Les règles de synchronisation doivent distinguer les types de données.

- **Saisies de production :** privilégier des événements immuables et uniques. Une nouvelle tentative d'envoi ne doit jamais créer une deuxième saisie.
- **Corrections de production :** autorisées uniquement pour les rôles habilités, avec historique de l'ancienne valeur, de la nouvelle valeur, de l'auteur, de l'heure et du motif.
- **Données de projet et paramètres :** détecter les modifications concurrentes et éviter qu'une modification plus ancienne écrase silencieusement une modification récente.
- **Messagerie :** synchroniser les nouveaux messages lorsque la connexion est disponible.

La stratégie détaillée de résolution des conflits doit être définie et testée avec un prototype avant de retenir définitivement le backend.

## 6. Sécurité

- Authentification individuelle.
- Autorisations vérifiées côté serveur pour chaque opération sensible.
- Isolation des données selon les permissions.
- Communications chiffrées.
- Protection des fichiers et documents.
- Journalisation des corrections sensibles.
- Sauvegardes automatiques côté serveur.

Un PIN ou la biométrie peuvent faciliter le déverrouillage local, mais ne remplacent pas l'authentification et l'autorisation côté serveur.

## 7. Technologies envisagées

| Couche | Orientation initiale |
|---|---|
| Application mobile | Flutter |
| Base locale | SQLite |
| Base centrale | PostgreSQL |
| Backend | À comparer |
| Synchronisation hors ligne | À comparer et prototyper |
| Fichiers | Stockage cloud sécurisé |
| Notifications push | Firebase Cloud Messaging |
| Dépôt du code | GitHub |

Aucun fournisseur de backend ou de synchronisation n'est encore sélectionné.

## 8. Prototype technique à réaliser avant le développement complet

Le prototype devra démontrer les scénarios suivants :

1. Deux téléphones se connectent avec deux comptes différents.
2. Un utilisateur crée une saisie de production en ligne et l'autre la voit après synchronisation.
3. Un téléphone passe hors ligne et enregistre une saisie.
4. Le téléphone retrouve la connexion et transmet la saisie une seule fois.
5. Une même opération est envoyée plusieurs fois à cause d'une coupure réseau : aucun doublon n'est créé.
6. Deux utilisateurs modifient simultanément une même donnée de projet : le conflit est détecté et traité sans perte silencieuse.
7. Un opérateur tente une correction interdite : le serveur la refuse.
8. Un responsable corrige une saisie : la trace d'audit est conservée.

## 9. Décisions restant à prendre

- Fournisseur backend et hébergement.
- Moteur de synchronisation offline-first.
- Données disponibles hors ligne et durée de conservation locale.
- Politique précise de résolution des conflits.
- Gestion des sessions et appareils perdus.
- Stockage, taille maximale et accès aux photos et documents.
- Stratégie de sauvegarde et de restauration serveur.

## 10. Règle de conception

Ne pas choisir une technologie uniquement parce qu'elle est facile à démarrer. Le choix doit être validé par un prototype qui prouve le multi-utilisateur, les droits d'accès, la synchronisation hors ligne et la prévention des doublons.
