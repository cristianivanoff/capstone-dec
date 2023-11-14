
with source as (

    select * from {{ source('sales', 'salespersonquotahistory') }}

),

renamed as (

    select
        _airbyte_raw_id
        , _airbyte_extracted_at
        , _airbyte_meta
        , salesquota
        , businessentityid
        , modifieddate
        , quotadate
        , rowguid

    from source

)

select * from renamed
