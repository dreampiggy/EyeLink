/**
 * Created by harvey on 2015/11/14.
 */
exports.authorize = function(req, res, next) {
    if (!req.cookies["phone"]) {
        res.redirect('/needLogin');
    } else {
        next();
    }
}