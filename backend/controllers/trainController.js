import express from "express";
import {
    getAllTrains,
    getTrainByID,
    createTrain,
    updateTrain,
    deleteTrain
} from "../models/trainModel.js";

const router = express.Router();

// Get all trains
router.get("/", async (req, res) => {
    try {
        const trains = await getAllTrains();
        res.status(200).json(trains);
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to fetch trains" });
    }
});

// Get a train by ID
router.get("/:id", async (req, res) => {
    try {
        const { id } = req.params;
        if (!id) return res.status(400).json({ error: "Train ID is required" });

        const train = await getTrainByID(id);
        if (!train) return res.status(404).json({ error: "Train not found" });

        res.status(200).json(train);
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to fetch train by ID" });
    }
});

// Create a new train
router.post("/", async (req, res) => {
    try {
        const { trainID, trainNameEN, trainNameAR, originStationID, destinationStationID, scheduleDate } = req.body;

        if (!trainID || !trainNameEN || !trainNameAR || !originStationID || !destinationStationID || !scheduleDate) {
            return res.status(400).json({ error: "All fields are required" });
        }

        const newTrainID = await createTrain(trainID, trainNameEN, trainNameAR, originStationID, destinationStationID, scheduleDate);
        res.status(201).json({ message: "Train created successfully", trainID: newTrainID });
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to create train" });
    }
});

// Update an existing train
router.put("/:id", async (req, res) => {
    try {
        const { id } = req.params;
        const { trainNameEN, trainNameAR, originStationID, destinationStationID, scheduleDate } = req.body;

        if (!id || !trainNameEN || !trainNameAR || !originStationID || !destinationStationID || !scheduleDate) {
            return res.status(400).json({ error: "All fields are required for updating the train" });
        }

        const updatedRows = await updateTrain(id, trainNameEN, trainNameAR, originStationID, destinationStationID, scheduleDate);
        if (updatedRows === 0) return res.status(404).json({ error: "Train not found or no changes made" });

        res.status(200).json({ message: "Train updated successfully" });
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to update train" });
    }
});

// Delete a train
router.delete("/:id", async (req, res) => {
    try {
        const { id } = req.params;
        if (!id) return res.status(400).json({ error: "Train ID is required" });

        const deletedRows = await deleteTrain(id);
        if (deletedRows === 0) return res.status(404).json({ error: "Train not found" });

        res.status(200).json({ message: "Train deleted successfully" });
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to delete train" });
    }
});

export default router;