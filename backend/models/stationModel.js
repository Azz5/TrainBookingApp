import pool from "../config/db.js";

// Get all stations
export const getAllStations = async () => {
    const [rows] = await pool.query('SELECT * FROM Station');
    return rows;
};

// Get a station by ID
export const getStationByID = async (stationID) => {
    const [rows] = await pool.query(
        'SELECT * FROM Station WHERE StationID = ?',
        [stationID]
    );
    return rows[0]; // Return the first row (or undefined if not found)
};

// Create a new station
export const createStation = async (stationID, stationNameEN, stationNameAR, city) => {
    const [result] = await pool.query(
        `INSERT INTO Station (StationID, StationName_EN, StationName_AR, City)
        VALUES (?, ?, ?, ?)`,
        [stationID, stationNameEN, stationNameAR, city]
    );
    return result.insertId; // Return the ID of the newly created station
};

// Update an existing station
export const updateStation = async (stationID, stationNameEN, stationNameAR, city) => {
    const [result] = await pool.query(
        `UPDATE Station
        SET StationName_EN = ?, StationName_AR = ?, City = ?
        WHERE StationID = ?`,
        [stationNameEN, stationNameAR, city, stationID]
    );
    return result.affectedRows; // Return the number of rows affected
};

// Delete a station
export const deleteStation = async (stationID) => {
    const [result] = await pool.query(
        'DELETE FROM Station WHERE StationID = ?',
        [stationID]
    );
    return result.affectedRows; // Return the number of rows affected
};
