with 
    sales_header_reason as (
        select *
        from {{ source('source', 'salesorderheadersalesreason') }}
    )

    , sales_header_reason_id as (
        select
            salesorderid as sales_order_id
            , salesreasonid as sales_order_reason_id
        from sales_header_reason
    )

    select * from sales_header_reason_id