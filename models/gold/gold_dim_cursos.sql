{{ config(materialized='table', alias='dim_cursos') }}

SELECT
    course_id,
    course_name
FROM {{ ref('silver_courses') }}
ORDER BY course_id
