// controllers/waitlistController.js

import express from "express";
import {
    getWaitlistByTrain,
    addToWaitlist,
    removeFromWaitlist,
    promoteFromWaitlist
} from "../models/waitlistModel.js";

const router = express.Router();

// Get all waitlisted passengers for a specific train
// GET /waitlist/train/:trainID
router.get("/train/:trainID", async (req, res) => {
    try {
        const { trainID } = req.params;
        if (!trainID) {
            return res.status(400).json({ error: "Train ID is required" });
        }

        const waitlist = await getWaitlistByTrain(trainID);
        res.status(200).json(waitlist);
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to fetch waitlist" });
    }
});

// Add a passenger to the waitlist
// POST /waitlist
router.post("/", async (req, res) => {
    try {
        const { trainID, passengerID, classType, priority } = req.body;

        // Validate input
        if (!trainID || !passengerID || !classType || !priority) {
            return res.status(400).json({ error: "All fields are required to add to waitlist" });
        }

        const newWaitlistID = await addToWaitlist(trainID, passengerID, classType, priority);
        res.status(201).json({ message: "Added to waitlist successfully", waitlistID: newWaitlistID });
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to add to waitlist" });
    }
});

// Remove a passenger from the waitlist
// DELETE /waitlist/:waitlistID
router.delete("/:waitlistID", async (req, res) => {
    try {
        const { waitlistID } = req.params;
        if (!waitlistID) {
            return res.status(400).json({ error: "Waitlist ID is required" });
        }

        const deletedRows = await removeFromWaitlist(waitlistID);
        if (deletedRows === 0) {
            return res.status(404).json({ error: "Waitlist entry not found" });
        }

        res.status(200).json({ message: "Removed from waitlist successfully" });
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to remove from waitlist" });
    }
});

// Promote a passenger's priority in the waitlist
// PUT /waitlist/promote/:waitlistID
router.put("/promote/:waitlistID", async (req, res) => {
    try {
        const { waitlistID } = req.params;
        const { scheduleDate,seatNumber } = req.body;
        if (!waitlistID || !scheduleDate || !seatNumber){
            return res.status(400).json({ error: "Waitlist ID is required" });
        }

        const updatedRows = await promoteFromWaitlist(waitlistID,scheduleDate,seatNumber);
        if (updatedRows === 0) {
            return res.status(404).json({ error: "Waitlist entry not found or already at highest priority" });
        }

        res.status(200).json({ message: "Waitlist entry promoted successfully" });
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to promote waitlist entry" });
    }
});

export default router;
