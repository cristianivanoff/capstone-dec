

with source as (

    select * from {{ source('production', 'productcategory') }}

),

renamed as (

    select
        _airbyte_raw_id
        , _airbyte_extracted_at
        , _airbyte_meta
        , productcategoryid
        , name
        , modifieddate
        , rowguid

    from source

)

select * from renamed
