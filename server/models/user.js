const mongoose=require('mongoose');

const userSchema=mongoose.Schema({ //Just idea about what are the structure of the user
     name:{
     type:String,
     required:true,
     trim:true,

     },
     email:{
     type:String,
     required:true,
     trim:true,
     validate:{
        validator:(value)=>{
        const re = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
        return value.match(re);
     },
     message :"Please Enter a valid Email..."
     }
     },
     password:{
     type:String,
     required:true,
     trim:true,
     },

     address :{
     type:String,
     default:" ",
     },

     type:{
     type:String,
     default:"user"
     }
     //Cart Menu


});

// Creating Model of that Schema
const User=mongoose.model('User',userSchema);
module.exports = User;