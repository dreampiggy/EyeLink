/**
 * Created by harvey on 2015/11/14.
 */
var mongoose = require('../util/database').mongoose;
var Schema = mongoose.Schema,
    ObjectId = Schema.ObjectId;

var accountSchema = new Schema({
    phone:String,
    pass:String
});

var account = mongoose.model('account',accountSchema);


module.exports=account;