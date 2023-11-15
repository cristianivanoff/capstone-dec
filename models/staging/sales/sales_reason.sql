
with source as (

    select * from {{ source('sales', 'salesreason') }}

),

renamed as (

    select
        _airbyte_raw_id
        , _airbyte_extracted_at
        , _airbyte_meta
        , salesreasonid
        , name
        , modifieddate
        , reasontype

    from source

)

select * from renamed
