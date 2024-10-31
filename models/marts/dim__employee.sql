with
    employees as (
        select *
        from {{ ref('stg__employee') }}
    )

    , person as (
        select *
        from {{ ref('stg__person') }}
    )

    , orders as (
        select * 
        from {{ ref('stg__ordersales') }}
    )
    
    , salesperson as (
        select *
        from {{ ref('stg__salesperson') }}
    )
    

    , employee as (
        select 
          employee_id
        , jobtitle
        , full_name
        , salesperson.territory_id
        from employees
        join person on employees.employee_id = person.businessentityid
        join salesperson on employees.employee_id = salesperson.sales_person_id
        -- join orders on person.businessentityid = orders.sales_person_id
    )

    select  * from employee
 