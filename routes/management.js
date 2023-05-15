var express = require('express');
var router = express.Router();
var document = require('../models/documents');
const multer = require('multer');
var mime = require('mime-types');
const path = require('path');

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, path.join(__dirname, '../', 'assets', 'doc'));
    },
    filename: function (req, file, cb) {
      cb(null, file.originalname);
    }
});

const fileFilter = function(req, file, cb) {
    const allowedTypes = 'application/pdf';
    if (!allowedTypes.includes(file.mimetype)) {
      const error = new Error('Jenis File Tidak di Izinkan');
      error.status = 400;
      return cb(error, false);
    }
    cb(null, true);
}

const upload = multer({ storage: storage, fileFilter: fileFilter });

router.get('/', function(req, res, next) {
    const viewpath = path.join(__dirname, '../', 'views', 'management.html')
    res.sendFile(viewpath);
});

router.post('/add', upload.single('filename'), async function(req, res, next) {

        const file = req.file;
        if (!file) {
          const error = new Error('Silahkan Tambahkan Dokumen');
          error.status = 400;
          return next(error);
        }

        let id = req.body.id;
        let name = req.body.name;
        let description = req.body.description;

        const newFile = await document.create({
        id: id,
        name: name,
        filename: file.originalname,
        description: description
        });
    
        if (newFile) {
            res.json({
                message: 'Dokumen Berhasil di Tambahkan',
                data: newFile,
                redirectUrl: '/management'
              });
        } else {
            res.send("Dokumen gagal ditambahkan");
        }
});

module.exports = router;