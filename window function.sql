--Ranking function
--row number

select
*
,row_number() over (partition by emp_department) as row_number
from employees

--rank
select
*
,rank() over (partition by emp_department) as row_number
from employees

--dense_rank

select
*
,dense_rank() over (partition by emp_department) as row_number
from employees

--NTILE(n)
select
*
,ntile(2) over (order by salary desc) as split_group
from employees

--Aggregate window function
--SUM()
select
*
,sum(salary) over (partition by emp_department) as dept_total_salary
from employees

--count

select
*
,count(*) over (partition by emp_department) as dept_total_salary
from employees

--AVG
select
*
,avg(salary) over (partition by emp_department) as dept_total_salary
from employees

--running total(cumulative sum)

select
emp_name,
emp_department,
hire_date,
salary,
sum(salary) over (order by hire_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
 AS running_total
 from employees
 

select
*
,row_number() over (partition by emp_department order by salary desc) as row_number
from employees


---value function
--LAG()

select
emp_name,
emp_department,
hire_date,
salary,
lag(salary) over order by hire_date asc) as prev_salary
from employees

--LEAD()
select
emp_name,
emp_department,
hire_date,
salary,
lead(salary) over order by hire_date asc) as prev_salary
from employees

--partition on lag/lead

select
emp_name,
emp_department,
hire_date,
salary,
lag(salary) over (partition by emp_department order by hire_date asc) as prev_salary
from employees
