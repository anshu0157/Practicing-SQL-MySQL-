use employees;

SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager dm
        WHERE
            dm.dept_no IN (SELECT 
                    d.dept_no
                FROM
                    departments d))
order by first_name;
                    
                    
select * from departments;


SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager dm)
order by first_name;

select dm.* from dept_manager dm where dm.emp_no in (select e.emp_no from employees e where e.hire_date between '1990-01-01' and '1995-01-01');
select hire_date from employees where emp_no in (110420,111877);



select * from employees e where exists (select * from titles t where e.emp_no =t.emp_no and title = 'assistant engineer') limit 50;
select emp_no from titles where title = 'assistant engineer' limit 50;

