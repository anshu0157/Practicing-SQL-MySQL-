use employees;
DELIMITER $$
drop procedure if exists  employee_info;
create procedure employee_info(in first_n varchar(255),in last_n varchar(255),out emp_number int)
BEGIN
select emp_no into emp_number from employees where first_name = first_n and last_name=last_n;
END$$
DELIMITER ;