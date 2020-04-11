CREATE TABLE if not exists departments_dup (
    dept_no CHAR(4) not null,
    dept_name VARCHAR(300) not null,
    primary key (dept_no),
    unique key (dept_name)
);
select * from departments_dup
commit;
insert into departments_dup 
select * from departments;
commit;
update departments_dup 
set dept_name='singar vala' where dept_no='d009';
select * from departments_dup;