use employees;
Delimiter $$
create procedure selecting()
begin
select * from employees.employees;
end$$
Delimiter ;