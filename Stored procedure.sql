use bt12

create function getGst(@amt float)
returns float
as
begin
  return @amt*.18
end

select Sales, dbo.getGst(sales) from SalesOrder

--Table Funcion
create function getCatSummary(@cat varchar(20))
returns table
as
 return select category,sum(sales) 'Total Sales' from SalesOrder where Category=@cat
  group by Category

select * from dbo.getCatSummary('furniture')
select * from dbo.getCatSummary('technology')

--print statement cannot be used in function body
--Error handling cannot be done function
--Function should be return a values
-----------------------------------------------

--> Stored procedure

create table test10
(
tid int,
tname varchar(20),
tage int
)

create table test11
(
tid int,
tname varchar(20),
tage int
)



alter table test11
add tproject_name varchar(100)

select * from test10

select * from test11

create proc spInsertdata1(@tid int,@tname varchar(20),@tage int,@tproject_name varchar(100))
as
begin
   insert into test10(tid,tname,tage) values (@tid,@tname,@tage)
   insert into test11(tid,tname,tage,tproject_name) values (@tid,@tname,@tage,@tproject_name)
end

execute spInsertdata1 1,'Rajiv',18,'Python'
select * from test10
select * from test11

alter proc spInsertdata1(@tid int,@tname varchar(20),@tage int,@tproject_name varchar(100))
as
begin
   insert into test10(tid,tname,tage) values (@tid,@tname,@tage)

   declare @project_name varchar (100)
   if @tage <20 set @tproject_name='Internship'
   else set @tproject_name='Python project'
   insert into test11(tid,tname,tage,tproject_name) values (@tid,@tname,@tage,@tproject_name)
end

execute spInsertdata1 1,'Ayush',40,'python'
select * from test10
select * from test11
















