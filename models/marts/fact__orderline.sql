with   
    orders as(
        select *
        from {{ref('stg__ordersales')}}
    )

    , order_itens as (
        select *
        from {{ ref('stg__order_details') }}
    )

    , card as (
        select *
        from {{ ref('stg__creditcard') }}
    )


    , orderline as (
        select 
            orders.order_date
            , orders.order_id  
            , order_itens.order_detail_id 
            , orders.customer_id 
            , orders.bill_to_address_id 
            , card.card_type  
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

