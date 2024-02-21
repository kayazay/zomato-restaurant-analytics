-- FILE FORMAT FOR ALL CSVS TO BE COPIED
CREATE OR REPLACE FILE FORMAT allcsv
    TYPE = 'CSV'
    FIELD_DELIMITER = '|'
    SKIP_HEADER = 1
    DATE_FORMAT = 'DD/MM/YYYY';

-- CREATION OF TABLES AND COPY HERE
-- 1. food table
CREATE OR REPLACE TABLE raw.zomato.food (
    f_id VARCHAR,
    item VARCHAR,
    veg_or_non_veg VARCHAR
);
COPY INTO raw.zomato.food (f_id, item, veg_or_non_veg)
FROM @zmt/food
file_format = (format_name=allcsv);

-- 2. menu table
CREATE OR REPLACE TABLE raw.zomato.menu (
    menu_id VARCHAR,
    r_id VARCHAR,
    f_id VARCHAR,
    cuisine VARCHAR,
    price VARCHAR
);
COPY INTO raw.zomato.menu (menu_id, r_id, f_id, cuisine, price)
FROM @zmt/menu
file_format = (format_name=allcsv);

-- orders table
CREATE OR REPLACE TABLE raw.zomato.orders (
    order_date DATE,
    sales_qty INTEGER,
    sales_amount INTEGER,
    currency VARCHAR,
    user_id INTEGER,
    r_id INTEGER
);
COPY INTO raw.zomato.orders 
(order_date, sales_qty, sales_amount, currency, user_id, r_id)
FROM @zmt/orders
file_format = (format_name=allcsv);

-- restaurant table
CREATE OR REPLACE TABLE raw.zomato.restaurant (
    id VARCHAR,
    name VARCHAR,
    city VARCHAR,
    rating VARCHAR,
    rating_count VARCHAR,
    cost VARCHAR,
    cuisine VARCHAR,
    lic_no VARCHAR,
    link VARCHAR
);
COPY INTO raw.zomato.restaurant 
(id,name,city,rating,rating_count,cost,cuisine, lic_no,link)
FROM @zmt/restaurant
file_format = (format_name=allcsv);

-- users table
CREATE OR REPLACE TABLE raw.zomato.users (
    user_id INTEGER,
    name VARCHAR,
    email VARCHAR,
    password VARCHAR,
    age INTEGER,
    gender VARCHAR,
    marital_status VARCHAR,
    occupation VARCHAR,
    monthly_income VARCHAR,
    educational_qualifications VARCHAR,
    family_size INTEGER
);
COPY INTO raw.zomato.users (user_id,name,email,password,age,gender,marital_status,occupation,monthly_income,educational_qualifications,family_size)
FROM @zmt/users
file_format = (format_name=allcsv);

-- countries table
CREATE OR REPLACE TABLE raw.zomato.countries (
    en_short_name VARCHAR, 
    nationality VARCHAR
);
COPY INTO raw.zomato.countries
FROM (SELECT $4,$5 FROM @zmt/countries)
file_format = (format_name=allcsv);
