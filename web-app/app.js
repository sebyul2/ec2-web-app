var express = require('express');
var app = express();
var port = process.env.PORT;

app.get('/', function (req, res) {
    console.log('request on');
    res.send('Hello green test World!');
});

app.listen(port, function () {
    console.log('Example app listening on port ', port, '!');
});