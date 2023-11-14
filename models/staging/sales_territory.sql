
with source as (

    select * from {{ source('sales', 'salesterritory') }}

),

renamed as (

    select
        _airbyte_raw_id
        , _airbyte_extracted_at
        , _airbyte_meta
        , costlastyear
        , costytd
        , name
        , salesytd
        , territoryid
        , modifieddate
        , saleslastyear
        , rowguid
        , countryregioncode
        , `group` as group_name

    from source

)

select * from renamed
