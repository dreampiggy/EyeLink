var config = require('./config');
var router = require('./router');
var express = require('express');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var app = express();

app.use(express.static(__dirname + '/public'));
app.use(cookieParser());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

router.route(app);

app.listen(process.env.PORT || 8080);

console.log('Server Start!');