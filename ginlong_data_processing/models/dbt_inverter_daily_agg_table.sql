{{ 
    config(materialized = 'table') 
}} 

select
    reporting_date,
    inverter_serial_number,
    produced_kwh,
    current_timestamp as inserted_datetime
from
    {{ ref('dbt_inverter_daily_agg_ctas') }}
    