use trainapp;
-- Passenger Table
CREATE TABLE Passenger (
    PassengerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(15),
    LoyaltyPoints INT DEFAULT 0,
    IdentificationDocument BLOB NOT NULL
);

-- Station Table
CREATE TABLE Station (
    StationID INT AUTO_INCREMENT PRIMARY KEY,
    StationName VARCHAR(100) NOT NULL,
    Location VARCHAR(100)
);

-- Train Table
CREATE TABLE Train (
    TrainID VARCHAR(10) PRIMARY KEY,
    TrainName_EN VARCHAR(100) NOT NULL,
    TrainName_AR VARCHAR(100) NOT NULL,
    OriginStationID INT NOT NULL,
    DestinationStationID INT NOT NULL,
    ScheduleDate DATE NOT NULL,
    FOREIGN KEY (OriginStationID) REFERENCES Station(StationID),
    FOREIGN KEY (DestinationStationID) REFERENCES Station(StationID)
);

-- Schedule Table
CREATE TABLE Schedule (
    ScheduleID INT AUTO_INCREMENT PRIMARY KEY,
    TrainID VARCHAR(10) NOT NULL,
    StationID INT NOT NULL,
    StopSequence INT NOT NULL,
    ArrivalTime TIME,
    DepartureTime TIME,
    FOREIGN KEY (TrainID) REFERENCES Train(TrainID),
    FOREIGN KEY (StationID) REFERENCES Station(StationID)
);

-- Reservation Table
CREATE TABLE Reservation (
    ReservationID INT AUTO_INCREMENT PRIMARY KEY,
    TrainID VARCHAR(10) NOT NULL,
    PassengerID INT NOT NULL,
    Date DATE NOT NULL,
    SeatNumber INT UNIQUE NOT NULL,
    PaymentStatus ENUM('Paid', 'Unpaid') NOT NULL,
    Status ENUM('Confirmed', 'Temporary', 'Cancelled') DEFAULT 'Temporary',
    FOREIGN KEY (TrainID) REFERENCES Train(TrainID),
    FOREIGN KEY (PassengerID) REFERENCES Passenger(PassengerID)
);

-- Payment Table
CREATE TABLE Payment (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    ReservationID INT NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    VAT DECIMAL(10,2) DEFAULT 0.15,
    PaymentDate DATE NOT NULL,
    FOREIGN KEY (ReservationID) REFERENCES Reservation(ReservationID)
);

-- Staff Table
CREATE TABLE Staff (
    StaffID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Role ENUM('Driver', 'Engineer', 'Admin') NOT NULL,
    AssignedTrainID VARCHAR(10),
    FOREIGN KEY (AssignedTrainID) REFERENCES Train(TrainID)
);

-- Dependent Table
CREATE TABLE Dependent (
    DependentID INT AUTO_INCREMENT PRIMARY KEY,
    PassengerID INT NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Age INT NOT NULL,
    FOREIGN KEY (PassengerID) REFERENCES Passenger(PassengerID)
);

-- Waitlist Table
CREATE TABLE Waitlist (
    WaitlistID INT AUTO_INCREMENT PRIMARY KEY,
    TrainID VARCHAR(10) NOT NULL,
    PassengerID INT NOT NULL,
    Class ENUM('First', 'Second') NOT NULL,
    Priority ENUM('Loyalty', 'Other') NOT NULL,
    FOREIGN KEY (TrainID) REFERENCES Train(TrainID),
    FOREIGN KEY (PassengerID) REFERENCES Passenger(PassengerID)
);

-- Insert Data

-- Passenger Table
INSERT INTO Passenger (Name, Email, PhoneNumber, LoyaltyPoints, IdentificationDocument)
VALUES
('John Doe', 'john.doe@example.com', '1234567890', 100, 'Document1'),
('Jane Smith', 'jane.smith@example.com', '0987654321', 200, 'Document2'),
('Ali Ahmed', 'ali.ahmed@example.com', '1122334455', 150, 'Document3');

-- Station Table
INSERT INTO Station (StationName, Location)
VALUES
('Riyadh Central', 'Riyadh'),
('Dammam Terminal', 'Dammam'),
('Jeddah South', 'Jeddah');

-- Train Table
INSERT INTO Train (TrainID, TrainName_EN, TrainName_AR, OriginStationID, DestinationStationID, ScheduleDate)
VALUES
('HHR100', 'Haramain Express', 'قطار الحرمين السريع', 1, 2, '2024-12-01'),
('KTX200', 'Kingdom Express', 'قطار المملكة السريع', 1, 3, '2024-12-02');

-- Schedule Table
INSERT INTO Schedule (TrainID, StationID, StopSequence, ArrivalTime, DepartureTime)
VALUES
('HHR100', 1, 1, '08:00:00', '08:15:00'),
('HHR100', 2, 2, '10:00:00', '10:15:00'),
('KTX200', 1, 1, '09:00:00', '09:15:00'),
('KTX200', 3, 2, '11:30:00', '11:45:00');

-- Reservation Table
INSERT INTO Reservation (TrainID, PassengerID, Date, SeatNumber, PaymentStatus, Status)
VALUES
('HHR100', 1, '2024-12-01', 1, 'Paid', 'Confirmed'),
('HHR100', 2, '2024-12-01', 5, 'Unpaid', 'Temporary'),
('KTX200', 3, '2024-12-02', 8, 'Paid', 'Confirmed');

-- Payment Table
INSERT INTO Payment (ReservationID, Amount, VAT, PaymentDate)
VALUES
(1, 100.00, 15.00, '2024-12-01'),
(3, 120.00, 18.00, '2024-12-02');

-- Staff Table
INSERT INTO Staff (Name, Role, AssignedTrainID)
VALUES
('Ahmed Al-Mutairi', 'Driver', 'HHR100'),
('Sara Al-Qahtani', 'Engineer', 'HHR100'),
('Fahad Al-Zahrani', 'Admin', NULL);

-- Dependent Table
INSERT INTO Dependent (PassengerID, Name, Age)
VALUES
(1, 'Laila Doe', 6),
(2, 'Omar Smith', 8);

-- Waitlist Table
INSERT INTO Waitlist (TrainID, PassengerID, Class, Priority)
VALUES
('HHR100', 3, 'First', 'Loyalty'),
('KTX200', 2, 'Second', 'Other');
