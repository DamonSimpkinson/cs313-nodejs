var bodyParser = require('body-parser');
var express = require('express');
var fs = require('fs');
var path = require('path');
var pg = require('pg');
var Themeparks = require('themeparks');
var url = require('url');

var app = express();

var port = (process.env.PORT || 5000);

app.use(express.static(__dirname + '/public'));

// views is directory for all template files
app.set('views', __dirname + '/views');
app.set('view engine', 'ejs');

console.log(process.env.DATABASE_URL);










app.listen(port, function() {
  console.log('Node app is running on port ', port);
});
