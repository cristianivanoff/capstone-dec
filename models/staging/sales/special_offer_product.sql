
with source as (

    select * from {{ source('sales', 'specialofferproduct') }}

),

renamed as (

    select
        _airbyte_raw_id
        , _airbyte_extracted_at
        , _airbyte_meta
        , productid
        , modifieddate
        , specialofferid
        , rowguid

    from source

)

select * from renamed
