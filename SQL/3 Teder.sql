-- SQL HomeWork 3. Joins 
-- 
select * from employees;		-- (работники) id , employee_name , email
select * from salary;			-- (зарплата) id , monthly_salary monhtly_salary
select * from employee_salary; 	-- (зарплата работников)id , employee_id , salary_id
select * from roles;  			-- (должность)id , role_name
select * from roles_employee; 	-- (зарплата должности) id , employee_id , role_id

--1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.

select  employee_name, monthly_salary  
from employees
join employee_salary 
on employees.id = employee_salary.employee_id
join salary 
on employee_salary.salary_id = salary.id;



-- 2. Вывести всех работников у которых ЗП меньше 2000.

select employee_name, monthly_salary 
from employees
join employee_salary
on employees.id = employee_salary.employee_id
join salary
on employee_salary.salary_id = salary.id 
where monthly_salary < 2000;

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select employee_name, monthly_salary 
from salary
join employee_salary
on salary.id = employee_salary. salary_id 
left join employees
on employee_salary.employee_id = employees.id 
where employee_name is null;

select employee_name, monthly_salary 
from employees 
right join employee_salary 
on employees.id=employee_salary.employee_id 
join salary 
on salary_id=salary.id 
where employee_name is null; 

-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select employee_name, monthly_salary
from salary as s
join employee_salary as es
on s.id = es.salary_id
left join employees as e
on  es.employee_id = e.id 
where monthly_salary < 2000 and employee_name is null
order by monthly_salary;


-- 5. Найти всех работников кому не начислена ЗП.

select employee_name, monthly_salary
from salary s 
right join employee_salary es 
on s.id = es.salary_id 
right join employees e 
on es.employee_id = e.id 
where monthly_salary is null;


select employee_name, monthly_salary 
from employees e 
left join employee_salary es 
on e.id = es.employee_id 
left join salary s 
on es.salary_id = s.id 
where monthly_salary is null;

-- 6. Вывести всех работников с названиями их должности.

select employee_name, role_name
from roles as r 
join roles_employee as re 
on r.id = re.role_id 
join employees as e
on re.employee_id = e.id
order by employee_name;

select employee_name , role_name 
from employees e 
left join roles_employee re 
on e.id  = re.employee_id  
left join roles r 
on re.role_id  = r.id
order by employee_name;

-- 7. Вывести имена и должность только Java разработчиков.
select employee_name, role_name
from employees as e
join roles_employee as re 
on e.id = re.employee_id 
join roles as r
on re.role_id = r.id 
where role_name like '%Java developer%';


-- 8. Вывести имена и должность только Python разработчиков.

select employee_name, role_name
from employees e 
join roles_employee re 
on e.id = re.employee_id 
join roles r 
on re.role_id = r.id 
where role_name like initcap('%Python%') ; 


-- 9. Вывести имена и должность всех QA инженеров.

select employee_name, role_name
from roles r 
join roles_employee re 
on r.id = re.role_id 
join employees e 
on re.employee_id = e.id 
where role_name like '%QA%'
order by employee_name;


-- 10. Вывести имена и должность ручных QA инженеров.

select employee_name, role_name
from employees e 
join roles_employee re 
on e.id = re.employee_id 
join roles r 
on re.role_id = r.id 
where role_name like '%Manual QA%';


-- 11. Вывести имена и должность автоматизаторов QA

select employee_name, role_name
from employees e 
join roles_employee re 
on e.id = re.employee_id 
join roles r 
on re.role_id = r.id 
where role_name like '%Automation QA%';


-- 12. Вывести имена и зарплаты Junior специалистов

select employee_name, monthly_salary, role_name
from employees e 
join roles_employee re 
on e.id = re.employee_id 
join roles r 
on re.role_id = r.id 
join employee_salary es 
on e.id = es.employee_id 
join salary s 
on es.salary_id = s.id 
where role_name like '%Junior%'
order by monthly_salary;

-- 13. Вывести имена и зарплаты Middle специалистов
select employee_name, monthly_salary, role_name 
from employees e 
join roles_employee re 
on e.id = re.employee_id 
join roles r 
on re.role_id = r.id 
join employee_salary es 
on es.employee_id = e.id 
join salary s
on es.salary_id = s.id 
where role_name like '%Middle%';


-- 14. Вывести имена и зарплаты Senior специалистов

select employee_name, monthly_salary, role_name 
from employees
join roles_employee
on employees.id = roles_employee.employee_id 
join roles 
on roles_employee.role_id  = roles.id 
join employee_salary
on employees.id = employee_salary.employee_id 
join salary
on employee_salary.salary_id = salary.id 
where role_name like 'Senior%';


-- 15. Вывести зарплаты Java разработчиков

