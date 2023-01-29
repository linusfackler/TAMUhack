var express = require("express");
var router = express.Router();

var spawn = require("child_process").spawn;

const axios = require("axios");
const fs = require("fs");
// var download = require("downloadjs");
const { initializeApp } = require("firebase/app");
const { getStorage, ref, getDownloadURL } = require("firebase/storage");

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

  if (String(filename).includes(".pdf") === false) {
    filename = filename + ".pdf";
  }

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
  // spawn new child process to call the python script
  const python = spawn("python", ["script.py", "backend/videos/" +filename, "backend/pics/0.png"]);
  // collect data from script
  python.stdout.on("data", function (data) {
    console.log("Pipe data from python script ...");
    dataToSend = data.toString();
    console.log(dataToSend);
  });
  // in close event we are sure that stream from child process is closed
  python.on("close", (code) => {
    console.log(`child process close all stdio with code ${code}`);
  });
});

module.exports = router;
