-- DIMENSION TABLE
-- HOLDS DATA FOR POPULAR FOOD ITEMS USED IN THE ZOMATO APP
-- AS WELL AS THEIR FREQUENCY OF OCCURENCE
-- AND WHETHER THEY'RE vegetarian or not
-- REFERENCES food table


WITH split_items AS (
-- regex on the item column to get every word with the condition:
-- first letter must be Capital and must be preceeded by 2 ore more words
-- flattens the array into rows
SELECT 
    id, item, veg, TRIM(value, '"') AS item_each
FROM
    {{ref('stg_food')}},
    LATERAL FLATTEN(REGEXP_SUBSTR_ALL(item, '\\b[A-Z][a-z]{2,}\\b'))
), stopwords_agg_item_only AS (
-- removes certain stopwords from the rows
-- then determine frequency of each item
-- take only the top 40 most occuring items
SELECT
    item_each, count(*) AS cnt
FROM 
    split_items
WHERE item_each NOT IN (
    'Veg','Pcs','Dry','Fry','Ice','Mix','Hot','And','Gms',
    'With','Fried','Combo','Sauce','Plain','Spicy',
    'Grilled','Special','Regular') 
GROUP BY 1
ORDER BY 2 DESC
LIMIT 40
)
-- joins the first cte that split the items
-- to the previous cte that aggregated the items
-- returns the id; 
-- then a popular food item, if it has that
-- then the frequency of item 
-- finally removes duplicates
SELECT
    id, spit.item_each AS item, veg, stagg.cnt AS item_cnt
FROM
    split_items spit
INNER JOIN
    stopwords_agg_item_only stagg ON spit.item_each=stagg.item_each
GROUP BY 1,2,3,4
