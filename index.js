var express = require('express');

var port = 3000;

var app = express();
app.get('/', function (req, res) {
  res.send('Hello World\n');
});

app.listen(port);
console.log('Running on http://localhost:' + port);
