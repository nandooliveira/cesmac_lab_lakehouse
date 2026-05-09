{{ config(materialized='table', alias='enrollments') }}

with source_data as (
    select
        try_cast(enrollment_id as bigint) as enrollment_id,
        try_cast(user_id as bigint) as user_id,
        try_cast(course_id as bigint) as course_id,
        try_cast(enrolled_at as timestamp) as enrolled_at,
        lower(nullif(trim(status), '')) as status
    from {{ ref('bronze_enrollments') }}
)

select *
from source_data

