
with source as (

    select * from {{ source('sales', 'store') }}

),

renamed as (

    select
        _airbyte_raw_id
        , _airbyte_extracted_at
        , _airbyte_meta
        , businessentityid
        , salespersonid
        , name
        , modifieddate
        , rowguid
        , demographics

    from source

)

select * from renamed
