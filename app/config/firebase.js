const admin = require('firebase-admin');
require("dontenv").config();
const path = require('path');
const serviceAccount = require(path.join(__dirname, '../', process.env.FIREBASE_SERVICE_ACCOUNT_KEY_PATH));

admin.initializeApp({
    credential: admin.credential.cert({
        projectid: process.env.FIREBASE_PROJECT_ID,
        clientEmail: process.env.FIREBASE_CLIENT_EMAIL,
        privateKey: process.env.FIREBASE_PRIVATE_KEY.replace(/\\n/g, '\n')
    }),
});

const db = admin.firestore();
const auth = admin.auth();

module.exports = { admin, db, auth}; 