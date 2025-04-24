// routes/billet.js
const express = require('express');
const router = express.Router();
const db = require('../db');


// GET - Récupérer tous les billets
router.get('/', (req, res) => {
  db.query('SELECT * FROM billet', (err, results) => {
    if (err) return res.status(500).json({ erreur: err.message });
    res.json(results);
  });
});

/// POST - Ajouter un billet
router.post('/', (req, res) => {
  const { categorie, prix, idSpec, Vendu, idPersonne } = req.body;

  // Vérifie les champs obligatoires
  if (!categorie || !prix || !idSpec || typeof Vendu === 'undefined') {
    return res.status(400).json({ erreur: 'Tous les champs obligatoires doivent être remplis' });
  }

  let sql, values;

  if (idPersonne) {
    sql = 'INSERT INTO billet (categorie, prix, idSpec, Vendu, idPersonne) VALUES (?, ?, ?, ?, ?)';
    values = [categorie, prix, idSpec, Vendu, idPersonne];
  } else {
    sql = 'INSERT INTO billet (categorie, prix, idSpec, Vendu) VALUES (?, ?, ?, ?)';
    values = [categorie, prix, idSpec, Vendu];
  }

  db.query(sql, values, (err, result) => {
    if (err) return res.status(500).json({ erreur: err.message });
    res.status(201).json({ message: 'Billet ajouté', id: result.insertId });
  });
});


module.exports = router;
