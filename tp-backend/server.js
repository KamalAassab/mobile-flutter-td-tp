const express = require('express');
const bodyParser = require('body-parser');
const fs = require('fs');

const app = express();
const port = 3000;

// Enable CORS for all routes
app.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', '*');
  res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
  res.header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
  if (req.method === 'OPTIONS') {
    return res.sendStatus(200);
  }
  next();
});

// Utilisation du body parser pour analyser le JSON dans les requêtes POST
app.use(bodyParser.json());

// Charger les données depuis le fichier JSON
const loadData = () => {
  try {
    const data = fs.readFileSync('data.json', 'utf8');
    return JSON.parse(data);
  } catch (error) {
    return { products: [], orders: [] };
  }
};

// Sauvegarder les données dans le fichier JSON
const saveData = (data) => {
  fs.writeFileSync('data.json', JSON.stringify(data, null, 2));
};

// Tester si le serveur fonctionne
app.get('/', (req, res) => {
  res.send('API Backend fonctionne!');
});

// Route GET pour obtenir tous les produits
app.get('/products', (req, res) => {
  const data = loadData();
  res.json(data.products);
});

// Route POST pour ajouter un produit
app.post('/products', (req, res) => {
  const data = loadData();
  const newProduct = req.body;
  
  if (!newProduct.name || !newProduct.price) {
    return res.status(400).json({ error: 'Le nom et le prix du produit sont requis' });
  }
  
  data.products.push(newProduct);
  saveData(data);
  res.status(201).json({ message: 'Produit ajouté', product: newProduct });
});

// Route GET pour obtenir toutes les commandes
app.get('/orders', (req, res) => {
  const data = loadData();
  res.json(data.orders);
});

// Route POST pour ajouter une commande
app.post('/orders', (req, res) => {
  const data = loadData();
  const newOrder = req.body;
  
  if (!newOrder.product || !newOrder.quantity) {
    return res.status(400).json({ error: 'Le produit et la quantité sont requis' });
  }
  
  data.orders.push(newOrder);
  saveData(data);
  res.status(201).json({ message: 'Commande créée', order: newOrder });
});

app.listen(port, () => {
  console.log(`Serveur API démarré sur http://localhost:${port}`);
}); 