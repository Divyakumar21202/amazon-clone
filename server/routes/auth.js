const express=require('express');
var bcrypt=require('bcryptjs');

const authRouter=express.Router();// creating router for not to use listen here because we already listen in in dex.js file..
const User=require('../models/user');
/*
  Steps for configuring :
  1.we have to get data from the Client.
  2.Post Data in Database
  3.Get Data from Database
*/
authRouter.post('/admin/signup', async (req,res)=>{
   try{

    let {name,email,password}=req.body; // Step 1 is finish..

    var salt = bcrypt.genSaltSync(10);
    password = bcrypt.hashSync(password, salt);
    const existingUser=await User.findOne({email});//findOne is the promise funtion like future and take some time to check email from db..
    if(existingUser){
    return res.
    status(400).
    json({msg:"Email Already Exist"});
    }

    let user=new User({
    name,
    password,
    email
    });
    user=await user.save();

    res.json(user);//Data send to the client side...
   }catch(e){
   res
   .status(500)
   .json({error : e.message});
   }
});
// tells that this private module is accessible as globally ...
module.exports=authRouter;
