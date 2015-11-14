/**
 * Created by harvey on 2015/11/14.
 */
var express = require('express');
var router = express.Router();
var filter = require('../app/util/filter');

//TODO get url of video stream
router.get('/url',filter.authorize,function(req,res,next){
    res.end('fine');

});
//TODO start monitor
router.get('/start',filter.authorize,function(req,res,next){
    res.end('fine');

});
//TODO stop monitor
router.get('/stop',filter.authorize,function(req,res,next){
    res.end('fine');

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
