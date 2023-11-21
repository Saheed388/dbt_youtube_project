with source as (

    select * from {{ ref('stg_youtube_data') }}

)

select
     `channel_name` as channel_fact_id,
        comments,
        likes,
        views,
        subscribers
 from source
