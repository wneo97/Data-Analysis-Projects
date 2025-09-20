
SELECT 
  EXTRACT(YEAR FROM trip_start_timestamp) AS year,
  CASE 
    WHEN trip_miles < 3 THEN 'Short (<3 mi)'
    WHEN trip_miles BETWEEN 3 AND 8 THEN 'Medium (3-8 mi)'
    ELSE 'Long (8+ mi)'
  END AS trip_type,
  fare, 
  ROUND(trip_miles, 0) AS trip_miles
FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`
WHERE trip_miles > 0 
  AND fare > 0 
  AND fare < 1000 
  AND trip_miles < 25
  AND EXTRACT(YEAR FROM trip_start_timestamp) = 2023;
