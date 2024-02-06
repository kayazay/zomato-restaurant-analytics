WITH newline_id_out_cte AS (
select
    try_to_number(id) AS id,
    name,
    city,
    try_to_number(rating) AS rating,
    to_number(CASE
        WHEN left(rating_count,4)='10K+' THEN 10*1000+1
        WHEN left(rating_count,3)='5K+' THEN 5*1000+1
        WHEN left(rating_count,3)='1K+' THEN 1*1000+1
        WHEN left(rating_count,4)='500+' THEN 500+1
        WHEN left(rating_count,4)='100+' THEN 100+1
        WHEN left(rating_count,3)='50+' THEN 50+1
        WHEN left(rating_count,3)='20+' THEN 20+1
        WHEN left(rating_count,3)='Too' THEN 1
        ELSE null END
    ) AS rating_cnt,
    SUBSTR(cost, 3) AS cost,
    cuisine,
    try_to_number(lic_no) AS lic_no,
    link
from
    raw.zomato.restaurant
)
select * from newline_id_out_cte where id IS NOT null
