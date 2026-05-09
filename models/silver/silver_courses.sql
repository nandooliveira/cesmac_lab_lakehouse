{{ config(materialized='table', alias='courses') }}

with source_data as (
    select
        try_cast(course_id as bigint) as course_id,
        nullif(trim(course_name), '') as course_name,
        nullif(trim(area), '') as area,
        try_cast(created_at as timestamp) as created_at
    from {{ ref('bronze_courses') }}
)

select *
from source_data

