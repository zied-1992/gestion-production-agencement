# Gestion de production – Agencement

Application mobile destinée au suivi des projets et de la production d'une société d'agencement réalisant des ouvrages en MDF et en structures métalliques.

## Objectif

Centraliser le suivi des projets, des produits à fabriquer, des opérations de production et des quantités réalisées. L'application vise une utilisation simple sur Android et iOS, par la direction, le responsable de production et les opérateurs.

## Périmètre fonctionnel prévu – V1

- Gestion des projets, clients (saisie libre), dates et statuts.
- Catalogue de produits et opérations de fabrication personnalisables.
- Suivi des quantités prévues, produites et restantes par opération.
- Saisie quotidienne de la production avec historique et traçabilité des corrections.
- Gestion des utilisateurs, rôles, équipes et permissions.
- Tableaux de bord et indicateurs de production adaptés aux rôles.
- Photos et documents associés aux projets.
- Rapports PDF et Excel.
- Messagerie interne et comptes rendus de réunion.
- Fonctionnement hors ligne avec synchronisation automatique.
- Assistant IA en lecture seule, respectant les droits d'accès.

## Processus de production indicatif

1. Découpe MDF
2. Découpe et préparation du métal
3. Soudure et assemblage des structures métalliques
4. Assemblage MDF
5. Assemblage final MDF + métal
6. Emballage et préparation de livraison
7. Installation chez le client

Les opérations MDF et métal peuvent avancer en parallèle. Les opérations et leur ordre doivent rester configurables.

## Technologies envisagées

- Application mobile : Flutter (Android et iOS).
- Base de données serveur : PostgreSQL.
- Stockage local : SQLite.
- Stockage des documents et photos : stockage cloud.
- Notifications : Firebase Cloud Messaging.
- Synchronisation hors ligne : solution à définir et valider avant développement.

Les choix techniques définitifs, notamment la synchronisation hors ligne, seront confirmés pendant la phase de conception.

## Hors périmètre de la V1

Gestion des stocks et achats, fournisseurs, sous-traitance, coûts et finances, maintenance, qualité et non-conformités, suivi des temps, gestion RH, diagramme de Gantt et interface desktop.

## Langue et plateformes

Interface en français. Application mobile Android et iOS.

## État du projet

Phase de préparation et de conception. Le cahier des charges détaillé et l'architecture technique seront documentés avant le développement des fonctionnalités.
