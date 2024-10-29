

with
    orders as (
        select*
        from {{ source('source', 'salesorderheader') }}
    )
    ,ordersales as (
        select
            to_date(orderdate) as order_date
            ,salesorderid as order_id
            ,customerid as customer_id
            ,territoryid as territory_id
            ,shiptoaddressid as ship_address_id
            ,billtoaddressid as bill_to_address_id
            ,creditcardid as creditcard_id
            ,salespersonid as sales_person_id
        from orders
    )
    
select * from ordersales

