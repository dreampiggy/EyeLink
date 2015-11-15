/**
 * Created by harvey on 2015/11/14.
 */
var express=require('express');
var router = express.Router();
var filter = require('../app/util/filter');

//TODO take video
router.get('/capture',filter.authorize,function(req,res,next){
    res.end('fine');

});

module.exports = router ;
