import express from "express"

import passengerController from './controllers/passengerController.js';
import reservationController from './controllers/reservationController.js';
import scheduleController from './controllers/scheduleController.js';
import stationController from './controllers/stationController.js';
import ticketController from './controllers/ticketController.js'
import trainController from './controller/trainController.js'

const app = express();

app.use("/api/passenger",passengerController)
app.use("/api/reservation",reservationController )
app.use("/api/schedule",scheduleController )
app.use("/api/station",stationController )
app.use("/api/ticket",ticketController )
app.use("/api/train",trainController )



const port = 3333 || process.env.PORTU
app.listen(port, (req,res) => {
    console.log(`Server on ${port}`)
})
