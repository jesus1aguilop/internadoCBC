const { auth, db } = require('../config/firebase');

exports.register = async (req, res) => {
    const { email, password, name, rol } = req.body;
    try {
        const user = await auth.createUser({
            email,
            password,
        });
        await db.collection('users').doc(user.uid).set({
            email,
            nombres,
            apellidos,
            name,
            rol,
            creado: new Date(),
        });
        res.status(201).json({ uid: user.uid, email });
    } catch (error) {
        res.status(400).json({ message: error.message });
    }
};