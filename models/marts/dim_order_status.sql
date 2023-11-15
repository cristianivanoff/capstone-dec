with
orders as (
    select
        {{ dbt_utils.generate_surrogate_key(['statusid']) }} as order_status_key
        , statusid
        , status_description
    from {{ ref('order_status') }}
)

select * from orders
