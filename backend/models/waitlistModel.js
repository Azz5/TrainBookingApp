import pool from "../config/db.js";

// Get all waitlisted passengers for a train
export const getWaitlistByTrain = async (trainID) => {
    const [rows] = await pool.query(
        'SELECT * FROM Waitlist WHERE TrainID = ?',
        [trainID]
    );
    return rows;
};

// Add a passenger to the waitlist
export const addToWaitlist = async (trainID, passengerID, classType, priority) => {
    const [result] = await pool.query(
        `INSERT INTO Waitlist (TrainID, PassengerID, Class, Priority)
        VALUES (?, ?, ?, ?)`,
        [trainID, passengerID, classType, priority]
    );
    return result.insertId; // Return the ID of the newly added waitlist entry
};

// Remove a passenger from the waitlist
export const removeFromWaitlist = async (waitlistID) => {
    const [result] = await pool.query(
        'DELETE FROM Waitlist WHERE WaitlistID = ?',
        [waitlistID]
    );
    return result.affectedRows; // Return the number of rows affected (1 if removed successfully)
};

// Promote a passenger from the waitlist
export const promoteFromWaitlist = async (waitlistID) => {
    const [result] = await pool.query(
        'UPDATE Waitlist SET Priority = "Loyalty" WHERE WaitlistID = ?',
        [waitlistID]
    );
    return result.affectedRows; // Return number of rows affected (1 if updated successfully)
};
