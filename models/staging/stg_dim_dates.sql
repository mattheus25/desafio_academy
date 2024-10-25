
with 
    raw_generate_date as (
        {{ dbt_date.get_date_dimension("2011-01-01", "2015-01-01") }}
)

, generate_date as (
    select
        raw_generate_date.date_day
      , cast(raw_generate_date.year_number as int ) as "year"
      , raw_generate_date.month_name as "month"
      , concat (raw_generate_date.month_name_short||'/'||raw_generate_date.year_number) as year_month
      , cast(raw_generate_date.quarter_of_year as int) as quarter   
    from raw_generate_date
)

select * from generate_date