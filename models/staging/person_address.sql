

with source as (

    select * from {{ source('person', 'address') }}

),

renamed as (

    select
        _airbyte_raw_id
        , _airbyte_extracted_at
        , _airbyte_meta
        , city
        , spatiallocation
        , postalcode
        , addressline2
        , modifieddate
        , stateprovinceid
        , addressline1
        , rowguid
        , addressid

    from source

)

select * from renamed
