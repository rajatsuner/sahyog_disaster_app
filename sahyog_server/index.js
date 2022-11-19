const express = require('express');
const server = express();
server.use(express.json());
const PORT = process.env.PORT||3000;
//const db = require('./config');
var admin = require("firebase-admin");

var serviceAccount = require("./serviceAccountKey.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL: "https://sahyog-007-default-rtdb.asia-southeast1.firebasedatabase.app"
});


server.get('/send-disaster-info', (req,res)=>{
    let pinCode  = req.query.pinCode;
    let mainProblemType = req.query.mainProblemType;

    var payload = {
        notification: {
          title: mainProblemType + ' in '+ req.query.address,
          body: "Tap here to check"
        },
        data:req.body
      };
      
       var options = {
        priority: "high",
        timeToLive: 60 * 60 *24
      };

     var condition = "'"+pinCode+"' in topics && '"+mainProblemType+"' in topics";
   
     admin.messaging().sendToCondition(condition,payload,options );
    res.send({"status":"success"});

});


  server.listen(PORT,"0.0.0.0",()=>{
    console.log("server is  listneing");
});

