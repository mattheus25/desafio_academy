

with
    customers as (
        select*
        from {{ source('source', 'customer') }}
    )
    
    , customer as (
        select
             customerid as customer_id
            , personid as person_id
            , territoryid as territory_id
        from customers
    )
    
select * from customer




