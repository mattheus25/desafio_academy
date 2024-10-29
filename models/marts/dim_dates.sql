
with 
    dates as (
        select * 
        from {{ ref('stg_dim_dates') }}
    )

select * from dates 