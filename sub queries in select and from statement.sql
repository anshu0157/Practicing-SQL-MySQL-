use employees;


/*Assign employee no 110022 as a manager to all employees from emp_no 10001 to 10020 and
 employee number 110039 as a manager to all employee from 10021 to 10040*/

SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS emp_id,
            d.dept_no AS dept_code,
            (SELECT 
                    emp_no
                FROM
                    dept_emp
                WHERE
                    emp_no = 110022) AS manager_id
    FROM
        employees e
    JOIN dept_emp d ON e.emp_no = d.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A 
UNION SELECT 
    B.*
FROM
    (SELECT 
        e.emp_no AS emp_id,
            d.dept_no AS dept_code,
            (SELECT 
                    emp_no
                FROM
                    dept_emp
                WHERE
                    emp_no = 110039) AS manager_id
    FROM
        employees e
    JOIN dept_emp d ON e.emp_no = d.emp_no
    WHERE
        e.emp_no BETWEEN 10021 AND 10040
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS B;