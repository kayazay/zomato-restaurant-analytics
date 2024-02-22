# Zomato Restaurant 🍜 Data Engineering Project

<img src="https://github.com/kayazay/zomato_analytics/assets/60517587/7331a97e-e230-4e46-86e9-f84009fadcd9" width="100%" height="40%" alt="zmt_real">

This is an end to end ELT project that uses data from the Zomato Restaurant, an Indian multinational restaurant aggregator and food delivery company. Founded in 2008 by Deepinder Goyal and Pankaj Chadda, the Zomato app is an online food ordering and delivery platform that helps you place a food order from the restaurant registered on Zomato, and get it delivered on your doorsteps.

## Problem Description
The purpose of this project is to make an end to end data pipeline which:

+ Extracts the Zomato data from a Kaggle dataset
+ Loads this data into Snowflake data warehouse
+ Transforms loaded data using dbt applying Kimbal Dimensional Modeling
+ Build a Tableau report to visualize data

## Technology Stack
1. **Snowflake** for data warehouse
1. **dbt** for transformation and data modeling
1. **Tableau** for data visualization

## Data Pipeline Architecture

![zomato_etl](https://github.com/kayazay/zomato_analytics/assets/60517587/f4fd8397-c476-46ab-a7b1-1cb7baab22c3)

## DAG for dbt 
I used the Kimball Dimensional modeling principle to create facts and dimension tables from staging models in the dbt project. I used aggregations, CTEs, table joins, window functions and complex SQL logic to transform data into four marts that described a specific business function. The DAG for this workflow is:

> **source tables &rarr; staging models &rarr; facts and dimension tables**

![dag](https://github.com/kayazay/zomato_analytics/assets/60517587/6b1e6c3a-5e28-4acd-9e12-a08ffbfe5b4a)

### ERD for Facts & Dimension tables

#### `dim_cuisine_country`

Dimension table holding data for the different dishes offered in the Zomato app and the country they originate from. It takes the cuisine column from the `menu` table, extracts the demonymns, then matches the respective country in the `countries` table. It also records the price of each dish on the app.

#### `dim_foods_veg`

Dimension table holding aggregated data of popular food items used in the zomato app by their frequency of occurence, and whether they're vegetarian or not. References the `food` table.

#### `dim_user_purchase`

Dimension table showing data on each user on the Zomato app as well as their lifetime order history. It finds the earliest & latest order date of each user that made a purchase on the `orders` table; then matches that user on the `users` table to get their demographic.

#### `fct_restaurant_orders`

Fact table holding data for each order made on the Zomato app, and to which restaurant. It collects the order date and restaurant id from the `orders` table; then matches it with the `restaurant` table for location, ratings and review data of the particular restaurant.


## Tableau Report
I created four dashboards on Tableau from data marts built out of dbt, then incorporated them into [**an interactive report on my Tableau profile**](https://public.tableau.com/shared/9332P3HXW?:display_count=n&:origin=viz_share_link) with appropriate controls, filters, and legends. The snapshots of the four dashboards are:

### `cuisine`
> ![CUISINE](https://github.com/kayazay/zomato_analytics/assets/60517587/f69e7e76-2321-47a2-894b-9b551636150c)

### `food`
> ![FOOD](https://github.com/kayazay/zomato_analytics/assets/60517587/e5460928-6e7a-4af1-9b0f-ee0314db7b08)

### `orders`
> ![ORDERS](https://github.com/kayazay/zomato_analytics/assets/60517587/e72c1366-9196-4ee8-9161-7a98efc0ac24)

### `restaurant`
> ![RST](https://github.com/kayazay/zomato_analytics/assets/60517587/aa8635ac-d39d-40e7-b4ae-ae7e4d424d5e)


---

&copy; 2024 Kingsley Izima
