import express from "express";
import {
    getAllSchedules,
    getScheduleByID,
    createSchedule,
    updateSchedule,
    deleteSchedule, getAllAllSchedules,
} from "../models/scheduleModel.js";

const router = express.Router();

router.get("/all", async (req, res) => {
    try {
        const schedules = await getAllAllSchedules();
        res.status(200).json(schedules);
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to fetch schedules" });
    }
});
// Get all schedules
router.get("/", async (req, res) => {
    try {
        const schedules = await getAllSchedules();
        res.status(200).json(schedules);
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to fetch schedules" });
    }
});

// Get a schedule by ID
router.get("/:id", async (req, res) => {
    try {
        const { id } = req.params;
        if (!id) return res.status(400).json({ error: "Schedule ID is required" });

        const schedule = await getScheduleByID(id);
        if (!schedule) return res.status(404).json({ error: "Schedule not found" });

        res.status(200).json(schedule);
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to fetch schedule by ID" });
    }
});

// Create a new schedule
router.post("/", async (req, res) => {
    try {
        const { scheduleID, trainID, departureTime, arrivalTime } = req.body;

        if (!scheduleID || !trainID || !departureTime || !arrivalTime) {
            return res.status(400).json({ error: "All fields are required to create a schedule" });
        }

        const newScheduleID = await createSchedule(scheduleID, trainID, departureTime, arrivalTime);
        res.status(201).json({ message: "Schedule created successfully", scheduleID: newScheduleID });
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to create schedule" });
    }
});

// Update an existing schedule
router.put("/:id", async (req, res) => {
    try {
        const { id } = req.params;
        const { trainID, departureTime, arrivalTime } = req.body;

        if (!trainID || !departureTime || !arrivalTime) {
            return res.status(400).json({ error: "All fields are required to update a schedule" });
        }

        const updatedRows = await updateSchedule(id, trainID, departureTime, arrivalTime);
        if (updatedRows === 0) {
            return res.status(404).json({ error: "Schedule not found or no changes made" });
        }

        res.status(200).json({ message: "Schedule updated successfully" });
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to update schedule" });
    }
});

// Delete a schedule
router.delete("/:id", async (req, res) => {
    try {
        const { id } = req.params;
        if (!id) return res.status(400).json({ error: "Schedule ID is required" });

        const deletedRows = await deleteSchedule(id);
        if (deletedRows === 0) return res.status(404).json({ error: "Schedule not found" });

        res.status(200).json({ message: "Schedule deleted successfully" });
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to delete schedule" });
    }
});

export default router;
