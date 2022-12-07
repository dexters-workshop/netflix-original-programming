
with source as (

    select * from {{ source('google_sheets', 'GOOGLE_SHEETS__ORIGINAL_DRAMAS') }}

),

standardized as (

    select * from source

)

select * from standardized