with
    source as (
        select *
        from {{ source('erp', 'contas') }}
    )

    , renamed as (
        select
            num_conta as pk_conta
            , cod_cliente as fk_cliente
            , cod_agencia as fk_agencia
            , cod_colaborador as fk_colaborador
            , tipo_conta
            , cast(data_abertura as date) as data_abertura_conta
            , cast(saldo_total as decimal(18,2)) as saldo_total_conta
            , cast(saldo_disponivel as decimal(18,2)) as saldo_disponivel_conta
            , cast(data_ultimo_lancamento as date) as data_ultimo_lancamento_conta
        from source
    )
    select *
    from renamed