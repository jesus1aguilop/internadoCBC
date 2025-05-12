const { db } = require('../config/firebase');

exports.getComidas = async (req, res) => {
    const { uidAprendiz, tipoComida, hora } = req.body;

    try{ 
        await db.collection('comidas').add({
            uidAprendiz,
            tipoComida,
            hora,
            confirmadoPor: req.usuario.uid,
            fecha: new Date(),
        });
        res.status(201).json({ message: 'food added successfully' });
    }catch (error) {
        res.status(400).json({ message: error.message });
    }
};