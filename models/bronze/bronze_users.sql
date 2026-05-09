{{ config(alias='users') }}

select * from read_parquet('data/users.parquet')
