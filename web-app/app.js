var express = require('express');
var app = express();
var port = process.env.PORT;

app.get('/', function (req, res) {
    res.send('Hello real World!');
});

app.listen(port, function () {
    console.log('Example app listening on port ', port, '!');
});