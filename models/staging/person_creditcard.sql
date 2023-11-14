
with source as (

    select * from {{ source('sales', 'personcreditcard') }}

),

renamed as (

    select
        _airbyte_raw_id
        , _airbyte_extracted_at
        , _airbyte_meta
        , businessentityid
        , modifieddate
        , creditcardid

    from source

)

select * from renamed
