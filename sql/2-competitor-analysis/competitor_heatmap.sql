SELECT
  company,
  EXTRACT(MONTH FROM trip_start_timestamp) AS month_number,
  EXTRACT(YEAR FROM trip_start_timestamp) AS year,
  CONCAT(CAST(ST_Y(ST_GEOGFROMTEXT(pickup_location)) AS STRING), ",", 
         CAST(ST_X(ST_GEOGFROMTEXT(pickup_location)) AS STRING)) AS pickup_coordinates,
  pickup_community_area,
  COUNT(*) AS trips_count
FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`
WHERE pickup_location IS NOT NULL
  AND company IS NOT NULL
GROUP BY company, month_number, year, pickup_coordinates, pickup_community_area
ORDER BY company, year DESC, month_number DESC;
