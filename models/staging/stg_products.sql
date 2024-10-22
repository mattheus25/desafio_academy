{{ config(materialized='view') }}

with
    products as (
        select*
        FROM {{ source('source', 'product') }}
    )
    ,product as (
        select
            productid as product_id
            ,name as product_name            
        from products
    )
    
select * from product