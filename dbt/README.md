# Staging Models

The staging models were transformed on top of source tables and used for further downstream queries. 
There are 6 staging models in the `staging/` folder, 5 of which are gotten from the a Kaggle datatset, 
while the other is gotten from a GitHub repository.
Dive into each of the source tables to know more about them here.

## country-nationality-list
This GitHub repository is the source of the `countries` table. 
Data was extracted in csv format from 
[here](https://github.com/Imagin-io/country-nationality-list/blob/master/countries.csv); 
and loaded into `Snowflake`.

{% docs countries_docs %}

### `stg_countries`
The Countries table contains information about 
+ countries of the world, 
+ their demonyms.

| COUNTRY                              | NATIONALITY                |
|--------------------------------------|----------------------------|
| China                                | Macanese, Chinese          |
| Italy                                | Italian                    |
| United Kingdom of Great Britain and Northern Ireland | British, UK |
| India                                | Indian, North Indian       |
| United States of America             | American                   |

{% enddocs %}

## Zomato Database
This Kaggle dataset is a repository that holds a collection of tables concerning information 
related to India's popular food delivery app, `Zomato`. 
Five tables are extracted and loaded into `Snowflake`;
and dataset can be found [here](https://www.kaggle.com/datasets/anas123siddiqui/zomato-database?select=orders.csv).

{% docs food_docs %}

### `stg_food`
The Food table contains information about the different food items available on the app such as: 
+ the unique identifier of each food item, 
+ its name, 
+ whether it is vegetarian (**True**) or non-vegetarian (**False**).

| ID | ITEM                | VEG  |
|----|---------------------|------|
| 0  | Aloo Tikki Burger   | true |
| 1  | Veg Creamy Burger   | true |
| 2  | Cheese Burst Burger | true |
| 3  | Paneer Creamy Burger| true |
| 4  | Maxican Burger      | true |

{% enddocs %}

{% docs menu_docs %}

### `stg_menu`
The Menu table contains information about the menus of different restaurants on the app. This table stores 
+ the unique identifier of the menu, 
+ the unique identifier of the restaurant associated with the menu, 
+ the unique identifier of the food items that make up the menu
+ the type of cuisine, 
+ the price of the menu item.

| ID  | FID | RID   | CUISINE           | PRICE |
|-----|-----|-------|-------------------|-------|
| 0   | 0   | 567335| Beverages,Pizzas  | 40.0  |
| 0   | 669322| 567335| Beverages,Pizzas | 40.0  |
| 328 | 0   | 158203| Beverages         | 65.0  |
| 328 | 669322| 158203| Beverages         | 65.0  |
| 449 | 0   | 158203| Beverages         | 65.0  |

{% enddocs %}

{% docs orders_docs %}

### `stg_orders`
The Orders table contains information about the orders placed by users on the app. This table stores the:
+ order date, 
+ quantity of items ordered & total sales amount, **(dummy generated and thus not used)**
+ currency used for the order,
+ unique identifier of the user who placed the order, 
+ unique identifier of the restaurant from which the order was placed.

| ORDER_DATE | SALES_QTY | SALES_AMT | CURRENCY | UID   | RID   |
|------------|-----------|-----------|----------|-------|-------|
| 2017-10-10 | 100       | 41241     | INR      | 49226 | 567335|
| 2018-05-08 | 3         | -1        | INR      | 77359 | 531342|
| 2018-04-06 | 1         | 875       | INR      | 5321  | 158203|
| 2018-04-11 | 1         | 583       | INR      | 21343 | 187912|
| 2018-06-18 | 6         | 7176      | INR      | 75378 | 543530|

{% enddocs %}

{% docs restaurant_docs %}

### `stg_retaurant`
The Restaurant table contains information about the restaurants available on the app. This table stores the:
+ unique identifier of the restaurant, 
+ its name, 
+ location, 
+ average rating, 
+ number of ratings and reviews received, 
+ an estimate of the average cost per person for a meal, 
+ the type of cuisine offered, license number, 
+ link to its website.

| ID    | NAME               | CITY   | RATING | RATING_CNT | COST | CUISINE                        | LIC_NO          | LINK                                                                                                              |
|-------|--------------------|--------|--------|------------|------|--------------------------------|-----------------|-------------------------------------------------------------------------------------------------------------------|
| 567335| AB FOODS POINT     | Abohar | NULL   | 1          | 200  | Beverages,Pizzas               | 22100000000000 | [AB FOODS POINT](https://www.swiggy.com/restaurants/ab-foods-point-central-abohar-abohar-567335)                |
| 531342| Janta Sweet House  | Abohar | 4      | 51         | 200  | Sweets,Bakery                  | 12100000000000 | [Janta Sweet House](https://www.swiggy.com/restaurants/janta-sweet-house-central-abohar-abohar-531342)          |
| 158203| theka coffee desi | Abohar | 4      | 101        | 100  | Beverages                      | 22100000000000 | [theka coffee desi](https://www.swiggy.com/restaurants/theka-coffee-desi-central-raipura-abohar-158203)         |
| 187912| Singh Hut          | Abohar | 4      | 21         | 250  | Fast Food,Indian               | 22100000000000 | [Singh Hut](https://www.swiggy.com/restaurants/singh-hut-nehru-park-main-bazar-abohar-187912)                   |
| 543530| GRILL MASTERS      | Abohar | NULL   | 1          | 250  | Italian-American,Fast Food     | 12100000000000 | [GRILL MASTERS](https://www.swiggy.com/restaurants/grill-masters-central-abohar-abohar-543530)                   |

{% enddocs %}

{% docs users_docs %}

### `stg_users`
The Users table contains credentials about the users registered on the app. This table stores the:
+ unique identifier of the user, 
+ their name, email address, encrypted password, **(dummy generated and thus not used)**
+ age, gender, marital status, 
+ occupation, monthly income, highest educational qualifications, and the number of people in their family.

| ID | NAME             | EMAIL                                | PASSWORD   | AGE | GENDER | MARRIED | OCCUPATION | M_INCOME | EDU_Q         | F_SIZE |
|----|------------------|--------------------------------------|------------|-----|--------|---------|------------|----------|---------------|--------|
| 1  | Claire Ferguson  | fordanthony@example.net              | NKz0fWDh!5 | 20  | female | false   | Student    | NULL     | Post Graduate | 4      |
| 2  | Jennifer Young   | ann96@example.com                    | NULL       | 24  | female | false   | Student    | 1        | Graduate      | 3      |
| 3  | Jermaine Roberson| uwalker@example.org                  | eO4GqGusF( | 22  | male   | false   | Student    | 1        | Post Graduate | 3      |
| 4  | Rachel Carpenter | kimberlypatterson@example.net        | d^c7O6odaS | 22  | female | false   | Student    | NULL     | Graduate      | 6      |
| 5  | Shawn Parker     | daniellebennett@example.com          | 8J#E5RMl1o | 22  | male   | false   | Student    | 1        | Post Graduate | 4      |


{% enddocs %}

---

&copy; 2024 Kingsley Izima
