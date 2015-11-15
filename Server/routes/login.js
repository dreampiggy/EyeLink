/**
 * Created by harvey on 2015/11/14.
 */

var accountOps = require('../app/model/accountOps');
var capOps = require('../app/model/capOps');
var log = require('../app/util/log');
var filter=require('../app/util/filter');

//TODO login
function login(req,res,next){
    valid(req,res);
}

function valid(req,res){
    var phone = req.body.phone;
    var pass = req.body.pass;

    accountOps.findOne({
        phone:phone,
        pass:pass
    },function(err,rst){
        if(err){
            log.error(err.toString());
            res.statusCode=403;
            res.end('error while looking in database. ');
        }else if(rst){
            res.cookie('phone',phone);
            res.status(200).end();
        }else{
            log.info('wrong password or account don`t exist');
            res.statusCode=403;
            res.end('wrong password or account don`t exist ');
        }
    })
}

module.exports=login ;