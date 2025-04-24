// routes/lieu.js
const express = require('express');
const router = express.Router();
const db = require('../db');

// GET - Récupérer tous les lieux
router.get('/', (req, res) => {
  db.query('SELECT * FROM lieu', (err, results) => {
    if (err) return res.status(500).json({ erreur: err.message });
    res.json(results);
  });
});

// POST - Ajouter un lieu
router.post('/', (req, res) => {
  const { NomLieu, Adresse, capacite } = req.body;

  if (!NomLieu || !Adresse || !capacite) {
    return res.status(400).json({ erreur: 'Tous les champs sont obligatoires' });
  }

  const sql = 'INSERT INTO lieu (NomLieu, Adresse, capacite) VALUES (?, ?, ?)';
  const values = [NomLieu, Adresse, capacite];

  db.query(sql, values, (err, result) => {
    if (err) return res.status(500).json({ erreur: err.message });
    res.status(201).json({ message: 'Lieu ajouté', id: result.insertId });
  });
});

module.exports = router;
