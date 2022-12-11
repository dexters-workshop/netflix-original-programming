
with 

comedies as (
    select * from {{ ref('base_google_sheets__original_comedies') }}
),

docuseries as (
    select * from {{ ref('base_google_sheets__original_docuseries') }}
),

dramas as (
    select * from {{ ref('base_google_sheets__original_dramas') }}
),

originals_unioned as (
    select * from comedies
    union
    select * from docuseries
    union
    select * from dramas
),

standardized as (
    
    select
        
          -- find/remove everything before/after astericks (including astericks)
          regexp_substr(title, '([^*]+)') as title
        , genre
        , category_id
    
          -- find/remove pattern opened bracket THEN any number(s) THEN closed bracket
        , regexp_replace(premiere, '\\[[[:digit:]]+\\]', '') as premiere
        , seasons
        , runtime
        , status
    
        -- originated from airbyte at time of ingestion
        , updated_at 
    
    from originals_unioned
),

premiere_date_cleanup as (
    select

        -- premiere date was ALL jacked up so this is a v1 method for cleaning/casting (refactor later)
        split_part(regexp_replace(premiere, ',', ''), ' ', 1) as premiere_month_name
        , case 
            when split_part(regexp_replace(premiere, ',', ''), ' ', 1) = 'January' then '01'
            when split_part(regexp_replace(premiere, ',', ''), ' ', 1) = 'February' then '02'
            when split_part(regexp_replace(premiere, ',', ''), ' ', 1) = 'March' then '03'
            when split_part(regexp_replace(premiere, ',', ''), ' ', 1) = 'April'     then '04'
            when split_part(regexp_replace(premiere, ',', ''), ' ', 1) = 'May'       then '05'
            when split_part(regexp_replace(premiere, ',', ''), ' ', 1) = 'June'      then '06'
            when split_part(regexp_replace(premiere, ',', ''), ' ', 1) = 'July'      then '07'
            when split_part(regexp_replace(premiere, ',', ''), ' ', 1) = 'August'    then '08'
            when split_part(regexp_replace(premiere, ',', ''), ' ', 1) = 'September' then '09'
            when split_part(regexp_replace(premiere, ',', ''), ' ', 1) = 'October'   then '10'
            when split_part(regexp_replace(premiere, ',', ''), ' ', 1) = 'November'  then '11'
            when split_part(regexp_replace(premiere, ',', ''), ' ', 1) = 'December'  then '12'
          end as premiere_month
        , split_part(regexp_replace(premiere, ',', ''), ' ', 2) as premiere_day
        , split_part(regexp_replace(premiere, ',', ''), ' ', 3) as premiere_year
        , standardized.*
    from standardized
)

select 
    title
   , genre
   , category_id
   , seasons
   , runtime
   , status
   , date(premiere_year || '-' || premiere_month || '-' || premiere_day) as premiere_date
   , premiere_year
   , premiere_month
   , premiere_day
   , updated_at
from premiere_date_cleanup