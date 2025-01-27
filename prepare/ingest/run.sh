#!/bin/bash

docker build -t hw1_ingest .
docker run -it --rm hw1_ingest --pg_host 172.29.64.1 --pg_port 5432\
 --pg_user root --pg_pwd root --pg_db taxi_db \
 --trip_data_url https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green/green_tripdata_2019-10.csv.gz \
 --zone_lookup_url  https://github.com/DataTalksClub/nyc-tlc-data/releases/download/misc/taxi_zone_lookup.csv