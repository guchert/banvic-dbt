with
    datas as (
        select
            explode(sequence(to_date('2010-01-01'), to_date('2030-12-31'), interval 1 day)) as data
    )

    select
        data as pk_data
        , year(data) as ano
        , quarter(data) as trimestre
        , month(data) as mes
        , case month(data)
            when 1 then 'Janeiro' when 2 then 'Fevereiro' when 3 then 'Março'
            when 4 then 'Abril' when 5 then 'Maio' when 6 then 'Junho'
            when 7 then 'Julho' when 8 then 'Agosto' when 9 then 'Setembro'
            when 10 then 'Outubro' when 11 then 'Novembro' else 'Dezembro'
        end as nome_mes
        , date_format(data, 'yyyy-MM') as ano_mes
        , day(data) as dia
        , weekday(data) + 1 as dia_semana
        , weekday(data) in (5, 6) as fim_de_semana
    from datas