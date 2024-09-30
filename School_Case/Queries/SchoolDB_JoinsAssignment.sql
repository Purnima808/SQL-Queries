use school_db;

show tables;

select * from student;

/*Join Basic Queries:

1. Find the list of players
playing both Chess and Bridge. Show their chessperformance data as well.

2. List the students who are
playing Piano from each class. Do mention the instrument type.

3. Do you think the students
who play Piano score better in Maths than the students who play Guitar?*/

/*1. Find the list of players
playing both Chess and Bridge. Show their chessperformance data as well.*/

alter table chess
add column chessperformance int;

set sql_safe_updates = 0;

update chess
set chessperformance = rand() * 100;

select c.ID, c.FullName, c.chessperformance
from chess c inner join bridge b on c.ID = b.ID;


/*2. List the students who are
playing Piano from each class. Do mention the instrument type.*/

select s.ID, FullName, Class, Type
from student s inner join music m on s.ID = m.ID
where Type = "Piano";

/*3. Do you think the students
who play Piano score better in Maths than the students who play Guitar?*/
-- Method 1
select s.ID, s.FullName, MTest, Type
from student s inner join music m on s.ID = m.ID
where Type = "Piano" or Type = "Guitar"
order by MTest desc;

-- Method 2
select avg(MTest) into @PianoAvg       -- User Defined Variable: 'into @abc' temporarily stores value
from student s inner join music m on s.ID = m.ID
where m.Type = "Piano";

select avg(MTest) into @GuitarAvg
from student s inner join music m on s.ID = m.ID
where m.Type = "Guitar";

select @PianoAvg, @GuitarAvg;

select if( @PianoAvg > @GuitarAvg,
"Piano students are better", "Guitar students are better") as MTestResult;

-- Method 3
select m.Type, avg(MTest)
from student s inner join music m on s.ID = m.ID
where m.Type in('Piano', 'Guitar')
group by m.Type;

/*Join Queries:

1. Make a list of students and the instruments they learn. (Natural Join)

2. Find the number of students learning piano in each class.

3. List the students who have not yet chosen an instrument. (No match)

4. Make a checking list of students and the instruments they learn. The
list should also contain the students without an instrument. (Outer Join)

5. List the pair of students from the same class (without any repetitions
of the pairs). (Hint: Inner Join the Student table with itself)*/


/*1. Make a list of students and the instruments they learn. (Natural Join)*/
select s.ID, FullName, Class, Type
from student s inner join music m on s.ID = m.ID;

/*2. Find the number of students learning piano in each class.*/
select s.ID, FullName, Class, Type
from student s inner join music m on s.ID = m.ID
where Type = "Piano";

-- ANTI JOIN: helps in finding difference
/*3. List the students who have not yet chosen an instrument. (No match)*/
select s.ID, FullName, Type
from student s left join music m on s.ID = m.ID
where m.Type is null;

/*4. Make a checking list of students and the instruments they learn. The
list should also contain the students without an instrument. (Outer Join)*/
select s.ID, FullName, Class, Type
from student s left join music m on s.ID = m.ID
Union
select s.ID, FullName, Class, Type
from student s right join music m on s.ID = m.ID;

-- SELF JOIN
-- Join the same table with itself.
/*5. List the pair of students from the same class (without any repetitions
of the pairs). (Hint: Inner Join the Student table with itself)*/
select s1.Class, s1.ID, s2.ID, s2.Class
from student s1 join student s2 on s1.ID < s2.ID
where s1.Class = s2.Class;


/* Union / Intersection / Difference
Questions:
1. Students who are playing either
Chess or Bridge or both.

2. List of all deposit customers and all highccbalance customers.
Show the DepositAmt and the CCBalance amount for such customers.

3. Students who are playing both –
Chess and Bridge

4. Students who are playing only Chess

5. Students who are playing either Chess or Bridge, but not both */

/*1. Students who are playing either Chess or Bridge or both*/
select ID, FullName
from chess
union
select ID, FullName
from bridge;

/*2. List of all deposit customers and all highccbalance customers.
Show the DepositAmt and the CCBalance amount for such customers.*/
select c.CustID, CCBalance, DepositAmt
from highcreditcardbalancecustomers c left join depositcustomers d on c.CustID = d.CustID
Union
select d.CustID, CCBalance, DepositAmt
from highcreditcardbalancecustomers c right join depositcustomers d on c.CustID = d.CustID;

/*3. Students who are playing both – Chess and Bridge*/
select c.ID, c.FullName
from chess c inner join bridge b on c.ID = b.ID;

/*4. Students who are playing only Chess*/
select c.ID, c.FullName
from chess c left join bridge b on c.ID = b.ID
left join music m on c.ID = m.ID
where b.ID is null and m.ID is null;

/*5. Students who are playing either Chess or Bridge, but not both */
select c.ID, c.FullName
from chess c left join bridge b on c.ID = b.ID
where b.ID IS NULL
UNION
select b.ID, b.FullName
from chess c right join bridge b on c.ID = b.ID
where c.ID is Null;