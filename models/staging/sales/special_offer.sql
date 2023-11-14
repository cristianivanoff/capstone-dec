
with source as (

    select * from {{ source('sales', 'specialoffer') }}

),

renamed as (

    select
        _airbyte_raw_id
        , _airbyte_extracted_at
        , _airbyte_meta
        , enddate
        , discountpct
        , description
        , modifieddate
        , specialofferid
        , type
        , category
        , startdate
        , maxqty
        , rowguid
        , minqty

    from source

)

select * from renamed
