with restaurant AS (
    select * from {{ref ('stg_restaurant') }}
)

select * from restaurant 
where rating > 5
