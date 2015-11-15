/**
 * Created by harvey on 2015/11/14.
 */

//Deprecated receive msg pushed from rsp pi.
function push(req,res,next){
    res.end('fine');
}

module.exports=push;