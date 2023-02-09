create table employees(
id serial primary key,
employee_name Varchar(50) not null
);

insert into employees (employee_name)
values ('Casha'),
        ('Erasha'),
        ('Fasha'),
        ('Jasha'),
        ('Lasha'),
        ('Nasha'),
        ('Arkasha'),
        ('Stepasha'),
        ('Dunasha'),
        ('Milasha'),
        ('Uliasha'),
        ('Zasha'),
        ('Wawasha'),
        ('QAsha'),
        ('Prosha'),
        ('Misha'),
        ('Mariasha'),
        ('Mladusha'),
        ('Gosha'),
        ('Gesha'),
        ('Goga'),
        ('Trosha'),
        ('Krosha'),
        ('Frosha'),
        ('Alosha'),
        ('Alesha'),
        ('Alena'),
        ('Alesia'),
        ('Olesia'),
        ('Olena'),
        ('Oleg'),
        ('Olen'),
        ('Elen'),
        ('Elena'),
        ('Elesha'),
        ('Ulsha'),
        ('Serezha'),
        ('Serega'),
        ('Sereg'),
        ('Serega'),
        ('Sergo'),
        ('Zgenia'),
        ('Zhenia'),
        ('Zhenka'),
        ('Zhendos'),
        ('Zhenka'),
        ('Joian'),
        ('Jordan'),
        ('Ioan'),
        ('Jordzh'),
        ('Jorg'),
        ('Gorg'),
        ('Koliasha'),
        ('Kolian'),
        ('Kolia'),
        ('Kolya'),
        ('Kostia'),
        ('Kostian'),
        ('Konstantin'),
        ('Koya'),
        ('Roy'),
        ('Svoy'),
        ('Bred'),
        ('Pit');

insert into employees (employee_name)
values ('Romasha'),
        ('Rimma'),
        ('Rusia'),
        ('Reggi'),
        ('Roxy'),
        ('Rollsroyssi');       
       
create table salary(
id serial primary key,
monthly_salary int not null
);      

insert into salary (monthly_salary)
values (1100),
        (1300),
        (1600),
        (1800),
        (1900),
        (2100),
        (2200),
        (2300),
        (2400),
        (2500);
        
create table employee_salary(
id serial primary key,
employee_id int not null unique,
salary_id int not null
);

insert into employee_salary (employee_id, salary_id )
values (1,7),
       (8,4),
       (3,9),
       (9,13),
       (4,7),
       (2,6),
       (7,4),
       (10,8),
       (6,9),
       (11,10),
       (5,11),
       (12,16),
       (26,13),
       (25,14),
       (24,15),
       (27,17),
       (13,18),
       (14,19),
       (23,4),
       (15,5),
       (21,6),
       (22,7),
       (20,8),
       (59,9),
       (82,10),
       (88,11),
       (17,12),
       (18,13),
       (29,14),
       (87,15),
       (98,16),
       (77,17),
       (33,18),
       (36,19),
       (89,4),
       (56,6),
       (54,6),
       (38,7),
       (52,8),
       (40,9);
       
create table roles(
id serial primary key,
role_title varchar(50) unique not null
);
alter table roles
rename column role_title to role_name;

insert into roles (role_name)
values ('Junior Python developer'),
('Middle Python developer'),
('Senior Python developer'),
('Junior JavaScript developer'),
('Middle JavaScript developer'),
('Senior JavaScript developer'),
('Project Manager'),
('Sales manager');

create table roles_employee(
id serial primary key,
employee_id int not null unique,
role_id int not null,
foreign key (employee_id)
  references employees (id),
foreign key (role_id)
  references roles (id)
);

insert into roles_employee (employee_id, role_id)
values (7,2),
       (20,4),
       (3,9),
       (5,13),
       (23,4),
       (11,2),
       (10,9),
       (22,13),
       (21,3),
       (34,4),
       (6,7),
       (1,12),
       (2,18),
       (4,1),
       (8,2),
       (24,3),
       (32,4),
       (9,5),
       (25,6),
       (12,7),
       (33,8),
       (26,9),
       (13,10),
       (27,11),
       (14,12),
       (35,13),
       (28,14),
       (15,15),
       (36,16),
       (29,17),
       (37,18),
       (16,19),
       (17,20),
       (38,21),
       (30,22),
       (18,3),
       (31,2),
       (19,21),
       (40,1),
       (39,22);

select * from employees;
select * from salary ;
select * from roles;
select * from roles_employee;