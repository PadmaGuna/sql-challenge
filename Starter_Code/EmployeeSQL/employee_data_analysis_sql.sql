/*select count(*) from employees;
select count(*) from departments;
select count(*) from dept_emp;
select count(*) from dept_manager;
select count(*) from salaries;
select count(*) from titles;*/
/*1*/
SELECT e.emp_no, e.emp_last_name, e.emp_first_name, e.emp_sex, s.salary
FROM employees e
INNER JOIN salaries s ON
    e.emp_no = s.emp_no;

/*2*/
SELECT e.emp_first_name, e.emp_last_name, e.emp_hire_date
FROM employees e
WHERE emp_hire_date between '1986-01-01' and '1986-12-31';

/*3*/
SELECT d.dept_no, d.dept_name, dm.emp_no, e.emp_last_name, e.emp_first_name
FROM employees e
INNER Join dept_manager dm on e.emp_no = dm.emp_no
INNER JOIN departments d ON dm.dept_no = d.dept_no;

/*4*/
SELECT d.dept_no, de.emp_no, e.emp_last_name, e.emp_first_name, d.dept_name 
FROM employees e
LEFT OUTER Join dept_emp de on e.emp_no = de.emp_no
LEFT OUTER JOIN departments d ON de.dept_no = d.dept_no;

/*5*/
SELECT e.emp_first_name, e.emp_last_name, e.emp_sex
FROM employees e
where e.emp_first_name = 'Hercules' and e.emp_last_name LIKE 'B%';

/*6*/
select e.emp_no, e.emp_last_name, e.emp_first_name
from employees e
Inner join dept_emp de on e.emp_no = de.emp_no
where de.dept_no IN
    (select d.dept_no
     from departments d
     where dept_name = 'Sales');
    
/*7*/
select e.emp_no, e.emp_last_name, e.emp_first_name, d.dept_name
from employees e
Inner join dept_emp de on e.emp_no = de.emp_no
INNER JOIN departments d on d.dept_no = de.dept_no and 
 			de.dept_no IN
   			 (select d.dept_no
    			 from departments d
    			 where dept_name = 'Sales' OR dept_name = 'Development');

/*8*/
select e.emp_last_name, count(e.emp_no) as "Frequency"
from employees e
group by e.emp_last_name
order by "Frequency" DESC;


