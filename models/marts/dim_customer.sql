with

customer as (
    select
        {{ dbt_utils.star(
                            ref('stg_sales__customer')   
                            , quote_identifiers=false
                            , except=[  "_airbyte_raw_id"
                                        ,"_airbyte_meta"
                                        ,"_airbyte_extracted_at"
                                        ,"rowguid"
                                        ,"territoryid"]) }}
    from {{ ref('stg_sales__customer') }}
)

, person as (
    select
        businessentityid as personid
        , title
        , firstname || ' ' || middlename || ' ' || lastname as full_name
    from {{ ref('stg_person__person') }}
)

, store as (
    select
        businessentityid as storeid
        , name as store_name
    from {{ ref('stg_sales__store') }}
)

, final as (
    select
        {{ dbt_utils.generate_surrogate_key(['customerid']) }} as customer_key
        , customerid
        , storeid
        , title
        , store_name
        , coalesce(full_name, 'Anonymous') as full_name
        , modifieddate as customer_modifieddate
    from customer
    left join person using (personid)
    left join store using (storeid)
)

select * from final
