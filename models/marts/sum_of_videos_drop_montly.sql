WITH source AS (
    SELECT *
    FROM {{ ref('int_video_dimentional_data') }} AS fact
)

SELECT
    fact.channel_dimentional_id,
    COUNT(fact.video_title) AS video_count,
    EXTRACT(MONTH FROM subquery.date_posted) AS month
FROM source fact
LEFT JOIN (
    SELECT
        date_dimentional_id,
        date_posted
    FROM {{ ref('int_date_dimentional_table') }} AS dim
) subquery
ON fact.channel_dimentional_id = subquery.date_dimentional_id
GROUP BY
    fact.channel_dimentional_id,
    month
ORDER BY
    video_count DESC
