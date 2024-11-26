-- SQL Query 5)
SELECT DISTINCT d.* 
FROM dealerships d
JOIN inventory i ON d.dealership_id = i.dealership_id
JOIN vehicles v ON i.vin = v.vin
WHERE v.color = 'White'
  AND v.make = 'Cadillac'
  AND v.model = 'XT5';