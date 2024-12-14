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
export const promoteFromWaitlist = async (waitlistID,scheduleDate,seatNumber) => {
    const [result] = await pool.query(
        'UPDATE Waitlist SET Priority = "Loyalty" WHERE WaitlistID = ?',
        [waitlistID]
    );

    const [waitlistRows] = await pool.query(
        'SELECT TrainID, PassengerID FROM Waitlist WHERE WaitlistID = ?',
        [waitlistID]
    );

    if (waitlistRows.length === 0) {
        throw new Error('No waitlist entry found after promotion.'); // Should not happen if above succeeded
    }

    const { TrainID, PassengerID } = waitlistRows[0];

    if (!TrainID || !PassengerID) {
        throw new Error('Missing TrainID or PassengerID from waitlist data.');
    }

// 3. Insert a new reservation using the retrieved data
// Choose default PaymentStatus and Status as needed. For example:
// PaymentStatus: 'Unpaid', Status: 'Temporary'
    const paymentStatus = 'Paid';
    const status = 'Temporary';

    const [reservationResult] = await pool.query(
        `INSERT INTO Reservation (TrainID, PassengerID, Date, SeatNumber, PaymentStatus, Status)
             VALUES (?, ?, ?, ?, ?, ?)`,
        [TrainID, PassengerID, scheduleDate, seatNumber, paymentStatus, status]
    );

// Get the newly created ReservationID
    const newReservationID = reservationResult.insertId;
    if (!newReservationID) {
        throw new Error('Failed to create a new reservation.');
    }


    return result.affectedRows; // Return number of rows affected (1 if updated successfully)
};

