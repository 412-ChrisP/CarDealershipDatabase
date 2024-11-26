DROP DATABASE IF EXISTS CarDealership;
CREATE DATABASE CarDealership;
USE CarDealership;

-- Table 1: dealerships
CREATE TABLE dealerships (
    dealership_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(50),
    phone VARCHAR(12)
);

-- Table 2: vehicles
CREATE TABLE vehicles (
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

