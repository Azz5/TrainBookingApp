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

export const reservationTicketData = async  (ticketId) => {
  const [result] = await pool.query(
      `
      SELECT
      t.TicketID,
      r.TrainID,
      r.Date AS ReservationDate,
      -- Departure info
      s1.StationID AS OriginStationID,
      s1.DepartureTime AS DepartureTime,
      -- Arrival info
      s2.StationID AS DestinationStationID,
      s2.ArrivalTime AS ArrivalTime
      FROM Ticket t
      INNER JOIN Reservation r ON t.ReservationID = r.ReservationID
      INNER JOIN Train tr ON r.TrainID = tr.TrainID
      -- Join schedule for origin station (lowest StopSequence)
      INNER JOIN Schedule s1 ON s1.TrainID = tr.TrainID
      AND s1.ScheduleDate = r.Date
      AND s1.StopSequence = (
      SELECT MIN(StopSequence) 
       FROM Schedule 
       WHERE TrainID = tr.TrainID 
       AND ScheduleDate = r.Date
   )
        -- Join schedule for destination station (highest StopSequence)
      INNER JOIN Schedule s2 ON s2.TrainID = tr.TrainID
      AND s2.ScheduleDate = r.Date
      AND s2.StopSequence = (
       SELECT MAX(StopSequence) 
       FROM Schedule 
       WHERE TrainID = tr.TrainID 
       AND ScheduleDate = r.Date
   )
WHERE t.TicketID = ?; 

      `,[ticketId]
  )
    return result[0]
};

// Delete a ticket
export const deleteTicket = async (ticketID) => {
    const [result] = await pool.query(
        'DELETE FROM Ticket WHERE TicketID = ?',
        [ticketID]
    );
    return result.affectedRows; // Return the number of rows affected
};
