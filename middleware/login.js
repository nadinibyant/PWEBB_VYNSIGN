const jwt = require('jsonwebtoken')

const verifyToken = (req, res, next) => {
    
    const accessToken = req.cookies.accessToken
    if (accessToken) {
        const payload = jwt.verify(accessToken, process.env.ACCESS_TOKEN_SECRET)
        const id = payload.id
        const username = payload.username
    } else {
        res.status(400).redirect("/users")

    }
    // try {
    // const accessToken = req.cookies.accessToken 
    // if (!accessToken)
    //     res.render("loginDosen")
    // const payload = jwt.verify(accessToken, process.env.ACCESS_TOKEN_SECRET)
    // const id = payload.id
    // const nama = payload.nama
    // const NIP = payload.NIP
    // next()
    // } catch (err) {
    //     res.render("mainlogin")
    // // }
}

module.exports = verifyToken