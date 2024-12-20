import pool from "../config/db.js" 

// Get all reservations
export const getAllReservations = async () => {
    const [rows] = await pool.query('SELECT * FROM Reservation');
    rows.map((e) => {
        const formattedDate = e.Date.toISOString().split('T')[0];
        e.Date = formattedDate;
        return e;
    })
    return rows;
};

export const getReservationByEmail = async (email) => {
    const [rows] = await pool.query(
        `SELECT r.* 
         FROM Reservation r
         JOIN Passenger p ON r.PassengerID = p.PassengerID
         WHERE p.Email = ?`,
        [email]
    );

    // If no rows found, return null; otherwise return the reservation data
    return rows.length > 0 ? rows : null;
};

// Get a reservation by ID
export const getReservationByID = async (reservationID) => {
    const [rows] = await pool.query(
        'SELECT * FROM Reservation WHERE ReservationID = ?',
        [reservationID]
    );
    return rows[0]; // Return the first row (or undefined if not found)
};

// Create a new reservation
export const createReservation = async (trainID, passengerID, date, seatNumber, paymentStatus, status) => {
    const [result] = await pool.query(
        `INSERT INTO Reservation (TrainID, PassengerID, Date, SeatNumber, PaymentStatus, Status)
        VALUES (?, ?, ?, ?, ?, ?)`,
        [trainID, passengerID, date, seatNumber, paymentStatus, status]
    );
    return result.insertId; // Return the ID of the newly created reservation
};

// Update an existing reservation
export const updateReservation = async (reservationID, trainID, passengerID, date, seatNumber, paymentStatus, status) => {
    const [result] = await pool.query(
        `UPDATE Reservation
        SET TrainID = ?, PassengerID = ?, Date = ?, SeatNumber = ?, PaymentStatus = ?, Status = ?
        WHERE ReservationID = ?`,
        [trainID, passengerID, date, seatNumber, paymentStatus, status, reservationID]
    );
    return result.affectedRows; // Return the number of rows affected (1 if updated successfully)
};

// Delete a reservation
export const deleteReservation = async (reservationID) => {
    const [result] = await pool.query(
        'DELETE FROM Reservation WHERE ReservationID = ?',
        [reservationID]
    );
    return result.affectedRows; // Return the number of rows affected (1 if deleted successfully)
};
