{{ config(materialized='view') }}

with 
    source_address as (
        select *
        from {{ source('source', 'address') }} 
    )

    ,address as (
    select 
        cast(addressid as int) as address_id
        ,cast(stateprovinceid as int) as state_province_id 
        ,city
        ,coalesce(addressline1, '') || ' ' || coalesce(addressline2, '') AS full_address
        ,spatiallocation as location_id
    from {{ source('source', 'address') }}
    )

select * from address
