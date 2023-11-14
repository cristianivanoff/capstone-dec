
with source as (

    select * from {{ source('sales', 'currency') }}

),

renamed as (

    select
        _airbyte_raw_id
        , _airbyte_extracted_at
        , _airbyte_meta
        , name
        , modifieddate
        , currencycode

    from source

)

select * from renamed
