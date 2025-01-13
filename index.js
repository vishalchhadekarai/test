const express = require('express');

const app = express();
const port = 3000;

app.get('/welcome', (req, res) => {
    res.send('Welcome to the Express server!');
});

app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});
app.get('/hello-to', (req, res) => {
    res.send('Hello to the Express server!');
});