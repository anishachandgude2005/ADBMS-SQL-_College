-- Basics of Join queries
create database basicjoin;
use basicjoin;

create table employees(
empid int primary key,
ename varchar(100));

desc employees;

insert into employees(empid,ename) 
values(101,'Anisha'),
		(102,'Sarika'),
		(103,'Soham'),
		(104,'kartik');

select * from employees;
        
create table projects(projectid int primary key,pname varchar(50),empid int,
foreign key(empid) references employees(empid));

desc projects;

insert into projects(projectid,pname,empid) 
values(1,'project A',101),
		(2,'project B',102),
		(3,'project C',103),
		(4,'project D',104);
        
select * from projects;

insert into projects values(5,'Project E',103);
insert into projects values(6,'Project F',104);

insert into employees values(105,'Sanjay');
insert into employees values(106,'Akshay');


/* Inner join- used for show matching data*/
select * from employees
join projects
on employees.empid=projects.empid;

-- fetch the employee name and the project name the belongs to
select e.ename,p.pname from employees e
inner JOIN projects p
ON e.empid = p.empid;

-- right join
-- right join=inner join + any additional records in the right table
select e.ename,p.pname from employees e
right JOIN projects p
ON e.empid = p.empid;

select e.ename,p.pname from projects p
right JOIN employees e
ON e.empid = p.empid;


-- left Join
-- left join=inner join + any additional records in the left table
select e.ename,p.pname from employees e
left JOIN projects p
ON e.empid = p.empid;

insert into projects values(7,'Project F',105);
insert into projects(projectid,pname,empid) 
values(1,'project A',101);


-- full outer join using union 
-- display all matching and non matching data  from both the tables
select * from employees
left JOIN projects
ON employees.empid = projects.empid
UNION
select * from employees
right JOIN projects
ON employees.empid = projects.empid;

select employees.ename,projects.pname
from employees
left join projects
on employees.empid=projects.empid
where projects.empid is not null;

select employees.ename,projects.pname
from employees
left join projects
on employees.empid=projects.empid
where projects.empid is null;






