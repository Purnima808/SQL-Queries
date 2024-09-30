/*Comments - These text wont get executed. 
1. Create database. Then, import tables into student database from Excel CSV (comma separated values) files. 
2. Treat/clean the data (missing values, changing date data types, etc.) 
3. Start writing SELECT queries in order to answer business questions. 
*/

/*Step 1: Create Database*/
Create Database school_db; 
Use school_db;

/*To import the tables using MySQL WB, please right click on the 
table under the database that you just created. 
Select Table Import Wizard and follow steps. */

SELECT ID, FullName, DOB, SEX 
FROM student;

select * from student;

/*Step 2: Treat the data / Clean the data 
a) Create a new Column for DOB - NewDOB with date data type 
b) Convert the text DOB into date NEWDOB
c) Replace "T" with Null
d) Convert Remission column from integer to binary*/

ALTER TABLE student 
ADD Column NewDOB datetime;

ALTER TABLE student 
DROP Column NewDOB;

SELECT DOB, left(DOB, 10), str_to_date(Left(DOB,10), "%d-%m-%Y"),
str_to_date(DOB,"%d-%m-%Y %H:%i") as DOB_TOB
FROM Student;

select DOB, str_to_date(DOB, "%m-%d-%Y %h:%i %p")
from student;

SELECT NewDOB FROM Student; 

/*b) Convert the text stored under DOB into date NEWDOB*/
/*Important - Please un-check restricted updates by going to 
Edit -> Preferences -> SQL Editor -> Uncheck Safe Updates and close and reopen MySQL Workbench*/

SET SQL_SAFE_UPDATEs = 0;

Update student
SET NewDOB = Str_To_Date(DOB, "%m-%d-%Y %h:%i %p");

SELECT FullName, NewDOB
FROM student; 

ALTER TABLE Student
DROP Column DOB;

SELECT * FROM Student;

Update Student
Set Sex = NULL, Class = Null, Hcode = Null, Dcode = Null
WHERE Sex = "T" and Class = "T" and Hcode = "T" and Dcode = "T"; 

Update student
Set Ptest = NULL WHERE FullName = "*ba";

SELECT * FROM Student;

/*How do you filter rows*/
SELECT ID, FullName, MTest, SEx 
FROM Student
WHERE Sex = "F";

/*Multiple conditions*/
SELECT ID, FullName, Mtest, SEx
FROM Student
WHERE (Sex = "M" AND Mtest > 90) 
OR (SEX = "F" and Mtest > 80);

/*List the female students who have scored less than 92 in Maths*/
select ID, FullName, MTest, NewDOB
from student
where (Sex = "F" and MTest < 92);

/*List the students who were born before 01/01/2000 (hint: use “ “ for date values)*/
select *
from student
where NewDOB < "2000-01-01";

/*List the students who have not paid their fees*/
select *
from student
where Remission = False;

/*List the students who come from district YMT*/
select ID, FullName, DCode
from student
where DCode = "YMT";

/*Find the age of students (hint: use date() function)*/
select ID, FullName, Class, NewDOB, (datediff(current_date(), NewDOB)/365) as StudentAge
from student;

/*Show the age in the following format: years in one column and the month in another.*/
select ID, FullName, Class, NewDOB, year(NewDOB) as yr, monthname(NewDOB) as mnth
from student;

select ID, FullName, Class, NewDOB, timestampdiff(year, NewDOB, Current_Date()) as yrs, timestampdiff(month, NewDOB, Current_Date()) as mnth
from student;

select ID, FullName, Class, NewDOB, timestampdiff(year, NewDOB, Current_Date()) as yrs, 
((datediff(current_date(), NewDOB)/365)- (timestampdiff(year, NewDOB, Current_Date()))) * 12 as mnth
from student;

select ID, FullName, Class, NewDOB, 
timestampdiff(year, NewDOB, Current_Date()) as yrs,
timestampdiff(month, NewDOB, Current_Date()) mod 12 as mnth
from student;

