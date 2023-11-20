-- Creating a temporary source table
WITH source AS (
    SELECT * FROM {{ source('youtube_dataset', 'youtube_data_table') }}
)

-- Selecting columns from the source table
SELECT
    comments,
    likes,
    duration,
    views,
    `channel name`, -- Enclosed in backticks to handle the space
    `date posted`,  -- Enclosed in backticks to handle the space
    subscribers,
    `video title`   -- Enclosed in backticks to handle the space
FROM source
