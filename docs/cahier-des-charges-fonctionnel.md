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

- Consulter tous les projets de l'entreprise, y compris ceux auxquels son équipe ne participe pas, ainsi que leurs produits, quantités prévues et avancements.
- Voir en priorité les projets en cours, sans masquer les autres projets.
- Consulter les quantités produites et restantes.
- Ajouter une saisie de production selon les opérations et droits qui lui sont attribués.
- Consulter son propre historique de saisies.
- Ne pas créer, modifier ni supprimer les projets, produits, opérations ou affectations.
- Ne pas modifier ni supprimer une saisie de production après validation.

Chaque opérateur dispose d'un compte individuel. La création des comptes est réservée à la direction et au responsable de production habilité ; les opérateurs ne peuvent pas créer eux-mêmes leur compte. Le compte est créé par un responsable habilité, puis le salarié reçoit un lien ou un code sécurisé d'activation et définit lui-même son mot de passe lors de sa première connexion. Le responsable ne connaît pas ce mot de passe. Le canal d'envoi de l'invitation reste à définir. Un utilisateur peut être connecté sur plusieurs appareils. Une saisie conserve toujours l'identité de son auteur, indépendamment de l'équipe ou des personnes affectées à l'opération.

### 3.4 Authentification

Connexion initiale par identifiant et mot de passe. Après cette première connexion, l'utilisateur peut choisir l'authentification biométrique (empreinte digitale ou reconnaissance faciale) si son appareil la prend en charge. Un code PIN sert de solution de secours lorsque la biométrie n'est pas disponible ou ne fonctionne pas. Le mot de passe reste disponible pour réauthentification et récupération selon les règles de sécurité. Les règles de sécurité du PIN, de récupération du compte et de renouvellement du mot de passe restent à préciser.

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
- Longueur (cm).
- Largeur (cm).
- Hauteur (cm).
- Quantité à fabriquer dans le projet.

Le centimètre (cm) est l'unité standard pour toutes les dimensions des produits. Les valeurs décimales sont autorisées si nécessaire. Pour un nouveau produit ajouté à un projet, la quantité prévue par défaut est de 1 pièce ; le Responsable de production peut la modifier.

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

Formule : taux d'avancement = quantité réalisée / quantité prévue × 100. Le dépassement de la quantité prévue est autorisé avec avertissement visible. L'application conserve la quantité réellement déclarée et affiche le taux réel, même s'il dépasse 100 %. La quantité restante affichée est plafonnée à zéro afin de ne pas présenter une quantité négative. L'avertissement signale clairement que la quantité réalisée dépasse la prévision.

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

Les tableaux de bord sont personnalisables : choix des indicateurs, ordre et disposition. Les indicateurs globaux ne doivent pas additionner des unités incompatibles. L'avancement global du projet est calculé comme la moyenne arithmétique des pourcentages d'avancement de chaque produit. Chaque produit a donc le même poids dans cette moyenne, quelle que soit sa quantité ou son unité. Les pourcentages réels des produits sont utilisés, y compris lorsqu'ils dépassent 100 %.

## 9. Planning et notifications

Le planning reste simple : seules les dates de début et de livraison prévues des projets sont gérées. Aucune date n'est définie au niveau des opérations. Pas de Gantt ni de mécanisme de retard.

Notifications prévues en V1 :

- Nouvelle saisie de production : Direction, Responsable de production et utilisateurs concernés par le projet selon les règles d'affectation et de suivi.
- Nouveau message privé : destinataire.
- Nouveau message de groupe : membres du groupe.
- Nouveau document ou nouvelle photo : utilisateurs concernés et autorisés.
- Modification importante ou clôture d'un projet : utilisateurs concernés.
- Invitation à une réunion, modification ou annulation : participants invités.

Chaque utilisateur peut activer ou désactiver les catégories de notifications proposées dans ses préférences. Les notifications sont marquées comme lues ou non lues et restent consultables dans un historique.

Les notifications sont disponibles dans l'application et, lorsque la connexion le permet, sous forme de notifications push. La définition précise des utilisateurs considérés comme « concernés par le projet » reste à préciser.

## 10. Rapports

Rapports prévus :

- Rapport de production hebdomadaire.
- Rapport de production mensuel.
- Rapport d'avancement par projet.
- Rapport de production par équipe.

Génération uniquement à la demande de l'utilisateur, sans envoi automatique périodique. Formats : PDF et Excel. Personnalisation possible avec logo, nom et couleurs de l'entreprise, ainsi que sélection des tableaux, graphiques et indicateurs. Les horaires d'envoi et les destinataires des rapports automatiques restent à définir.

## 11. Documents et photos

### 11.1 Documents de projet

Possibilité d'ajouter plusieurs photos et documents à un projet, notamment des plans et des fichiers PDF. Les opérateurs peuvent également ajouter des photos et des documents aux projets qu'ils sont autorisés à consulter, même si leur équipe n'est pas affectée au projet. Les photos peuvent être classées par étape : avant fabrication, en fabrication, après fabrication et installation. Chaque fichier conserve automatiquement son auteur, la date et l'heure d'ajout, le projet et son type. Les documents sont consultables selon les droits de l'utilisateur.

### 11.2 Documents administratifs

Espace documentaire pour les procédures, modes opératoires, fiches de poste, documents d'organisation et autres documents PDF ou Word.

La Direction et le Responsable de production définissent, pour chaque document, les rôles autorisés à le consulter. L'accès est contrôlé par rôle et les documents sensibles ne sont visibles que par les utilisateurs autorisés. La gestion avancée des versions et les commentaires sur documents sont exclus de la V1.

