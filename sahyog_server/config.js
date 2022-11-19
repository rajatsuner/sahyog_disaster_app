const {initializeApp} =  require("firebase/app");
const {getDatabase} =  require("firebase/database");

const firebaseConfig = {
    apiKey: "AIzaSyBiEnUrNgcvbl7klholmcK7RQ5WJYnXSRM",
    authDomain: "sahyog-007.firebaseapp.com",
    databaseURL: "https://sahyog-007-default-rtdb.asia-southeast1.firebasedatabase.app",
    projectId: "sahyog-007",
    storageBucket: "sahyog-007.appspot.com",
    messagingSenderId: "728163053383",
    appId: "1:728163053383:web:9da0918f837d503d8c6662",
    measurementId: "G-Z78QN2F486"
  };


// Initialize Firebase
 const app=initializeApp(firebaseConfig);
 const db = getDatabase(app);




  
  


