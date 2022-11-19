const express = require('express'); //import express
const {ref, onValue, getDatabase, query, startAfter,endBefore, limitToFirst, equalTo, orderByChild, orderByValue, QueryConstraint} =  require("firebase/database");
const db = require('../config');

const router = express.Router(); 

router.get('/your-method-api',async(req,res)=>{
 
});

module.exports = router; 
