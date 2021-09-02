const express = require("express")
const mongoose = require('mongoose');

const cors = require("cors")

const app = express()

mongoose.connect('mongodb://localhost:27017/test');

const Person = mongoose.model('Person', { name: String });

app.use(express.json())

app.use(cors())

app.get("/",(req,res)=>{
    Person.find({}, function (err, data) {
        res.json(data)
    });
    
})

app.post("/add",(req,res)=>{

    const person = new Person({ name: req.body.name });
    person.save().then(data => res.json(data));
    
})


app.post("/delete",(req,res)=>{
    Person.deleteOne({_id:req.body.id},function(err){
        if (err) {
          console.log(err);
        }else {
          res.json("success")
        }
      })
})

app.listen(4000)
