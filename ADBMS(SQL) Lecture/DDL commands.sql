-- DDL commands
create database Institute;     -- create database
show databases;				   
use Institute;				-- use database

create table Staff( staff_id int,first_name varchar(10),last_name varchar(10),DOB date, dept_id int);
create table Department (dept_id int,dept_name varchar(10), dept_location varchar(15));

-- desc query used to describe table like table columns its datatype
desc Staff;
desc Department;

alter table Staff add location varchar(10);
alter table Staff add joining_year int;

alter table Staff add age int,add contact_no int(10); -- OR this show warning 
-- alter table staff add (age int,contact_no int(10));  --use this 

-- change the data type of a colume in an existing table 
alter table Staff modify first_name text;

-- Drop column table 
alter table Staff drop column contact_no;

-- change the size of a colume in an existing table 
alter table Staff modify location varchar(15);

alter table Staff add primary key(staff_id);
alter table Department add primary key(dept_id);

alter table Staff drop primary key;

-- alter table Staff add foreign key(dept_id) references Department(dept_id);

alter table Staff add constraint FK_staff_department foreign key(dept_id) references Department(dept_id);

alter table Staff drop foreign key FK_staff_department;

alter table Staff rename Staff1;
desc Staff1;

alter table Staff1 rename Staff;

drop database institute;