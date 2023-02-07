use BT12

--1. Write a SQL statement to display all the information of all salesmen
  SP_help  salesmen

--2Write a SQL statement to display a string This is SQL Exercise, Practice and Solution
 select 'This is SQl Excercise , Practic and Soluction'

--3 Write a query to display three numbers in three columns. 
 select 10,11,12

--4 Write a query to display the sum of two numbers 10 and 15 from MS SQL.
 select 10+15 'Sum'

--5 Write a query to display the result of an arithmetic expression.
 select 10+15-5*2 'arithmetic expression'

--6 Write a SQL statement to display specific columns like name and commission for all the salesmen.
 select name,commission from salesmen

 --7 Write a query to display the columns in a specific order like order date, Salesmen id,order number and purchase amount from for all the orders.
 select [ord_date],[salesman_id],[ord_no],[purch_amt] from Orders

--8 Write a query which will retrieve the value of Salesmen id of all salesmen, getting orders from the customers in orders table without any repeats
 select Distinct [customer_id],[ord_no] from Orders

--9 Write a SQL statement to display names and city of Salesmen, who belongs to the city of Paris.
 select name,city from Salesmen
 where city='paris'

--10 Write a SQL statement to display all the information for those customers with a grade of 200.
 select* from Customer
 where grade=200

-->11 Write a SQL query to display the order number followed by order date and the
--purchase amount for each order which will be delivered by the Salesmen who is
--holding the ID 5001.
select [ord_no],[ord_date],[purch_amt] from Orders
where [salesman_id]=5001

--12 Write a SQL query to display the Nobel prizes for 1970.
 select * from NobalPrize
 where year=1970

--13 Write a SQL query to know the winner of the 1971 prize for Literature.
 select year,subject,winner from NobalPrize
 where YEAR=1971 and SUBJECT='Literature'

 --14 Write a SQL query to display the year and subject that won Dennis Gabor his prize.
  select year,SUBJECT,WINNER from NobalPrize
  where WINNER='Dennis Gabor'

--15 Write a SQL query to give the name of the Physics winners since the year 1950.
 select YEAR,SUBJECT,WINNER from NobalPrize
where SUBJECT='Physics' and YEAR>=1950 

--16 Write a SQL query to Show all the details (year, subject, winner, country ) of the
--Chemistry prize winners between the year 1965 to 1975 inclusive.
select YEAR,SUBJECT,WINNER,COUNTRY from NobalPrize
where SUBJECT='Chemistry' and (YEAR>=1965 and YEAR<=1975)

--17. Write a SQL query to show all details of the Prime Ministerial winners after 1972 of
--Menachem Begin and Yitzhak Rabin
select * from NobalPrize
where CATEGORY='Prime Minister' and YEAR>1970 and WINNER in ('Menachem Begin','Yitzhak Rabin')

--19 Write a SQL query to show all the details of the winners with first name Louis.
 select *  from NobalPrize
where WINNER like ('louis%')

--20 Write a SQL query to show all the winners in Physics for 1970 together with the
--winner of Economics for 1971.
select * from NobalPrize
where (YEAR=1970 and SUBJECT='Physics') or (year=1971 and subject='Economics')

--21 Write a SQL query to show all the winners of nobel prize in the year 1970 except the subject Physiology and Economics. 

select YEAR,SUBJECT,WINNER from NobalPrize
where YEAR=1970 and SUBJECT not in ('Physiology','Economics')

--22 Write a SQL query to show the winners of a 'Physiology' prize in an early year before 1971 together with winners of a 'Peace' prize in a later year on and after the 1974. 
 select YEAR,SUBJECT,WINNER from NobalPrize
 where (SUBJECT='Physiology' and YEAR<=1971) or (SUBJECT='Peace' and year>1974)

 --23 Write a SQL query to find all details of the prize won by Johannes Georg Bednorz.
 select * from NobalPrize
 where WINNER='Johannes Georg Bednorz'

