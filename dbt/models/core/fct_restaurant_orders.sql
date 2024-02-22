
SELECT
-- joins the orders and restaurant table
    order_date,rid,sales_amt,
    name,city,rating,rating_cnt
FROM
    {{ref('stg_orders')}} o
LEFT JOIN
    {{ref('stg_restaurant')}} r ON o.rid=r.id

