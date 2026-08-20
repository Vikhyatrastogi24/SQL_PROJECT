SELECT 
    job_title_short,
    company_id,
    job_location
FROM 
    january_jobs    


UNION 


SELECT 
    job_title_short,
    company_id,
    job_location
FROM 
    february_jobs


UNION



SELECT 
    job_title_short,
    company_id,
    job_location
FROM 
    march_jobs




 --PRACTICE PROBLEM 
 /*  
 get the corresponding skill and skill type for each job posting in q1 

 includes those without any skills too 

 Why? look at the skills and the type for each job in the first quarter that has a salary > 70000
 */   
WITH quarter_1_data AS(
SELECT 
   DISTINCT job_title_short  ,
    job_id,
    salary_year_avg
FROM 
    january_jobs    
    WHERE 
        salary_year_avg>70000
UNION 

SELECT 
    DISTINCT job_title_short,
    job_id,
    salary_year_avg
FROM 
    february_jobs
    WHERE 
        salary_year_avg>70000

UNION

SELECT 
    DISTINCT job_title_short,
    job_id,
    salary_year_avg
FROM 
    march_jobs
    WHERE 
        salary_year_avg>70000
)
SELECT
      quarter_1_data.job_id,
      quarter_1_data.job_title_short,
      quarter_1_data.salary_year_avg,
      skills.skill_id,
      skills_dim.skills,
      skills_dim.type
FROM quarter_1_data
LEFT JOIN skills_job_dim AS skills ON skills.job_id=quarter_1_data.job_id   
LEFT JOIN skills_dim ON skills_dim.skill_id=skills.skill_id
ORDER BY 
salary_year_avg DESC;




