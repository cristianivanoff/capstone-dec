
with source as (

    select * from {{ source('sales', 'salesorderheader') }}

),

renamed as (

    select
        _airbyte_raw_id
        , _airbyte_extracted_at
        , _airbyte_meta
        , shiptoaddressid
        , purchaseordernumber
        , billtoaddressid
        , onlineorderflag
        , freight
        , modifieddate
        , orderdate
        , creditcardid
        , rowguid
        , creditcardapprovalcode
        , shipdate
        , shipmethodid
        , accountnumber
        , totaldue
        , salespersonid
        , duedate
        , subtotal
        , customerid
        , territoryid
        , salesorderid
        , revisionnumber
        , comment
        , currencyrateid
        , taxamt
        , status

    from source

)

select * from renamed
