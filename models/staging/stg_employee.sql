{{ config(materialized='view') }}

with 
    source_employee as (
        select *
        from {{ source('source', 'employee') }}
    )

    ,employee as (
        SELECT
            cast(businessentityid as int) as employee_id
            ,cast(nationalidnumber as int ) as national_id_number
            ,jobtitle      
            FROM {{ source('source', 'employee') }}
    )

select * from employee

