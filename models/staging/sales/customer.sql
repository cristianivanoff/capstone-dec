
with source as (

    select * from {{ source('sales', 'customer') }}

),

renamed as (

    select
        _airbyte_raw_id
        , _airbyte_extracted_at
        , _airbyte_meta
        , customerid
        , territoryid
        , modifieddate
        , personid
        , storeid
        , rowguid

    from source

)

select * from renamed
