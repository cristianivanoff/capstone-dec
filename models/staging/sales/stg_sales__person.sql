
with source as (

    select * from {{ source('sales', 'salesperson') }}

),

renamed as (

    select
        _airbyte_raw_id
        , _airbyte_extracted_at
        , _airbyte_meta
        , salesquota
        , businessentityid
        , bonus
        , salesytd
        , territoryid
        , modifieddate
        , saleslastyear
        , rowguid
        , commissionpct

    from source

)

select * from renamed
