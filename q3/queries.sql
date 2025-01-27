/*
    Assumes the data is cleaned and 
    no entry violates invariant dropoff_datetime > pickup_datetime 
*/

SELECT COUNT(*) AS "UP TO 1 MILE" 
FROM trips 
WHERE lpep_pickup_datetime >= '2019-10-01' 
	AND lpep_pickup_datetime < '2019-11-01'
	AND lpep_dropoff_datetime < '2019-11-01'
	AND trip_distance <= 1.0;

SELECT COUNT(*) AS "1(excl.) to 3 MILES" 
FROM trips 
WHERE lpep_pickup_datetime >= '2019-10-01' 
	AND lpep_pickup_datetime < '2019-11-01'
	AND lpep_dropoff_datetime < '2019-11-01'
	AND trip_distance > 1.0 AND trip_distance <= 3.0;

SELECT COUNT(*) AS "3(excl.) to 7 MILES" 
FROM trips 
WHERE lpep_pickup_datetime >= '2019-10-01' 
	AND lpep_pickup_datetime < '2019-11-01'
	AND lpep_dropoff_datetime < '2019-11-01'
	AND trip_distance > 3.0 AND trip_distance <= 7.0;

SELECT COUNT(*) AS "7(excl.) to 10 MILES" 
FROM trips 
WHERE lpep_pickup_datetime >= '2019-10-01' 
	AND lpep_pickup_datetime < '2019-11-01'
	AND lpep_dropoff_datetime < '2019-11-01'
	AND trip_distance > 7.0 AND trip_distance <= 10.0;

SELECT COUNT(*) AS "FROM 10 MILES(excl.)"
FROM trips 
WHERE lpep_pickup_datetime >= '2019-10-01' 
	AND lpep_pickup_datetime < '2019-11-01'
	AND lpep_dropoff_datetime < '2019-11-01'
	AND trip_distance > 10.0;




