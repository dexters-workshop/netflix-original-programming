
with program_categories as (

    select * from {{ ref('stg_google_sheets__original_categories') }}

)

-- limit to drama, comedy, docuseries
select
    category_id
    , category
    , updated_at_utc
from program_categories
where category_id in (1, 2, 3)  