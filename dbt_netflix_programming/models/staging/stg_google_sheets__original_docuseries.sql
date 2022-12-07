
with source as (

    select * from {{ source('google_sheets', 'GOOGLE_SHEETS__ORIGINAL_DOCUSERIES') }}

),

standardized as (

    select *
    from source

)

select * from standardized