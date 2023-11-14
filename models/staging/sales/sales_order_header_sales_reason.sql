
with source as (

    select * from {{ source('sales', 'salesorderheadersalesreason') }}

),

renamed as (

    select
        _airbyte_raw_id
        , _airbyte_extracted_at
        , _airbyte_meta
        , salesreasonid
        , modifieddate
        , salesorderid

    from source

)

select * from renamed
