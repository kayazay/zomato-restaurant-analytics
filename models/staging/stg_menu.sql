WITH cte_menu AS (
select
    REPLACE(menu_id, 'mn', '') AS id,
    r_id AS rid,
    REPLACE(f_id, 'fd', '') AS fid,
    cuisine,
    coalesce(
        try_to_double(price), 
        REGEXP_SUBSTR(price, '\\d+')
    ) AS price
from
    raw.zomato.menu
)
select 
    to_number(id) as id,
    to_number(rid) as rid,
    to_number(fid) as fid,
    cuisine,
    price
from
    cte_menu


