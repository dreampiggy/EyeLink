
var captcha = require('./routes/captcha');
var login = require('./routes/login');
var push = require('./routes/push');
var register = require('./routes/register');
var video = require('./routes/video');
var image = require('./routes/image');
var photo = require('./routes/photo');
var monitor = require('./routes/monitor');

function route (app) {
	app.use('/image',image);//1
	app.use('/photo',photo);//2
	app.use('/monitor',monitor);//5
	app.use('/video',video);//1

	app.get('/register',register);
	app.get('/login',login);
	app.get('/captcha',captcha);
	app.get('/push',push);
	app.get('/needLogin',function(req,res,next){
		res.statusCode=403;
		res.end("Sorry,But you have to login first");
	});

}

exports.route = route ;