var express = require('express');
var app = express();

var env = app.get('env');
var mongoURI
//NODE_ENV=production
//export NODE_ENV=production
if (env == 'production'){
	console.log('#Production mode#');
	mongoURI = 'mongodb://112.126.81.42:27017/eyelink'
}
//NODE_ENV=development or other
else{
	console.log('#Development mode#');
	mongoURI = 'mongodb://localhost:27017/eyelink'
}

exports.env = env;
exports.mongoURI = mongoURI;