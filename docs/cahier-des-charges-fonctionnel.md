# Cahier des charges fonctionnel – V1

- **Projet :** Gestion de production – Agencement
- **Version :** 0.1 – base de conception
- **Langue de l'interface :** français
- **Plateformes :** Android et iOS
- **Public concerné :** direction, responsable de production et opérateurs

## 1. Contexte et objectif

L'entreprise réalise des travaux d'agencement sur mesure associant notamment des panneaux MDF et des structures métalliques. L'application doit faciliter le suivi des projets et des quantités fabriquées, depuis la préparation de la production jusqu'à l'installation chez le client.

L'objectif est de disposer d'une application mobile simple, centralisée et utilisable sur le terrain, y compris lorsque la connexion Internet est momentanément indisponible.

L'application n'a pas vocation à remplacer un ERP complet.

## 2. Périmètre de la V1

### 2.1 Fonctions incluses

- Gestion des projets et de leurs produits.
- Catalogue réutilisable de produits.
- Modèles d'opérations et opérations personnalisées.
- Suivi des quantités prévues, produites et restantes.
- Saisie quotidienne de la production et historique.
- Gestion des utilisateurs, rôles, équipes et droits.
- Tableaux de bord et indicateurs de production.
- Planning simple par dates de début et de livraison prévues.
- Photos et documents associés aux projets.
- Gestion documentaire administrative.
- Rapports PDF et Excel.
- Messagerie interne.
- Réunions, comptes rendus, décisions et actions.
- Recherche globale respectant les permissions.
- Assistant IA en lecture seule sur les données autorisées.
- Mode hors ligne et synchronisation automatique.
- Notifications internes et notifications push.

### 2.2 Fonctions exclues

La V1 ne comprend pas : gestion des stocks, matières premières, achats, fournisseurs, sous-traitants, coûts, finances, maintenance, qualité, non-conformités, réclamations, suivi des temps, objectifs intermédiaires, codes QR/barres, signatures électroniques, gestion RH/congés, priorités, retards, diagramme de Gantt, Kanban, dépendances obligatoires entre opérations, catalogue clients, interface desktop ou calendrier/visioconférence externe.

## 3. Utilisateurs, rôles et droits

### 3.1 Direction / Gérant

- Consulter l'ensemble des projets et des données de production.
- Consulter les tableaux de bord globaux et les rapports.
- Créer, modifier et annuler des projets.
- Gérer les données de référence selon les droits attribués.
- Corriger ou supprimer une saisie de production, avec traçabilité.

### 3.2 Responsable de production / Ingénieur

- Consulter et gérer les projets et les produits.
- Organiser les opérations, affecter les équipes et les opérateurs.
- Consulter les tableaux de bord et l'historique.
- Corriger ou supprimer les saisies de production, avec justification.
- Gérer les comptes utilisateurs et leurs permissions.
- Gérer les équipes.

### 3.3 Opérateur

- Consulter tous les projets, produits, quantités prévues et avancements.
- Voir en priorité les projets en cours.
- Consulter les quantités produites et restantes.
- Ajouter une saisie de production.
- Consulter son propre historique de saisies.
- Ne pas modifier ni supprimer une saisie après validation.

Chaque opérateur dispose d'un compte individuel. La création des comptes est réservée à la direction et au responsable de production habilité ; les opérateurs ne peuvent pas créer eux-mêmes leur compte. Un utilisateur peut être connecté sur plusieurs appareils. Une saisie conserve toujours l'identité de son auteur, indépendamment de l'équipe ou des personnes affectées à l'opération.

### 3.4 Authentification

Connexion par identifiant et mot de passe, avec code PIN prévu pour faciliter l'accès. L'authentification biométrique peut être proposée si l'appareil le permet. Les règles de sécurité du PIN, de récupération du compte et de renouvellement du mot de passe restent à préciser.

## 4. Gestion des projets

Chaque projet contient au minimum :

