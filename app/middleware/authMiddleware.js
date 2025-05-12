const { db, auth } = require('../config/firebase');

const verifyToken = async (req, res, next) => {
    const token = req.headers.authorization?.split('')[1];
    if (!token) return res.status(401).json({ message: 'Token not found' || 'Unauthorized' });

    try{
        const decoded = await auth.verifyIdToken(token);
        req.usuario = decoded;
        next();
    } catch (error) {
        return res.status(401).json({ message: 'Invalid token' || 'Unauthorized' });
    }
};

const verificarRo1 = (rolRequerido) => {
    return async (req, res, next) => {
        const uid = req.usuario.uid;
        const userDoc = await db.collection('users').doc(uid).get();
        if (!userDoc.exists) return res.status(404).json({ message: 'User not found' });

        const data = userDoc.data();
        if (data.rol !== rolRequerido) {
            return res.status(403).json({ message: 'you do not have permissions' });
        }
        next();
    };

};

module.exports = { verifyToken, verificarRo1 };