--24 Write a SQL query to find all the details of the nobel winners for the subject not started with the letter 'P' and arranged the list as the most recent comes first, then by name in order. 
 select * from NobalPrize
 where SUBJECT not like('p%')
 order by year desc ,WINNER 

 --25 Write a SQL query to find all the details of 1970 winners by the ordered to subject and winner name; but the list contain the subject Economics and Chemistry at last.
 select * from NobalPrize
 where YEAR=1970
 order by subject desc

 
 --26 Write a SQL query to find all the products with a price between Rs.200 and Rs.600.
  select PRO_NAME,PRO_PRICE from Product
  where PRO_PRICE between 200 and 600

--27 Write a SQL query to calculate the average price of all products of the manufacturer which code is 16
select avg(pro_price) 'Average price'from Product
where PRO_COM=16

--28 Write a SQL query to find the item name and price in Rs.
 select [PRO_NAME] 'Items name',[pro_price] 'Price in Rs' from Product 

 --29 Write a SQL query to display the name and price of all the items with a price is equal or more than Rs.250, and the list contain the larger price first and then by name in ascending order.   
  select PRO_NAME,PRO_PRICE from Product
  where PRO_PRICE>=250
  order by PRO_PRICE asc

--30 Write a SQL query to display the average price of the items for each company, showing only the company code.
 select PRO_COM, AVG(pro_price) 'Avg price'from Product
 group by PRO_COM

 #--31 Write a SQL query to find the name and price of the cheapest item.   
 select MIN ([pro_price]),[pro_name] from product


 #-- 32 Write a query in SQL to find the last name of all employees, without duplicate
 select * from employee1


 --33.	Write a query in SQL to find the data of employees whose last name is 'Snares'.
 select* from SalesOrder


 --34.	Write a query in SQL to display all the data of employees that work in the department 
  select* from Product

  --35	Write a query to display all customers with a grade above 100.
    select* from Customer
	where grade> 100
	order by customer_id

--36.Write a query statement to display all customers in New York who have a grade value above 100.
 select * from Customer
 where city='new york' and grade> 100

--37.Write a SQL statement to display all customers, who are either belongs to the city New York or had a grade above 100.  
select * from Customer
where city='new york' and not grade>100

--38.	Write a SQL statement to display all the customers, who are either belongs to the city New York or not had a grade above 100.   
select * from Customer
where city='new york' or not grade>100

--39.	Write a SQL query to display those customers who are neither belongs to the city New York nor grade value is more than 100
 select * from  Customer
  where not( city='new york' and grade>100)

--40 Write a SQL statement to display either those orders which are not issued on date 2012-09-10 and issued by the Salesmen whose ID is 5005 and below or those orders which purchase amount is 1000.00 and below.
select * from orders
where not (ord_date='2012-09-10 00:00:00.000') and salesman_id=5005 or purch_amt<1000.00

--41 Write a SQL statement to display Salesmen_id, name, city and commission who gets the commission within the range more than 0.10% and less than 0.12%.
 select salesman_id,name ,city,commission from salesmen
 where commission>.10 and commission<.12

 --42 Write a SQL query to display all orders where purchase amount less than 200 or exclude those orders which order date is on or greater than 10th Feb, 2012 and customer id is below 3009. 42.	Write a SQL query to display all orders where purchase amount less than 200 or exclude those orders which order date is on or greater than 10th Feb, 2012 and customer id is below 3009. 
 select * from Orders
where purch_amt<200 or not ord_date<='10-feb-2012' and customer_id <3009

--43.Display all in reverse, where order dates are 2012-08-17 or customer id greater than 3005 and purchase amount is below 1000
select * from Orders
where not (ord_date='2012-08-17 00:00:00.000') or customer_id>3005 and purch_amt<1000

--44.Write a SQL query to display order number, purchase amount, archived, the unachieved percentage for those order which exceeds the 50% of the target value of 6000.

select * ,
case
when (6000-purch_amt)>3000 then 'Aechived' else 'not Aechived'
end 'status' from Orders

