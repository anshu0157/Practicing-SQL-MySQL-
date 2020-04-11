use employees;
select * from dept_dup order by dept_no;
select * from dept_manager_dup order by dept_no;
select * from employees order by emp_no limit 200;

SELECT 
    t1.emp_no, t3.first_name, t3.last_name,t3.gender,t3.birth_date, t2.dept_name,count(first_name)
FROM
    dept_manager_dup t1
        JOIN
    dept_dup t2
        JOIN
    employees t3 ON t1.dept_no = t2.dept_no
        AND t1.emp_no = t3.emp_no group by first_name
LIMIT 50;