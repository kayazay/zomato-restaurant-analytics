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
This project leveraged the Kimball Dimensional Modeling principle to construct facts and dimension tables from initial staging models within the dbt framework. By utilizing a combination of advanced techniques including aggregations, Common Table Expressions, appropriate table joins, window functions and detailed SQL logic, the raw data went through extensive transformation and modeling. The **Directed Acyclic Graph (DAG)** below shows the dependencies and logical flow of transformations in this pipeline, from the source tables to the four distinct data marts, each built to address a specific component of the operations within the Zomato company.

![dag](https://github.com/kayazay/zomato_analytics/assets/60517587/6b1e6c3a-5e28-4acd-9e12-a08ffbfe5b4a)

### Data Marts Dictionary

#### `dim_cuisine_country`

Dimension table holding data for the different dishes offered in the Zomato app and the country they originate from. It takes the cuisine column from the `menu` table, extracts the demonymns, then matches the respective country in the `countries` table. It also records the price of each dish on the app.

#### `dim_foods_veg`

Dimension table holding aggregated data of popular food items used in the zomato app by their frequency of occurence, and whether they're vegetarian or not. References the `food` table.

#### `dim_user_purchase`

Dimension table showing data on each user on the Zomato app as well as their lifetime order history. It finds the earliest & latest order date of each user that made a purchase on the `orders` table; then matches that user on the `users` table to get their demographic.

#### `fct_restaurant_orders`

Fact table holding data for each order made on the Zomato app, and to which restaurant. It collects the order date and restaurant id from the `orders` table; then matches it with the `restaurant` table for location, ratings and review data of the particular restaurant.


## Tableau Report
The project culminated in the development of four dynamic dashboards within Tableau, each derived from the data marts built within dbt framework. These dashboards were seamlessly integrated into [**an interactive report**](https://public.tableau.com/shared/9332P3HXW?:display_count=n&:origin=viz_share_link) hosted on `Tableau Public`. Through the incorporation of controls, filters, legends, and narratives, users can easily explore and analyze the insights contained within the data.

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
