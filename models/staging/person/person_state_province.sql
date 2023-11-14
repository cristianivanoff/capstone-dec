

with source as (

    select * from {{ source('person', 'stateprovince') }}

),

renamed as (

    select
        _airbyte_raw_id
        , _airbyte_extracted_at
        , _airbyte_meta
        , isonlystateprovinceflag
        , name
        , territoryid
        , modifieddate
        , stateprovinceid
        , stateprovincecode
        , rowguid
        , countryregioncode

    from source

)

select * from renamed
