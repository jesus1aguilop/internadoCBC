const express = require('express');
const router = express.Router();
const { verifyToken, verificarRo1 } = require('../middlewares/authMiddleware');
const reportController = require('../controllers/reportController');    

router.get('/faltantes', verifyToken, verificarRo1('admin'), reportController.generateReportFaltantes);

module.exports = router;