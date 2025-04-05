<<<<<<< HEAD
# 📱 Module Mobile avec Flutter - Travaux Dirigés & Pratiques 🚀  

Bienvenue dans le repo officiel du **Module Mobile avec Flutter**. Ce repo contient tous les **Travaux Dirigés (TDs)** et **Travaux Pratiques (TPs)** pour apprendre le développement mobile (Flutter).  

## 📂 Contenu du dépôt  

### 📌 Travaux Dirigés (TDs)  

- **[TD1 - Gestion d’un Système de Commandes en Dart](TD1/TD1.md)** 🛠  
  Ce TD vous permettra de pratiquer la manipulation des listes, la gestion des entrées/sorties et la gestion des erreurs en Dart.   

### 🛠 Travaux Pratiques (TPs)  
Les TPs sont des mises en pratique avancées pour développer des applications complètes.  

- **[TP1 - Développement d’une API et d’un client Dart](TP1/TP1.md)** 💻  
  Implémentation d’une API Express.js pour la gestion des produits et commandes, et développement d’un client Dart.  



- **[TP2 - Développement d'une Application Flutter avec API Backend](TP2/TP2.md)** 💻  
  Développement d'une application mobile Flutter permettant d'afficher, ajouter, modifier et supprimer des shows avec une API backend. 




🎯 **Bonne programmation et amusez-vous avec Flutter !** 🚀🔥  
=======
# TP1 - API REST avec Node.js et Client Dart

Ce projet implémente une API REST avec Node.js/Express.js et un client Dart pour gérer des produits et des commandes.

## Structure du Projet

```
project/
├── tp-backend/           # Backend Node.js/Express.js
│   ├── server.js        # Serveur Express.js
│   ├── data.json        # Stockage des données
│   └── package.json     # Dépendances Node.js
└── dart-client/         # Client Dart
    ├── client.dart      # Code source Dart
    └── pubspec.yaml     # Dépendances Dart
```

## Fonctionnalités

### Backend (Node.js/Express.js)
- API REST pour la gestion des produits et commandes
- Stockage des données dans un fichier JSON
- Validation des données
- Gestion des erreurs
- Support CORS

### Client (Dart)
- Communication avec l'API REST
- Gestion des requêtes HTTP asynchrones
- Affichage des données
- Gestion des erreurs

## Installation

### Backend
```bash
cd tp-backend
npm install
node server.js
```

### Client Dart
```bash
cd dart-client
dart pub get
dart run client.dart
```

## API Endpoints

### Produits
- `GET /products` - Récupérer tous les produits
- `POST /products` - Ajouter un nouveau produit
  ```json
  {
    "name": "Nom du produit",
    "price": 99.99
  }
  ```

### Commandes
- `GET /orders` - Récupérer toutes les commandes
- `POST /orders` - Créer une nouvelle commande
  ```json
  {
    "product": "Nom du produit",
    "quantity": 2
  }
  ```

## Auteurs
- [Votre nom]

## Licence
MIT 
>>>>>>> cebd1dd42bcb4373acaafed7587c73165c0ccc2b
