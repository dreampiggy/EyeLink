/**
 * Created by harvey on 2015/11/14.
 */

var fs = require('fs');
var express = require('express');
var router = express.Router();
var filter = require('../app/util/filter');
var log =require('../app/util/log');


//TODO get photos
router.get("*",filter.authorize,function(req,res,next){
    var realPath = __dirname+"/../static"+req.url;
    fs.exists(realPath,function(exists){
        if(!exists){
            log.info('try to read a non-existed file: '+realPath);
            res.writeHead(403,{
                'Content-Type':'text/plain'
            })
            res.end('file don`t exist: '+realPath);
        }else{
            fs.readFile(realPath,function(err,data){
                res.writeHead(200,{
                    'Content-Type':'image/jpeg'
                });
                res.write(data,'binary');
                res.end();
            })
        }
    });
});

module.exports = router ;
