CREATE DATABASE datascience_jobs;
USE datascience_jobs;
Select * from salaries;

-- 1. What is the average salary fro all jobs in the dataset ?
Select AVG(salary_in_usd) as Averagesal from salaries;

-- 2. What is the highest salary for each jobtitle in the dataset?
Select job_title,Max(salary_in_usd) from salaries
group by job_title
order by 2 Desc;

-- 3. What is the average salary for data scientists in US?
Select Avg(salary_in_usd) from salaries
where job_title = 'Data Scientist' and employee_residence = 'US';

-- 4. What is the number of jobs available for each job title?
Select Job_title,count(job_title) as cnt from salaries
group by job_title
order by 2 desc;

-- 5. What is the total salary paid for all data analyst jobs in DE?
Select SUM(salary_in_usd) as total_salary_paid 
from salaries
where job_title= 'data analyst' and employee_residence = 'DE';

-- 6. What are the top 5 highest paying job titles and their corresponding average salaries?
Select job_title,Round(AVG(salary_in_usd),2) from salaries
group by job_title
order by 2 Desc
Limit 5;

-- 7. What is the number of jobs available in each location?
Select employee_residence,count(job_title) as no_of_jobs
from salaries
group by employee_residence
order by no_of_jobs Desc;

-- 8. What are the top 3 job titles that have the most jobs available in the dataset?
Select job_title,count(job_title) as avalible_jobs
from salaries
group by job_title
order by avalible_jobs Desc
Limit 3;

-- 11. What is the average salary for each job title, and what is the total number of jobs available for each job title?
Select job_title,avg(salary_in_usd) as Averagesal,count(job_title) as no_of_jobs
from salaries
group by job_title
order by no_of_jobs desc,Averagesal desc;

 -- 12. What are the top 5 job titles with the highest total salaries, 
 -- and what is the total number of jobs available for each job title?
 
 Select job_title,sum(salary_in_usd) as total_salary,count(job_title)
 from salaries
 group by job_title
 order by total_salary desc
 limit 5;

 -- 13. What are the top 5 locations with the highest total salaries, 
 -- and what is the total number of jobs available for each location?
 Select employee_residence,sum(salary_in_usd) as total_salary,count(job_title)
 from salaries
 group by employee_residence
 order by total_salary desc
 limit 5;
 
 -- 14. What is the average salary for each job title in each location, 
 -- and what is the total number of jobs available for each job title in each location?
 
 Select job_title,employee_residence as location,AVG(salary_in_usd) as Averagesal,count(job_title) as avalivle_jobs
 from salaries
 group by job_title,location
 order by total_salary desc;
 
 
-- 15. What is the average salary for each job title in each location, 
-- and what is the percentage of jobs for each job title in each location?
SELECT job_title,employee_residence, AVG(salary) As average_salary,
round(COUNT(*) * 100 / (SELECT COUNT(*) FROM salaries WHERE employee_residence = s.employee_residence),2) AS job_percentage 
FROM salaries AS s
GROUP BY job_title,employee_residence;

-- 15. What is the total number of jobs available for each year of experience,
-- and what is the average salary for each year of experience?
Select work_year,AVG(salary_in_usd) as averagesal,count(job_title) as no_of_jobs
from salaries
group by work_year
order by no_of_jobs Desc;

-- 19. What are the top 5 job titles with the highest average salaries in each location?
Select job_title,employee_residence,AVG(salary_in_usd) as averagesal
from salaries
group by job_title,employee_residence
order by 3 Desc
limit 5;


 
 
 
 