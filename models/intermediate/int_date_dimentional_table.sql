with source as (

    select * from {{ ref('stg_youtube_data') }}

)

SELECT
    channel_name as date_dimentional_id,
    date_posted,

    REPLACE(REPLACE(REPLACE(REPLACE(duration, 'PT', ''), 'M', ':'), 'S', ':'), 'H', ':') AS cleaned_duration

       
 from source




