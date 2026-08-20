/*SELECT 
     COUNT (job_id) AS job_posted_count,    
      EXTRACT(MONTH FROM job_posted_date) AS month
FROM 
    job_postings_fact    
    WHERE
    job_title_short='Data Analyst'  
    GROUP BY
    month 
    ORDER BY 
    job_posted_count DESC;  */

-- practice problem 1
   SELECT 
         AVG (salary_year_avg) AS year_avg,
         AVG (salary_hour_avg)AS hour_avg,
        job_posted_date :: DATE AS date,
         job_schedule_type
        FROM 
            job_postings_fact
            WHERE 
                  job_posted_date > '2023-06-01'
                GROUP BY
                  job_posted_date:: DATE,                
                 job_schedule_type
            ORDER BY
                    date ;

