/**
 * Created by harvey on 2015/11/14.
 */
var fs = require('fs'),
    Log = require('log');

var moment = require('moment');
var date = moment().format('YYYY-MM-DD');

log = new Log('debug',fs.createWriteStream(__dirname+'/../../log/'+date+'.log'));

module.exports = log;