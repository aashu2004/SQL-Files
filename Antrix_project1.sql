--Answer1
create Database ANTRIX_PROJECT1

use ANTRIX_PROJECT1

--Answer2
create table timetable
(
Cdate datetime,
Starting_time Datetime,
Ending_time Datetime,
Course_name varchar(20),
Lesson_topic varchar(20),
room_no int
)

--Answer3(a)
alter table timetable
add teacher_name varchar(20)

--(b)
alter table timetable
alter column room_no varchar(5)

--(c) 
alter table timetable
drop column Lesson_topic

--Answer4 
create table product
(
Product_id int identity(1,1) primary key,
Product_Name varchar(12) unique,
Product_Rate money check (Product_rate>0),
Product_Location varchar(12) check (Product_location in('Delhi','Mumbai')),
Product_Manager_Id int foreign key references Employee(Employee_id)
)

--Answer 5

create table Department
(
Department_id int identity(1,1) primary key,
Department_name varchar(12) unique,
Head_quarter varchar(12) default 'Bangaluru'
)

--Answer6
create table Employee
(
Employee_Id int identity(21,1) primary key,
Employee_Name varchar(12) unique,
Employee_Age int check (Employee_age>18),
Employee_Salary money ,
Department_Id int foreign key references Department(Department_id)
)


select * from vwsalesreport1
--Answer7 
create table Sales
(
Sales_id int identity(71,1) primary key,
Product_Id int foreign key references product(product_id),
Employee_Id int foreign key references Employee(Employee_id),
Unit_Sold int ,
Product_Manager_Id int foreign key references Employee(Employee_id),
Order_Date date default getdate()
)

--Answer8

select * from vwSalesReport1

--Answer9
create proc spInsertData(@product_name varchar(12),@product_rate money , @product_location varchar(12))

as
begin
   insert into product(product_name,product_rate,product_location) values (@product_name,@product_rate,@product_location)
end

execute spInsertData 'nike',23000,'delhi'

--10
create proc newproc (@Employee_id int)
as
begin
select Employee_name,Unit_Sold,unit_sold*product_rate as 'total sale' from sales join product on
product.Product_id=Sales_id join Employee on
product.Product_id=Sales.Sales_id
where employee.Employee_Id=@Employee_id
end


--11 Answer
create function ProductCategory(@product_rate money)
returns varchar(20)
as
begin
   declare @category varchar(20)

   if @product_rate>5000 set @category='Gold'
   else if @product_rate between 5000 and 3000 set @category='Silver'
return @category
end

--12 Answer
alter function getdivision (@num1 int, @num2 int)
returns float
as 
begin
return @num1/@num2
end

begin try
select dbo.getdivision(10,2)
end try
begin catch
select 0
end catch

--13 answer
create function newdata (@Employee_id int)
returns table
as
 return select Employee_name,Unit_Sold,unit_sold*product_rate as 'total sale' from sales join product on
product.Product_id=Sales_id join Employee on
product.Product_id=Sales.Sales_id



--14 Answer
create trigger trdeleteproduct on product for delete
as
begin
   rollback
   print 'Deletion aborted'
end

--15 Answer
create table temp_product
(
Product_id int,
Product_Name varchar(12),
Product_Rate money,
Product_Location varchar(12),
Product_Manager_Id int
)

select * from product
select * from temp_product

create trigger trInsertProduct on product for insert
as 
begin
  declare @prd_rate int
  select @prd_rate=Product_Rate from inserted
  if @prd_rate >5000
  insert into temp_product select * from inserted
  end

  insert into product(Product_Name,Product_Rate,Product_Location)
  values ('Book',6000,'Mumbai')

    insert into product(Product_Name,Product_Rate,Product_Location)
  values ('Zara',4000,'Delhi')

  

