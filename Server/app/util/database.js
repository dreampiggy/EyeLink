var config = require('../../config');
var mongoose = require('mongoose');
mongoose.connect(config.mongoURI);
var db = mongoose.connection;
db.on('error', console.error.bind(console, 'MongoDB connect markdown ERROR!'));
db.once('open', function (callback) {
	console.log('MongoDB connect markdown OK!');
});


exports.mongoose = mongoose;