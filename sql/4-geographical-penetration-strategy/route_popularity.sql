SELECT
  EXTRACT(YEAR FROM trip_start_timestamp) AS year,
  EXTRACT(MONTH FROM trip_start_timestamp) AS month_number,
  pickup_community_area,
  dropoff_community_area,
  COUNT(*) AS trips_count,
  AVG(fare) AS avg_fare
FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`
WHERE pickup_community_area IS NOT NULL
  AND dropoff_community_area IS NOT NULL
  AND fare IS NOT NULL
  AND fare > 0
GROUP BY year, month_number, pickup_community_area, dropoff_community_area
ORDER BY year DESC, month_number DESC, trips_count DESC
