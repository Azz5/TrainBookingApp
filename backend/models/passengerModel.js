import pool from "../config/db.js";

// Get all passengers
export const getAllPassengers = async () => {
    const [rows] = await pool.query('SELECT * FROM Passenger');
    console.log(rows)
    return rows;
};

// Get a specific passenger by ID
export const getPassengerByID = async (passengerID) => {
    const [rows] = await pool.query(
        'SELECT * FROM Passenger WHERE PassengerID = ?',
        [passengerID]
    );
    return rows[0]; // Return the first row (or undefined if not found)
};

// Get a specific passenger by ID
export const getPassengerByEmail = async (email) => {
    const [rows] = await pool.query(
        'SELECT * FROM Passenger WHERE email = ?',
        [email]
    );
    return rows[0]; // Return the first row (or undefined if not found)
};

// Create a new passenger
export const createPassenger = async (name, email, phoneNumber, loyaltyPoints, identificationDocument) => {
    const [result] = await pool.query(
        `INSERT INTO Passenger (Name, Email, PhoneNumber, LoyaltyPoints, IdentificationDocument)
        VALUES (?, ?, ?, ?, ?)`,
        [name, email, phoneNumber, loyaltyPoints, identificationDocument]
    );
    return result.insertId; // Return the ID of the newly created passenger
};

// Update an existing passenger
export const updatePassenger = async (passengerID, name, email, phoneNumber, loyaltyPoints, identificationDocument) => {
    const [result] = await pool.query(
        `UPDATE Passenger
        SET Name = ?, Email = ?, PhoneNumber = ?, LoyaltyPoints = ?, IdentificationDocument = ?
        WHERE PassengerID = ?`,
        [name, email, phoneNumber, loyaltyPoints, identificationDocument, passengerID]
    );
    return result.affectedRows; // Return the number of rows affected (1 if updated successfully)
};

// Delete a passenger
export const deletePassenger = async (passengerID) => {
    const [result] = await pool.query(
        'DELETE FROM Passenger WHERE PassengerID = ?',
        [passengerID]
    );
    return result.affectedRows; // Return the number of rows affected (1 if deleted successfully)
};
