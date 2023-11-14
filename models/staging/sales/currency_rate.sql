
with source as (

    select * from {{ source('sales', 'currencyrate') }}

),

renamed as (

    select
        _airbyte_raw_id
        , _airbyte_extracted_at
        , _airbyte_meta
        , fromcurrencycode
        , currencyratedate
        , averagerate
        , endofdayrate
        , tocurrencycode
        , modifieddate
        , currencyrateid

    from source

)

select * from renamed