- Référence de projet générée automatiquement et modifiable.
- Nom du projet.
- Nom du client en texte libre, sans catalogue client.
- Date de début prévue.
- Date de livraison prévue.
- Liste des produits / ouvrages à fabriquer.
- Quantité prévue pour chaque produit.
- Photos prises ou ajoutées aux différentes étapes.
- Documents associés : plans, PDF et autres fichiers autorisés.
- Statut : **En cours**, **Terminé** ou **Annulé**.

Fonctions disponibles : création, consultation, modification, recherche, filtres par statut et dates, consultation d'un historique simple indiquant l'utilisateur et la date de modification.

La recherche d'un projet doit pouvoir utiliser son nom, le client, le produit ou la référence. Un calendrier simple affiche les dates de début et de livraison prévues.

Pas de priorité, de statut « en retard », de commentaires ni de suivi détaillé des retards en V1.

## 5. Produits et opérations de fabrication

### 5.1 Catalogue produits

Un produit réutilisable peut être créé et ajouté à tout moment. Ses champs sont :

- Nom.
- Longueur.
- Largeur.
- Hauteur.
- Quantité à fabriquer dans le projet.

Les unités des dimensions et leur précision devront être normalisées dans la conception technique.

### 5.2 Opérations

Chaque produit peut avoir plusieurs opérations. L'utilisateur peut partir de modèles réutilisables ou créer une opération personnalisée.

Modèles initiaux proposés :

- Découpe MDF.
- Découpe fer / métal.
- Soudure.
- Assemblage.
- Finition.
- Emballage.

Les opérations peuvent être ajoutées, modifiées, supprimées, réordonnées et affectées à une équipe ou à plusieurs opérateurs. Leur ordre est libre et aucune dépendance obligatoire n'est imposée. Les activités MDF et métal peuvent donc avancer en parallèle.

## 6. Suivi de la production

### 6.1 Unités

Les quantités peuvent être suivies en pièce, mètre linéaire (ml), mètre carré (m²), lot, kilogramme (kg) ou unité personnalisée.

Une même opération utilise une unité cohérente. Les quantités exprimées dans des unités différentes ne doivent jamais être additionnées dans un indicateur global.

### 6.2 Saisie d'une production

Une saisie comprend :

- Projet.
- Produit.
- Opération.
- Date de production.
- Quantité réalisée.
- Équipe et/ou opérateur(s) concernés.
- Auteur de la saisie, attribué automatiquement.

Après validation, la quantité est intégrée immédiatement au cumul. Il n'y a pas de circuit de validation.

### 6.3 Calculs et historique

Pour chaque opération, afficher :

- Quantité prévue.
- Quantité cumulée réalisée.
- Quantité restante.
- Taux d'avancement.

Formule indicative : taux d'avancement = quantité réalisée / quantité prévue × 100. Le comportement en cas de dépassement de la quantité prévue doit être défini avant développement. La quantité réellement déclarée doit rester consultable même si elle dépasse la prévision.

L'historique permet de consulter les saisies par projet, produit, opération, date, équipe et auteur.

### 6.4 Corrections et traçabilité

Seuls la direction et le responsable de production peuvent modifier ou supprimer une saisie. Toute correction doit conserver une trace comprenant :

- Valeur précédente.
- Nouvelle valeur.
- Utilisateur ayant effectué la correction.
- Date et heure.
- Motif obligatoire de la correction.

La suppression ne doit pas effacer la trace d'audit.

## 7. Équipes

Équipes initiales proposées :

- Équipe découpe MDF.
- Équipe découpe fer.
- Équipe soudure et structures métalliques.
- Équipe assemblage et montage.

La direction ou le responsable habilité peut ajouter, modifier et supprimer des équipes. Une opération peut concerner plusieurs opérateurs. L'équipe affectée et l'auteur de la saisie sont deux informations distinctes.

## 8. Tableaux de bord et indicateurs

### 8.1 Direction

- Nombre de projets en cours.
- Nombre de projets terminés.
- Avancement global de la production.
- Graphiques de production hebdomadaire et mensuelle.
- Liste des projets et leur avancement.

### 8.2 Responsable de production

