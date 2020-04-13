/*SQL views*/
use employees;
create view v_avg_salary as select round(avg(salary),2) from salaries;
select * from v_avg_salary;