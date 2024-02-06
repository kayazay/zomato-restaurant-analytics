select
    user_id AS id,
    name,
    email,
    password,
    age,
    LOWER(gender) AS gender,
    CASE 
        WHEN marital_status='Single' THEN True
        WHEN marital_status='Married' THEN False
    END as married,
    REPLACE(occupation,'Self Employeed','Self Employed') AS occupation,
    to_number(CASE
        WHEN monthly_income='Below Rs.10000' THEN 1
        WHEN monthly_income='10001 to 25000' THEN 10001
        WHEN monthly_income='25001 to 50000' THEN 25001
        WHEN monthly_income='More than 50000' THEN 50001
        WHEN monthly_income='No Income' THEN null
    END) AS m_income,
    educational_qualifications AS edu_q,
    family_size AS f_size
from
    raw.zomato.users