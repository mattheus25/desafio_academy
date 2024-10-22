with   
    orders as(
        select *
        from {{ref('stg_ordersales')}}
    )

    , order_itens as (
        select *
        from {{ ref('stg_order_details') }}
    )


    , orderline as (
        select 
            orders.order_date
            , {{ dbt_utils.generate_surrogate_key(['orders.order_id', 'order_detail_id']) }} as sk_orderline_id
            , orders.order_id  
            , order_itens.order_detail_id 
            , orders.customer_id 
            , orders.territory_id 
            , orders.bill_to_address_id 
            , orders.creditcard_id 
            , orders.sales_person_id 
            , order_itens.order_qtd 
            , order_itens.product_id 
            , order_itens.unit_price 
            , order_itens.unit_price_discount 
        from orders 
        left join order_itens on orders.order_id = order_itens.order_id

    )

select * from orderline 

