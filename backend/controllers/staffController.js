// controllers/staffController.js

import express from "express";
import {
    getAllStaff,
    getStaffByID,
    createStaff,
    updateStaff,
    deleteStaff,
    assignTrainToStaff,
    removeAssignedTrain
} from "../models/staffModel.js";

const router = express.Router();

// Get all staff members
// GET /staff
router.get("/", async (req, res) => {
    try {
        const staff = await getAllStaff();
        res.status(200).json(staff);
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to fetch staff members" });
    }
});

// Get a staff member by ID
// GET /staff/:staffID
router.get("/:staffID", async (req, res) => {
    try {
        const { staffID } = req.params; // Ensure the route parameter matches the destructured variable
        if (!staffID) {
            return res.status(400).json({ error: "Staff ID is required" });
        }

        const staff = await getStaffByID(staffID);
        if (!staff) {
            return res.status(404).json({ error: "Staff member not found" });
        }

        res.status(200).json(staff);
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to fetch staff member by ID" });
    }
});

// Create a new staff member
// POST /staff
router.post("/", async (req, res) => {
    try {
        const { name, role, assignedTrainID } = req.body;

        // Validate input
        if (!name || !role) {
            return res.status(400).json({ error: "Name and Role are required to create a staff member" });
        }

        // Validate role
        const validRoles = ['Driver', 'Engineer', 'Admin'];
        if (!validRoles.includes(role)) {
            return res.status(400).json({ error: `Role must be one of the following: ${validRoles.join(', ')}` });
        }

        const newStaffID = await createStaff(name, role, assignedTrainID || null);
        res.status(201).json({ message: "Staff member created successfully", staffID: newStaffID });
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to create staff member" });
    }
});

// Update an existing staff member
// PUT /staff/:staffID
router.put("/:staffID", async (req, res) => {
    try {
        const { staffID } = req.params;
        const { name, role, assignedTrainID } = req.body;

        if (!staffID) {
            return res.status(400).json({ error: "Staff ID is required" });
        }

        // Validate role if provided
        const validRoles = ['Driver', 'Engineer', 'Admin'];
        if (role && !validRoles.includes(role)) {
            return res.status(400).json({ error: `Role must be one of the following: ${validRoles.join(', ')}` });
        }

        const updatedRows = await updateStaff(staffID, name, role, assignedTrainID || null);
        if (updatedRows === 0) {
            return res.status(404).json({ error: "Staff member not found or no changes made" });
        }

        res.status(200).json({ message: "Staff member updated successfully" });
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to update staff member" });
    }
});

// Delete a staff member
// DELETE /staff/:staffID
router.delete("/:staffID", async (req, res) => {
    try {
        const { staffID } = req.params;
        if (!staffID) {
            return res.status(400).json({ error: "Staff ID is required" });
        }

        const deletedRows = await deleteStaff(staffID);
        if (deletedRows === 0) {
            return res.status(404).json({ error: "Staff member not found" });
        }

        res.status(200).json({ message: "Staff member deleted successfully" });
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to delete staff member" });
    }
});

// Assign a train to a staff member
// PUT /staff/:staffID/assign-train
router.put("/:staffID/assign-train", async (req, res) => {
    try {
        const { staffID } = req.params;
        const { trainID } = req.body;

        if (!staffID || !trainID) {
            return res.status(400).json({ error: "Staff ID and Train ID are required to assign a train" });
        }

        const updatedRows = await assignTrainToStaff(staffID, trainID);
        if (updatedRows === 0) {
            return res.status(404).json({ error: "Staff member not found or train assignment failed" });
        }

        res.status(200).json({ message: "Train assigned to staff member successfully" });
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to assign train to staff member" });
    }
});

// Remove assigned train from a staff member
// PUT /staff/:staffID/remove-train
router.put("/:staffID/remove-train", async (req, res) => {
    try {
        const { staffID } = req.params;

        if (!staffID) {
            return res.status(400).json({ error: "Staff ID is required to remove assigned train" });
        }

        const updatedRows = await removeAssignedTrain(staffID);
        if (updatedRows === 0) {
            return res.status(404).json({ error: "Staff member not found or no train assigned" });
        }

        res.status(200).json({ message: "Assigned train removed from staff member successfully" });
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to remove assigned train from staff member" });
    }
});

export default router;
