WITH company_monthly AS (
  SELECT 
    company,
    EXTRACT(MONTH FROM trip_start_timestamp) AS month_number,
    EXTRACT(YEAR FROM trip_start_timestamp) AS year,

    COUNT(taxi_id) AS total_trips,
    COUNT(DISTINCT taxi_id) AS fleet_count,             
    SUM(fare) AS total_fare,                            
    AVG(fare) AS avg_fare,
    AVG(trip_miles) AS avg_trip_miles,
    AVG(fare)/NULLIF(AVG(trip_miles),0) AS avg_fare_per_mile,
    AVG(trip_seconds) AS avg_trip_duration
  FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips` 
  WHERE 
      company IS NOT NULL
    AND pickup_community_area IS NOT NULL
    AND trip_miles > 0
    AND fare > 0
  GROUP BY company, EXTRACT(YEAR FROM trip_start_timestamp), EXTRACT(MONTH FROM trip_start_timestamp)
),
pickup_counts AS (
  SELECT
    company,
    EXTRACT(YEAR FROM trip_start_timestamp) AS year,
    EXTRACT(MONTH FROM trip_start_timestamp) AS month_number,
    pickup_community_area,
    COUNT(*) AS pickup_count
  FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`
  WHERE company IS NOT NULL
    AND pickup_community_area IS NOT NULL
  GROUP BY company, year, month_number, pickup_community_area
),
pickup_popularity AS (
  SELECT
    *,
    ROW_NUMBER() OVER (
      PARTITION BY company, year, month_number
      ORDER BY pickup_count DESC
    ) AS popularity_rank
  FROM pickup_counts
),
top_pickup_areas AS (
  SELECT 
    company,
    year,
    month_number,
    pickup_community_area AS most_popular_pickup_area,
    pickup_count AS pickup_count_of_most_popular_pickup_area
  FROM pickup_popularity 
  WHERE popularity_rank = 1
)

SELECT 
  cm.company,
  cm.year,
  cm.month_number,
  cm.total_trips,
  cm.fleet_count,                                        -- ✅ fleet count
  cm.total_fare,                                         -- ✅ total fare
  cm.avg_fare,
  cm.avg_trip_miles,
  cm.avg_fare_per_mile,
  cm.avg_trip_duration,
  tpa.most_popular_pickup_area,
  tpa.pickup_count_of_most_popular_pickup_area,
  tpa.pickup_count_of_most_popular_pickup_area / cm.total_trips AS pickup_concentration
FROM company_monthly cm
LEFT JOIN top_pickup_areas tpa 
  ON cm.company = tpa.company 
 AND cm.year = tpa.year 
 AND cm.month_number = tpa.month_number
ORDER BY cm.year DESC, cm.month_number DESC, cm.total_trips DESC;
