SELECT 
	EXTRACT(MONTH FROM trip_start_timestamp) AS month_number,
    EXTRACT(YEAR FROM trip_start_timestamp) AS year,

    CASE 
        WHEN fare BETWEEN 0 AND 5 THEN '$0-5'
        WHEN fare BETWEEN 5.01 AND 10 THEN '$6-10'
        WHEN fare BETWEEN 10.01 AND 15 THEN '$11-15'
        WHEN fare BETWEEN 15.01 AND 25 THEN '$16-25'
        WHEN fare BETWEEN 25.01 AND 40 THEN '$26-40'
        WHEN fare > 40 THEN '$40+'
        ELSE 'Other'
    END AS fare_bin,
    COUNT(*) as trip_count,
    ROUND(AVG(fare), 2) as avg_fare_in_bin,
    ROUND(SUM(fare), 2) as total_revenue_in_bin,
    CASE 
        WHEN fare BETWEEN 0 AND 5 THEN 1
        WHEN fare BETWEEN 5.01 AND 10 THEN 2
        WHEN fare BETWEEN 10.01 AND 15 THEN 3
        WHEN fare BETWEEN 15.01 AND 25 THEN 4
        WHEN fare BETWEEN 25.01 AND 40 THEN 5
        WHEN fare > 40 THEN 6
        ELSE 7
    END AS fare_bin_rank
FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`
WHERE fare > 0 AND fare < 200  
GROUP BY month_number, year, fare_bin, fare_bin_rank
ORDER BY fare_bin_rank;
