select
    user_id AS id,
    name,
    email,
    password,
    age,
    LOWER(gender) AS gender,
    CASE marital_status
        WHEN 'Single' THEN False
        WHEN 'Married' THEN True
    END as married,
    REPLACE(occupation,'Self Employeed','Self Employed') AS occupation,
    to_number(
        CASE monthly_income
        -- convert monthly income to numeric value
            WHEN 'Below Rs.10000' THEN 1
            WHEN '10001 to 25000' THEN 10001
            WHEN '25001 to 50000' THEN 25001
            WHEN 'More than 50000' THEN 50001
            WHEN 'No Income' THEN null END
    ) AS m_income,
    educational_qualifications AS edu_q,
    family_size AS f_size
from
    raw.zomato.users