const express = require('express');
const { google } = require('googleapis');

const admin = require("firebase-admin");
const serviceAccount = require("./firebase-admin.json");

const app = express();
const port = 3000;

const MESSAGING_SCOPE = 'https://www.googleapis.com/auth/firebase.messaging';
const SCOPES = [MESSAGING_SCOPE];


admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});

function getAccessToken() {
  return new Promise((resolve, reject) => {
    const jwtClient = new google.auth.JWT({
      email: serviceAccount.client_email,
      key: serviceAccount.private_key,
      scopes: SCOPES,
    });

    jwtClient.authorize((err, tokens) => {
      if (err) return reject(err);
      resolve(tokens.access_token);
    });
  });
}

app.get('/', async (req, res) => {
  const token = await getAccessToken()

  res.json(token);
});




app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
});