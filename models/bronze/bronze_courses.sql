{{ config(alias='courses') }}

select * from read_parquet('data/courses.parquet')
