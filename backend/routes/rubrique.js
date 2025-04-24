const express = require('express');
const router = express.Router();
const db = require('../db');

// POST - Ajouter une rubrique à un spectacle
router.post('/', (req, res) => {
  const { idSpec, dateRubrique, heureRubrique, LieuRubrique, nombreSpectateur } = req.body;

  // Vérifie les champs requis
  if (!idSpec || !dateRubrique || !heureRubrique || !LieuRubrique) {
    return res.status(400).json({ erreur: 'Champs requis manquants' });
  }

  // Valeur par défaut si non fournie
  const nbSpectateurs = nombreSpectateur || 60;

  // SQL pour insérer une nouvelle rubrique avec places_reservees initialisé à une chaîne vide
  const sql = `
    INSERT INTO rubrique 
    (idSpec, dateRubrique, heureRubrique, LieuRubrique, nombreSpectateur, places_reservees)
    VALUES (?, ?, ?, ?, ?, ?)
  `;

  db.query(sql, [idSpec, dateRubrique, heureRubrique, LieuRubrique, nbSpectateurs, ''], (err, result) => {
    if (err) return res.status(500).json({ erreur: err.message });
    res.status(201).json({ message: 'Rubrique ajoutée', id: result.insertId });
  });
});


// GET - Toutes les rubriques
router.get('/', (req, res) => {
  db.query('SELECT * FROM rubrique', (err, results) => {
    if (err) return res.status(500).json({ erreur: err.message });
    res.json(results);
  });
});

// GET - Rubrique par IdRubrique
router.get('/:idRubrique', (req, res) => {
  const idRubrique = req.params.idRubrique;
  db.query('SELECT * FROM rubrique WHERE IdRubrique = ?', [idRubrique], (err, results) => {
    if (err) return res.status(500).json({ erreur: err.message });
    if (results.length === 0) return res.status(404).json({ erreur: 'Rubrique non trouvée' });
    res.json(results[0]);
  });
});
// GET - nombreSpectateur pour une rubrique donnée
router.get('/getNombreSpectateur/:idRubrique', (req, res) => {
  const idRubrique = req.params.idRubrique;

  const sql = 'SELECT nombreSpectateur FROM rubrique WHERE IdRubrique = ?';
  db.query(sql, [idRubrique], (err, results) => {
    if (err) return res.status(500).json({ erreur: err.message });
    if (results.length === 0) return res.status(404).json({ erreur: 'Rubrique non trouvée' });
    
    res.json({ idRubrique, nombreSpectateur: results[0].nombreSpectateur });
  });
});


// GET - Rubriques par idSpec
router.get('/spectacle/:idSpec', (req, res) => {
  const idSpec = req.params.idSpec;
  db.query('SELECT * FROM rubrique WHERE idSpec = ?', [idSpec], (err, results) => {
    if (err) return res.status(500).json({ erreur: err.message });
    res.json(results);
  });
});

// GET - Rubriques par dateRubrique
router.get('/date/:dateRubrique', (req, res) => {
  const dateRubrique = req.params.dateRubrique;
  db.query('SELECT * FROM rubrique WHERE dateRubrique = ?', [dateRubrique], (err, results) => {
    if (err) return res.status(500).json({ erreur: err.message });
    res.json(results);
  });
});

// GET - LieuRubrique pour une rubrique donnée
router.get('/getLieuRubrique/:idRubrique', (req, res) => {
  const idRubrique = req.params.idRubrique;

  const sql = 'SELECT LieuRubrique FROM rubrique WHERE IdRubrique = ?';
  db.query(sql, [idRubrique], (err, results) => {
    if (err) return res.status(500).json({ erreur: err.message });
    if (results.length === 0) return res.status(404).json({ erreur: 'Rubrique non trouvée' });

    res.json({ idRubrique, LieuRubrique: results[0].LieuRubrique });
  });
});


// GET - Rubriques par heureRubrique
router.get('/heure/:heureRubrique', (req, res) => {
  const heureRubrique = req.params.heureRubrique;
  db.query('SELECT * FROM rubrique WHERE heureRubrique = ?', [heureRubrique], (err, results) => {
    if (err) return res.status(500).json({ erreur: err.message });
    res.json(results);
  });
});

// GET - Rubriques par lieuRubrique (LIKE)
router.get('/lieu/:lieuRubrique', (req, res) => {
  const lieuRubrique = req.params.lieuRubrique;
  db.query('SELECT * FROM rubrique WHERE LieuRubrique LIKE ?', [`%${lieuRubrique}%`], (err, results) => {
    if (err) return res.status(500).json({ erreur: err.message });
    res.json(results);
  });
});

// PUT - Mettre à jour nombreSpectateur d'une rubrique par idRubrique
router.put('/:idRubrique/updateSpectateurs', (req, res) => {
  const { selectedQuantity } = req.body;
  const { idRubrique } = req.params;

  const sql = `
    UPDATE rubrique
    SET nombreSpectateur = GREATEST(nombreSpectateur - ?, 0)
    WHERE idRubrique = ?
  `;

  db.query(sql, [selectedQuantity, idRubrique], (err, result) => {
    if (err) return res.status(500).json({ erreur: err.message });
    res.json({ message: 'Nombre de spectateurs mis à jour' });
  });
});

// PUT - Mettre à jour places_reservees et nombreSpectateur d'une rubrique
router.put('/:idRubrique/updatePlaces', (req, res) => {
  const { places_reservees, nombreSpectateur } = req.body;
  const { idRubrique } = req.params;

  // 👇 Ajoute ce log
  console.log('Données reçues :', { idRubrique, places_reservees, nombreSpectateur });

  const sql = `
    UPDATE rubrique
    SET places_reservees = ?, nombreSpectateur = ?
    WHERE IdRubrique = ?
  `;

  db.query(sql, [places_reservees, nombreSpectateur, idRubrique], (err, result) => {
    if (err) {
      console.error('Erreur SQL:', err); // 👈 Ajoute ceci pour voir l’erreur dans la console
      return res.status(500).json({ erreur: err.message });
    }
    if (result.affectedRows === 0) {
      return res.status(404).json({ message: 'Rubrique non trouvée' });
    }
    res.json({ message: 'Rubrique mise à jour avec succès' });
  });
});


module.exports = router;
