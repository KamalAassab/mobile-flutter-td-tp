import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

// Fonction pour récupérer tous les produits
Future<void> getProducts(String baseUrl) async {
  try {
    final response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      List<dynamic> products = jsonDecode(response.body);
      print('\nProduits disponibles:');
      if (products.isEmpty) {
        print('Aucun produit disponible.');
      } else {
        for (var product in products) {
          print('Nom: ${product['name']}, Prix: ${product['price']}€');
        }
      }
    } else {
      var errorMessage = 'Erreur inconnue';
      try {
        errorMessage = jsonDecode(response.body)['error'] ?? 'Erreur inconnue';
      } catch (_) {}
      print(
          'Erreur lors de la récupération des produits: ${response.statusCode} - $errorMessage');
    }
  } catch (e) {
    print('Erreur de connexion: $e');
  }
}

// Fonction pour ajouter un nouveau produit
Future<void> addProduct(String baseUrl, Map<String, dynamic> product) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/products'),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: jsonEncode(product),
    );

    if (response.statusCode == 201) {
      final responseData = jsonDecode(response.body);
      print('Produit ajouté avec succès: ${responseData['message']}');
    } else {
      var errorMessage = 'Erreur inconnue';
      try {
        errorMessage = jsonDecode(response.body)['error'] ?? 'Erreur inconnue';
      } catch (_) {}
      print(
          'Erreur lors de l\'ajout du produit: ${response.statusCode} - $errorMessage');
    }
  } catch (e) {
    print('Erreur de connexion: $e');
  }
}

// Fonction pour récupérer toutes les commandes
Future<void> getOrders(String baseUrl) async {
  try {
    final response = await http.get(Uri.parse('$baseUrl/orders'));

    if (response.statusCode == 200) {
      List<dynamic> orders = jsonDecode(response.body);
      print('\nCommandes disponibles:');
      if (orders.isEmpty) {
        print('Aucune commande disponible.');
      } else {
        for (var order in orders) {
          print('Produit: ${order['product']}, Quantité: ${order['quantity']}');
        }
      }
    } else {
      var errorMessage = 'Erreur inconnue';
      try {
        errorMessage = jsonDecode(response.body)['error'] ?? 'Erreur inconnue';
      } catch (_) {}
      print(
          'Erreur lors de la récupération des commandes: ${response.statusCode} - $errorMessage');
    }
  } catch (e) {
    print('Erreur de connexion: $e');
  }
}

// Fonction pour ajouter une nouvelle commande
Future<void> addOrder(String baseUrl, Map<String, dynamic> order) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/orders'),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: jsonEncode(order),
    );

    if (response.statusCode == 201) {
      final responseData = jsonDecode(response.body);
      print('Commande créée avec succès: ${responseData['message']}');
    } else {
      var errorMessage = 'Erreur inconnue';
      try {
        errorMessage = jsonDecode(response.body)['error'] ?? 'Erreur inconnue';
      } catch (_) {}
      print(
          'Erreur lors de la création de la commande: ${response.statusCode} - $errorMessage');
    }
  } catch (e) {
    print('Erreur de connexion: $e');
  }
}

void main() async {
  final String baseUrl = 'http://localhost:3000';

  // Test des fonctionnalités
  print('=== Test de l\'API ===\n');

  // 1. Récupérer les produits (devrait être vide)
  await getProducts(baseUrl);

  // 2. Ajouter un nouveau produit
  final newProduct = {'name': 'Ordinateur Portable', 'price': 999.99};
  print('\nAjout d\'un nouveau produit...');
  await addProduct(baseUrl, newProduct);

  // 3. Vérifier que le produit a été ajouté
  await getProducts(baseUrl);

  // 4. Ajouter une commande
  final newOrder = {'product': 'Ordinateur Portable', 'quantity': 2};
  print('\nCréation d\'une nouvelle commande...');
  await addOrder(baseUrl, newOrder);

  // 5. Vérifier les commandes
  await getOrders(baseUrl);
}
