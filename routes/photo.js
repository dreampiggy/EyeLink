/**
 * Created by harvey on 2015/11/14.
 */

var express=require('express');
var router = express.Router();
var filter = require('../app/util/filter');
var config = require('../config');
var request = require('superagent');
var fs =require('fs');
var log = require('../app/util/log');
var formidable = require('formidable');

var form = new formidable.IncomingForm();
var raspULR=config.raspURL;
var serverIP=config.serverIP;

//TODO take photo
router.get('/capture',filter.authorize,function(req,res,next){
     var url = raspULR+"/photo/capture";
    request
        .get(url)
        .end(function(err,resp){
            if(err){
                log.error(err.toString());
                res.end('fuck you');
                return
            }
            if(resp.statusCode==200){
                res.writeHead(200,{
                    'Content-type':'text/plain'
                });
                var fileName=new Date().getTime().toString()+'.jpg';
                var filePath =__dirname+"/../static/manul/"+fileName;
                fs.open(filePath,'w',function(err,fd){
                    if(err){
                        res.statusCode=403;
                        res.end('创建文件失败');
                    }else{
                        fs.write(fd,resp.body,0,resp.body.length,function(e){
                            if(e){
                                res.statusCode=403;
                                res.end('写入文件失败');
                                fs.close(fd);
                            }else{
                                res.statusCode=200;
                                var rstURL = serverIP+"/image/manul/"+fileName;
                                res.end(rstURL);
                            }
                        });
                    }
                });
            }else{
                res.statusCode=403;
                res.error('fuck')
                res.end('fuck you');
            }
        });
});

//TODO get od photos
router.get('/history',filter.authorize,function(req,res,next){
    var dir = './static/upload';
    fs.exists(dir,function(exists){
        if(!exists){
            res.statusCode=403;
            res.end(dir+'not found')
        }
        fs.readdir(dir,function(err,files){
            if(err){
                res.statusCode=403;
                log.error(err.toString());
                res.end(err.toString());
            }else {
                res.contentType('text/plain');
                if (files.size<1) {
                    res.statusCode = 200;
                    res.end('this is no history file.');
                } else {
                    var page = parseInt(req.query.page);
                    var judge = (page-1)*10;
                    var rst=[];
                    for(var i=0;i<files.length;i++){
                        if((i-judge)>=0&&(i-judge)<=9){
                            rst.push(files[i])
                        }
                    }
                    res.end(rst.map(function(e){return serverIP+'/image/upload/'+e}).toString());
                }
            }
        })
    })

});

//TODO get photos from rsp pi
router.post('/upload',function(req,res,next){
    var inputName = 'file';
    var form = new formidable.IncomingForm();
    form.uploadDir = __dirname+"/../static/upload/";
    form.keepExtensions = true;
    form.parse(req,function(err,fields,files){
        var fileName=files[inputName].name;
        var rstURL=serverIP+"/image/upload/"+fileName;
        res.writeHead(200,{
            'Content-Type':'text/plain'
        });
        res.end(rstURL);
    });
});

module.exports = router ;
