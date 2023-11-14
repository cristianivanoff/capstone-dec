

with source as (

    select * from {{ source('production', 'product') }}

),

renamed as (

    select
        _airbyte_raw_id
        , _airbyte_extracted_at
        , _airbyte_meta
        , productline
        , color
        , productid
        , modifieddate
        , finishedgoodsflag
        , rowguid
        , listprice
        , discontinueddate
        , productmodelid
        , class
        , standardcost
        , daystomanufacture
        , productsubcategoryid
        , makeflag
        , weight
        , reorderpoint
        , weightunitmeasurecode
        , size
        , safetystocklevel
        , productnumber
        , name
        , sellenddate
        , sizeunitmeasurecode
        , style
        , sellstartdate

    from source

)

select * from renamed
