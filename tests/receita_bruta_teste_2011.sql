-- tests/test_fact_orderline_gross_revenue_2011.sql

WITH total_revenue_2011 AS (
    SELECT
        SUM(unit_price * order_qtd) AS gross_revenue
    FROM {{ ref('fact_orderline') }}
    WHERE order_date >= '2011-01-01' and order_date <'2012-01-01'
)

select * from total_revenue_2011