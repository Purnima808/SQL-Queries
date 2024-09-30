/*Description

There are 2 datasets present in the file. Data 1 and Data 2
The primary key for both data1 and data2 is Order Id + Product ID combination (i.e. the individual datasets do not have any duplicate on this combination)

Provide solution and approach for the following:

1) How to identify the Records (Order ID + Product ID combination) present in data1 but missing in data2 (Specify the number of records missing in your answer)

2) How to identify the Records (Order ID + Product ID combination) missing in data1 but present in data2 (Specify the number of records missing in your answer)

3) Find the Sum of the total Qty of Records missing in data1 but present in data2

4) Find the total number of unique records (Order ID + Product ID combination) present in the combined dataset of data1 and data2*/

create database records_matching_case;

use records_matching_case;

alter table data1 rename column `Order ID` to orderID;
alter table data1 rename column `Product ID` to productID;

alter table data2 rename column `Order ID` to orderID;
alter table data2 rename column `Product ID` to productID;

/*1) How to identify the Records (Order ID + Product ID combination) present in data1 but 
missing in data2 (Specify the number of records missing in your answer)*/

select *
from data1 d1 left join data2 d2
on d1.orderID = d2.orderID and d1.productId = d2.productID
where d2.orderID is NULL and d2.productID IS NULL;

/*2) How to identify the Records (Order ID + Product ID combination) missing in data1 but 
present in data2 (Specify the number of records missing in your answer)*/

select *
from data1 d1 right join data2 d2
on d1.orderID = d2.orderID and d1.productId = d2.productID
where d1.orderID is NULL and d1.productID IS NULL;

/*3) Find the Sum of the total Qty of Records missing in data1 but present in data2*/

select sum(d2.Qty) as TotalQtyInData2ButMissingInData1
from data1 d1 right join data2 d2
on d1.orderID = d2.orderID and d1.productId = d2.productID
where d1.orderID is NULL and d1.productID IS NULL;

/*4) Find the total number of unique records (Order ID + Product ID combination) present in the combined dataset of data1 and data2*/

select *
from(
select orderID, productID
from data1 
union
select orderID, productID
from data2) as TempTable;


select d1.orderID, d1.productId
from data1 d1 left join data2 d2
on d1.orderID = d2.orderID and d1.productId = d2.productID
union
select d2.orderID, d1.productId
from data1 d1 right join data2 d2
on d1.orderID = d2.orderID and d1.productId = d2.productID;
