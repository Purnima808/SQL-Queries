create database school_db;

use school_db;

select * from student;

/*Pattern Matching - Basic Exercise*/

/*Questions:
1. List the students who come from districts that contain Y in the district name
2. List the students who are playing instruments that contain
letter "p" somewhere.
3. List the instruments played by students whose names start
with letter capital "A".
4. List the students whose name contain small case "u"
 as the second letter.
5. List the students whose name contain "u" or "r" somewhere
*/

/*1. List the students who come from districts that contain Y in the district name*/
select *
from student
where DCode like "%Y%";

/*2. List the students who are playing instruments that contain letter "p" somewhere.*/ -- Need to check
select s.ID, FullName, Type
from student s inner join music m on s.ID = m.ID
where Type like "%p%";

/*3. List the instruments played by students whose names start with letter capital "A".*/
select FullName, s.ID, Type
from student s inner join music m on s.ID = m.ID
where binary FullName like "R%";

/*4. List the students whose name contain small case "u" as the second letter.*/
select *
from student
where FullName like "_u%";

/*5. List the students whose name contain "u" or "r" somewhere*/
select *
from student
where FullName like "%u%" or FullName like "%r%";

-- Left / Right Outer Join
/*6. List all the students. Also, show the type of instrument they play , if any*/
select s.ID, s.FullName, m.ID, m.Type
from student s left join music m on s.ID = m.ID;

select s.ID, s.FullName, m.ID, m.Type
from student s right join music m on s.ID = m.ID;

select s.ID, s.FullName, m.ID, m.Type
from music m right join student s on s.ID = m.ID;

-- Self Join
-- Joins the same table with itself
/*7. List of distinct pairs from the same class*/
select s1.ID, s2.ID
from student s1 join student s2 on s1.ID < s2.ID
where s1.Class = s2.Class;

-- Anti Joins: helps in finding difference
-- Left Anti Join: Rows from the left table is not available in the right table
/*8. List of students who are not playing any musical instuments*/
select s.ID, s.FullName, m.Type, m.ID
from student s left join music m on s.ID = m.ID
where m.Type is null;