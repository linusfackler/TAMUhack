var express = require("express");
var router = express.Router();

require("dotenv").config();

// var getVideo = require("../public/javascripts/firebase");

const { initializeApp } = require("firebase/app");
const { getStorage, ref, getDownloadURL } = require("firebase/storage");

// TODO: Replace the following with your app's Firebase project configuration
const firebaseConfig = {
  apiKey: process.env.apiKey,
  authDomain: process.env.authDomain,
  projectId: process.env.projectId,
  storageBucket: process.env.storageBucket,
  messagingSenderId: process.env.messagingSenderId,
  appId: process.env.appId,
};

const app = initializeApp(firebaseConfig);
const storage = getStorage(app);

// void async function getVideo(refID) {
//   let root = ref(storage);
//   let videoRef = ref(root, refID);

//   getDownloadURL(videoRef)
//     .then((url) => {
//       const xhr = new XMLHttpRequest();
//       xhr.responseType = "blob";
//       xhr.onload = (event) => {
//         const file = xhr.response;
//       };
//       xhr.open("GET", url);
//       xhr.send();
//     })
//     .catch((error) => {
//       console.log(error);
//     });
// };

router.get("/", function (req, res, next) {
  // res.send("Hello World!");
  let refID = req.params.filename;

  // console.log(app);

  let videoRef = ref(storage, "/Resume_2022_Fall.pdf");
  console.log(videoRef);

  getDownloadURL(videoRef)
    .then((url) => {
      const xhr = new XMLHttpRequest();
      xhr.responseType = "blob";
      xhr.onload = (event) => {
        const file = xhr.response;
      };
      xhr.open("GET", url);
      xhr.send();
    })
    .catch((error) => {
      console.log(error);
    });

  // getVideo(filename);
  // let filePath = `./public/videos/${filename}`;
});

module.exports = router;
