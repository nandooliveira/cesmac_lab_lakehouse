{{ config(alias='answers') }}

select * from read_parquet('data/answers.parquet')
