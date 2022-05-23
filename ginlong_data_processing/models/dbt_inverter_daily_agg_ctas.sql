{{ 
    config(materialized = 'ephemeral') 
}} 

select
    reporting_date,
    inverter_serial_number,
    produced_kwh
from
    (
        select
            date(register_time) reporting_date,
            inverter_serial_number,
            produced_since_morning_til_register_time as produced_kwh,
            row_number() over (
                partition by inverter_serial_number,
                date(register_time)
                order by
                    register_time desc
            ) rn
        from
            inverter_daily_log
    ) daily_log
where
    rn = 1
