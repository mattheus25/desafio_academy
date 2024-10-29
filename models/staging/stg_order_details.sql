

with
    order_details as (
        select*
        from {{ source('source', 'salesorderdetail') }}
    )
    ,order_detail as (
        select
            salesorderid as order_id
            ,salesorderdetailid as order_detail_id
            ,orderqty as order_qtd
            ,productid as product_id
            ,unitprice as unit_price
            ,unitpricediscount as unit_price_discount
        from order_details
    )
    
select * from order_detail

