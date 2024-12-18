import express from "express";
import {
    getAllReservations,
    getReservationByID,
    createReservation,
    updateReservation,
    deleteReservation, getReservationByEmail
} from "../models/reservationModel.js";

const router = express.Router();

// Get all reservations
router.get("/", async (req, res) => {
    try {
        const reservations = await getAllReservations();
        res.status(200).json(reservations);
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to fetch reservations" });
    }
});

// Get a reservation by ID
router.get("/:id", async (req, res) => {
    try {
        const { id } = req.params;
        if (!id) return res.status(400).json({ error: "Reservation ID is required" });

        const reservation = await getReservationByID(id);
        if (!reservation) return res.status(404).json({ error: "Reservation not found" });

        res.status(200).json(reservation);
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to fetch reservation by ID" });
    }
});

// Get a reservation by passenger email
router.get("/by/:email", async (req, res) => {
    try {
        const { email } = req.params;
        if (!email) return res.status(400).json({ error: "Passenger Email is required" });

        const reservation = await getReservationByEmail(email);
        if (!reservation) return res.status(404).json({ error: "No reservation found for the provided email" });

        res.status(200).json(reservation);
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to fetch reservation by email" });
    }
});

// Create a new reservation
router.post("/", async (req, res) => {
    try {
        const { trainID, passengerID, date, seatNumber, paymentStatus, status } = req.body;

        // Validate input
        if (!trainID || !passengerID || !date || !seatNumber || !paymentStatus || !status) {
            return res.status(400).json({ error: "All fields are required to create a reservation" });
        }

        const newReservationID = await createReservation(trainID, passengerID, date, seatNumber, paymentStatus, status);
        res.status(201).json({ message: "Reservation created successfully", reservationID: newReservationID });
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to create reservation" });
    }
});

// Update an existing reservation
router.put("/:id", async (req, res) => {
    try {
        const { id } = req.params;
        console.log(req.body)
        const { TrainID , PassengerID, Date, SeatNumber, PaymentStatus, Status } = req.body;

        // Validate input
        if (!id || !TrainID || !PassengerID || !Date || !SeatNumber || !PaymentStatus || !Status) {
            return res.status(400).json({ error: "All fields are required to update a reservation" });
        }

        const updatedRows = await updateReservation(id, TrainID, PassengerID, Date, SeatNumber, PaymentStatus, Status);
        if (updatedRows === 0) {
            return res.status(404).json({ error: "Reservation not found or no changes made" });
        }

        res.status(200).json({ message: "Reservation updated successfully" });
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to update reservation" });
    }
});

// Delete a reservation
router.delete("/:id", async (req, res) => {
    try {
        const { id } = req.params;
        if (!id) return res.status(400).json({ error: "Reservation ID is required" });

        const deletedRows = await deleteReservation(id);
        if (deletedRows === 0) return res.status(404).json({ error: "Reservation not found" });

        res.status(200).json({ message: "Reservation deleted successfully" });
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to delete reservation" });
    }
});

export default router;