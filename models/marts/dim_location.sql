with 
    country as (
        select*
        from {{ ref('stg_country_region') }}
    )

    , state as (
        select *
        from {{ ref('stg_state_province') }}
    )

    , address as (
        select *
        from {{ ref('stg_address') }}
    )

    , orders as (
        select 
        distinct bill_to_address_id 
        from {{ ref('stg_ordersales') }}
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
        join address on orders.bill_to_address_id = address.address_id
        join state on address.state_province_id = state.state_province_id
        join country on state.country_region_code = country.country_region_code
    )

select * from filtered_customer_location
 
    