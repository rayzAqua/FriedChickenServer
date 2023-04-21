import express from "express";

const app = express();
const port = 3000


app.use("/", (req, res) => {
    res.send("WELCOME TO BACKEND SERVER!<br/>CREATE BY GROUP 20!<br/>HAVE FUN!");
});

app.listen(port, () => {

    console.log("Connected to server!");
});