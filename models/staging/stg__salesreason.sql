with
    salesreasons as (
        select*
        from {{ source('source', 'salesreason') }}
    )
    , salesreason as (
        select
            salesreasonid as sales_reason_id
            , name as reason_name 
            , reasontype as reason_type
        from salesreasons
    )
    
select * from salesreason