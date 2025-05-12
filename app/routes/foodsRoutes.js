const express = require('express');
const router = express.Router();
const foodsController = require('../controllers/foodsController');
const { verifyToken, verificarRo1 } = require('../middlewares/authMiddleware');

router.post('/confirmar', verifyToken, verificarRo1('cocina'), foodsController.confirmarComida);

module.exports = router;