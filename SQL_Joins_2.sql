insert into roles_salary(id_role, id_salary)
values (7, 1),
       (8, 3),
       (9, 7),
       (10, 15),
       (11, 5),
       (12, 8),
       (13, 1),
       (14, 3),
       (15, 18),
       (16, 2),
       (17, 19),
       (18, 3),
       (19, 1),
       (20, 4),
       (21, 7),
       (22, 17);
          
//1.Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.

select employee_name, monthly_salary from employees
join roles_employee on employees.id=roles_employee.employee_id
join roles on roles_employee.employee_id=roles.id
join roles_salary on roles.id=roles_salary.id_role
join salary on roles_salary.id_role=salary.id
order by 2 asc;

//2.Вывести всех работников у которых ЗП меньше 2000

select employee_name, monthly_salary from employees
join roles_employee on employees.id=roles_employee.employee_id
join roles on roles_employee.employee_id=roles.id
join roles_salary on roles.id=roles_salary.id_role
join salary on roles_salary.id_role=salary.id
where monthly_salary <2000
order by 2 asc;

//3.Вывести все зарплатные позиции, но работник по ним не назначен

select monthly_salary, employee_name from employees
left join roles_employee on employees.id=roles_employee.employee_id
left join roles on roles_employee.employee_id=roles.id
left join roles_salary on roles.id=roles_salary.id_role
left join salary on roles_salary.id_role=salary.id
where employee_name is null
order by 1 asc;

//4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select monthly_salary, employee_name from employees
left join roles_employee on employees.id=roles_employee.employee_id
left join roles on roles_employee.employee_id=roles.id
left join roles_salary on roles.id=roles_salary.id_role
left join salary on roles_salary.id_role=salary.id
where monthly_salary<2000 and employee_name is null 
order by 1 asc;

// 5. Найти всех работников кому не начислена ЗП.

select monthly_salary, employee_name from employees
left join roles_employee on employees.id=roles_employee.employee_id
left join roles on roles_employee.employee_id=roles.id
left join roles_salary on roles.id=roles_salary.id_role
left join salary on roles_salary.id_role=salary.id
where monthly_salary is null 
order by 2 asc;

//6.Должность каждого сотрудника

select employee_name, role_name from employees
join roles_employee on employees.id=roles_employee.employee_id
join roles on roles_employee.employee_id=roles.id
order by 1 asc;

//Должность каждого сотрудника(в том числе без должности)

select employee_name, role_name from employees
left join roles_employee on employees.id=roles_employee.employee_id
left join roles on roles_employee.employee_id=roles.id
order by 1 asc;

//Сотрудники без должности 

select employee_name, role_name from employees
left join roles_employee on employees.id=roles_employee.employee_id
left join roles on roles_employee.employee_id=roles.id
where role_name is null 
order by 1 asc;

//7. Вывести имена и должность только Java разработчиков.

select employee_name, role_name from employees
join roles_employee on employees.id=roles_employee.employee_id
join roles on roles_employee.employee_id=roles.id
where role_name like 'Java_%'
order by 1 asc;

//8. Вывести имена и должность только Python разработчиков.

select employee_name, role_name from employees
join roles_employee on employees.id=roles_employee.employee_id
join roles on roles_employee.employee_id=roles.id
where role_name like '%Python%'
order by 1 asc;

//9.Вывести имена и должность всех QA инженеров.

select employee_name, role_name from employees
join roles_employee on employees.id=roles_employee.employee_id
join roles on roles_employee.employee_id=roles.id
where role_name ilike '%qa%'
order by 1 asc;

//10.Вывести имена и должность всех ручных QA инженеров.

select employee_name, role_name from employees
join roles_employee on employees.id=roles_employee.employee_id
join roles on roles_employee.employee_id=roles.id
where role_name like '%QA_manual%'
order by 1 asc;

//11.Вывести имена и должность всех автоматизаторов QA.

select employee_name, role_name from employees
join roles_employee on employees.id=roles_employee.employee_id
join roles on roles_employee.employee_id=roles.id
where role_name like 'QA_automation%'
order by 1 asc;

//12.Вывести имена и зарплаты Junior специалистов

select employee_name, monthly_salary from employees
join roles_employee on employees.id=roles_employee.employee_id
join roles on roles_employee.employee_id=roles.id
join roles_salary on roles.id=roles_salary.id_role
join salary on roles_salary.id_role=salary.id 
where role_name like '%junior%'
order by 1 asc;

//13.Вывести имена и зарплаты Middle специалистов

select employee_name,  monthly_salary from employees
join roles_employee on employees.id=roles_employee.employee_id
join roles on roles_employee.employee_id=roles.id
join roles_salary on roles.id=roles_salary.id_role
join salary on roles_salary.id_role=salary.id 
where role_name ilike '%middle%'
order by 1 asc;

//14.Вывести имена и зарплаты Senior специалистов

select employee_name,  monthly_salary from employees
join roles_employee on employees.id=roles_employee.employee_id
join roles on roles_employee.employee_id=roles.id
join roles_salary on roles.id=roles_salary.id_role
join salary on roles_salary.id_role=salary.id
where role_name like '%senior%'
order by 1 asc;

//15. Вывести зарплаты Java разработчиков

select monthly_salary from salary
join roles_salary on roles_salary.id_role=salary.id
join roles on roles.id=roles_salary.id_role
where role_name like 'Java_%'
order by 1 asc;

// 16. Вывести зарплаты Python разработчиков

