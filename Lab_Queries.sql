create database Lab_Queries

--6
select name,commission from salesmen
--7
select ord_date,salesman_id,ord_no,purch_amt from Orders
--8
select DISTINCT(customer_id),ord_no from Orders
--9
select name,city from Salesmen
where city='Paris'
--10
select * from Customer
where grade=200
--11
select ord_no,purch_amt,ord_date from Orders
where salesman_id=5001
--12
select * from NobalPrize
where YEAR=1970
--13
select * from NobalPrize
where SUBJECT='Literature'
--14
select YEAR,SUBJECT,WINNER from NobalPrize
where WINNER='Dennis Gabor'
--15
select YEAR,SUBJECT,WINNER from NobalPrize
where SUBJECT='Physics'
--16
select year, subject, winner, country from NobalPrize
where YEAR>=1965 and YEAR<=1975
--17
select * from NobalPrize
where YEAR>1972 and CATEGORY='Prime Minister'
--19
select * from NobalPrize
where WINNER like 'louis%'
--20
select * from NobalPrize
where (YEAR=1970 and SUBJECT='Physics') or (YEAR=1971 and SUBJECT='Economics')
--21
select * from NobalPrize
where not (SUBJECT='Physiology' and SUBJECT='Economics') 
--22
select * from NobalPrize
where (YEAR<=1971 and SUBJECT='Physiology') or (YEAR>=1974 and SUBJECT='Peace')
--23
select * from NobalPrize
where WINNER='Johannes Georg Bednorz'
--24
select * from NobalPrize
where not (SUBJECT like 'p%')
order by year desc
--25
select YEAR,SUBJECT,WINNER from NobalPrize
where year=1970
order by SUBJECT desc
--26
select * from Product
where PRO_PRICE>=200 and PRO_PRICE<=600
--27
select pro_com,AVG(pro_price) 'Average_Price' from Product
where PRO_COM=16
group by PRO_COM
--28
select distinct(PRO_NAME) 'Item name',PRO_PRICE 'Price in Rs' from Product
--29
select PRO_NAME,PRO_PRICE from Product
where PRO_PRICE>=250
order by PRO_PRICE desc ,PRO_NAME asc
--30
select distinct(pro_com),avg(pro_price) 'Average Price' from product
group by PRO_COM
--31
select distinct(PRO_NAME),min(PRO_PRICE) from Product
group by PRO_NAME
--32
select distinct(EMP_LNAME) from Employee
--33
select * from Employee
where EMP_LNAME='Snares'
--34
select * from Employee
where EMP_DEPT=57
--35
select * from Customer
where grade>100
--36
select * from Customer
where city='New York' and grade>100
--37
select * from Customer
where city='New York' or grade>100
--38
select * from Customer
where city='New York' or not(grade>100)
--39
select * from Customer
where not (city='New York' and grade>100)
--40
select * from Orders
where (not (ord_date='2012-09-10 00:00:00.000' and salesman_id=5005)) or purch_amt<1000
--41
select * from Salesmen
where commission>=.10 and commission<=.12
--42
select * from Orders
where (purch_amt<200 or (not (ord_date<='10-Feb-2012')) and customer_id<3009)
--43
select * from Orders
where not( (ord_date='2012-08-17 ' or customer_id>3005 ) and purch_amt<1000)
--44
select *,
case
when (6000-purch_amt)>3000 then 'Archived' else 'Unachived'
end 'Status' from Orders
--45
select cust_name,name,Customer.city from Customer join Salesmen on Customer.city=Salesmen.city
--46

--53
select * from Orders where orders.salesman_id  in (select Salesmen.salesman_id from Salesmen where name='Paul Adam')
--54
select * from Orders where orders.salesman_id  in (select Salesmen.salesman_id from Salesmen where city='London')
--55
select * from Orders where salesman_id in (select salesman_id from Orders where customer_id=3007)
--anotherway
select * from Orders where salesman_id in (select salesman_id from Salesmen where salesman_id in (select salesman_id from Customer where customer_id=3007))
--56
select * from Orders where purch_amt > (
select AVG(purch_amt) from Orders where ord_date='2012-10-10 00:00:00.000')
--57
select * from Orders where salesman_id in (select salesman_id from Salesmen where city='New York')
--58
select city,commission from Salesmen where salesman_id in (select salesman_id from Customer where city='Paris')
--59
select *from Customer where customer_id in( 
select salesman_id from Salesmen where salesmen.name like '%MC%')
--60
select count(*) from Customer where grade >( 
select AVG(grade) from Customer where city='new york')
--61
select * from Customer where salesman_id in ( select salesman_id from Orders where ord_date='2012-10-05 00:00:00.000')
--62
select * from Customer where salesman_id in ( select salesman_id from Orders where ord_date='2012-08-17')
--63
select name,count(*) from Salesmen where salesman_id in(
select salesman_id from Customer group by salesman_id having COUNT(*)>1)
group by name
--64
select * from Orders
where purch_amt>( select avg(purch_amt)from Orders)

select * from Orders
select * from Salesmen
select * from Customer
select * from Orders




























