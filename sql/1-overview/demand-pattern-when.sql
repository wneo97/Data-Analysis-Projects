-- Demand patterns by location, day, and hour
SELECT 
  pickup_community_area,
  
  -- Day of week (1=Sunday … 7=Saturday), numeric for correct order
  CAST(EXTRACT(DAYOFWEEK FROM trip_start_timestamp) AS INT64) AS day_of_week,
  
  -- Hour of day (0–23), numeric
  CAST(EXTRACT(HOUR FROM trip_start_timestamp) AS INT64) AS hour_of_day,
  
  -- Month (1–12), numeric
  CAST(EXTRACT(MONTH FROM trip_start_timestamp) AS INT64) AS month_number,
  
  -- Year, numeric
  CAST(EXTRACT(YEAR FROM trip_start_timestamp) AS INT64) AS year,
  
  COUNT(*) AS trip_count
FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`
WHERE fare > 0 
GROUP BY pickup_community_area, day_of_week, hour_of_day, month_number, year
