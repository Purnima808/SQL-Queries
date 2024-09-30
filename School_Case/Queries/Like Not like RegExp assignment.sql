/*IN, NOT, BETWEEN AND, Like Queries*/

/*1. Find the students who have IDs in the following set – 1,5,9*/
select * 
from student
where ID regexp "[159]";

/*2. List the names of the students who are playing a musical instrument
(Hint: refer to Music and Student tables both)*/
select s.ID, FullName, Type
from student s inner join music m on s.ID = m.ID;

/*3. List the students who were born on Wednesday or Saturdays (Hint: Use
WeekDay(DOB) function, which returns the day of the week (in number
format between 1 &amp; 7) corresponding to a given date – Eg – 1 means
Sunday)*/
select ID, FullName, NewDOB, dayname(NewDOB)
from student;

/*4. List the students who were not born in January, March, and June (Hint:
Use Month(DOB) function)*/
select ID, FullName, NewDOB, monthname(NewDOB)
from student
where monthname(NewDOB) not in ("January", "March", "June");

/*5. List the students who have scored between 70 and 80 and 90 and 100.*/
select *
from student
where MTest regexp "[70-100]" and PTest regexp "[70-100]";

/*6. List the students whose names contain E*/
select * 
from student
where FullName regexp "E";

/*7. List the students who come from Districts ending with T*/
select *
from student
where DCode regexp "T$";

/*8. List the students whose names contain B as the second last letter*/
select *
from student
where FullName like "%B_";

/*9. List the students who come from districts with M as the third character*/
select *
from student
where DCode regexp "^..M";

/*10. List the students who come from districts that contain Y in the district name*/
select *
from student 
where DCode regexp "Y";

/*11. List the students who are playing instruments that contain letter "p" somewhere.*/
select s.ID, FullName, Type
from student s inner join music m on s.ID = m.ID
where Type like "%p%";

/*12. List the instruments played by students whose names start with letter capital "A".*/
select s.ID, FullName, Type
from student s inner join music m on s.ID = m.ID
where FullName like "A%";

/*13. List the students whose name contain small case "u" as the second letter.*/
select *
from student 
where FullName like "_u%";

/*14. List the students whose name contain "u" or "r" somewhere*/
select *
from student
where FullName regexp "[ur]";

/*15. List the students who don’t contain ‘A’ and ‘R’ in their names.*/
select *
from student
where FullName not regexp "[AR]";

/*16. List the students whose names contain only these characters - “A” or
“B” or “C” or “D” (eg – names like “dada” “baba” “caba”)*/
select *
from student 
where FullName regexp "^[a-d]*$";

/*17. List the students whose names don’t contain t, o, r anywhere*/
select *
from student
where FullName not regexp "[tor]";

/*18. List the students whose names contain only three characters and must
contain at least one of the following characters: a, e, u*/
select *
from student
where char_length(FullName) = 3 and FullName regexp "[aeu]+";