WITH trips_by_area_hour AS (
  SELECT
    pickup_community_area AS area,
    EXTRACT(YEAR FROM trip_start_timestamp) AS year,
    EXTRACT(MONTH FROM trip_start_timestamp) AS month,
    EXTRACT(HOUR FROM trip_start_timestamp) AS hour_of_day,
    COUNT(*) AS total_trips,
    COUNT(DISTINCT taxi_id) AS unique_taxi_count,
    ROUND(COUNT(*) / COUNT(DISTINCT taxi_id), 2) AS trips_per_taxi
  FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`
  WHERE pickup_community_area IN (8, 32, 76)  -- top areas
    AND fare > 0
    AND trip_miles > 0
  GROUP BY area, year, month, hour_of_day
)
SELECT
  *,
  CASE
    WHEN trips_per_taxi >= 3 THEN 'high_demand_underserved'  -- example threshold
    ELSE 'normal'
  END AS demand_flag
FROM trips_by_area_hour
ORDER BY area, year, month, hour_of_day;
