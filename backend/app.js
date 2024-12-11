import express from "express"

import passengerController from './controllers/passengerController.js';
import reservationController from './controllers/reservationController.js';
import scheduleController from './controllers/scheduleController.js';
import stationController from './controllers/stationController.js';
import ticketController from './controllers/ticketController.js';
import trainController from './controllers/trainController.js';
import staffController from './controllers/staffController.js'
import waitlistController from "./controllers/waitListController.js"

const app = express();

app.use(express.json());

app.use("/passenger",passengerController)
app.use("/reservation",reservationController )
app.use("/schedule",scheduleController )
app.use("/station",stationController )
app.use("/ticket",ticketController )
app.use("/train",trainController )
app.use("/staff",staffController)
app.use("/waitlist",waitlistController)


const port = 3333 || process.env.PORTU
app.listen(port, (req,res) => {
    console.log(`Server on ${port}`)
})
