/*CRUID Operations in SQL: 
Create (databases, tables)-> CREATE
Read (fetch rows) -> SELECT
Update (existing data) -> UPDATE
Insert (add rows) -> INSERT
Delete (rows) -> DELETE
*/

/*MySQL Workbench is LARGELY NoT CaSe SensitIve!

To be on the safer side, please write the commands in small 
case (or UPPER CASE) but be consistent. 

Write the database names, table name, column names in 
the same case (upper or lower or proper) as they were
created in (or appear in the server).*/


/*Step 1: Let's create a new database called Loans_db
*/
create database loans_db;

drop database loans_db; /*Removed the database*/

/*Make the new database as the default database*/
USE Loans_db;

/*Let's see if we have any tables in the database*/
Show tables;

/*Let's create a new table in the loans_db*/
CREATE TABLE customers(custId INTEGER,
custName char(100),
gender char(10),
income integer,
dob date,
credit_history boolean
);

describe customers; /*Show the metadata (or data dictionary) of this table*/

/*CRUD Operations:
Create -> Create database / table
Read -> Select
Add Rows -> INSERT
Update - Update
Delete - Delete*/

select custName, gender, income, dob, credit_history 
from customers;

select * /*select all the columns.*/
from customers;

/*How to insert rows into a table?*/
INSERT INTO customers(custId, custName, gender, income, dob, credit_history)
VALUES
(101, "Deepak Raj", "Male", 9999999, "1999-12-05", TRUE),
(201, "Suhas Chavan", "Male", 777777, "2001-11-30", TRUE);

/*Delete rows /records*/
delete
from customers;

/*You're not allowed to delete or update without where conditions*/
SET SQL_SAFE_UPDATEs = 0; /*Disables the unconditonal delete / update restriction*/

/*delete rows conditionally*/
delete 
from customers 
where custName = "Divya";

use loans_db;

/*Update -> modify existing data (eg somebody's last name)*/
Update customers
SET custName = "Divya", custId = 666
where custID = 101;

select * from customers;

/*1Q. Create a new table called as loans with the following structure and data:*/
create table loans(Loan_ID integer,
Loan_Amount integer,
cust_ID integer);

describe loans;

insert into loans(Loan_ID, Loan_Amount, cust_ID)
values
(1, 43434, 101),
(2, 4222, 201),
(3, 66533, 101);

select *
from loans;

/*2Q. Change the loan_amt to 5555 for loan_Id 2*/
update loans
set Loan_Amount = 5555
where Loan_ID = 2;

/*3Q. Add a new row with loan_ID 4, loan_amt 666, custId 201*/
insert into loans(Loan_ID, Loan_Amount, cust_ID)
values
(4, 666, 201);

/*4Q. Delete the loan details of loan_ID 4*/
delete
from loans
where Loan_ID = 4;