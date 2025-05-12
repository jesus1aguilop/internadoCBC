const express = require('express');
const router = express.Router();
const { verificarToken, verificarRol } = require('../middleware/authMiddleware');
const alertasController = require('../controllers/alertasController');

router.post('/enviar', verificarToken, verificarRol('admin'), alertasController.enviarAlerta);
router.get('/ver', verificarToken, alertasController.verAlertas);

module.exports = router;
