{{ config(alias='questions') }}

select * from read_parquet('data/questions.parquet')
