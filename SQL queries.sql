use employees;
select* from dept_dup;
alter table dept_dup 
add column department_nmanager varchar(255);
alter table  dept_dup
rename column department_nmanager to dept_manager;
select dept_no,ifnull(dept_name,'null value')  from dept_dup;
insert into dept_dup(dept_no,dept_name) values('d010','chaivala');
insert into dept_dup(dept_no) values ('d012');
rename table dept_dup to dept_dup;
alter table  dept_dup 
modify column dept_name varchar(255) default null;


select dept_no,dept_name,coalesce(dept_name,dept_no) as dept_info from dept_dup order by dept_no asc;