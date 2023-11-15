with
dates_raw as (
    {{ dbt_utils.date_spine(
        datepart="day",
        start_date="cast('1970-01-01' as date)",
        end_date="date_add(current_date(), interval 1 year)"
        )
    }}
)

, calendar as (
    select
        cast(date_day as date) as date
        , format_date('%A', date_day) as weekday
        , format_date('%u', date_day) as weekday_number
        , format_date('%V', date_day) as iso_week
        , format_date('%B', date_day) as month_name
        , format_date('%m', date_day) as month
        , format_date('%Q', date_day) as quarter
        , format_date('%Y', date_day) as year
    from dates_raw
)

, final as (
    select
        {{ dbt_utils.generate_surrogate_key(['date']) }} as order_date_key
        , *
    from calendar
)

select * from final
