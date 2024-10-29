with 
    sales_reason_id as (
        select *
        from {{ ref('stg_sales_reason_id') }}
    )

    , sales_reason as (
        select * 
        from {{ ref('stg_salesreason') }}
    )

    , reason as (
        select 
            sales_reason_id.sales_order_id 
            , sales_reason_id.sales_order_reason_id
            , sales_reason.reason_name
            , sales_reason.reason_type
        from sales_reason
        join sales_reason_id on sales_reason_id.sales_order_reason_id = sales_reason.sales_reason_id
    )

    select * from reason 