-- tests/test_fact_orderline_gross_revenue_2011.sql

WITH total_revenue_2011 AS (
    SELECT
        *
    FROM {{ ref('fact_orderline') }}
    
)

, query_test as (
    select 
        round(sum(unit_price * order_qtd),2) as gross_revenue
    FROM total_revenue_2011
    WHERE order_date >= '2011-01-01' and order_date <'2012-01-01'
)

, test as (
    select 
        *
    from query_test  
    where gross_revenue <> 12646112.16
)

select * from test