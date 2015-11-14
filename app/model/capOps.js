/**
 * Created by harvey on 2015/11/14.
 */
var mongoose = require('../util/database').mongoose;
var Schema = mongoose.Schema,
    ObjectId = Schema.ObjectId;

var capSchema = new Schema({
    raw:String,
    png:String
});

var captcha = mongoose.model('captcha',capSchema);


module.exports=captcha;