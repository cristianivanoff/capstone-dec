
with source as (

    select * from {{ source('sales', 'creditcard') }}

),

renamed as (

    select
        _airbyte_raw_id
        , _airbyte_extracted_at
        , _airbyte_meta
        , expmonth
        , expyear
        , modifieddate
        , cardtype
        , cardnumber
        , creditcardid

    from source

)

select * from renamed
