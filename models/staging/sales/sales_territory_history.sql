
with source as (

    select * from {{ source('sales', 'salesterritoryhistory') }}

),

renamed as (

    select
        _airbyte_raw_id
        , _airbyte_extracted_at
        , _airbyte_meta
        , enddate
        , businessentityid
        , territoryid
        , modifieddate
        , startdate
        , rowguid

    from source

)

select * from renamed
