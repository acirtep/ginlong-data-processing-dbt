select
    *
from
    (
        select
            to_char(reporting_date, 'YYYYMMDD') as reporting_date,
            produced_kwh
        from
            inverter_daily_agg
        where
            to_char(reporting_date, 'YYYYMM') = to_char(current_date - interval '1' month, 'YYYYMM')
        except
        select
            to_char(register_date, 'YYYYMMDD') as reporting_date,
            produced_kwh
        from
            inverter_monthly_log
        where
            to_char(register_date, 'YYYYMM') = to_char(current_date - interval '1' month, 'YYYYMM')
    ) daily_vs_monthly
