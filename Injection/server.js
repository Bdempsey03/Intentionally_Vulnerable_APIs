import {getUsers, makeUser, anyQuery} from './database.js';

import express from 'express';
import cors from 'cors';
import { fileURLToPath } from 'url';
import { dirname } from 'path';


const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);
// import timeRoutes from './routes/time.js';
// import jsonRoutes from './routes/json.js"';
// import echoAllRoutes from './routes/echo-all.js';

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors()); //cross origin resource sharing
app.use(express.json())
//MIDDLEWARE
app.get("/users", async (req, res) => {
    const users = await getUsers();
    res.send(users);
})
app.post("/users", async (req, res) => {
    const {firstName, lastName} = req.body;
    const user =  await makeUser(firstName, lastName);
    res.status(201).send(user);
})
app.post("/query", async (req, res) => {//OBVIOUSLY BAD
    const {query} = req.body;
    const user =  await anyQuery(query);
    res.status(201).send(user);
})

app.options("*", (req, res, next)=>{
    res.header('Access-Control-Allow-Origin', "*");
    res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,OPTIONS');
    res.header('Access-Control-Allow-Headers', 'Authorization, Content-Length, X-Requested-With');
    res.send(200);
});
app.use(express.json()); //for json requests

app.use(express.urlencoded({ extended:false })); //for form requests

app.use((req, res, next)=> {
    console.log(`${req.method} ${req.path} - ${req.ip}`);
    next();
});


app.use(express.static('public'));//looks in order here (i.e public first, css second)
app.use(express.static('css'));

// const timeRoutes = require("./routes/time.js");
// const nameRoutes = require("./routes/name.cjs");
// const jsonRoutes = require("./routes/json.js");
// const echoAllRoutes = require("./routes/echo-all.js");

// app.use("/routes/time", timeRoutes);
// app.use("/routes/name", nameRoutes);
// app.use("/routes/json", jsonRoutes);
// app.use("/routes/echo-all", echoAllRoutes);

app.get('/', (req, res) => {
    res.sendFile(__dirname + "/views/index.html");
});

app.get('/form', (req, res) => {
    res.sendFile(__dirname + "/views/form.html");
});

app.get('/:word/echo', (req, res) => {
    res.json({ "echo": req.params.word })
});

app.all('*', (req, res) => {
    res.send("Invalid route");
});

app.listen(PORT, () => console.log(`Listening on ${PORT}`));
