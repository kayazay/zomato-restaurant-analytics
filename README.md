# Zomato Restaurant 🍜 ELT Project
![zmt_real](https://github.com/kayazay/zomato_analytics/assets/60517587/7331a97e-e230-4e46-86e9-f84009fadcd9)

![zmt_2](https://github.com/kayazay/zomato_analytics/assets/60517587/5e73ef08-4912-4790-bcaa-902f8f6f4578)

This is an end to end ELT data engineering project. This project uses the Zomato Restaurant dataset, an Indian multinational restaurant aggregator and food delivery company. Founded in 2008 by Deepinder Goyal and Pankaj Chadda, the Zomato app is an online food ordering and delivery platform that helps you place a food order from the restaurant registered on Zomato, and get it delivered on your doorsteps.

## Problem Description
The purpose of this project is to make an end to end data pipeline which:

+ Extracts the Zomato data from a Kaggle dataset
+ Loads this data into Snowflake data warehouse
+ Transform loaded data using dbt applying Kimbal Dimensional Modeling
+ Build a Tableau report to visualize data

## Technology Stack
1. Snowflake for data warehouse
1. dbt for transformation and data modeling
1. Tableau for data visualization

## Data Pipeline Architecture

![zomato_etl](https://github.com/kayazay/zomato_analytics/assets/60517587/f4fd8397-c476-46ab-a7b1-1cb7baab22c3)

## DAG for dbt 
I used the Kimball Dimensional modeling principle to create facts and dimension tables from staging models in the dbt project. The exact order is:

> **source tables &rarr; staging models &rarr; facts and dimension tables**

![dag](https://github.com/kayazay/zomato_analytics/assets/60517587/6b1e6c3a-5e28-4acd-9e12-a08ffbfe5b4a)

## Tableau Report
I created four dashboards on Tableau from facts and dimension tables built out of dbt, then incorporated them all into one report with appropriate controls like filters and legends. The four dashboards are:


### `food`
![FOOD](https://github.com/kayazay/zomato_analytics/assets/60517587/e5460928-6e7a-4af1-9b0f-ee0314db7b08)

### `cuisine`
![CUISINE](https://github.com/kayazay/zomato_analytics/assets/60517587/f69e7e76-2321-47a2-894b-9b551636150c)

### `orders`
![ORDERS](https://github.com/kayazay/zomato_analytics/assets/60517587/e72c1366-9196-4ee8-9161-7a98efc0ac24)

### `restaurant`
![RST](https://github.com/kayazay/zomato_analytics/assets/60517587/aa8635ac-d39d-40e7-b4ae-ae7e4d424d5e)

Here is the [interactive report](https://public.tableau.com/shared/9332P3HXW?:display_count=n&:origin=viz_share_link) on my Tableau profile.



<div class='tableauPlaceholder' id='viz1708518394238' style='position: relative'><noscript><a href='#'><img alt=' ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;7C&#47;7CP9C97Q8&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz'  style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='path' value='shared&#47;7CP9C97Q8' /> <param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;7C&#47;7CP9C97Q8&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /><param name='language' value='en-US' /></object></div>                <script type='text/javascript'>                    var divElement = document.getElementById('viz1708518394238');                    var vizElement = divElement.getElementsByTagName('object')[0];                    vizElement.style.width='100%';vizElement.style.height=(divElement.offsetWidth*0.75)+'px';                    var scriptElement = document.createElement('script');                    scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';                    vizElement.parentNode.insertBefore(scriptElement, vizElement);                </script>