const express = require('express');
const server = express();
server.use(express.json());
const PORT = process.env.PORT||3000;
const db = require('./config');

//Importing API files written in apis folder
// const hospitalRoutes = require('./apis/hospitals');
// const policeRoutes = require('./apis/police_station');
// const demoRoutes = require('./apis/demo');
// const problemsRoutes = require('./apis/my_problems');

//default page return
server.get('/', (req,res)=>{
    res.send('Welcome to sahyog');
});

//PUSH notification according to pinCode and problemType
server.get("/send-disaster-info", (req,res)=>{
    let pinCode = req.query.pinCode;
    let mainProblemType = req.query.mainProblemType;
    res.json({"status":"success"});
});

//TO use the api routes defined in APIS folder
// server.use('/',hospitalRoutes);
// server.use('/',policeRoutes);
// server.use('/',demoRoutes);
// server.use('/',problemsRoutes);


server.listen(PORT,"0.0.0.0",()=>{
    console.log("server is  listneing");
});