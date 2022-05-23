{{ 
    config(
        materialized = 'incremental',
        unique_key = 'reporting_date'
        ) 
}} 

select
    reporting_date,
    inverter_serial_number,
    produced_kwh,
    current_timestamp as inserted_datetime
from
    {{ ref('dbt_inverter_daily_agg_ctas') }}

{% if is_incremental() %}

  where reporting_date = cast(current_date - interval '1' day as date)

{% endif %}
    