with
cards as (
    select
        {{ dbt_utils.generate_surrogate_key(['creditcardid']) }} as creditcard_key
        , creditcardid
        , cardtype
    from {{ ref('stg_sales__creditcard') }}
)

select * from cards
