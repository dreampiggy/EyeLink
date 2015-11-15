/**
 * Created by harvey on 2015/11/14.
 */

var log = require('../app/util/log');
var accountOps = require('../app/model/accountOps');

//register
function register(req,res,next){
    createUser(req,res);
}

var createUser = function(req,res){
    accountOps.create({
        phone:req.body.phone,
        pass:req.body.pass
    },function(err){
        if(err){
            log.error(err.toString());
            res.statusCode=403
            res.end("error while connect to mongo.");
        }else{
            log.info("Create new user %s ",req.body.phone);
            res.statusCode=201;
            res.end("create account successfully");
        }
    });
};

module.exports=register ;