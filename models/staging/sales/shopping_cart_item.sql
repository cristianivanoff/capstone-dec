
with source as (

    select * from {{ source('sales', 'shoppingcartitem') }}

),

renamed as (

    select
        _airbyte_raw_id
        , _airbyte_extracted_at
        , _airbyte_meta
        , shoppingcartid
        , shoppingcartitemid
        , quantity
        , productid
        , modifieddate
        , datecreated

    from source

)

select * from renamed
