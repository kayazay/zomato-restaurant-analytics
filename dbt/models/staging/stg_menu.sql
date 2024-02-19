select
    -- remove preceeding text from id columns
    to_number(
        TRIM(menu_id, 'mn')
    ) AS id,
    to_number(
        TRIM(f_id, 'fd')
    ) AS fid,
    to_number(r_id) AS rid,
    cuisine,
    COALESCE(
    -- try to convert to double, or else use regex to extract price
        TRY_TO_DOUBLE(price), 
        REGEXP_SUBSTR(price, '\\d+')
    ) AS price
from
    {{ source('zomato','menu') }}

