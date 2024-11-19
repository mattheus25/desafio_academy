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
            distinct customers.customer_id as customer_id
            , full_name
            , country.country_name as country_name 
            , state.state_name as state_name 
            , address.full_address as full_address
        from customers
        left join person on customers.person_id = person.businessentityid
        left join orders on customers.customer_id = orders.customer_id
        left join address on orders.bill_to_address_id = address.address_id
        left join state on address.state_province_id = state.state_province_id
        left join country on state.country_region_code = country.country_region_code
        where full_name is not null
    )

select * from customer 
