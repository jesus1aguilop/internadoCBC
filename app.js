const express = require('express');
const cors = require('cors');
const app = express();
const reportRoutes = require('./app/routes/reportRoutes');

const authRoutes = require('./app/routes/authRoutes');
const comidasRoutes = require('./app/routes/comidasRoutes');

app.use(cors());
app.use(express.json());
app.use('/api/reportes', reportRoutes);
app.use('/api/auth', authRoutes);
app.use('/api/comidas', comidasRoutes);

module.exports = app;
