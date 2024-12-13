import pool from "../config/db.js"

// Get all trains
export const getAllTrains = async () => {
    const [rows] = await pool.query('SELECT * FROM Train');
    return rows;
};

// Get a specific train by ID
export const getTrainByID = async (trainID) => {
    const [rows] = await pool.query(
        'SELECT * FROM Train WHERE TrainID = ?',
        [trainID]
    );
    return rows[0]; // Return the first row (or undefined if not found)
};

export const getUnAssignedDriverTrain = async () => {
    try {
        const [rows] = await pool.query(
            `
            SELECT *
            FROM Train
            WHERE TrainID NOT IN (
                SELECT DISTINCT AssignedTrainID
                FROM Staff
                WHERE Role = 'Driver' AND AssignedTrainID IS NOT NULL
            );
            `
        );
        return rows; // Returns the list of unassigned drivers and train details
    } catch (error) {
        console.error("Error fetching unassigned drivers and trains:", error);
        throw new Error("Failed to fetch unassigned drivers and trains.");
    }
};


export const getUnAssignedEngineerTrain = async () => {
    try {
        const [rows] = await pool.query(
            `
            SELECT *
            FROM Train
            WHERE TrainID NOT IN (
                SELECT DISTINCT AssignedTrainID
                FROM Staff
                WHERE Role = 'Driver' AND AssignedTrainID IS NOT NULL
            );
            `
        );
        return rows; // Returns the list of unassigned drivers and train details
    } catch (error) {
        console.error("Error fetching unassigned drivers and trains:", error);
        throw new Error("Failed to fetch unassigned drivers and trains.");
    }
};

// Create a new train
export const createTrain = async (trainID, trainNameEN, trainNameAR, originStationID, destinationStationID, scheduleDate) => {
    const [result] = await pool.query(
        `INSERT INTO Train (TrainID, TrainName_EN, TrainName_AR, OriginStationID, DestinationStationID, ScheduleDate)
        VALUES (?, ?, ?, ?, ?, ?)`,
        [trainID, trainNameEN, trainNameAR, originStationID, destinationStationID, scheduleDate]
    );
    return result.insertId; // Return the ID of the newly created train
};

// Update an existing train
export const updateTrain = async (trainID, trainNameEN, trainNameAR, originStationID, destinationStationID, scheduleDate) => {
    const [result] = await pool.query(
        `UPDATE Train
        SET TrainName_EN = ?, TrainName_AR = ?, OriginStationID = ?, DestinationStationID = ?, ScheduleDate = ?
        WHERE TrainID = ?`,
        [trainNameEN, trainNameAR, originStationID, destinationStationID, scheduleDate, trainID]
    );
    return result.affectedRows; // Return the number of rows affected (1 if updated successfully)
};

// Delete a train
export const deleteTrain = async (trainID) => {
    const [result] = await pool.query(
        'DELETE FROM Train WHERE TrainID = ?',
        [trainID]
    );
    return result.affectedRows; // Return the number of rows affected (1 if deleted successfully)
};
