


with
    salespersons as (
        select*
        FROM {{ source('source', 'salesperson') }}
    )
    ,salesperson as (
        select
            businessentityid as sales_person_id 
            ,territoryid as territory_id         
        from salespersons
    )
    
select * from salesperson


