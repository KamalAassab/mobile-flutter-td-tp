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