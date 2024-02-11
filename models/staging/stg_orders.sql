with constrained_currency AS (
select
    order_date,
    sales_qty,
    sales_amount AS sales_amt,
    cast(
    -- constrain currency column so it's 3 characters
        left(TRIM(currency,'"'), 3) AS CHAR(3)
    ) AS currency,
    user_id AS uid,
    r_id AS rid
from
    {{ source('zomato','orders') }}
)
select * from constrained_currency where currency='INR'