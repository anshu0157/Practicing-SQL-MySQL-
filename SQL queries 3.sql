select * ,count(emp_no) as 'no_of_employees' from employees.employees where emp_no between 400000 and 500000 group by first_name having gender='m' order by emp_no desc limit 100 ;
use employees;
select * from employees order by emp_no desc;
commit;
update employees set birth_date='1980-02-2',first_name='anshu',gender='m';
rollback;

drop database employees;
select * from employees;