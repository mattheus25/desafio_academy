with 
    source_employee as (
        select *
        from {{ source('source', 'employee') }}
    )

    , employee as (
        SELECT
            businessentityid as employee_id
            , nationalidnumber as national_id_number
            , jobtitle      
        FROM {{ source('source', 'employee') }}
    )

select * from employee

