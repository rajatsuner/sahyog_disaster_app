const { async } = require('@firebase/util');
const express = require('express'); //import express
const {ref, onValue, getDatabase, query, startAfter,endBefore, limitToFirst, equalTo, orderByChild, orderByValue, QueryConstraint} =  require("firebase/database");
const db = require('../config');

const router = express.Router(); 

router.get('/my-problems-data',async(req,res)=>{
     var userPhone = req.query.phone;
     var db = getDatabase();
     const data = ref(db,"civilCred/"+userPhone+"/problems");
     let problemData=[];
      await onValue(data,(snap)=>{
      
          
          let problemIds = Object.keys(snap.val());
          problemIds.forEach(async(pId)=>{
            const pData = ref(db,"problemsData/"+ pId);
            await onValue(pData,(pSnap)=>{
                console.log(pSnap.val());
                problemData.push({"problemId":pId, "data": pSnap.val()});
               
            });
          });
          
         
  
     });
     res.json({"status":"success","myProblemsData":problemData});
     
});

module.exports = router; 