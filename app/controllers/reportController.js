const { db } = require('../config/firebase');

exports.generateReport = async (req, res) =>{
    try{
        const fecha = new Date();
        const snapshot = await db.collection('comidas').where('fecha', '>=', new Date(fecha.toDateString())).get();

        const comidasentregadas = {};
        snapshot.forEach(doc => {
            const { uidAprendiz, tipoComida } = doc.data();
            if (!comidasentregadas[uidAprendiz]) comidasentregadas[uidAprendiz] = [];
            comidasEntregadas[uidAprendiz].push(tipoComida);
        });
        const aprendicesSnap = await db.collection('users').where('rol', '==', 'aprendiz').get();
        const faltantes = {};

        aprendicesSnap.forEach(doc => {
            const aprendiz = doc.data();
            const comidaHoy = comidasentregadas[aprendiz.uid] || [];
            ['desayuno', 'almuerzo', 'cena'].forEach(tipo => {
                if (!comidaHoy.includes(tipo)) {
                     faltantes.push({
                        uid: aprendiz.uid,
                        nombre: `${aprendiz.nombres} ${aprendiz.apellidos}`,
                        comidaFaltante: tipo,
                     });
                }
            });
        });
        res.json(faltantes);
    }catch (error) {
        res.status(400).json({ message: error.message });
    }
};
