use employees;
/*Exercise 1:
Starting your code with “DROP TABLE”, create a table called “emp_manager” (emp_no – integer of 11, not null; 
dept_no – CHAR of 4, null; manager_no – integer of 11, not null). 
*/

drop table if exists emp_manager;
create table emp_manager(
emp_no int not  null,
dept_no char(4) default null,
manager_no int not null
);
/*Exercise 2:

Fill emp_manager with data about employees, the number of the department they are working in, and their managers.
Your query skeleton must be:
Insert INTO emp_manager SELECT
U.*
FROM
                (A)
UNION (B) UNION (C) UNION (D) AS U;
A and B should be the same subsets used in the last lecture (SQL Subqueries Nested in SELECT and FROM). In other words, assign employee number 110022 as a manager to all employees from 10001 to 10020 (this must be subset A), and employee number 110039 as a manager to all employees from 10021 to 10040 (this must be subset B).
Use the structure of subset A to create subset C, where you must assign employee number 110039 as a manager to employee 110022.
Following the same logic, create subset D. Here you must do the opposite - assign employee 110022 as a manager to employee 110039.
Your output must contain 41 rows.
*/
insert into emp_manager
select U.* from
(select A.* from
(select e.emp_no as emp_id,d.dept_no as dept_code,
(select emp_no from dept_emp where emp_no = 10022) as manager_id
from employees e join dept_emp d on e.emp_no = d.emp_no
where e.emp_no <=10020
group by e.emp_no
order by e.emp_no) as A

UNION

select B.* from
(select e.emp_no as emp_id,d.dept_no as dept_code,
(select emp_no from dept_emp where emp_no = 10039) as manager_id
from employees e join dept_emp d on e.emp_no = d.emp_no
where e.emp_no between 10021 and 10040
group by e.emp_no
order by e.emp_no) as B

UNION all

select C.* from 
(select e.emp_no as emp_id,min(d.dept_no) as dept_code,
(select emp_no from dept_emp where emp_no = 10039) as manager_id
from employees e join dept_emp d on e.emp_no = d.emp_no
where e.emp_no =10022
group by e.emp_no) as C

UNION 

select D.* from
(select e.emp_no as emp_id,d.dept_no as dept_code,
(select emp_no from dept_emp where emp_no = 10022) as manager_id
from employees e join dept_emp d on e.emp_no = d.emp_no
where e.emp_no =10039
group by e.emp_no
order by e.emp_no) as D) as U;
select * from emp_manager;
truncate table emp_manager;