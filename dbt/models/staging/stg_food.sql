with numbered_fid as (
select
    -- removes fd and converts to number, or else null
    try_to_number(trim(f_id, 'fd')) as id,
    item,
    CASE veg_or_non_veg
    -- reduces column to true or false based on whether food item is vegetarian or not
        WHEN 'Veg' THEN True
        WHEN 'Non-veg' THEN False
        ELSE null
    END AS veg
from
    {{ source('zomato','food') }}
)
select * from numbered_fid 
where id IS NOT NULL
