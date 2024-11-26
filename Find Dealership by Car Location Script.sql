-- SQL Query 4)
SELECT d.* 
FROM dealerships d
JOIN inventory i ON d.dealership_id = i.dealership_id
WHERE i.vin = 1121;