var express = require("express");
var router = express.Router();

var getVideo = require("../public/javascripts/firebase");

router.get("/", function (req, res, next) {
  // res.send("Hello World!");
  let filename = req.params.filename;
  let file = `./public/videos/${filename}`;
});

module.exports = router;
