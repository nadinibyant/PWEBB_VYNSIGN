var express = require('express');
var router = express.Router();
const bodyParser = require('body-parser');
const app = express();

app.use(bodyParser.json());

router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

module.exports = router;