select monthly_salary from salary
join roles_salary on roles_salary.id_role=salary.id
join roles on roles.id=roles_salary.id_role
where role_name like '%Python%'
order by 1 asc;

//17. Вывести имена и зарплаты Junior Python разработчиков

select employee_name, monthly_salary from employees
join roles_employee on employees.id=roles_employee.employee_id
join roles on roles_employee.employee_id=roles.id
join roles_salary on roles.id=roles_salary.id_role
join salary on roles_salary.id_role=salary.id
where role_name like '%Junior_Python%'
order by 1 asc;

//18.Вывести имена и зарплаты Middle JS разработчиков

select employee_name, monthly_salary from employees
join roles_employee on employees.id=roles_employee.employee_id
join roles on roles_employee.employee_id=roles.id
join roles_salary on roles.id=roles_salary.id_role
join salary on roles_salary.id_role=salary.id
where role_name like '%Middle JavaScript%'
order by 1 asc;

//19. Вывести имена и зарплаты Senior Java разработчиков/ilike -регистронезависимый

select employee_name, monthly_salary from employees
join roles_employee on employees.id=roles_employee.employee_id
join roles on roles_employee.employee_id=roles.id
join roles_salary on roles.id=roles_salary.id_role
join salary on roles_salary.id_role=salary.id
where role_name ilike 'java%senior'
order by 1 asc;

//20. Вывести зарплаты Junior QA инженеров

select monthly_salary from salary
join roles_salary on roles_salary.id_role=salary.id
join roles on roles.id=roles_salary.id_role
where role_name ilike '%qa%junior%';

//21. Вывести среднюю зарплату всех Junior специалистов

select avg(monthly_salary) from salary
join roles_salary on roles_salary.id_role=salary.id
join roles on roles.id=roles_salary.id_role
where role_name ilike '%junior%';

//22. Вывести сумму зарплат JS разработчиков

select sum(monthly_salary) from salary
join roles_salary on roles_salary.id_role=salary.id
join roles on roles.id=roles_salary.id_role
where role_name ilike '%javascript developer%';

//23. Вывести минимальную ЗП QA инженеров
 
select min(monthly_salary) from salary
join roles_salary on roles_salary.id_role=salary.id
join roles on roles.id=roles_salary.id_role
where role_name ilike '%qa%';

//24. Вывести максимальную ЗП QA инженеров

select max(monthly_salary) from salary
join roles_salary on roles_salary.id_role=salary.id
join roles on roles.id=roles_salary.id_role
where role_name ilike '%qa%';

//25. Вывести количество QA инженеров

select count(employee_name) from employees 
join roles_employee on employees.id=roles_employee.employee_id
join roles on roles_employee.employee_id=roles.id 
where role_name ilike '%qa%';

//26.Вывести количество Middle специалистов.

select count(employee_name) from employees 
join roles_employee on employees.id=roles_employee.employee_id
join roles on roles_employee.employee_id=roles.id 
where role_name ilike '%middle%';

//27. Вывести количество разработчиков

select count(employee_name) from employees 
join roles_employee on employees.id=roles_employee.employee_id
join roles on roles_employee.employee_id=roles.id 
where role_name ilike '%developer%';

//28.Вывести фонд (сумму) зарплаты разработчиков.

select sum(monthly_salary) from salary
join roles_salary on roles_salary.id_role=salary.id
join roles on roles.id=roles_salary.id_role
where role_name ilike '%developer%';

//29. Вывести имена, должности и ЗП всех специалистов по возрастанию

select employee_name, role_name, monthly_salary from employees
join roles_employee on employees.id=roles_employee.employee_id
join roles on roles_employee.employee_id=roles.id
join roles_salary on roles.id=roles_salary.id_role
join salary on roles_salary.id_role=salary.id
order by 3 asc;

//30. ...у которых ЗП от 1700 до 2300

select employee_name, role_name, monthly_salary from employees
join roles_employee on employees.id=roles_employee.employee_id
join roles on roles_employee.employee_id=roles.id
join roles_salary on roles.id=roles_salary.id_role
join salary on roles_salary.id_role=salary.id
where monthly_salary between 1700 and 2300
order by 3 asc;

//31. ...у которых ЗП меньше 2300

select employee_name, role_name, monthly_salary from employees
join roles_employee on employees.id=roles_employee.employee_id
join roles on roles_employee.employee_id=roles.id
join roles_salary on roles.id=roles_salary.id_role
join salary on roles_salary.id_role=salary.id
where monthly_salary<2300
order by 3 asc;

//32. ...у которых ЗП равна 1100, 1600, 2000

select employee_name, role_name, monthly_salary from employees
join roles_employee on employees.id=roles_employee.employee_id
join roles on roles_employee.employee_id=roles.id
join roles_salary on roles.id=roles_salary.id_role
join salary on roles_salary.id_role=salary.id
where monthly_salary=1100 or monthly_salary=1600 or monthly_salary=2000
order by 3 asc;


//6.Вывести все зарплатные позиции, но работник по ним не назначен

select monthly_salary, role_name from employees
join roles_employee on employees.id=roles_employee.employee_id
join roles on roles_employee.employee_id=roles.id
join roles_salary on roles.id=roles_salary.id_role
join salary on roles_salary.id_role=salary.id
where employee_name is null 
order by 1 asc;

select * from salary;
select * from employees;
select * from roles_salary;
select * from roles r ;
select * from roles_employee re;
select * from employee_salary es; 