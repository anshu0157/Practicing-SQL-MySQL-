select * from employees.departments;
select * from employees.dept_manager;

SELECT 
    dm.emp_no, dm.dept_no, d.dept_name, dm.from_date
FROM
    employees.dept_manager dm
        CROSS JOIN
    employees.departments d
ORDER BY dm.emp_no , d.dept_no;


SELECT 
    dm.emp_no, dm.dept_no, d.dept_name, dm.from_date
FROM
    employees.dept_manager dm
      join
    employees.departments d
ORDER BY dm.emp_no , d.dept_no;


select e.*,d.*,count(emp_no)
from employees.employees e
cross join
employees.departments d 
where e.emp_no <10011
group by e.emp_no
order by e.emp_no,d.dept_name;

CREATE TABLE employees.employees_dup (
    emp_no INT,
    birth_date DATE,
    first_name VARCHAR(14),
    last_name VARCHAR(16),
    gender ENUM('M', 'F'),
    hire_date DATE
);

insert into employees.employees_dup 
select * from employees.employees
limit 30;

select * from employees.employees_dup;


SELECT 
    *
FROM
    (SELECT 
        e.emp_no,
            e.first_name,
            e.last_name,
            NULL AS dept_no,
            NULL AS from_date
    FROM
        employees.employees e
    WHERE
        e.last_name = 'denis' UNION ALL SELECT 
        NULL AS emp_no,
            NULL AS first_name,
            NULL AS last_name,
            dm.dept_no,
            dm.from_date
    FROM
        employees.dept_manager dm) AS a
ORDER BY - a.emp_no DESC;