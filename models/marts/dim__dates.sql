with 
    dates as (
        select * 
        from {{ ref('stg__dim_dates') }}
    )
select * from dates 