select employee_name, monthly_salary, role_name 
from employees
join roles_employee
on employees.id = roles_employee.employee_id 
join roles 
on roles_employee.role_id  = roles.id 
join employee_salary
on employees.id = employee_salary.employee_id 
join salary
on employee_salary.salary_id = salary.id 
where role_name 
like '%Java developer';

-- 16. Вывести зарплаты Python разработчиков
select employee_name, monthly_salary, role_name 
from employees e 
join roles_employee re 
on e.id = re.employee_id 
join roles r 
on re.role_id = r.id 
join employee_salary es 
on e.id = es.employee_id 
join salary s 
on es.salary_id = s.id 
where role_name like initcap('%Python%');

-- 17. Вывести имена и зарплаты Junior Python разработчиков

select employees.employee_name, salary.monthly_salary, roles.role_name 
from employees
join roles_employee
on employees.id = roles_employee.employee_id 
join employee_salary 
on roles_employee.employee_id = employee_salary.employee_id 
join salary
on employee_salary.salary_id = salary.id 
join roles 
on roles_employee.role_id = roles.id 
where roles.role_name like '%Junior Python%';


-- 18. Вывести имена и зарплаты Middle JS разработчиков

select employee_name, monthly_salary, role_name 
from employees e 
join roles_employee re 
on re.employee_id = e.id
join roles 
on re.role_id = roles.id
join employee_salary es 
on re.employee_id = es.employee_id  
join salary 
on es.salary_id = salary.id
where role_name like '%Middle JavaScript developer%';

-- 19. Вывести имена и зарплаты Senior Java разработчиков

select employee_name, monthly_salary, role_name 
from employees e 
join roles_employee re 
on re.employee_id = e.id
join roles 
on re.role_id = roles.id
left join employee_salary es 
on re.employee_id = es.employee_id  
left join salary 
on es.salary_id = salary.id
where role_name like initcap('%Senior Java %');

-- 20. Вывести зарплаты Junior QA инженеров

select employee_name, monthly_salary, role_name 
from employees e 
join roles_employee re 
on re.employee_id = e.id
join roles 
on re.role_id = roles.id
left join employee_salary es 
on re.employee_id = es.employee_id  
left join salary 
on es.salary_id = salary.id
where role_name like 'Junior%QA%'
order by monthly_salary;


select employee_name, monthly_salary, role_name 
from employees e 
join roles_employee re 
on re.employee_id = e.id
join roles 
on re.role_id = roles.id
join employee_salary es 
on re.employee_id = es.employee_id  
join salary 
on es.salary_id = salary.id
where role_name like 'Junior%QA%'
order by monthly_salary;


-- 21. Вывести среднюю зарплату всех Junior специалистов

select avg(monthly_salary) as avg_salary_Junior
from roles r
join roles_employee re 
on r.id = re.role_id 
join employee_salary es 
on re.employee_id = es.employee_id 
join salary s 
on es.salary_id = s.id 
where role_name like '%Junior%';

-- 22. Вывести сумму зарплат JS разработчиков

select sum(monthly_salary)
from salary s 
join employee_salary es 
on s.id = es.salary_id 
join roles_employee re
on es.employee_id = re.employee_id 
join roles r 
on re.role_id = r.id 
where role_name like '%JavaScript developer%';



---- 23. Вывести минимальную ЗП QA инженеров

select min(monthly_salary) as min_salary_qa
from roles r
join roles_employee re 
on r.id = re.role_id 
join employee_salary es 
on re.employee_id = es.employee_id 
join salary s 
on es.salary_id = s.id 
where role_name like '%QA%';

-- 24. Вывести максимальную ЗП QA инженеров

select max(monthly_salary) as max_salary_qa
from roles r
join roles_employee re 
on r.id = re.role_id 
join employee_salary es 
on re.employee_id = es.employee_id 
join salary s 
on es.salary_id = s.id 
where role_name like '%QA%';


-- 25. Вывести количество QA инженеров
select count(role_name) as count_QA
from roles r
join roles_employee re 
on r.id = re.role_id 
join employee_salary es 
on re.employee_id = es.employee_id 
where role_name like '%QA%';

select  COUNT (role_name) from roles
where role_name like '%QA%';

select count(role_name) as count_QA 
from roles_employee
join roles 
on roles.id  = roles_employee.role_id 
where role_name like '%QA%';

select role_name, count(role_name) as count_QA
from employees e 
left join roles_employee re 
on e.id = re.employee_id
left join roles 
on re.role_id = roles.id
group by role_name
having  role_name like '%QA%';

-- 26. Вывести количество Middle специалистов.

select  COUNT (role_name) from roles
where role_name like '%Middle%';

select count(role_name) as count_QA
from roles r
join roles_employee re 
on r.id = re.role_id 
join employee_salary es 
on re.employee_id = es.employee_id 
where role_name like '%Middl%';


