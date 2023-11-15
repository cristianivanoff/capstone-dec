with

address as (
    select
        {{ dbt_utils.generate_surrogate_key(['addressid']) }} as address_key
        , addressid
        , addressline1
        , addressline2
        , postalcode
        , city as city_name
        , stateprovinceid
    from {{ ref('stg_person__address') }}
)

, state as (
    select
        stateprovinceid
        , name as state_name
        , countryregioncode
    from {{ ref('stg_person__state_province') }}
)

, country as (
    select
        countryregioncode
        , name as country_name
    from {{ ref('stg_person__country_region') }}
)

, final as (
    select
        address.address_key
        , address.addressid
        , address.addressline1
        , address.addressline2
        , address.postalcode
        , address.city_name
        , state.state_name
        , country.country_name
    from address
    left join state using (stateprovinceid)
    left join country using (countryregioncode)
)

select * from final
