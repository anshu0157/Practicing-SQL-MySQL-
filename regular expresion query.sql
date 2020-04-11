select distinct first_name  from employees.employees where first_name regexp '^[aeiou]';
select distinct first_name from employees.employees where first_name regexp '^[^aeiou]';
select distinct first_name from employees.employees where first_name regexp '[aeiou]$';
select distinct first_name from employees.employees where first_name regexp '[^aeiou]$';
select distinct first_name from employees.employees where first_name regexp '^[aeiou].|[aeiou]$';
select distinct first_name from employees.employees where first_name regexp '^[aeiou]';
select distinct first_name from employees.employees where first_name regexp  '^[a,e,i,o,u].*[a,e,i,o,u]$';