--45.Write a query to find those customers with their name and those salesmen with their name and city who lives in the same
  select city ,cust_name from Customer
  union
  select city,name from Salesmen

select cust_name,name,Salesmen.city,Customer.city from Customer join Salesmen 
on customer.city=salesmen.city 

--46 Write a SQL statement to find the names of all customers along with the salesmen who works for them.
select salesman_id,cust_name from Customer
union
select salesman_id,name from Salesmen
  
 --47.	Write a SQL statement to display all those orders by the customers not located in the same cities where their salesmen live.
 select ord_no,cust_name,orders.customer_id,Orders.salesman_id from 
 Salesmen,Customer,Orders where Customer.city<>Salesmen.city and
 Orders.customer_id=Customer.customer_id and 
 orders.salesman_id = Salesmen.salesman_id

 --48.Write a SQL statement that finds out each order number followed by the name of the customers who made the order.
 SELECT orders.ord_no, customer.cust_name
FROM orders, customer
WHERE orders.customer_id = customer.customer_id

 --49.	Write a SQL statement that sorts out the customer and their grade who made an order. Each of the customers must have a grade and served by at least a salesman, who belongs to a city.


 --50.	Write a query that produces all customers with their name, city, salesman and commission, who served by a salesman and the salesman works at a rate of the commission within 12% to 14%. 

  
  --51.	Write a SQL statement that produces all orders with the order number, customer name, commission rate and earned commission amount for those customers who carry their grade more than 200 and served by an existing salesman


  --53.	Write a query to display all the orders from the orders table issued by the salesman 'Paul Adam'.
  select * from Orders where salesman_id in(select salesman_id from Salesmen 
  where name like '%paul adam%')

--54.	Write a query to display all the orders for the salesman who belongs to the city London.
select * from Orders where salesman_id in(select salesman_id from Salesmen where 
city='London')

--55.	Write a query to find all the orders issued against the salesman who works for customer whose id is 3007
select * from Orders where salesman_id in(select salesman_id from Salesmen where
salesman_id in(select salesman_id from Customer where customer_id=3007))

--56.	Write a query to display all the orders which values are greater than the average order value for 10th October 2012
select * from Orders where purch_amt > (select avg(purch_amt) from Orders where
ord_date='10-oct-2012')

--57.Write a query to find all orders attributed to a salesman in New york.
select * from Orders where salesman_id in (select salesman_id from Salesmen where
city='New york')

--58.Write a query to display the commission of all the salesmen servicing customers in Paris.
select commission from Salesmen where salesman_id in(select salesman_id from Customer where
city='Paris')

--59.	Write a query to display all the customers whose id is 2001 bellow the salesman ID of Mc Lyon.
select * from Customer where customer_id in(
select salesman_id=2001 from Salesmen where name='Mc Lyon')

--60.	Write a query to count the customers with grades above New York's average.
select * from Customer where grade> (select AVG(grade) from Customer where city='new york')

--61.	Write a query to display all customers with orders on October 5, 2012.
select * from Customer where customer_id in(select customer_id from Orders where ord_date='5-oct-2012')

--62.Write a query to display all the customers with orders issued on date 17th August, 2012.
select * from Customer where customer_id in(select customer_id from Orders where ord_date='17-aug-2012')

--63.	Write a query to find the name and numbers of all salesmen who had more than one customer.
select name,  count(*) from Salesmen where salesman_id in
(select salesman_id from Customer group by salesman_id having count(*)>1)
group by name

--64.	Write a query to find all orders with order amounts which are 
--above-average amounts for their customers.
select * from Orders where purch_amt>(select AVG(purch_amt) from Orders)

--65.	Write a queries to find all orders with order amounts which are on or above-average amounts for their customers.

--66

--67 Write a query to extract the data from the customer table if and only if one or more of the customers in the customer table are located in London.
select * from Customer where exists (select * from Customer where city='london')

--68 Write a query to find the salesmen who have multiple customers
select * from Customer where salesman_id in (select salesman_id from Customer group by salesman_id having COUNT(*)>1)


use bt12


















