
with source as (

    select * from {{ source('sales', 'countryregioncurrency') }}

),

renamed as (

    select
        _airbyte_raw_id
        , _airbyte_extracted_at
        , _airbyte_meta
        , modifieddate
        , currencycode
        , countryregioncode

    from source

)

select * from renamed
