/**
 * Created by harvey on 2015/11/14.
 */
var express = require('express');
var request = require('superagent');
var router = express.Router();
var filter = require('../app/util/filter');
var log = require('../app/util/log');
var config = require('../config'),
    raspURL = config.raspURL;

/*
 *  @deprecated
 */
router.get('/url',filter.authorize,function(req,res,next){
    res.end('fine');

});
//start monitor
router.get('/start',filter.authorize,function(req,res,next){
    var url = raspURL + "/monitor/image";
    request
        .get(url)
        .end(function (err, resp) {
            if (err) {
                log.info('fuck');
                log.info('start monitor failed,superagent error');
                log.error(err.toString());
                res.writeHead(403, {
                    'content-type': 'text/plain'
                });
                res.end('start monitor failed,superagent error');
            } else if (resp.statusCode == 200) {
                res.writeHead(200, {
                    'Content-type': 'text/plain'
                });
                log.info('start monitor successfully');
                res.end('start monitor successfully');
            } else {
                res.writeHead(403, {
                    'Content-type': 'text/plain'
                });
                log.info('start monitor failed');
                res.end('start monitor failed');
            }
        });
});
// stop monitor
router.get('/stop',filter.authorize,function(req,res,next){
    var url = raspURL + "/monitor/stop";
    request
        .get(url)
        .end(function (err, resp) {
            if (err) {
                log.info('fuck');
                log.info('stop monitor failed,superagent error');
                log.error(err.toString());
                res.writeHead(403, {
                    'content-type': 'text/plain'
                });
                res.end('stop  monitor failed,superagent error');
            } else if (resp.statusCode == 200) {
                res.writeHead(200, {
                    'Content-type': 'text/plain'
                });
                log.info('stop  monitor successfully');
                res.end('stop  monitor successfully');
            } else {
                res.writeHead(403, {
                    'Content-type': 'text/plain'
                });
                log.info('stop  monitor failed');
                res.end('stop  monitor failed');
            }
        });

});
//TODO post schedule monitor
router.post('/schedule',filter.authorize,function(req,res,next){
    res.end('fine');

});

//TODO check monitor schedules
router.get('/schedule',filter.authorize,function(req,res,next){
    res.end('fine');

});

module.exports = router ;