## 12. Messagerie et réunions

### 12.1 Messagerie

Messagerie interne permettant les conversations privées et les groupes, avec partage de photos et de documents et notification des nouveaux messages. Une conversation peut être associée à un projet afin de centraliser les échanges liés à celui-ci. La création des groupes est réservée à la direction et au responsable de production. Les messages et conversations sont conservés sans limite de durée, jusqu'à suppression manuelle. Chaque utilisateur peut supprimer ses propres messages. La Direction peut supprimer tous les messages.

### 12.2 Réunions

Une réunion contient :

- Date.
- Participants.
- Projet associé, facultatif.
- Compte rendu.
- Décisions.
- Actions à réaliser.
- Responsable désigné pour chaque action.
- État de chaque action : À faire, En cours ou Terminée.

Les actions restent consultables après la réunion pour permettre le suivi de leur réalisation. Pas de signature électronique ni de calendrier externe en V1.

## 13. Recherche globale

Recherche globale dans les projets, produits, clients saisis en texte libre, utilisateurs, documents et messages. Filtres par catégorie, date, utilisateur et type de contenu. La recherche est accessible depuis l'application. Les résultats doivent toujours respecter les droits d'accès du compte connecté ; un document non autorisé ne doit pas apparaître dans les résultats.

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

Les messages sont conservés sans limite de durée jusqu'à suppression manuelle. Lorsqu'un utilisateur quitte l'entreprise, son compte est désactivé sans effacer ses messages ni ses anciennes saisies ; son nom reste conservé dans l'historique. La politique de confidentialité et les règles de traitement des données personnelles devront être définies avant mise en production.

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

## 19. Points restant à préciser avant ou pendant le développement

Les décisions déjà prises dans les sections précédentes sont considérées comme validées. Les sujets suivants restent ouverts :

1. Canal d'envoi des invitations et règles détaillées de récupération du compte, du PIN et de gestion des appareils perdus.
2. Définition exacte des utilisateurs « concernés » à notifier pour chaque événement de projet.
3. Limites de taille, formats autorisés et durée de conservation locale des photos et documents.
4. Politique détaillée de résolution des conflits de synchronisation, à confirmer par prototype.
5. Fournisseur backend, hébergement et moteur de synchronisation hors ligne.
6. Fournisseur IA, coûts, confidentialité et limites d'utilisation.
7. Nom de l'application, logo et comptes de publication Android/iOS.
8. Règles de suppression des photos et documents ajoutés par les opérateurs : à confirmer par la Direction.

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


## 21. Décisions complémentaires issues des maquettes d'interface

### 21.1 Navigation et identité visuelle
- Style visuel de référence : industriel, avec anthracite, orange et blanc.
- Navigation principale en bas de l'écran : Accueil, Projets, Production, Messages et Menu.
- L'écran d'accueil met les projets au premier plan ; les statistiques restent secondaires.
- Thème clair ou sombre sélectionnable manuellement.
- Les maquettes présentées pendant la conception sont illustratives ; elles ne constituent pas encore des écrans connectés au backend.

### 21.2 Affectation des opérations
- Le Responsable de production sélectionne une opération, une équipe et un ou plusieurs opérateurs.
- Un opérateur peut être affecté à plusieurs opérations.
- L'affectation détermine les droits de saisie de production ; elle ne modifie pas le droit de consultation de tous les projets.
- L'équipe et les opérateurs affectés sont affichés dans le formulaire de saisie. L'auteur connecté est attribué automatiquement.

### 21.3 Formulaire et historique de production
- Le formulaire de saisie propose le projet, le produit, l'opération, la date et la quantité ; l'équipe affectée et l'auteur sont renseignés automatiquement lorsque possible.
- L'historique permet de filtrer les saisies par projet, produit, opération, date, équipe et auteur.
- L'opérateur consulte son historique sans pouvoir corriger ni supprimer ses saisies.
- La Direction et le Responsable de production habilité peuvent corriger ou supprimer une saisie avec un motif obligatoire et une trace d'audit.

### 21.4 Tableaux de bord
- Le tableau de bord Direction présente les projets en cours et terminés, l'avancement global, la production hebdomadaire et mensuelle, ainsi que la liste des projets.
- Le tableau de bord Responsable de production met en avant les projets en production, les dernières saisies et les quantités produites aujourd'hui et cette semaine.
- Le tableau de bord opérateur présente les projets en cours, les quantités produites et restantes, son historique et l'avancement global des projets.
- Les indicateurs de production sont regroupés par unité compatible ; aucune somme entre unités différentes n'est autorisée.

### 21.5 Notifications, conversations et réunions
- Le centre de notifications distingue les catégories Production, Messages, Photos et documents, et Réunions ; l'utilisateur peut régler ses préférences.
- Les conversations peuvent être privées, en groupe ou associées à un projet.
- Le compte rendu de réunion comprend le résumé des discussions, les décisions et les actions, avec un responsable et un statut pour chaque action.
- Les statuts des actions sont : À faire, En cours et Terminée.

### 21.6 Assistant IA
- L'assistant est présenté comme un outil d'analyse en langage naturel, en lecture seule.
- Il peut proposer des questions rapides sur les projets, la production, les équipes et les synthèses périodiques.
- Toute réponse doit être fondée sur les données disponibles et autorisées ; les réponses doivent signaler les données manquantes ou insuffisantes.
