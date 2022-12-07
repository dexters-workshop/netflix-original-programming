
with source as (

    select * from {{ source('google_sheets', 'GOOGLE_SHEETS__ORIGINAL_DRAMAS') }}

),

standardized as (

    select 
        -- keep only title which exists between astericks (not perfect solution BUT good enough for now)
        regexp_substr(title, '([^*]+)') as title
      , genre
      , regexp_replace(premiere, '\\[[[:alnum:]]+\\]') as premiere_date
      , split_part(premiere, ' ', 1) as premiere_month
      , seasons
      , runtime
      , regexp_replace(status, '\\[[[:alnum:]]+\\]') as status
      , updated_at
    from source

)

select * from standardized