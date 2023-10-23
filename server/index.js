//IMPORTS FROM PACKAGES :
const express=require('express');
const mongoose=require('mongoose');

//IMPORTING FROM OTHER FILES :
const authRouter=require('./routes/auth');


//INITIALIZATION
const PORT=3000;
const DB ='mongodb+srv://Amazon2:fW5rrU283c5kjqDp@cluster1.b5x1phb.mongodb.net/?retryWrites=true&w=majority';


//import 'express/express.dart';
const app=express();

// CREATING API
// GET,POST,INSERT,DELETE ,UPDATE : CRUD
// Connection with Db
  app.use(express.json())
  app.use(authRouter);
mongoose.connect(DB).then(()=>{
  console.log("Connection to DB Successful"); // Step 2 is finished here.
}).catch((e)=>{
  console.log("Connection to DB Failed");
});
  app.listen(PORT,"0.0.0.0",()=>{
  console.log("Connected Port is :"+PORT);
  });