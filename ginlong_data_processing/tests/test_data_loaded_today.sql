select
    *
from
    (
        select
            count(*) as no_of_rec
        from
            inverter_daily_agg
        where
            reporting_date = current_date - 1
    ) select_count
where
    no_of_rec <> 1