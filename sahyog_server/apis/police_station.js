const express = require('express'); //import express

// 1.
const router  = express.Router(); 

router.get('/police',(req,res)=>{
    res.send("POLICE");
});

module.exports = router; 