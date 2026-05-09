{{ config(materialized='table', alias='matriculas_mensais') }}

with source_data as (
    select
        date_trunc('month', e.enrolled_at) as mes,
        count(distinct e.user_id) as matriculas
    from {{ ref('silver_enrollments') }} as e
    group by 1
)
select *
from source_data
order by mes
