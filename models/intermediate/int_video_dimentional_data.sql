with source as (

    select * from {{ ref('stg_youtube_data') }}

)

select
     `channel_name` as channel_dimentional_id,
        `video_title` as video_title
       
 from source
