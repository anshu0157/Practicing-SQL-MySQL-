set @v_emp_no=0;
call employee_info('aruna','journel',@v_emp_no);
select @v_emp_no;