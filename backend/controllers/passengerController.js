import express from "express";
import {
    getAllPassengers,
    getPassengerByID,
    deletePassenger,
    createPassenger,
    updatePassenger,
    getPassengerByEmail
} from "../models/passengerModel.js";

const router = express.Router();

// Get all passengers
router.get("/", async (req, res) => {
    try {
        const passengers = await getAllPassengers();
        res.status(200).json(passengers);
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to fetch passengers" });
    }
});

// Get a passenger by ID
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

router.get("/by/:email", async (req,res) => {
    try {
        const email = req.params.email;
        if (!email) return res.status(400).json({ error: "Passenger Email is required" });

        const passenger = await getPassengerByEmail(email);
        if (!passenger) return res.status(404).json({ error: "Passenger not found" });
        return res.status(200).json({ passenger });

    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to fetch passenger by Email"})
    }
});

// Create a new passenger
router.post("/", async (req, res) => {
    try {
        const { name, email, phoneNumber, loyaltyPoints} = req.body;
        console.log(req.body)
        if (!name || !email || !phoneNumber|| !loyaltyPoints) {
            return res.status(400).json({ error: "All fields are required to update a passenger" });
        }
        console.log(req.body)
        let k =null;
        const newPassenger = await createPassenger(name, email, phoneNumber, loyaltyPoints,k);
        console.log(newPassenger)
        res.status(201).json({ messemail: "Passenger created successfully", data: newPassenger });
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to create passenger" });
    }
});

// Update an existing passenger
router.put("/:id", async (req, res) => {
    try {
        const { id } = req.params;
        const { name, email, phoneNumber, loyaltyPoints} = req.body;

        // Validate input
        if (!id || !name || !email || !phoneNumber|| !loyaltyPoints) {
            return res.status(400).json({ error: "All fields are required to update a passenger" });
        }

        const updatedRows = await updatePassenger(id, { name, email, phoneNumber, loyaltyPoints});
        if (updatedRows === 0) {
            return res.status(404).json({ error: "Passenger not found or no changes made" });
        }

        res.status(200).json({ messemail: "Passenger updated successfully" });
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to update passenger" });
    }
});

// Delete a passenger
router.delete("/:id", async (req, res) => {
    try {
        const { id } = req.params;
        if (!id) return res.status(400).json({ error: "Passenger ID is required" });

        const deleted = await deletePassenger(id);
        if (deleted) {
            res.status(200).json({ messemail: "Passenger deleted successfully" });
        } else {
            res.status(404).json({ error: "Passenger not found" });
        }
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to delete passenger" });
    }
});

export default router;
