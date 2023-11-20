WITH int_video_fact_data AS (
    SELECT
        "channel name", -- Assuming this is the correct identifier quoting for your database
        comments,
        likes,
        views,
        subscribers
    FROM {{ ref("stg_youtube_data") }}
)

SELECT *
FROM int_video_fact_data;

