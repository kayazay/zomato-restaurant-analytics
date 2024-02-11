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
    CASE occupation
        WHEN 'Self Employeed' THEN 'Self Employed'
        WHEN 'House wife' THEN 'House Wife'
        ELSE occupation
    END AS occupation,
    to_number(
        CASE monthly_income
        -- convert monthly income to numeric value
            WHEN 'Below Rs.10000' THEN 1
            WHEN '10001 to 25000' THEN 10001
            WHEN '25001 to 50000' THEN 25001
            WHEN 'More than 50000' THEN 50001
            WHEN 'No Income' THEN null END
    ) AS m_income,
    CASE educational_qualifications
        WHEN 'School' THEN 'High School'
        ELSE educational_qualifications 
    END AS edu_q,
    family_size AS f_size
from
    {{ source('zomato','users') }}