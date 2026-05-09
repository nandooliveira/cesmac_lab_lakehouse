{{ config(materialized='table') }}

with source_data as (
    select
        try_cast(answer_id as bigint) as answer_id,
        try_cast(user_id as bigint) as user_id,
        try_cast(question_id as bigint) as question_id,
        is_correct,
        try_cast(answered_at as timestamp) as answered_at,
        lower(nullif(trim(source), '')) as source
    from {{ ref('bronze_answers') }}
)

select *
from source_data

