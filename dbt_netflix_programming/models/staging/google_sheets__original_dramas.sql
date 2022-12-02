with source as (

    select * from {{ source('google_sheets', 'stg_google_sheets__original_dramas') }}

),

standardized as (

    select
        genre

    from source

)

select * from standardized