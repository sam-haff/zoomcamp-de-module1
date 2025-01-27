SELECT pu."Zone", SUM(t."total_amount") AS overall_amount
FROM trips AS t
    JOIN zones AS pu ON t."PULocationID" = pu."LocationID"
WHERE t."lpep_pickup_datetime"::date = '2019-10-18'
GROUP BY pu."Zone"
HAVING SUM(t."total_amount") > 13000
ORDER BY 2 DESC;