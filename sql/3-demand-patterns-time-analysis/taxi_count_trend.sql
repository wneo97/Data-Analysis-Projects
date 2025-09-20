-- Trip Count over the months and years with previous year metrics
WITH monthly_metrics AS (
  SELECT 
    EXTRACT(MONTH FROM trip_start_timestamp) AS month_number,
    EXTRACT(YEAR FROM trip_start_timestamp) AS year,
    
    -- Core metrics
    COUNT(DISTINCT taxi_id) AS taxi_count,
  FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`
  WHERE fare IS NOT NULL AND fare > 0
  GROUP BY month_number, year
)

SELECT
  *,
  LAG(taxi_count) OVER (PARTITION BY month_number ORDER BY year) AS prev_year_taxi_count,
FROM monthly_metrics
ORDER BY year DESC, month_number DESC;
