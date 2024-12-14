import pool from "../config/db.js";

// Get all schedules
export const getAllSchedules = async () => {
    const [rows] = await pool.query('SELECT * FROM Schedule');
    return rows;
};

export const getAllAllSchedules = async () => {
    const query = `
SELECT 
    S.ScheduleID,
    T.TrainID,
    T.TrainName_EN,
    T.TrainName_AR,
    T.ScheduleDate AS TrainScheduleDate,
    St.StationName AS StopStation,
    St.Location AS StopLocation,
    S.StopSequence,
    S.ArrivalTime,
    S.DepartureTime
FROM 
    Schedule S
JOIN 
    Train T ON S.TrainID = T.TrainID
JOIN 
    Station St ON S.StationID = St.StationID
ORDER BY 
    T.TrainID, S.StopSequence;
    `;

    const [rows] = await pool.query(query);
    return rows;
};

// Get a schedule by ID
export const getScheduleByID = async (scheduleID) => {
    const [rows] = await pool.query(
        'SELECT * FROM Schedule WHERE ScheduleID = ?',
        [scheduleID]
    );
    return rows[0]; // Return the first row (or undefined if not found)
};

// Create a new schedule
export const createSchedule = async (scheduleID, trainID, departureTime, arrivalTime) => {
    const [result] = await pool.query(
        `INSERT INTO Schedule (ScheduleID, TrainID, DepartureTime, ArrivalTime)
        VALUES (?, ?, ?, ?)`,
        [scheduleID, trainID, departureTime, arrivalTime]
    );
    return result.insertId; // Return the ID of the newly created schedule
};

// Update an existing schedule
export const updateSchedule = async (scheduleID, trainID, departureTime, arrivalTime) => {
    const [result] = await pool.query(
        `UPDATE Schedule
        SET TrainID = ?, DepartureTime = ?, ArrivalTime = ?
        WHERE ScheduleID = ?`,
        [trainID, departureTime, arrivalTime, scheduleID]
    );
    return result.affectedRows; // Return the number of rows affected
};

// Delete a schedule
export const deleteSchedule = async (scheduleID) => {
    const [result] = await pool.query(
        'DELETE FROM Schedule WHERE ScheduleID = ?',
        [scheduleID]
    );
    return result.affectedRows; // Return the number of rows affected
};
