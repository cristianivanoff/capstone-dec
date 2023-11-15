
with source as (

    select * from {{ source('sales', 'salesorderdetail') }}

),

renamed as (

    select
        _airbyte_raw_id
        , _airbyte_extracted_at
        , _airbyte_meta
        , productid
        , salesorderdetailid
        , modifieddate
        , salesorderid
        , specialofferid
        , orderqty
        , unitprice
        , rowguid
        , unitpricediscount
        , carriertrackingnumber

    from source

)

select * from renamed
