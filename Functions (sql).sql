use BT12

select * from SalesOrder

select segment,category,sales from SalesOrder

select segment,category,sales from SalesOrder
where sales>500

select segment,category,sales from SalesOrder
where segment='consumer'

select Segment,Category,Sales 'Total sales',[Order Date] from SalesOrder
where sales>3000
order by sales desc

select segment,sum(sales) from SalesOrder
group by Segment
having sum(sales)>5000

--to list down specfic column and rows
select segment,category,sales 'Total sales',[order date] from SalesOrder

--text:- =,<>,like,in
select segment,category,sales 'Total sales',[order date] from SalesOrder
where segment='corporate'

select segment,category,sales 'Total sales',[order date] from SalesOrder
where segment<>'corporate'

select segment,category,sales 'Total sales',[order date] from SalesOrder
where segment like 'co%'


select segment,category,sales 'Total sales',[order date] from SalesOrder
where segment in('corporate' ,'consumer')


select segment,category,sales 'Total sales',[order date] from SalesOrder
where sales between 2000 and 3000

--date:- day,month,year,datepart,datediff,dateadd...
select segment,category,sales 'Total sales',[order date] from SalesOrder
where [order date]>'1-jan-2014'

select segment,category,sales 'Total sales',[order date] from SalesOrder
where [order date] between'1-jan-2014' and '31-mar-2014'

--logical operator: and, or,not
select segment,category,sales 'Total sales',[order date] from SalesOrder
where not (sales between 2000 and 3000)

---is operator:- null/blank
select segment ,sales , [postal code] from SalesOrder
where [postal code] is not null

select segment ,sales , [postal code] from SalesOrder
where [postal code] is null

---function:
--Row by row= use in where clause
-->date: day,month,year,datepart,datediff,dateadd...
-->text:- left,right,substring,upper,lower...
-->Date and text part of where clause
--Group by group= use in having
--> Number:sum,max,min,avg... 

select segment,
left(Segment,2)as 'left',
right(segment,2) as 'Right',
substring(segment,2,5) as Substring from SalesOrder

select segment ,sales from SalesOrder
where left(segment,3)='co'

-------->Date and text part of where clause

select getdate()

select [order date],[ship date],
datepart(month,[order date]),datename(month,[order date])
 ,dateadd(month,24,[Order Date]),dateadd(month,-24,[Order Date])
 from SalesOrder

select [order date],[ship date],
datediff(day,[order date],[ship date]) 'TAT day' from SalesOrder
where datediff(day,[order date],[ship date])>2

--waq to below output 
--segment,category,sales,[order date],[ship date], new column
--->New column TAT>2 'sla breached'else 'within sla'

select segment,category,sales,[order date],[ship date],
case
when datediff(day,[order date],[ship date])>2 then 'sla breached'
else 'within sla'
end 'SLA category' from SalesOrder

-------> group by summarisation
--1.all column should be part of group by clause if they coing with agg fun.

select segment,category,[Sub-Category],max (sales),sum(sales) from SalesOrder

group by Segment,Category,[Sub-Category]
having sum(sales)>1000
order by 1,2,3

--waq to show year and segment wise sum of sale
select year([order date]),segment,sum(sales) from SalesOrder
where year([order date]) in (2012,2013)
group by  year([order date]),segment
order by 1 

---->pivot
select * from(select segment, category ,sales from SalesOrder) A1
pivot (sum(sales) for category in ([technology],[furniture],[office supply])) a1

select * from (select year([order date]) 'Years' ,segment,sales,category from SalesOrder) A1
pivot (sum(sales) for category in([furniture],[technology],[office supply])) A2

select years,segment,round(technology,2),furniture,[office supply] from (select year([order date]) 'Years' ,segment,sales,category from SalesOrder) A1
pivot (sum(sales) for category in([furniture],[technology],[office supply])) A2


-----------------------------------------------------------------------------
--------------------------------------------------------------------------------
use bt12
--To find all tables in database]\

select * from sys.tables

-- To list down table structure

sp_help salesorder

--To list down all roes and all column from table
select * from BT12.dbo.SalesOrder
select * from SalesOrder

--to list down specfic column with all rows
--operator: relational ,comparision
--text: =,<>, like,in
select segment,category,sales as 'Total Revenue' ,[order date] from SalesOrder
where Segment='corporate'

