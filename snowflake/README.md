# Snowflake Database

## Source tables

All tables were extracted and loaded into a `Snowflake` data warehouse then referenced by `dbt`. Documentation for all six tables with full description is found [here](https://github.com/kayazay/zomato_analytics/blob/main/dbt/README.md). The schema for these source tables can be found below:

<iframe width="560" height="315" src='https://dbdiagram.io/e/65c145a8ac844320ae806ca9/65d4bd27ac844320ae95ce1d'> </iframe>

### DSL for Entity Relationship Diagram found here

```dsl
Table food {
  id NUMBER PK
	item VARCHAR
	veg BOOLEAN
}

Table restaurant {
  id NUMBER PK
  name VARCHAR
  city VARCHAR
  rating NUMBER
  rating_cnt NUMBER
  cost VARCHAR
  cuisine VARCHAR
  lic_no NUMBER
  link VARCHAR
}

Table users {
  id INTEGER PK
  name VARCHAR
  email VARCHAR
  password VARCHAR
  age NUMBER
  gender VARCHAR
  married BOOLEAN
  occupation VARCHAR
  monthly_income NUMBER
  edu_q VARCHAR
  f_size NUMBER
}

Table menu {
  id NUMBER PK
  rid NUMBER
  fid NUMBER
  cuisine VARCHAR
  price FLOAT
}

Table orders {
  order_date DATE
  uid NUMBER
  rid NUMBER
  sales_qty NUMBER
  sales_amt NUMBER
  currency VARCHAR
}

Table countries {
  country VARCHAR
  nationality VARCHAR
}

Ref: food.id < menu.fid

Ref: restaurant.id < menu.rid

Ref: restaurant.id < orders.rid

Ref: users.id < orders.uid
```

## How to Reproduce

1. Fork this repository and clone to your local environment then `cd` to the `/snowflake` folder.

1. Setup your Snowflake environment and use `ACCOUNTADMIN` permissions to run the queries contained in this folder in the described order: 

      + **initDatabase** - create warehouse, datebases, and schema
      
      + create internal stage in already created schema and upload csv files to it

      + **copyData**- creates all six tables, copies data from internal stage, and loads into tables

      + **newCredential**- create new user, role and grant necessary permission to interact with transformed data from a BI tool
