var express = require('express');
var router = express.Router();
var user = require('../models/users');
const { response } = require('express');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const multer = require('multer');
var mime = require('mime-types');
const path = require('path');
const { sign } = require('crypto');
const cookieParser = require('cookie-parser')

router.get('/', async function(req, res, next) {
  res.render("signup");
});


//validasi gambar signature
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
      cb(null, path.join(__dirname, '../', 'assets', 'sign_img'));
  },
  filename: function (req, file, cb) {
    cb(null, file.originalname);
  }
});

const fileFilter = function(req, file, cb) {
  const allowedTypes = ['image/jpeg', 'image/jpg', 'image/png'];
  if (!allowedTypes.includes(file.mimetype)) {
    const error = new Error('Jenis File Tidak di Izinkan');
    error.status = 400;
    return cb(error, false);
  }
  cb(null, true);
}
const upload = multer({ storage: storage, fileFilter: fileFilter });
//


//register atau signup
router.post('/signup', upload.single('sign_img'), async function(req, res, next) {

  const file = req.file;
  if(!file){
    const error = new Error ("Silahkan Tambahkan Gambar Tanda Tangan");
    error.status = 400;
    res.status(error);
  }
  let id = req.body.id;
  let username = req.body.username;
  let email = req.body.email;
  let password = req.body.password;
  let nik = req.body.nik;
  let institute_name = req.body.institute_name;
  let city = req.body.city;

  const salt = bcrypt.genSaltSync(10);
  const hashedPassword = bcrypt.hashSync(password, salt);

  const users = await user.create({
    id: id,
    username: username,
    email: email,
    password: hashedPassword,
    nik: nik,
    institute_name: institute_name,
    city: city,
    sign_img:  file.originalname
  })
  if (users) {
    res.status(200).json({
      message: "Pendaftaran Akun Berhasil",
      data: users
    });
   } else {
    res.status(200).json({
      message: "Pendaftaran Akun Tidak Berhasil",
    });
   }
});


// token login
// const authenticateToken = (req, res, next) => {
//   // ambil token dari header
//   const authHeader = req.headers['authorization'];
//   const token = authHeader && authHeader.split(' ')[1];
  
//   if (token == null) {
//     return res.status(401).json({ error: 'Unauthorized' });
//   }
  
//   // verifikasi token
//   jwt.verify(token, process.env.ACCESS_TOKEN_SECRET, (err, user) => {
//     if (err) {
//       return res.status(403).json({ error: 'Forbidden' });
//     }

//     // simpan user
//     req.user = user;
//     next();
//   });
// }

router.post('/signin', async function(req, res, next){
  let email = req.body.email; 
  let password = req.body.password;

  //cek email
  const cari = user.findOne({ where: { email: email } }).then(user => {
    if (!cari) {
      //jika user tidak ditemukan
      res.status(401).json({ message: 'Email Salah' });
      return;
    }

    // cek password
    bcrypt.compare(password, user.password, async (err, result) => {
      if (err || !result) {
        // Invalid password
        res.status(401).json({ message: 'Password Salah'});
        return;
      }

      //jika email dan password benar
      const token = jwt.sign({ email: email, password: password }, process.env.ACCESS_TOKEN_SECRET, { expiresIn: '30m' });
      const updateToken = await user.update({token: token}, {
        where: {
          email: email
        }
      });

      res.cookie('token', token, {
        httpOnly: true,
        maxAge: 1800000
      })
      
      if (updateToken) {
        res.status(200).redirect("/home")
      } else {
        res.status(400).json({
          message: "Email Tidak Ditemukan"
        })
      }
    });
  });

})

module.exports = router;
