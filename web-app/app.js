var express = require('express');
var app = express();
var port = process.env.port || 4000;

app.get('/', function (req, res) {
    res.send('Hello Fucking World!');
});

app.listen(port, function () {
    console.log('Example app listening on port ', port, '!');
});