with 

program_originals as (

    select * from {{ ref('stg_google_sheets__originals_unioned') }}

),

program_categories as (

    select * from {{ ref('dim_netflix_original_categories') }}

)

select 
    title
  , premiere_date
  , case
      when premiere_date <= current_date() then 'Current'
      when premiere_date >  current_date() then 'Upcoming'
    end as premiere_status
  , genre 
  , category
  , seasons
  , runtime
  , renewal_status
  , premiere_year
  , premiere_month
  , premiere_day
  , updated_at_utc
from program_originals
join program_categories using(category_id)
where 
  title is not null
  and lower(title) != 'awaiting release'