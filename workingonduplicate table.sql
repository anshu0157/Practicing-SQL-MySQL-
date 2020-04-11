use employees;
alter table dept_dup modify column dept_no char(4) null;



create table dept_manager_dup(
emp_no int(11) not null,
dept_no char(4) null,
from_date date not null,
to_date date null
);

insert into dept_manager_dup
select * from dept_manager;

select * from dept_manager_dup;


insert into dept_manager_dup(emp_no,from_date)
values  (999904, '2017-01-01'),

		(999905, '2017-01-01'),

		(999906, '2017-01-01'),

		(999907, '2017-01-01');
        
        
delete from dept_manager_dup where dept_no='d001';



insert into dept_dup (dept_name) values ('public relations');

alter table dept_dup
drop primary key;

select * from dept_dup;

delete from dept_dup where dept_no= 'd002';

update dept_dup set dept_name=null where dept_no='d010';
