with   
    orders as(
        select *
        from {{ref('stg_ordersales')}}
    )

    , order_itens as (
        select *
        from {{ ref('stg_order_details') }}
    )

    , card as (
        select *
        from {{ ref('stg_creditcard') }}
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
            , card.card_type 
            , orders.sales_person_id 
            , order_itens.order_qtd 
            , order_itens.product_id 
            , order_itens.unit_price 
            , order_itens.unit_price_discount
            , order_itens.unit_price * (1 - order_itens.unit_price_discount) * order_itens.order_qtd as net_amount
        from orders 
        left join order_itens on orders.order_id = order_itens.order_id
        left join card on orders.creditcard_id = card.creditcard_id 
    )

select * from orderline 

