-- tests/test_fact_orderline_gross_revenue_2011.sql

with 
    total_revenue_2011 as (
        select *
    from {{ ref('fact__orderline') }}
    
)

, query_test as (
    select 
        round(sum(unit_price * order_qtd),2) as gross_revenue
    from total_revenue_2011
    where order_date >= '2011-01-01' and order_date <'2012-01-01'
)

, test as (
    select 
        *
    from query_test  
    where gross_revenue != 12646112.16
)

select * from test