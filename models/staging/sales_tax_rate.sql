
with source as (

    select * from {{ source('sales', 'salestaxrate') }}

),

renamed as (

    select
        _airbyte_raw_id
        , _airbyte_extracted_at
        , _airbyte_meta
        , taxrate
        , name
        , modifieddate
        , stateprovinceid
        , salestaxrateid
        , rowguid
        , taxtype

    from source

)

select * from renamed
