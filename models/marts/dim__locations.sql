with 
    country as (
        select*
        from {{ ref('stg__country_region') }}
    )

    , state as (
        select *
        from {{ ref('stg__state_province') }}
    )

    , address as (
        select *
        from {{ ref('stg__address') }}
    )

    , orders as (
        select 
        distinct bill_to_address_id 
        from {{ ref('stg__ordersales') }}
    )

    , filtered_customer_location as (
        select
            address.location_id
            , address.address_id
            , orders.bill_to_address_id
            , country.country_name
            , country.country_region_code
            , state_name
            , address.city
            , address.full_address
        from orders 
        left join address on orders.bill_to_address_id = address.address_id
        left join state on address.state_province_id = state.state_province_id
        left join country on state.country_region_code = country.country_region_code
    )

select * from filtered_customer_location

