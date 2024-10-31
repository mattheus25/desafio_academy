with
    persons as (
        select*
        from {{ source('source', 'person') }}
    )
    , person as (
        select
            businessentityid
            , persontype
            , firstname || ' ' || lastname as full_name                
        from persons 
    )
    
select * from person

