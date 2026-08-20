/*
CREATE TABLE january_jobs AS
    SELECT * 
    FROM
    job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) =1;

CREATE TABLE february_jobs AS
    SELECT * 
    FROM
    job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) =2;


CREATE TABLE march_jobs AS
    SELECT * 
    FROM
    job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) =3;
*/

    --SELECT * FROM march_jobs;



--CASE EXPRESSION TUTORIAL

SELECT
    COUNT(job_id) AS number_of_jobs,
    --job_title_short,
    --job_location,
    CASE
        WHEN job_location='Anywhere' THEN 'Remote' 
        WHEN job_location='New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM
     job_postings_fact
     WHERE
        job_title_short='Data Analyst'
GROUP BY 
    location_category;






--CASE EXPRESSION PRACTICE PROBLEM

SELECT
    job_title_short,
    job_location,
    salary_year_avg,
    CASE
        WHEN salary_year_avg >0 AND salary_year_avg<50000 THEN 'Low Salary'
        WHEN salary_year_avg >=50000 AND salary_year_avg <= 130000 THEN 'Standard Salary'
        WHEN salary_year_avg >130000 THEN 'High Salary'
        ELSE NULL
    END AS compensation_bracket
FROM 
    job_postings_fact 
    WHERE 
        job_title_short='Data Analyst'
    ORDER BY 
       salary_year_avg;        






