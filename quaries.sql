--1. 
--checking employees and salary tables
select * from employees;
select * from salaries;
----
select emp.employee_no, emp.last_name, emp.first_name, emp.gender, sal.salary
from employees emp, salaries sal
where emp.employee_no = sal.employee_no
order by "salary" desc
;

--2. 
select employee_no, first_name, last_name, hire_date
from employees
where hire_date
	between '1986-01-01' and '1986-12-31'
order by "hire_date" asc
;

--3. 
--- checking dept_manager and department tables
select * from department;
select * from dept_manager;
----
select dep.department_no, dep.department_name, emp.employee_no, emp.last_name, emp.first_name, dept_manager.from_date, dept_manager.to_date
from employees emp 
join dept_manager on dept_manager.employee_no = emp.employee_no
inner join department dep on dep.department_no =  dept_manager.department_no
;

--4. 
select emp.employee_no, emp.last_name, emp.first_name, dep.department_name
from employees emp
join dept_emp 
on dept_emp.employee_no = emp.employee_no
inner join department dep 
on dep.department_no =  dept_emp.department_no
;

--5. 
select first_name, last_name
from employees
where first_name = 'Hercules' and last_name like 'B%'
order by last_name
;

--6. 
select emp.employee_no, emp.last_name, emp.first_name, dep.department_name
from employees emp
join dept_emp on dept_emp.employee_no = emp.employee_no 
inner join department dep on dep.department_no =  dept_emp.department_no
where dep.department_name in ('Sales')
; 

--7.
select emp.employee_no, emp.last_name, emp.first_name, dep.department_name 
from employees emp 
join dept_emp on dept_emp.employee_no = emp.employee_no 
inner join department dep on dep.department_no = dept_emp.department_no
where dep.department_name in ('Sales', 'Development') 
group by dep.department_name, emp.employee_no
;

--8. 
select last_name, count(last_name) as "Lastname_count"
from employees
group by last_name
order by "Lastname_count" desc
;