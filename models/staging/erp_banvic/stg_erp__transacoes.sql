with
    source as (
        select *
        from {{ source('erp', 'transacoes') }}
    )

    , renamed as (
        select
            cod_transacao as pk_transacao
            , num_conta as fk_conta
            , cast(data_transacao as timestamp) as ts_transacao
            , cast(data_transacao as date) as data_transacao
            , nome_transacao
            , cast(valor_transacao as decimal(18,2)) as valor_transacao
        from source
    )
    select *
    from renamed