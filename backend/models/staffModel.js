// models/staffModel.js

import pool from "../config/db.js";

// Get all staff members
export const getAllStaff = async () => {
    const [rows] = await pool.query('SELECT * FROM Staff');
    return rows;
};

// Get a staff member by ID
export const getStaffByID = async (staffID) => {
    const [rows] = await pool.query('SELECT * FROM Staff WHERE StaffID = ?', [staffID]);
    return rows[0];
};

// Create a new staff member
export const createStaff = async (name, role, assignedTrainID) => {
    const [result] = await pool.query(
        `INSERT INTO Staff (Name, Role, AssignedTrainID)
         VALUES (?, ?, ?)`,
        [name, role, assignedTrainID]
    );
    return result.insertId; // Return the ID of the newly created staff member
};

// Update an existing staff member
export const updateStaff = async (staffID, name, role, assignedTrainID) => {
    const [result] = await pool.query(
        `UPDATE Staff 
         SET Name = ?, Role = ?, AssignedTrainID = ?
         WHERE StaffID = ?`,
        [name, role, assignedTrainID, staffID]
    );
    return result.affectedRows; // Return the number of rows affected (1 if updated successfully)
};

// Delete a staff member
export const deleteStaff = async (staffID) => {
    const [result] = await pool.query('DELETE FROM Staff WHERE StaffID = ?', [staffID]);
    return result.affectedRows; // Return the number of rows affected (1 if deleted successfully)
};

// Assign a train to a staff member
export const assignTrainToStaff = async (staffID, trainID) => {
    const [result] = await pool.query(
        `UPDATE Staff 
         SET AssignedTrainID = ?
         WHERE StaffID = ?`,
        [trainID, staffID]
    );
    return result.affectedRows;
};

// Remove assigned train from a staff member
export const removeAssignedTrain = async (staffID) => {
    const [result] = await pool.query(
        `UPDATE Staff 
         SET AssignedTrainID = NULL
         WHERE StaffID = ?`,
        [staffID]
    );
    return result.affectedRows;
};
