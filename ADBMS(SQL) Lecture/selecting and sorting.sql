create database User;
use User;

create table Customer(Custid int, Custname varchar(15),City varchar(10),Product varchar(15),Price int);

desc Customer;

insert into Customer(Custid,Custname,City,Product,Price) values (101,"Anisha","Baramati","phone",25000),
(102,"Rahul","pune","Earphone",5000),
(103,"Karan","Mumbai","Laptop",75000);

alter table Customer add primary key(Custid);

select * from Customer;
select Custid,Custname,City from Customer;
select * from Customer where Custid=102;
select * from Customer where Custid=102 or Custid=103;
create table Clonetable as select * from Customer;
select * from Clonetable;
drop table Clonetable;

select Custname,product,Price from Customer where Price>15000;
select Custname,product,Price from Customer where Price<15000;
select Custname,product,Price from Customer where Price=15000;

select * from Customer where City="Baramati";

/* Sorting data using order by single column*/
select * from Customer order by Price;
select * from Customer order by Price desc;

/* Sorting data using order by single column*/
select * from Customer order by Price,City;
select * from Customer order by City,Price;

select * from Customer order by City desc, Price asc;

-- single-row functions
-- case conversion functions
select upper(Custname),lower(Product) from Customer where Custid<103;
select upper(Custname),lower(Product) from Customer;
alter table Customer add Lastname varchar(10);
update  customer set lastname="Chandgude" where Custid=101;
update  customer set lastname="Sharma" where Custid=102;
update  customer set lastname="Kundra" where Custid=103;

-- concat two column
select concat(Custname," ",lastname) from Customer;
select concat(Custname," ",lastname)as FullName from Customer; -- conacat column name change

-- use of SUBSTR and INSTR functions
select * from Customer;
select substr(Custname,1,3) from customer; -- first three letter 
select substr(Custname,0,3) from customer; -- empty table
select substr(Custname,1,1) from customer; -- single first letter
select substr(Custname,0,1) from customer; -- empty table
select substr(Custname,1,0) from customer; -- empty table

select instr(Custname,'a') as position from Customer;
select substr(Custname,1,2) as Substring,instr(Custname,'a') as Instring from Customer;
select substr(Custname,1,3), instr(Custname,'a') from Customer where Custid<103;

-- Data and time function
select now(); -- show current date and time 

select now() as current_datetime;  -- current_datetime is alice name set using as keyword for column name

alter table customer add column date date;
update customer set date='2002-03-04' where Custid=101;
update customer set date='2024-01-11' where Custid=102;
update customer set date='2011-04-05' where Custid=103;

