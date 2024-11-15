with 
    customers as (
        select *
        from {{ ref('stg__customers') }}
    )

    , person as (
        select *
        from {{ ref('stg__person') }}
    )
    
    , orders as (
        select *
        from {{ ref('stg__ordersales') }}
    )

    , order_itens as (
        select *
        from {{ ref('stg__order_details') }}
    )

    , address as (
        select *
        from {{ ref('stg__address') }}
    )

    , state as (
        select *
        from {{ ref('stg__state_province') }}
    )

    , country as (
        select*
        from {{ ref('stg__country_region') }}
    )

    , customer as (
        select
            customers.customer_id as customer_id
            , sum((order_qtd * unit_price) * (1 - unit_price_discount)) as cltv
            , min(order_date) as first_purchase
            , max(order_date) as last_purchase
        from customers
        join person on customers.person_id = person.businessentityid
        join orders on customers.customer_id = orders.customer_id
        join address on orders.bill_to_address_id = address.address_id
        join state on address.state_province_id = state.state_province_id
        join country on state.country_region_code = country.country_region_code
        join order_itens on orders.order_id = order_itens.order_id
        group by customers.customer_id

    )

    , customer_details as (
        select 
            customer_id 
            , round(cltv,2) as cltv
            , first_purchase
            , last_purchase
            , round(datediff('day', first_purchase, last_purchase) / 30.44, 1) as customer_lifetime_months
        from customer
    )
    select * from customer_details