- Projets en production.
- Dernières saisies.
- Quantités produites aujourd'hui.
- Quantités produites cette semaine.

### 8.3 Opérateur

- Projets en cours mis en évidence, sans masquer les autres projets.
- Quantités produites et restantes.
- Historique personnel des saisies.
- Avancement global des projets.

Les tableaux de bord sont personnalisables : choix des indicateurs, ordre et disposition. Les indicateurs globaux ne doivent pas additionner des unités incompatibles. La méthode de calcul d'un avancement global entre plusieurs produits devra être validée avant implémentation.

## 9. Planning et notifications

Le planning reste simple : dates de début et de livraison prévues des projets et, si nécessaire, dates prévues des opérations. Pas de Gantt ni de mécanisme de retard.

Notifications prévues en V1 :

- Nouveau message.
- Nouvelle saisie de production.
- Projet marqué comme terminé.

Les notifications sont disponibles dans l'application et, lorsque la connexion le permet, sous forme de notifications push. Les destinataires exacts dépendent du rôle et restent à définir.

## 10. Rapports

Rapports prévus :

- Rapport de production hebdomadaire.
- Rapport de production mensuel.
- Rapport d'avancement par projet.
- Rapport de production par équipe.

Génération automatique périodique et génération manuelle. Formats : PDF et Excel. Personnalisation possible avec logo, nom et couleurs de l'entreprise, ainsi que sélection des tableaux, graphiques et indicateurs. Les horaires d'envoi et les destinataires des rapports automatiques restent à définir.

## 11. Documents et photos

### 11.1 Documents de projet

Possibilité d'ajouter plusieurs photos et documents à un projet, notamment des plans et des fichiers PDF. Les documents sont consultables selon les droits de l'utilisateur.

### 11.2 Documents administratifs

Espace documentaire pour les procédures, modes opératoires, fiches de poste, documents d'organisation et autres documents PDF ou Word.

L'accès est contrôlé par rôle. La gestion avancée des versions et les commentaires sur documents sont exclus de la V1.

## 12. Messagerie et réunions

### 12.1 Messagerie

Messagerie interne permettant les conversations privées et les groupes, avec partage de photos et de documents et notification des nouveaux messages. Les règles de création des groupes, de conservation des messages et de suppression restent à préciser.

### 12.2 Réunions

Une réunion contient :

- Date.
- Participants.
- Projet associé, facultatif.
- Compte rendu.
- Décisions.
- Actions à réaliser.
- Responsables des actions.

Pas de signature électronique ni de calendrier externe en V1.

## 13. Recherche globale

Recherche dans les projets, produits, clients saisis en texte libre, utilisateurs, documents et messages. Filtres par catégorie, date, utilisateur et type de contenu. Les résultats doivent toujours respecter les droits d'accès du compte connecté.

## 14. Assistant IA

L'assistant répond en langage naturel à des questions portant sur les données réelles accessibles à l'utilisateur, par exemple :

- Quels projets ont le plus faible avancement ?
- Quelle quantité a été produite cette semaine ?
- Quel est le taux d'avancement global ?
- Résume la production du mois.

L'assistant est en lecture seule : il ne peut ni créer ni modifier ni supprimer de données. Les droits d'accès doivent être appliqués aux données utilisées pour chaque réponse. Le fournisseur IA, les coûts, la confidentialité et les limites d'utilisation doivent être validés avant activation.

## 15. Expérience utilisateur

- Interface entièrement en français.
- Application mobile Android et iOS.
- Identité visuelle personnalisable : logo, nom et couleurs de l'entreprise.
- Thème clair ou sombre, sélection manuelle.
- Navigation principale en barre inférieure et fonctions secondaires dans un menu latéral.
- Écrans et tableaux de bord adaptés au rôle.
- Saisie simple et lisible sur téléphone.

## 16. Fonctionnement hors ligne et synchronisation

L'application doit permettre les opérations essentielles de consultation et de saisie de production sans connexion Internet. Les données saisies hors ligne sont enregistrées localement puis synchronisées automatiquement au retour de la connexion.

