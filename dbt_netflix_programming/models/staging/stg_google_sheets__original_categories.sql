{{
  config(
    materialized='table'
  )
}}



with source as (

    select * from {{ source('google_sheets', 'GOOGLE_SHEETS__ORIGINAL_CATEGORIES') }}

),

get_category_id_from_category as (
    select 
          regexp_replace(category, '[^0-9.]', '') as category_id
        , regexp_replace(category, '[^A-Za-z]', '') as category
        , updated_at
    from source
),

data_prepped as (
    select
        case when category_id = '66.16.26.3' then '6' 
           else category_id
        end as category_id
      , case when category like '%Docuseries%' then 'Docuseries'
             else category
        end as category
        , updated_at
    from get_category_id_from_category
)

select
      cast(substr(category_id, 1, 2) as int) as category_id
    , category
    , date(updated_at) as updated_at
from data_prepped
where category_id in ('1', '2', '6')