
with source as (

    select * from {{ source('google_sheets', 'GOOGLE_SHEETS__ORIGINAL_COMEDIES') }}

),

standardized as (

    -- saving data standardization/cleaning for after union (to stay DRY)
    select 
        title
      , genre
      , premiere
      , seasons
      , runtime
      , status
      --, date(updated_at) as updated_at
      , _airbyte_emitted_at as updated_at
    from source

)

select * from standardized