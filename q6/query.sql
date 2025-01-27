SELECT dz."Zone", MAX(t."tip_amount") AS tip_amount
FROM trips AS t
    JOIN zones AS dz ON t."DOLocationID" = dz."LocationID"
WHERE t."PULocationID"=74
    AND t."lpep_pickup_datetime" >= '2019-10-01' 
    AND t."lpep_pickup_datetime" < '2019-11-01'
GROUP BY dz."Zone"
ORDER BY 2 DESC
LIMIT 1;