import argparse
import sys
import os
import pathlib
import pandas as pd
from sqlalchemy import create_engine

def main(args):
    # db connection
    pg_con_string = f'postgresql://{args.pg_user}:{args.pg_pwd}@{args.pg_host}:{args.pg_port}/{args.pg_db}'
    con = create_engine(pg_con_string)

    # db tables names    
    trips_table = 'trips'
    zones_table = 'zones'

    # download files with data to ingest
    trip_data_ext = ''.join(pathlib.Path(args.trip_data_url).suffixes)
    trip_data_filename = f'trip_data{trip_data_ext}'
    zone_lookup_ext = ''.join(pathlib.Path(args.zone_lookup_url).suffixes)
    zone_lookup_filename = f'zone_lookup{zone_lookup_ext}'
    os.system(f'wget {args.trip_data_url} -O {trip_data_filename}')
    os.system(f'wget {args.zone_lookup_url} -O {zone_lookup_filename}')

    # data ingestion
    trip_data_it = pd.read_csv(trip_data_filename, iterator=True, chunksize=100000)
    print('Ingestion started(trips)')
    for chunk in trip_data_it:
        chunk.lpep_pickup_datetime = pd.to_datetime(chunk.lpep_pickup_datetime)
        chunk.lpep_dropoff_datetime = pd.to_datetime(chunk.lpep_dropoff_datetime)

        chunk.to_sql(trips_table, con=con, if_exists="append") 
        print('Chunk ingested')
    print('Ingestion completed(trips)')

    zones_it = pd.read_csv(zone_lookup_filename, iterator=True, chunksize=10) # can be done without iterator
    print('Ingestion started(zones)')
    for chunk in zones_it:
        chunk.to_sql(zones_table, con=con, if_exists="append") 
        print('Chunk ingested')
    print('Ingestion completed(zones)')


if __name__ == "__main__":
    argv = sys.argv
    args_parser = argparse.ArgumentParser()
    args_parser.add_argument("--trip_data_url", help="Trip Data Url(csv file)")
    args_parser.add_argument("--zone_lookup_url", help="Zone Lookup Url(csv file)")
    args_parser.add_argument("--pg_host", help="Postgres Host")
    args_parser.add_argument("--pg_port", help="Postgres Port")
    args_parser.add_argument("--pg_user", help="Postgres User")
    args_parser.add_argument("--pg_pwd", help="Postgres User Password")
    args_parser.add_argument("--pg_db", help="SQL Database Name")

    main(args_parser.parse_args(argv[1:]))