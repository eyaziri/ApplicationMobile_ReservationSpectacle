const express = require('express');
const app = express();
const PORT = 3000; // Permet de définir un port via les variables d’environnement

// Middleware pour parser le JSON
app.use(express.json());

// Importation des routes
const emailRoutes = require('./routes/email');
const personneRoutes = require('./routes/personne');
const spectacleRoutes = require('./routes/spectacle');
const billetRoutes = require('./routes/billet');
const rubriqueRoutes = require('./routes/rubrique'); // ✅ Route rubrique

// Utilisation des routes
app.use('/email', emailRoutes); 
app.use('/personnes', personneRoutes);
app.use('/spectacles', spectacleRoutes);
app.use('/billets', billetRoutes);
app.use('/rubriques', rubriqueRoutes); // ✅ Utilisation de la route rubrique

// Middleware pour gérer les routes non trouvées
app.use((req, res, next) => {
  res.status(404).json({ erreur: 'Route non trouvée' });
});

// Middleware pour la gestion des erreurs internes
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ erreur: 'Erreur interne du serveur' });
});

// Lancement du serveur
app.listen(PORT, () => {
  console.log(`🚀 Serveur lancé sur http://localhost:${PORT}`);
});
