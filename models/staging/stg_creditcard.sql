with
    card as (
        select *
        from {{ source('source', 'creditcard') }}
    )

    , card_final as (
        select 
            creditcardid as creditcard_id
            , cardtype as card_type
        from card
    )

    select * from card_final 