

with source as (

    select * from {{ source('person', 'countryregion') }}

),

renamed as (

    select
        _airbyte_raw_id
        , _airbyte_extracted_at
        , _airbyte_meta
        , name
        , modifieddate
        , countryregioncode

    from source

)

select * from renamed
