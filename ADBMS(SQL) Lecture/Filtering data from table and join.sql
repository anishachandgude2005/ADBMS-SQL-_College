-- Filtering data from tables
-- filtering operators(WHERE ,SELECT DISTINCT,AND,OR,NOT,IN,NOT IN,BETWEEN,LIKE,LIMIT,IS NULL)
create database organization;
use organization;

create table employee(Empid int not null primary key,First_name varchar(15),Last_name varchar(15), Gender char, Role varchar(15),dept varchar(15),Manager_id varchar(10));

insert into employee(Empid ,First_name,Last_name , Gender, Role ,dept ,Manager_id) values
 (1,'Anisha','Chandgude','F','Team Leader','Retail',101),
(2,'rahul','Sharma','M','Manager','Finance',102),
(3,'Karan','Rao','M','President','HR',103),
(4,'Sneha','Karne','F','Team Leader','Finance',104),
(5,'Ram','Jadhav','M','Manager','Retail',105);

-- distinct 
select distinct Dept from employee order by Dept;
select distinct role from employee order by Role;

-- And Operator logical operator contains two or more boolean expressions
-- return 1,0,null

select * from employee where role='president' and dept='Finance'; -- return null
select * from employee where role='president' and dept='Finance';

-- OR operator -combines two boolean expressions and returns 1
-- filtering with where clause
select * from employee where role='Manager' and dept='Team Leader';
select * from employee where role='Manager' and dept='HR';

-- In operator   return true or false display data
select * from employee where role in('president','Manager');
select * from employee where role in('TM','CEO');

-- NOT IN operator

select * from employee where role not in ('President','manager');

-- Between operator

alter table employee add experience int;
update employee set experience=8 where Empid=1;
update employee set experience=10 where Empid=2;
update employee set experience=5 where Empid=3;
update employee set experience=15 where Empid=4;
update employee set experience=6 where Empid=5;

select * from employee where experience between 6 and 10;
select * from employee where experience=5 or experience=10;

-- Like operator

select  * from employee where Last_name like 'S%';

-- Limit -used to limit the number of rows returned

select * from employee order by experience limit 4;

-- IS NULL operator

insert into employee(Empid ,First_name,Last_name , Gender, dept ,Manager_id) values(6,'Sachin','Jadhav','M','Retail',106);
insert into employee(Empid ,First_name,Last_name , Gender, Role ,dept) values(7,'Sonal','rao','F','Manager','HR');
insert into employee(Empid ,First_name, Gender, Role ,dept ,Manager_id) values(8,'Vihan','M','Team Leader','Finance',108);

select * from employee where Manager_id is null;
select * from employee where experience is null;

select * from employee where experience is not null;

-- Aggregate Functions
select count(*) from employee;

select count(Empid) from employee where dept='Finance';
select count(Empid) from employee where role='Team Leader';
select Min(experience) from employee;
select max(experience) from employee;
select Sum(experience) from employee;
select avg(experience) as emp_exr from employee;

-- GROUP BY clause is used with Aggregate functions

select dept, count(*) as Employee_count from Employee group by Dept;
select Role, count(*) as Employee_count from Employee group by Role;
select Gender, count(*) as Employee_count from Employee group by Gender;

-- The having clause was added to sql beacuse the where keyword cannot be used with aggregate functions
select * from employee;
select dept ,sum(experience) as total_experience 
from employee 
group by dept 
having total_experience>=10 and total_experience<=20;


select dept,count(empid) 
from employee 
group by dept
having count(empid)>2
order by count(empid);

select dept ,sum(experience) as total_experience 
from employee group by dept 
having total_experience>=10 or total_experience<=30;

