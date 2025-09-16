-- Trip Count over the months and years with previous year metrics
WITH monthly_metrics AS (
  SELECT 
    EXTRACT(MONTH FROM trip_start_timestamp) AS month_number,
    EXTRACT(YEAR FROM trip_start_timestamp) AS year,
    
    -- Core metrics
    COUNT(unique_key) AS trip_count,
 
    SUM(fare) AS total_trip_fare,
    AVG(fare) AS avg_fare_per_trip,
    COUNT(unique_key) / COUNT(DISTINCT DATE(trip_start_timestamp)) AS avg_daily_trips,
    AVG(trip_miles) AS avg_trip_miles,
    AVG(trip_seconds)/60 AS avg_trip_minutes
  FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`
  WHERE fare IS NOT NULL AND fare > 0
  GROUP BY month_number, year
)

SELECT
  *,
  LAG(trip_count) OVER (PARTITION BY month_number ORDER BY year) AS prev_year_trip_count,
  LAG(total_trip_fare) OVER (PARTITION BY month_number ORDER BY year) AS prev_year_total_fare,
  LAG(avg_fare_per_trip) OVER (PARTITION BY month_number ORDER BY year) AS prev_year_avg_fare,
  LAG(avg_daily_trips) OVER (PARTITION BY month_number ORDER BY year) AS prev_year_avg_daily_trips,
  LAG(avg_trip_miles) OVER (PARTITION BY month_number ORDER BY year) AS prev_year_avg_trip_miles,
  LAG(avg_trip_minutes) OVER (PARTITION BY month_number ORDER BY year) AS prev_year_avg_trip_minutes
FROM monthly_metrics
ORDER BY year DESC, month_number DESC;
