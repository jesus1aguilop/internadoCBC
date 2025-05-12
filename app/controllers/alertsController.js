const {db} = require('../config/firebase');

exports.sendAlert = async (req, res) => {
        const { uiDestino, titulo, mensaje } = req.body;

        try{
            await db.collection('alertas').add({
                uiDestino,
                titulo,
                mensaje,
                fecha: new Date(),
                enviadoPor: req.user.uid,
            });
            res.json({mensaje: 'Alerta enviada correctamente'});
        }catch (error) {
            res.status(400).json({ message: error.message });
        }

};
exports.getAlerts = async (req, res) => {
    try {
        const snapshot = await db.collection('alertas')
        .where('uiDestino', '==', req.user.uid)
        .orderBy('fecha', 'desc')
        .get();

        const alertas = snapshot.docs.map(doc => ({id: doc.id, ...doc.data()}));
        res.json(alertas);
    } catch (error) {
        res.status(400).json({ message: error.message });
    }
};
