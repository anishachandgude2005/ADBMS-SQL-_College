-- Start a new transaction.
/*BEGIN
Start transaction; -- TO execute multiple statement as single transaction,we must explicitly start the transaction.
COMMIT :-Saves all cahnges made during the transaction .
SAVEPOINT:-Sets a savepoint within a transaction to rollback to later
ROLLBACK TO SAVEPOINT :-Rolls back to a specific savepoint without affecting earlier changes .*/
create database TCL;
use TCL;
create table orders(order_id int primary key,customer_name varchar(100),status varchar(50));
desc orders;

set autocommit=0;
start transaction;

-- begin;

 insert into orders values (101,'Geet','Pending');
 insert into orders values (102,'Bob','Pending');
 commit;
 update orders set customer_name='Raj' where order_id=102;
 rollback;
 
 truncate table orders;
 select * from orders;
 
 -- step 1 insert a few orders
 insert into orders values (103,'Om','Pending');
 insert into orders values (104,'Sahil','Pending');
 savepoint sp1;
 
 -- step 2 :Update one order
 update orders set status ='shipped' where order_id=103;
 savepoint sp2;
 rollback to savepoint sp1;
 
 -- step delete
 delete from orders where order_id=102;
 savepoint sp3;
 
 rollback to savepoint sp1;
 select * from orders;
 
 rollback;
 commit;
 
 
 
 
 