DROP DATABASE IF EXISTS CarDealership;
CREATE DATABASE CarDealership;
USE CarDealership;

-- Table 1) dealerships
CREATE TABLE dealerships 
(
    dealership_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(50),
    phone VARCHAR(12)
);

-- Table 2) vehicles
CREATE TABLE vehicles 
(
    vin INT PRIMARY KEY,
    year INT NOT NULL,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    vehicleType VARCHAR(50),
    color VARCHAR(20),
    odometer INT,
    price DOUBLE NOT NULL,
    sold BOOLEAN DEFAULT FALSE
);

-- Table 3) inventory
CREATE TABLE inventory 
(
    dealership_id INT,
    vin INT,
    PRIMARY KEY (dealership_id, vin),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
    FOREIGN KEY (vin) REFERENCES vehicles(vin) 
);

-- Table 4) sales_contracts
CREATE TABLE sales_contracts 
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    vin INT,
    salesTaxAmount DOUBLE NOT NULL,
    recordingFee DOUBLE NOT NULL,
    processingFee DOUBLE NOT NULL,
    financeOption BOOLEAN,
    FOREIGN KEY (vin) REFERENCES vehicles(vin)
);

-- Table 5) lease_contracts
CREATE TABLE lease_contracts 
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    vin INT,
    expectedEndingValue DOUBLE NOT NULL,
    leaseFee DOUBLE NOT NULL,
    FOREIGN KEY (vin) REFERENCES vehicles(vin) ON DELETE CASCADE
);

-- Dealership sample data
INSERT INTO dealerships (name, address, phone) 
VALUES 
('Toyota 51', '112 Green Drive', '123-4565'),
('Bowie Motor Co', '7311 Charlotte Street', '321-5432'),
('Rohrich Cadillac', '4341 Alton Ave', '420-6969');

-- Vehicles sample data
INSERT INTO vehicles (vin, year, make, model, vehicleType, color, odometer, price, sold) 
VALUES
(1121, 2006, 'Lexus', 'IS250', 'Sedan', 'Red', 147000, 8000, FALSE),
(1654, 2017, 'Cadillac', 'XT5', 'SUV', 'White', 84000, 21000, FALSE),
(1985, 2011, 'Cadillac', 'Escalade', 'SUV', 'Black', 139000, 15000, TRUE);

-- Inventory sample data
INSERT INTO inventory (dealership_id, vin) 
VALUES 
(1, 1121), 
(2, 1654), 
(3, 1985);

-- Sales_Contracts sample data
INSERT INTO sales_contracts (vin, salesTaxAmount, recordingFee, processingFee, financeOption) 
VALUES 
(1985, 1500, 150, 300, TRUE);

-- Lease_Contracts sample data 
INSERT INTO lease_contracts (vin, expectedEndingValue, leaseFee) 
VALUES 
(1121, 5000, 350);