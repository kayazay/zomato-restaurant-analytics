/*
DIMENSION TABLE
HOLDS DATA SHOWING EACH USER WITH AN ACCOUNT ON THE APP
AS WELL AS THEIR ORDER HISTORY OR SUMMARY
AND MORE DETAILS ABOUT USER
REFERENCES users and orders table
*/


WITH users_orders_history AS (
-- aggregates orders on the level of each user
SELECT
    uid,
    MIN(order_date) AS first_purchase,
    MAX(order_date) AS last_purchase,
    COUNT(*) AS orders_cnt,
    SUM(sales_amt) AS total_purchase
FROM
    {{ref('stg_orders')}}
GROUP BY 1
)
-- joins the first cte to the users table extracting relevant details
SELECT
    id, age, gender, married, occupation,
    m_income, edu_q, f_size,
    first_purchase, last_purchase, 
    orders_cnt, total_purchase
FROM
    {{ref('stg_users')}} u
INNER JOIN
    users_orders_history uoh ON uoh.uid=u.id

