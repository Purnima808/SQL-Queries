/* Using School Database (student table) to solve the following questions: */
-- Text Function Queries:

/*
1.  Find the position of first "a" in name of each customer.
2.    Display the customers' entire name but the last character.
Eg: Prateek -> Pratee
3.    Display the last two characters of the customers’ name
4.    Select names containing a single “e”.  
*/

use school_db;

-- Q1.  Find the position of first "a" in name of each customer.
select fullname, locate("a", fullname, 1) as PositionOfA
from student;


-- Q2. Display the customers' entire name but the last character. Eg: Prateek -> Pratee
select fullname, 
 left(fullname, length(fullname) - (locate(" ", fullname, 1)+1))
from student;

select fullname, left(fullname, length(fullname)-1)
from student;

select fullname, 
left(substring_index(fullname, ' ', 1), 
length(substring_index(fullname, ' ', 1)) - 1) as first_name_without_last_char  from student;

-- Q3. Display the last two characters of the customers’ name
select fullname, right(fullname, 2) as last2chars
from student;

-- Q4. Select names containing a single “e”. (Need to make names in lower, then the code worked)

alter table student
add column LcaseName char(100);

SET SQL_SAFE_UPDATES = 0;

update student
set LcaseName = lower(fullname);

select * from student;

select fullname, LcaseName
from student
where length(LcaseName) - length(replace(LcaseName, "e", "")) = 1;


/* Please refer to the attached notes on Text Functions in SQL. Then, please do the following questions using the School_Db:

1. List the first initial of all the students coming from YMT
2. Display the entire name but the last character of students
3. Display the last two characters of the students’ name
4. Do the second question using Mid function
5. Do the third question using Mid function
6. Show the fullname in Upper Case.
7. Select students whose name contain a single “e”.  
8. Find the position of second “e” in fullnames */

-- Q1. List the first initial of all the students coming from YMT
select fullname, left(fullname, 1) as firstInitial
from student
where DCode = "YMT";

-- Q2. Display the entire name but the last character of students
select LcaseName, left(LcaseName, length(LcaseName)-1)
from student;

-- Q3. Display the last two characters of the students’ name
select fullname, right(fullname, 2) as last2chars
from student;

-- Q4. Do the second question using Mid function
select LcaseName, mid(LcaseName, 1, length(LcaseName) - 1)
from student;

-- Q5. Do the third question using Mid function
select fullname, mid(fullname, length(fullname) - 1, 2) as Last2Chars
from student;

-- Q6. Show the fullname in Upper Case.
select fullname, upper(fullname) as Ucase
from student;

-- Q7. Select students whose name contain a single “e”.
select LcaseName
from student
where length(LcaseName) - length(replace(LcaseName, "e", "")) = 1;

-- Q8. Find the position of second “e” in fullnames
select LcaseName, 
	locate("e", LcaseName, locate("e", LcaseName) + 1)
from student;



/* Credit Card Database Questions:

1.  Find the position of first "a" in name of each customer.
2.    Display the customers' entire name but the last character.
Eg: Prateek -> Pratee
3.    Display the last two characters of the customers’ name
4.    Select names containing a single “e”.  
*/

use creditcard_db;

select * from customers;

-- Q1. Find the position of first "a" in name of each customer.
select Name,
		locate("a", Name, 1)
from customers;        

-- Q2. Display the customers' entire name but the last character. Eg: Prateek -> Pratee
select Name, left(Name, length(Name)-2)
from customers;

-- Q3. Display the last two characters of the customers’ name
select Name, right(Name, 2)
from customers;

-- Q4. Select names containing a single “e”.
select Name
from customers
where length(Name) - length(replace(Name, "e", "")) = 1;