Exigences de conception :

- Identifiants uniques générés côté client pour les nouvelles opérations.
- Conservation des dates/heures et de l'auteur de chaque saisie.
- File locale des opérations en attente de synchronisation.
- Prévention des doublons lors des nouvelles tentatives d'envoi.
- Gestion explicite des conflits entre modifications effectuées sur plusieurs appareils.
- Indication claire de l'état de synchronisation.

La messagerie et les notifications push nécessitent une connexion. La stratégie technique de synchronisation et les règles précises de résolution des conflits doivent être validées par un prototype avant le choix définitif du backend.

## 17. Sécurité et sauvegardes

- Accès aux données selon les rôles et permissions.
- Protection des documents et photos.
- Traçabilité des corrections de production.
- Communications réseau sécurisées.
- Sauvegardes automatiques côté serveur.
- Aucun mécanisme de sauvegarde/restauration manuelle par l'utilisateur en V1.

Les durées de conservation, les règles de suppression des comptes et la politique de confidentialité devront être définies avant mise en production.

## 18. Architecture technique envisagée

Orientation initiale, à confirmer après validation d'un prototype :

- Application mobile : Flutter.
- Base de données serveur : PostgreSQL.
- Base locale : SQLite.
- Stockage distant des fichiers : stockage objet sécurisé.
- Notifications push : Firebase Cloud Messaging.
- Production de rapports : génération PDF et Excel.
- Assistant IA : API externe ou service compatible, avec contrôle des permissions.
- Code source et documentation : GitHub.

Le choix du backend ne doit pas être arrêté avant d'avoir testé le fonctionnement hors ligne, la synchronisation, les conflits et les droits d'accès.

## 19. Points à valider avant le développement fonctionnel

Les décisions suivantes restent ouvertes et ne doivent pas être supposées :

1. **Dépassement de quantité :** autoriser une production supérieure à la quantité prévue ? Comment afficher le restant (zéro ou valeur négative) et le taux (plafonné à 100 % ou supérieur) ?
2. **Avancement global :** quelle pondération utiliser pour agréger les avancements de produits et opérations de natures différentes ?
3. **Unités :** quelles unités utiliser pour les dimensions des produits et comment gérer les arrondis ?
4. **Planning :** faut-il gérer une date prévue par opération ou seulement les dates du projet ?
5. **Rapports automatiques :** quels jours/heures et quels destinataires ?
6. **Notifications :** quels rôles reçoivent chaque type de notification ?
7. **Messagerie :** qui peut créer des groupes et quelles sont les règles de conservation/suppression ?
8. **Hors ligne :** quelles fonctions doivent être intégralement disponibles hors ligne et quelle règle appliquer en cas de conflit ?
9. **Comptes :** quelles règles pour le PIN, la récupération et la désactivation d'un compte ?
10. **Assistant IA :** quel fournisseur, quelles limites de coût et quelles règles de confidentialité ?
11. **Documents :** quelles limites de taille et quels formats de fichiers accepter ?
12. **Mise en production :** nom de l'application, identité graphique et comptes de publication Android/iOS.

## 20. Critères d'acceptation essentiels de la V1

La V1 sera considérée comme fonctionnellement prête lorsque :

- Les trois rôles disposent des accès attendus.
- Un projet peut être créé avec plusieurs produits et opérations.
- Les opérations MDF et métal peuvent être suivies indépendamment.
- Un opérateur peut enregistrer une quantité et retrouver sa saisie.
- Les cumuls et restants sont calculés correctement par unité.
- Une correction par un responsable conserve une trace complète.
- Les tableaux de bord n'additionnent pas des unités incompatibles.
- Les documents et photos sont accessibles uniquement aux personnes autorisées.
- Les rapports PDF et Excel peuvent être générés.
- Les messages et réunions peuvent être gérés selon les permissions.
- Une saisie hors ligne est conservée puis synchronisée sans doublon.
- L'assistant IA ne révèle aucune donnée non autorisée et ne modifie aucune donnée.
