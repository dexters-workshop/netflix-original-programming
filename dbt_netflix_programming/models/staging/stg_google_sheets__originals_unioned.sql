
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

    select *
    --     -- keep only title which exists between astericks (not perfect solution BUT good enough for now)
    --     regexp_substr(title, '([^*]+)') as title
    --   , genre
    --   , regexp_replace(premiere, '\\[[[:alnum:]]+\\]') as premiere_date
    --   , split_part(premiere, ' ', 1) as premiere_month
    --   , seasons
    --   , runtime
    --   , regexp_replace(status, '\\[[[:alnum:]]+\\]') as status
    --   , updated_at
    from originals_unioned

)

select * from standardized