
with 
    raw_generate_date as (
        {{ dbt_date.get_date_dimension("2011-01-01", "2015-01-01") }}
)

, generate_date as (
    select
        raw_generate_date.date_day as date_day
      , raw_generate_date.year_number as year_number
      , case 
            when raw_generate_date.year_number = 2011 then '2011-01-01' 
            when raw_generate_date.year_number = 2012 then '2012-01-01'
            when raw_generate_date.year_number = 2013 then '2013-01-01'
            when raw_generate_date.year_number = 2014 then '2014-01-01'
        end as year_date
      , raw_generate_date.month_name as date_month
      , concat (raw_generate_date.month_name_short||'/'||raw_generate_date.year_number) as year_month
      , cast(raw_generate_date.quarter_of_year as int) as quarter   
    from raw_generate_date
)

, final_date as (
    select 
        date_day
        , cast( year_date as date) as year_date
        , date_month
        , year_month
        , quarter
    from generate_date
)

select * from final_date