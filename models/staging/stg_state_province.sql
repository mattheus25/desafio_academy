{{ config(materialized='view') }}

with
    stateprovince as (
        select*
        from {{ source('source', 'stateprovince') }}
    )
    ,state as (
        select
            stateprovinceid as state_province_id
            ,stateprovincecode as state_province_code
            ,countryregioncode as country_region_code
            ,name as state_name 
            ,territoryid as territory_id
        from stateprovince
    )
    
select * from state