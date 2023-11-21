WITH source AS (
    SELECT *
    FROM {{ ref('int_video_fact_data') }} AS fact
)

SELECT
    fact.channel_fact_id,  
    SUM(fact.views) AS total_views,
    SUM(fact.subscribers) AS total_subscribers,
    SUM(fact.views) - SUM(fact.subscribers) AS viewer_without_sub
FROM source fact
LEFT JOIN (
    SELECT
        channel_dimentional_id,
        video_title,
        -- Include channel_fact_id in the subquery
    FROM {{ ref('int_video_dimentional_data') }} AS dim
) subquery
ON fact.channel_fact_id = subquery.channel_dimentional_id
GROUP BY fact.channel_fact_id
ORDER BY total_views DESC
