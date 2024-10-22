{{ config(materialized='view') }}

with 
    countryregion as (
        select *
        from {{ source('source', 'countryregion') }} 
    )

    , country as (
        select 
            countryregioncode as country_region_code
            , name as country_name
        from {{ source('source', 'countryregion') }}
    )
select * from country 