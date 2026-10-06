with
    transacoes as (
        select *
        from {{ ref('stg_erp__transacoes') }}
    )

    , contas as (
        select *
        from {{ ref('stg_erp__contas') }}
    )

    , transacoes_enriquecido as (
        select
            transacoes.pk_transacao
            , transacoes.fk_conta
            , contas.fk_cliente
            , contas.fk_agencia
            , contas.fk_colaborador
            , transacoes.data_transacao as fk_data
            , transacoes.ts_transacao
            , transacoes.nome_transacao
            , transacoes.valor_transacao
        from transacoes
        left join contas on transacoes.fk_conta = contas.pk_conta
    )
    select *
    from transacoes_enriquecido