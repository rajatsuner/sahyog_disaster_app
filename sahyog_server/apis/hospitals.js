const express = require('express'); //import express
const {ref, onValue, getDatabase, query, startAfter,endBefore, limitToFirst, equalTo, orderByChild, orderByValue, QueryConstraint} =  require("firebase/database");
const db = require('../config');

const router  = express.Router(); 

router.get('/hospital-near-me',async(req,res)=>{
    
    const db = getDatabase();
    let userLatitude = req.query.latitude;
    let userLongitude = req.query.longitude;
    let distanceLimit = req.query.distance;
    const data = ref(db,"hospitalData");
   await onValue(data,(snap)=>{
      
        let hosData=[];
        snap.forEach((snapChild)=>{
            var dis = calcCrow(snapChild.val()["latitude"],snapChild.val()["longitude"],userLatitude,userLongitude);
            if(dis<=distanceLimit){
              hosData.push(snapChild.val());
            }
        });
        res.json({"status":"success","hospitalData":hosData,});

    });

    
 //  res.status(404);
    
});


function calcCrow(lat1, lon1, lat2, lon2) 
{
  var R = 6371; // km
  var dLat = toRad(lat2-lat1);
  var dLon = toRad(lon2-lon1);
  var lat1 = toRad(lat1);
  var lat2 = toRad(lat2);

  var a = Math.sin(dLat/2) * Math.sin(dLat/2) +
    Math.sin(dLon/2) * Math.sin(dLon/2) * Math.cos(lat1) * Math.cos(lat2); 
  var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
  var d = R * c;
  return d;
}

// Converts numeric degrees to radians
function toRad(Value) 
{
    return Value * Math.PI / 180;
}

module.exports = router; 