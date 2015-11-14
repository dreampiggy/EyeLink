/**
 * Created by harvey on 2015/11/14.
 */

var log = require('../app/util/log');
var capOps = require('../app/model/capOps');
var captchapng=require('captchapng');

//captcha
function captcha(req,res,next){
    createCaptcha(res);
}

function createCaptcha(res){
    var raw = parseInt(Math.random()*9000+1000);
    var p = new captchapng(80,30,raw);
    p.color(0,0,0,0);
    p.color(80,80,80,255);
    var img = p.getBase64();
    var imgBase64 = new Buffer(img,'base64');

    capOps.create({
        raw:raw,
        png:imgBase64
    },function(err){
        if(err){
            log.debug(err.toString());
            res.statusCode=403;
            res.end("error while save new captcha!")
        }else{
            res.statusCode=200;
            res.writeHead(200,{
                'Content-Type':'image/png'
            });
            res.end(imgBase64);
        }
    })
}

module.exports=captcha ;