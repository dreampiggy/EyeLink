var express = require('express');
var app = express();

var env = app.get('env');
var ip = require("ip");

var mongoURI ;
var serverIP ;
var raspURL ;//ip address of raspberry pi

//NODE_ENV=production
//export NODE_ENV=production
if (env == 'production'){
	console.log('#Production mode#');
	mongoURI = 'mongodb://112.126.81.42:27017/eyelink';
	serverIP='112.126.81.42:8080';
}
//NODE_ENV=development or other
else{
	console.log('#Development mode#');
	mongoURI = 'mongodb://localhost:27017/eyelink';
	serverIP= ip.address();
}

exports.raspURL=raspURL;
exports.env = env;
exports.mongoURI = mongoURI;
exports.serverIP =serverIP;
