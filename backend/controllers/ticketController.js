import express from "express";

import {
    getAllTickets,
    getTicketByID,
    createTicket,
    updateTicket,
    deleteTicket,
} from "../models/ticketModel.js";

const router = express.Router();

// Get all tickets
router.get("/", async (req, res) => {
    try {
        const tickets = await getAllTickets();
        res.status(200).json(tickets);
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to fetch tickets" });
    }
});

// Get a ticket by ID
router.get("/:id", async (req, res) => {
    try {
        const { id } = req.params;
        if (!id) return res.status(400).json({ error: "Ticket ID is required" });

        const ticket = await getTicketByID(id);
        if (!ticket) return res.status(404).json({ error: "Ticket not found" });

        res.status(200).json(ticket);
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to fetch ticket by ID" });
    }
});

// Create a new ticket
router.post("/", async (req, res) => {
    try {
        const { ticketID, reservationID, price, issueDate, validity } = req.body;

        if (!ticketID || !reservationID || !price || !issueDate || !validity) {
            return res.status(400).json({ error: "All fields are required to create a ticket" });
        }

        const newTicketID = await createTicket(ticketID, reservationID, price, issueDate, validity);
        res.status(201).json({ message: "Ticket created successfully", ticketID: newTicketID });
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to create ticket" });
    }
});

// Update an existing ticket
router.put("/:id", async (req, res) => {
    try {
        const { id } = req.params;
        const { reservationID, price, issueDate, validity } = req.body;

        if (!reservationID || !price || !issueDate || !validity) {
            return res.status(400).json({ error: "All fields are required to update a ticket" });
        }

        const updatedRows = await updateTicket(id, reservationID, price, issueDate, validity);
        if (updatedRows === 0) {
            return res.status(404).json({ error: "Ticket not found or no changes made" });
        }

        res.status(200).json({ message: "Ticket updated successfully" });
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to update ticket" });
    }
});

// Delete a ticket
router.delete("/:id", async (req, res) => {
    try {
        const { id } = req.params;
        if (!id) return res.status(400).json({ error: "Ticket ID is required" });

        const deletedRows = await deleteTicket(id);
        if (deletedRows === 0) return res.status(404).json({ error: "Ticket not found" });

        res.status(200).json({ message: "Ticket deleted successfully" });
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Failed to delete ticket" });
    }
});

export default router;