select role_name, count(employee_name) as count 
from employees e  
join roles_employee re 
on e.id = re.employee_id
join roles 
on re.role_id = roles.id 
group by role_name 
having role_name like 'Middl%';

-- 27. Вывести количество разработчиков

select  COUNT (role_name) from roles
where role_name like '%developer%';

select count(role_name) as count
from roles r
join roles_employee re 
on r.id = re.role_id 
join employee_salary es 
on re.employee_id = es.employee_id 
where role_name like '%developer%';


select role_name, count(role_name) as count_developer
from employees e  
join roles_employee re 
on e.id = re.employee_id
join roles 
on re.role_id = roles.id 
group by role_name
having role_name like '%developer';


-- 28. Вывести фонд (сумму) зарплаты разработчиков.

select  SUM(monthly_salary)
from roles r
join roles_employee re 
on r.id = re.role_id 
join employee_salary es 
on re.employee_id = es.employee_id 
join salary s 
on es.salary_id = s.id 
where role_name like '%developer'

-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию

select employee_name, role_name, monthly_salary 
from employees e 
left join roles_employee re 
on e.id = re.employee_id
left join roles 
on re.role_id = roles.id 
left join employee_salary es 
on re.employee_id = es.employee_id 
left join salary 
on es.salary_id = salary.id 
order by monthly_salary asc;

select employee_name, role_name, monthly_salary 
from employees e 
join roles_employee re 
on e.id = re.employee_id
join roles 
on re.role_id = roles.id 
join employee_salary es 
on re.employee_id = es.employee_id 
join salary 
on es.salary_id = salary.id 
order by monthly_salary asc;

-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300

select employee_name, role_name, monthly_salary 
from employees 
right join employee_salary 
on employees.id = employee_salary.employee_id
left join salary 
on salary_id = salary.id
left join roles_employee 
on employees.id = roles_employee.employee_id 
left join roles 
on role_id = roles.id 
where monthly_salary between 1700 and  2300 
order by monthly_salary asc;

select employee_name,role_name, monthly_salary  
from employees
join roles_employee
on roles_employee.employee_id = employees.id
join roles 
on roles.id = roles_employee.role_id
join employee_salary 
on employee_salary.employee_id = employees.id 
join salary 
on salary.id = employee_salary.salary_id
where monthly_salary between 1700 and 2300
order by monthly_salary;

select employee_name, role_name, monthly_salary from employees 
join 
employee_salary on employee_salary.employee_id=employees.id 
join roles_employee on employee_salary.employee_id=roles_employee.employee_id 
join 
roles on roles_employee.role_id=roles.id
join 
salary on employee_salary.salary_id=salary.id
where monthly_salary >all (select monthly_salary  from salary where monthly_salary <1700)
and 
monthly_salary <all (select monthly_salary from salary where monthly_salary>2300)
order by monthly_salary asc; 

--  31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300

select employee_name, role_name, monthly_salary 
from employees 
join employee_salary 
on employees.id = employee_salary.employee_id
join salary 
on salary_id = salary.id
join roles_employee 
on employees.id = roles_employee.employee_id 
join roles 
on role_id = roles.id 
where monthly_salary<2300 
order by monthly_salary asc;

select employee_name, role_name, monthly_salary from employees 
join 
employee_salary on employee_salary.employee_id=employees.id 
join roles_employee on employee_salary.employee_id=roles_employee.employee_id 
join 
roles on roles_employee.role_id=roles.id
join 
salary on employee_salary.salary_id=salary.id
where monthly_salary <all(select monthly_salary from salary where monthly_salary=2300)
order by monthly_salary asc; 

select employee_name, role_name, monthly_salary 
from employees 
right join employee_salary 
on employees.id = employee_salary.employee_id
left join salary 
on salary_id = salary.id
left join roles_employee 
on employees.id = roles_employee.employee_id 
left join roles 
on role_id = roles.id 
where monthly_salary<2300
order by role_name asc;


--  32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000

select employee_name, role_name, monthly_salary 
from employees 
join employee_salary 
on employees.id = employee_salary.employee_id
join salary 
on salary_id = salary.id
join roles_employee 
on employees.id = roles_employee.employee_id 
join roles 
on role_id = roles.id 
where monthly_salary IN (1100, 1500, 2000)
order by monthly_salary asc;

select employee_name, role_name, monthly_salary 
from employees 
right join employee_salary 
on employees.id = employee_salary.employee_id
left join salary 
on salary_id = salary.id
left join roles_employee 
on employees.id = roles_employee.employee_id 
left join roles 
on role_id = roles.id 
where monthly_salary IN (1100, 1500, 2000)
order by monthly_salary asc;


