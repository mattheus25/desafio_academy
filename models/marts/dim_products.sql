with 
    products as (
        select *
        from {{ ref('stg_products') }}
    )

    , product as (
        select 
            product_id
            ,product_name
        from products
    )
    select * from product 