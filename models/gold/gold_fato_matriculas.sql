{{ config(materialized='table', alias='matriculas') }}

SELECT
    e.enrollment_id AS enrollment_id,
    dim_courses.course_id
FROM {{ ref('silver_enrollments') }} AS e
JOIN {{ ref('gold_dim_cursos') }} AS dim_courses
    ON e.course_id = dim_courses.course_id
