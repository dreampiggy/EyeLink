function route (app) {
	app.get('/', function(req,res){
		res.end('Hello');
	})
}

exports.route = route;