import express from "express"
import { getAllPassengers } from "./models/passengerModel.js"

const app = express()

app.get('/', async (req,res) => {
    const data = getAllPassengers();
    res.send(await data)
})

app.listen((4444) , ()=> {
    console.log("SERVER  IS  ON !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
})