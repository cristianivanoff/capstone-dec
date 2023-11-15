with
stg_header as (
    select
        salesorderid
        , customerid
        , creditcardid
        , shiptoaddressid
        , status as order_status
        , cast(orderdate as date) as orderdate
    from {{ ref('stg_sales__order_header') }}
)

, stg_detail as (
    select
        salesorderid
        , salesorderdetailid
        , productid
        , orderqty
        , unitprice
        , unitprice * orderqty as revenue
    from {{ ref('stg_sales__order_detail') }}
)

, final as (
    select
        {{ dbt_utils.generate_surrogate_key(['salesorderid', 'salesorderdetailid']) }} as sales_key
        , {{ dbt_utils.generate_surrogate_key(['productid']) }} as product_key
        , {{ dbt_utils.generate_surrogate_key(['customerid']) }} as customer_key
        , {{ dbt_utils.generate_surrogate_key(['creditcardid']) }} as creditcard_key
        , {{ dbt_utils.generate_surrogate_key(['shiptoaddressid']) }} as ship_address_key
        , {{ dbt_utils.generate_surrogate_key(['order_status']) }} as order_status_key
        , {{ dbt_utils.generate_surrogate_key(['orderdate']) }} as order_date_key
        , stg_header.salesorderid
        , stg_detail.salesorderdetailid
        , stg_detail.orderqty
        , stg_detail.unitprice
        , stg_detail.revenue
    from stg_header
    inner join stg_detail using (salesorderid)
)

select * from final
