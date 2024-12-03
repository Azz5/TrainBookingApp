import express from "express"
import passengerController from './controllers/passengerController.js'
const app = express();

app.use("/passenger",passengerController)

const port = 3333 || process.env.PORTU
app.listen(port, (req,res) => {
    console.log(`Server on ${port}`)
})