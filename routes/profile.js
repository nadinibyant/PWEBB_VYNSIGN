var express = require('express');
var router = express.Router();
var user = require('../models/users');
const { response } = require('express');
const bcrypt = require('bcryptjs');
const verifytoken = require('../middleware/login')


router.get('/', verifytoken, (req, res) => {
    res.json({
        user: req.user
    })
    // res.render("profile", {
    //     user: req.user
    // })
  });
  
  router.get('/:id', async function(req, res, next) {
      let id = req.params.id.slice(1);
      const users = await user.findByPk(id);
      res.json(users);
  });
  
  router.post('/edit/:id', async function (req, res, next){
  
      let id = req.params.id.slice(1);
    
      let username = req.body.username;
      let email = req.body.email;
      let password = req.body.password;
      let nik = req.body.nik;
      let institute_name = req.body.institute_name;
      let city = req.body.city;
      let sign_img = req.body.sign_img;
    
      const salt = bcrypt.genSaltSync(10);
      const hashedPassword = bcrypt.hashSync(password, salt);
    
      const updateUser = await user.update({ 
        username: username,
        email: email,
        password: hashedPassword,
        nik: nik,
        institute_name: institute_name,
        city: city,
        sign_img: sign_img}, {
        where: {
          id: id
        }
      });
      
    
      const userInstance = await user.findByPk(id);
    if (!userInstance) {
      return res.status(404).json({ message: 'Data tidak ditemukan' });
    }
    
    userInstance.username = username;
    userInstance.email = email;
    userInstance.password = hashedPassword;
    userInstance.nik = nik;
    userInstance.institute_name = institute_name;
    userInstance.city = city;
    userInstance.sign_img = sign_img;
    
    await userInstance.save();
    
    return res.json({
      message : 'Data Berhasil di Ubah',
      data: userInstance
    });
     
    });

module.exports = router;