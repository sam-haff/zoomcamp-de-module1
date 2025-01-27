SELECT lpep_pickup_datetime::date AS pickup_date, MAX(trip_distance) AS max_trip_distance
FROM trips
GROUP BY lpep_pickup_datetime::date
ORDER BY 2 DESC
LIMIT 1;
