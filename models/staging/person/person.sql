

with source as (

    select * from {{ source('person', 'person') }}

),

renamed as (

    select
        _airbyte_raw_id
        , _airbyte_extracted_at
        , _airbyte_meta
        , firstname
        , namestyle
        , businessentityid
        , emailpromotion
        , middlename
        , modifieddate
        , title
        , suffix
        , persontype
        , rowguid
        , lastname
        , additionalcontactinfo
        , demographics

    from source

)

select * from renamed
