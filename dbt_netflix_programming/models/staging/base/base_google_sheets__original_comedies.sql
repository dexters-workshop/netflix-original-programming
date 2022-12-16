
with source as (

    select * from {{ source('google_sheets', 'GOOGLE_SHEETS__ORIGINAL_COMEDIES') }}

),

standardized as (

    -- saving data standardization/cleaning for after union (to stay DRY)
    select 
        title
      , 2 as category_id
      , genre
      , premiere
      , seasons
      , runtime
      , status
      , _airbyte_emitted_at as updated_at -- switched to airbyte created column instead of google sheet created column
    from source

)

select * from standardized