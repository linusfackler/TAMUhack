var express = require("express");
var router = express.Router();

var spawn = require("child_process").spawn;

const axios = require("axios");
const fs = require("fs");

// var download = require("downloadjs");
const { initializeApp } = require("firebase/app");
const { getStorage, ref, getDownloadURL, put } = require("firebase/storage");
const path = require("path");

const firebaseConfig = {
  apiKey: "AIzaSyB3nPAemDSz-_b1GGXXzXCDg6GgdIhMITI",
  authDomain: "tamuhack-1839f.firebaseapp.com",
  projectId: "tamuhack-1839f",
  storageBucket: "tamuhack-1839f.appspot.com",
  messagingSenderId: "516649805203",
  appId: "1:516649805203:web:e6f9a342eeaa94b1e2f466",
};

const app = initializeApp(firebaseConfig);
const storage = getStorage(app);

router.get("/:filename", function (req, res, next) {
  let filename = req.params.filename;

  var videoRef = ref(storage, "/clips/" + filename);
  getDownloadURL(videoRef)
    .then((url) => {
      axios({
        method: "get",
        url: url,
        responseType: "stream",
      })
        .then((response) => {
          response.data
            .pipe(fs.createWriteStream("./public/videos/" + filename))
            .on("close", () => {
              console.log("File saved!");
            });
        })
        .catch((error) => {
          error;
        });
    })
    .catch((error) => {
      console.log(error);
    });

  	var dataToSend;
 
	console.log(path.parse(filename).name);
 
	const python = spawn("python3", ["script.py", "./public/videos/" +filename, "./public/pics/" + path.parse(filename).name]);
  
	python.stdout.on("data", function (data) {
  	console.log("Pipe data from python script ...");
  	dataToSend = data.toString();
  	console.log(dataToSend);
  	});
 	 python.on("close", (code) => {
 	 console.log(`child process close all stdio with code ${code}`);
  	const result = require("../results.json");
  	res.send(result);

  });

});

module.exports = router;
