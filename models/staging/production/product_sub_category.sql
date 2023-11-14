

with source as (

    select * from {{ source('production', 'productsubcategory') }}

),

renamed as (

    select
        _airbyte_raw_id
        , _airbyte_extracted_at
        , _airbyte_meta
        , productcategoryid
        , productsubcategoryid
        , name
        , modifieddate
        , rowguid

    from source

)

select * from renamed
