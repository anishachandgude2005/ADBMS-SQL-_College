
create database company_db;
use company_db;

-- NOT NULL Constraints
create table Employees(EmpId int NOT NULL, FirstName varchar(10), LastName varchar(10),EmpAge int); 
desc Employees;
insert into Employees values(NULL,'Ravi','Kumar',25);  -- show error because of NOT NULL constarint
insert into Employees values(1,NULL,'Kumar',25);
insert into Employees values(1,'Ravi','Kumar',25);


-- UNIQUE constraint
create table Employees1(EmpId int NOT NULL, FirstName varchar(10), LastName varchar(10),EmpAge int,Unique(EmpId)); 
desc Employees1;
insert into Employees1 values(NULL,'Ravi','Kumar',25);  -- will show error cannot be null
insert into Employees1 values(1,'ravi','Kumar',25); 
insert into Employees1 values(1,'Ravi','Kumar',25);		-- Duplicate entry will not allowed
insert into Employees1 values(2,'Ravi','Kumar',25);

-- CHECK constraint
create table Employees2(EmpId int NOT NULL, FirstName varchar(10), LastName varchar(10),EmpAge int,Check(EmpAge>20)); 
desc Employees2;
insert into Employees2 values(1,'Ravi','Kumar',25);
insert into Employees2 values(2,'ravi','Kumar',19);   -- will show error because of check constraint

-- alter table Employees2 add column salary int;
-- alter table employee2 drop column salary;

alter table Employees2 add column salary int, add check (salary>=50000);
insert into Employees2 values(1,'Ravi','Kumar',25,45000); -- will show error because of check constraint
insert into Employees2 values(2,'Ravi','Kumar',20,60000); -- will show error because of check constraint
insert into Employees2 values(3,'Ravi','Kumar',25,60000);
show create table Employees2;  -- show consrtaint info as well as table 
alter table Employees2 drop check employees2_chk_2;  -- remove the existing check constraint of salary field

select * from Employees2;

-- NOT NULL , Check and primary key constraints
create table Employees3
(EmpId int NOT NULL, FirstName varchar(10), LastName varchar(10),EmpAge int,Check(EmpAge>20), primary key(EmpId)); 
insert into Employees3 values(1,'Ravi','Kumar',22); 
insert into Employees3 values(1,'Ravi','Kumar',22); -- Now duplicate entry
insert into Employees3 values(2,'Ravi','Kumar',21);

-- a check constraint on multiple columns
create table Employees4
(EmpId int primary key, FirstName varchar(10), LastName varchar(10),EmpAge int,Salary int); 
insert into Employees4 values(1,'ravi','kumar',25,50000);

alter table Employees4 add constraint chk_EmpAge_salary check( EmpAge>20 AND Salary >=50000);
alter table Employees4 drop check chk_EmpAge_salary;
show create table Employees4;

-- default Constraint 
create table Employees5
(EmpId int NOT NULL, FirstName varchar(10), LastName varchar(10),EmpDept varchar(10) Default 'Operations'); 
Desc Employees5;
insert into Employees5 values(1,'Anisha','Chandgude');  -- this query will not work
insert into Employees5 values(1,'Anisha','Chandgude', default);  -- extra do this by my self
insert into Employees5(EmpId,FirstName,LastName) values(2,'Raj','Sharma');  -- this is correct query
select * from Employees5;


-- apply index used for acces multiple columns easily by calling single index name
create index demoindex on Employees5(FirstName);
show indexes from Employees5;

create index demoindex2 on Employees5(FirstName,LastName);
drop index Demoindex on Employees5;
drop index Demoindex2 on Employees5;

-- Auto increment
create table persons(
	Personid int NOT NULL auto_increment,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    Primary key(Personid));
    
    desc persons;
    insert into persons(LastName,Firstname,Age) values ('patil','raj',22);
    insert into persons(LastName,Firstname,Age) values ('rane','sahil',23),
													   ('shinde','gauri',21);
    select * from persons;







