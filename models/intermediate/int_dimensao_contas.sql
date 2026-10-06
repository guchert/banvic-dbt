with
    contas as (
        select *
        from {{ ref('stg_erp__contas') }}
    )

    select
        pk_conta
        , tipo_conta
        , data_abertura_conta
        , saldo_total_conta
        , saldo_disponivel_conta
        , data_ultimo_lancamento_conta
    from contas