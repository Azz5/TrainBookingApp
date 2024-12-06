import express from "express";
import {
    getAllStations,
    getStationByID,
    createStation,
    updateStation,
    deleteStation,
} from "../models/stationModel.js";

const router = express.Router();

// Get all stations
router.get("/", async (req, res) => {
    try {
        const stations = await getAllStations();
        res.status(200).json(stations);
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to fetch stations" });
    }
});

// Get a station by ID
router.get("/:id", async (req, res) => {
    try {
        const { id } = req.params;
        if (!id) return res.status(400).json({ error: "Station ID is required" });

        const station = await getStationByID(id);
        if (!station) return res.status(404).json({ error: "Station not found" });

        res.status(200).json(station);
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to fetch station by ID" });
    }
});

// Create a new station
router.post("/", async (req, res) => {
    try {
        const { stationID, stationNameEN, stationNameAR, city } = req.body;

        if (!stationID || !stationNameEN || !stationNameAR || !city) {
            return res.status(400).json({ error: "All fields are required to create a station" });
        }

        const newStationID = await createStation(stationID, stationNameEN, stationNameAR, city);
        res.status(201).json({ message: "Station created successfully", stationID: newStationID });
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to create station" });
    }
});

// Update an existing station
router.put("/:id", async (req, res) => {
    try {
        const { id } = req.params;
        const { stationNameEN, stationNameAR, city } = req.body;

        if (!stationNameEN || !stationNameAR || !city) {
            return res.status(400).json({ error: "All fields are required to update a station" });
        }

        const updatedRows = await updateStation(id, stationNameEN, stationNameAR, city);
        if (updatedRows === 0) {
            return res.status(404).json({ error: "Station not found or no changes made" });
        }

        res.status(200).json({ message: "Station updated successfully" });
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to update station" });
    }
});

// Delete a station
router.delete("/:id", async (req, res) => {
    try {
        const { id } = req.params;
        if (!id) return res.status(400).json({ error: "Station ID is required" });

        const deletedRows = await deleteStation(id);
        if (deletedRows === 0) return res.status(404).json({ error: "Station not found" });

        res.status(200).json({ message: "Station deleted successfully" });
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to delete station" });
    }
});

export default router;
