{{ config(materialized='table', alias='questions') }}

with source_data as (
    select
        try_cast(question_id as bigint) as question_id,
        nullif(trim(discipline_name), '') as discipline_name,
        nullif(trim(subject_name), '') as subject_name,
        cast(round(try_cast(difficulty as double), 2) as decimal(4,2)) as difficulty,
        try_cast(created_at as timestamp) as created_at
    from {{ ref('bronze_questions') }}
)

select *
from source_data

