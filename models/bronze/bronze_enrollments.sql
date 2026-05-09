{{ config(alias='enrollments') }}

select * from read_parquet('data/enrollments.parquet')
