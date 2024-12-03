import express from "express";
import { getAllPassengers, getPassengerByID, deletePassenger, createPassenger, updatePassenger } from "../models/passengerModel.js";


const router = express.Router();

router.get("/", async (req, res) => {
    try {
        const passengers = await getAllPassengers();
        res.status(200).json(passengers);
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to fetch passengers" });
    }
});

router.get("/:id", async (req, res) => {
    try {
        const id = req.params.id;
        if (!id) return res.status(400).json({ error: "Passenger ID is required" });

        const passenger = await getPassengerByID(id);
        if (!passenger) return res.status(404).json({ error: "Passenger not found" });

        res.status(200).json(passenger);
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to fetch passenger by ID" });
    }
});

// Update an existing passenger
router.put("/:id", async (req, res) => {
    try {
        const { id } = req.params;
        const { name, age, gender, email } = req.body;

        // Validate input
        if (!id || !name || !age || !gender || !email) {
            return res.status(400).json({ error: "All fields are required to update a passenger" });
        }

        const updatedRows = await updatePassenger(id, { name, age, gender, email });
        if (updatedRows === 0) {
            return res.status(404).json({ error: "Passenger not found or no changes made" });
        }

        res.status(200).json({ message: "Passenger updated successfully" });
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to update passenger" });
    }
});

router.delete("/:passenger", async (req, res) => {
    try {
        const passengerID = req.params.passenger;
        if (!passengerID) return res.status(400).json({ error: "Passenger ID is required" });

        const deleted = await deletePassenger(passengerID);
        if (deleted) {
            res.status(200).json({ message: "Passenger deleted successfully" });
        } else {
            res.status(404).json({ error: "Passenger not found" });
        }
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to delete passenger" });
    }
});

router.post("/", async (req, res) => {
    try {
        const passengerData = req.body;
        if (!passengerData || !passengerData.name || !passengerData.age) {
            return res.status(400).json({ error: "Invalid passenger data" });
        }

        const newPassenger = await createPassenger(passengerData);
        res.status(201).json({ message: "Passenger created successfully", data: newPassenger });
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to create passenger" });
    }
});

export default router;
