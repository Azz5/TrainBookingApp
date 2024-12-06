import pool from "../config/db.js";

// Get all tickets
export const getAllTickets = async () => {
    const [rows] = await pool.query('SELECT * FROM Ticket');
    return rows;
};

// Get a ticket by ID
export const getTicketByID = async (ticketID) => {
    const [rows] = await pool.query(
        'SELECT * FROM Ticket WHERE TicketID = ?',
        [ticketID]
    );
    return rows[0]; // Return the first row (or undefined if not found)
};

// Create a new ticket
export const createTicket = async (ticketID, reservationID, price, issueDate, validity) => {
    const [result] = await pool.query(
        `INSERT INTO Ticket (TicketID, ReservationID, Price, IssueDate, Validity)
        VALUES (?, ?, ?, ?, ?)`,
        [ticketID, reservationID, price, issueDate, validity]
    );
    return result.insertId; // Return the ID of the newly created ticket
};

// Update an existing ticket
export const updateTicket = async (ticketID, reservationID, price, issueDate, validity) => {
    const [result] = await pool.query(
        `UPDATE Ticket
        SET ReservationID = ?, Price = ?, IssueDate = ?, Validity = ?
        WHERE TicketID = ?`,
        [reservationID, price, issueDate, validity, ticketID]
    );
    return result.affectedRows; // Return the number of rows affected
};

// Delete a ticket
export const deleteTicket = async (ticketID) => {
    const [result] = await pool.query(
        'DELETE FROM Ticket WHERE TicketID = ?',
        [ticketID]
    );
    return result.affectedRows; // Return the number of rows affected
};
