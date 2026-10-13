-- DML Commands
create database college;
use college;
show databases;
create table Employees(EmpId int, FirstName varchar(10), LastName varchar(10),EmpAge int, Empzone varchar(10)); 
desc Employees;
insert into Employees values(1,"Anisha","Chandgude",21,"West"); -- single row insertion 
insert into Employees(EmpId,FirstName, LastName,EmpAge, Empzone) values (2,'Riya','Joshi',23,'North'),
																		(3,'Vaibhavi','More',24,NULL); -- Multiple row insertion
select * from Employees;

update Employees set Empzone='South' where EmpId=2;  -- update single fields
update Employees set EmpAge=25,Empzone='West' WHERE EmpId=3; -- update multiple fields

select EmpId,FirstName from employees;

truncate Employees;

delete from Employees where EmpId=3;