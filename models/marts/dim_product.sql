with

stg_product as (
    select
        {{ dbt_utils.star(
                            ref('stg_product__product')   
                            , quote_identifiers=false
                            , except=[  "_airbyte_raw_id"
                                        ,"_airbyte_meta"
                                        ,"rowguid"]) }}

    from {{ ref("stg_product__product") }}
)

, stg_product_sub_category as (
    select
        {{ dbt_utils.star(
                            ref('stg_product__sub_category')  
                            , quote_identifiers=false
                            , except=[  "_airbyte_raw_id"
                                        ,"_airbyte_extracted_at"
                                        ,"_airbyte_meta"
                                        ,"modifieddate"
                                        ,"rowguid"]) }}

    from {{ ref("stg_product__sub_category") }}
)

, stg_product_category as (
    select
        {{ dbt_utils.star(
                            ref('stg_product__category')      
                            , quote_identifiers=false
                            , except=[  "_airbyte_raw_id"
                                        ,"_airbyte_extracted_at"
                                        ,"_airbyte_meta"
                                        ,"modifieddate"
                                        ,"rowguid"]) }}

    from {{ ref("stg_product__category") }}
)

, final as (
    select
        {{ dbt_utils.generate_surrogate_key(['p.productid']) }} as product_key
        , p.productid
        , p.name as product_name
        , p.* except (productid, _airbyte_extracted_at, name)
        , psc.name as sub_category
        , pc.name as category
        , p._airbyte_extracted_at as extracted_at
    from stg_product as p
    left join stg_product_sub_category as psc using (productsubcategoryid)
    left join stg_product_category as pc using (productcategoryid)
)

select * from final