select segment,category,sales as 'Total Revenue' ,[order date] from SalesOrder
where Segment<>'corporate'

select segment,category,sales as 'Total Revenue' ,[order date] from SalesOrder
where Segment like'cor%'

select segment,category,sales as 'Total Revenue' ,[order date] from SalesOrder
where Segment like'%co%'

select segment,category,sales as 'Total Revenue' ,[order date] from SalesOrder
where Segment in ('consuer','corporate')

--numbers: <,>,<>,<=,>=,between...and
select segment,category,sales as 'Total Revenue' ,[order date] from SalesOrder
where Sales between 3000 and 5000

select segment,category,sales as 'Total Revenue' ,[order date] from SalesOrder
where Sales>3000

select segment,category,sales as 'Total Revenue' ,[order date] from SalesOrder
where Sales<3000

--Dates: <,>,<>,<=,>=,between...and
select  segment, category,sales 'Total Revenue',[order date] from salesorder
where [order date]='2014-01-28 00:00:00.000'

select  segment, category,sales 'Total Revenue',[order date] from salesorder
where [order date] between '1-jan-2014' and '31-march-2014'

select  segment, category,sales 'Total Revenue',[order date] from salesorder
where [order date]>'2014-01-28 00:00:00.000'

--logical operator: and ,or, not
select  segment, category,sales 'Total Revenue',[order date] from salesorder
where segment='consumer' and sales>4000

select  segment, category,sales 'Total Revenue',[order date] from salesorder
where segment='consumer' or sales>4000

select  segment, category,sales 'Total Revenue',[order date] from salesorder
where not (segment='consumer' and sales>4000)

select  segment, category,sales 'Total Revenue',[order date] from salesorder
where not (sales between 2000 and 3000)

---------------------
--Is operator: null/blank
select segment,sales,[postal code] from SalesOrder
where [postal code] is not null

select segment,sales,[postal code] from SalesOrder
where [postal code] is null

----------------------------
--Functions
--Row by Row  => use in where clause
--text: left,right,substring,len
--date: year,month,day,datepart,datename,dateadd,datediff
--Group by group=> use in having
---number : sum,max, min,avg

select segment,left(segment,2) 'Left',
right(segment,2) 'Right',
substring(segment,2,5) 'Mid',len(segment) 'len' from SalesOrder

select segment,sales from SalesOrder
where left(segment,2)='ho'

--date: year,month,day,datepart,datename,dateadd,datediff

select year(getdate())

select [order date],[ship date],
datepart(month,[order date]),
datename(month,[order date]),
dateadd(YEAR,2,[order date]),
dateadd(YEAR,-2,[order date]) from salesorder

select [order date],[ship date],
datediff(day,[order date],[ship date]) from SalesOrder

select [order date],[ship date],
datediff(day,[order date],[ship date]) 'Tat days' from SalesOrder
where datediff(day,[order date],[ship date]) >2

--waq to below output 
--segment,category,sales,[order date],[ship date], new column
--->New column TAT>2 'sla breached'else 'within sla'

select segment,category,[order date],[ship date],
case
when datediff(day,[order date],[ship date])>2 then 'Sla breached'
else 'Within sla'
end 'Tat status'
from SalesOrder

-------Group by :for summarization
1-- all normal column should be part of group by clause by chance if they coming with agg function
select max(sales),avg(sales) from SalesOrder

select segment ,category,max(sales),avg(sales) from SalesOrder
group by Segment,category

select segment ,category,max(sales),avg(sales),sum(sales) 'Total sales' from SalesOrder
group by Segment,category
order by 'Total sales'

select segment ,category,max(sales),avg(sales),sum(sales) 'Total sales' from SalesOrder
group by Segment,category
having sum(sales)>4500
order by 'Total sales'

--waq to show year and segment wise sum of sales
select segment,year([order date]),sum(sales) 'Total sales' from SalesOrder
group by year([order date]),segment
order by 2

-------------PIVOT---
select years,segment,round(technology,0),furniture,[office supplies] from (select segment,category,Sales,YEAR([order date]) 'years' from salesorder)
p1
pivot
(sum(sales) for category in ([technology],[furniture],[office supplies]))b1


use bt12




















































































--syntex function
--date:- day,month,year,datepart,datediff,dateadd...
--text:- left,right,substring,upper,lower...
-->Date and text part of where clause
-- Number:sum,max,min,avg...



















