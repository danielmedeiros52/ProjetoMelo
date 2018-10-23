module.exports = function (req, res, next) {
    res.header('Access-Control-Allow-Orign', '*')
    res.header('Access-Control-Allow-Methods', 'GET,POST,OPTIONS,PUT,PATCH,DELETE')
    res.header('Access-Control-Allow-Headers', 'Origin,X-Requested-With,Content-Type,Acept')
    next()
}