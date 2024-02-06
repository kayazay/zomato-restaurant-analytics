with newline_item_out_cte as (
select
    try_to_number(REPLACE(f_id, 'fd', '')) as id,
    item,
    CASE
        WHEN veg_or_non_veg = 'Veg' THEN True
        WHEN veg_or_non_veg= 'Non-veg' THEN False
    END AS veg
from
    raw.zomato.food
)
select * from newline_item_out_cte where id IS NOT NULL