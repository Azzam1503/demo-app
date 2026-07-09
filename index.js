const express = require("express");

const app = express();


app.get("/", (req, res) => {
    return res.send("version 1");
});
app.listen(4321, () =>{
	console.log("app is running on port 4321");
});
