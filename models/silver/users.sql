{{ config(materialized='table') }}

with source_data as (
    select
        try_cast(user_id as bigint) as user_id,
        nullif(trim(user_name), '') as user_name,
        lower(nullif(trim(email), '')) as email,
        try_cast(created_at as timestamp) as created_at,
        try_cast(updated_at as timestamp) as updated_at,
        lower(nullif(trim(status), '')) as status
    from {{ ref('bronze_users') }}
)

select *
from source_data

