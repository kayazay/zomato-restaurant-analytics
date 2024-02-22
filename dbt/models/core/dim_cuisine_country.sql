WITH cte_menu AS (
-- removes hyphen so text in cuisine column can be split properly
SELECT
    id,
    REPLACE(cuisine, '-', ',') as cuisine,
    price
FROM
    {{ref('stg_menu')}}
), cuisine2table AS (
-- splits cuisine column by given delimeter and flattens to rows
SELECT
    id,
    cuisine,
    value AS cuisine_,
    price
FROM
    cte_menu,
    LATERAL SPLIT_TO_TABLE(cte_menu.cuisine, ',')
), joined_country AS (
-- joins the cuisine2table to the countries table
-- return rows that exist in demonym column 
SELECT
    id, cuisine_, price, country
FROM cuisine2table c2t 
LEFT JOIN {{ref('stg_countries')}} stgc
    ON stgc.nationality LIKE '%'||c2t.cuisine_||'%'
)
-- remove rows that does't return respective country
-- remove any duplicates from table
SELECT
    id, country, price
FROM
    joined_country
WHERE country IS NOT NULL
GROUP BY
    1,2,3

