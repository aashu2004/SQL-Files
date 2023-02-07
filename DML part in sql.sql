use bt13

create table t12
(
tid int,
tname varchar(20),
tage int
)

---insert---
insert into t12(tid,tname,tage)
values (1,'Ayush',19),(2,'Rajiv',22),(3,'Chandan',23)

select * from t12

--copy data into new table--
select * into t13 from t12 where tage>18

select * from t13  
select * from t12

--to copy data in existing table--
 insert into t13(tid,tname) select tid,tname from t12 where tid=2

 select * from t13
 -------------
 --update-----
 --syntax 
 --update <table> set col=newvalue,col=newvalue...where <condition>
 update t13 set tage=30,tname='Rahul'
 update t13 set tname='MR.'+tname
 select * from t13

 ----delete--
 --delete from <table> where condition
 delete from t13 where tid<=1
  select * from t13

  ---truncate table-- delete all data except structure
  truncate table t13
    select * from t13

	---drop-- delete all structure
	drop table t13
	  select * from t13

--------------
--t-sql---
---------
--variable-
--declare @varchar as <datatype>
declare @id int, @age int,@name varchar(20)
set @id=1
set @age=22
set @name ='Rajiv'
print @age
print @name
------------------------

declare @var1 int
set @var1=10
if @var1>5 print 'hello'
else print'bye'
-----------------------
declare @var1 int
set @var1=10
if @var1>5 begin print 'hello' print 'Welcome' end
else begin print'bye' print 'goodbye' end
-----------------------------------------------
--Multilevel if else----

declare @var1 int
set @var1=10
if @var1>15 begin print 'hello' end
   else if @var1>10 begin print 'hello1' end
 else print 'bye'
 ----------------------------------------------------

 declare @var1 int , @var2 int
 set @var1=1
 set @var2=20
if @var1>5 and @var2>5 print 'var1 and var2 >5' else
if @var1>5 and @var2<5 print 'var1 >5 but var2 not'
else
 print 'var2>5 but var1 not >5'


---------------------------------------------------------

declare @var1 int, @var2 int ,@var3 int
set @var1=5
set @var2=10
set @var3=15
   begin
       if @var1>@var2 and @var1>@var3 print 'var1 is greatest'
	else
	    if @var2>@var1 and @var2>@var3 print 'var2 is greatest'
	else
	    print 'var3 is greatest'
		end
-----------------------------------------------------------------
--loops-------
-------------
declare @i int
set @i=1
while  @i<5
begin
   print @i
   set @i=@i+1
   end
   ---------------------------

declare @i int
set @i=1
while @i<10
begin
   set @i=@i+1
   print @i
end
----------------------------------------

declare @i int
set @i=1
while @i<5
begin
     set @i=@i+1
	 if @i=4 continue
	 print @i
	 end
-------------------------------------------------
declare @i int
set @i=0
while @i<5
begin
      set @i=@i+1
	 if @i=4 break
	 print @i
end
-----------------------------------------

declare @num1 float,@num2 float, @reasult float
set @num1=10
set @num2=2
set @reasult= @num1/@num2
print @reasult
------------------------------------------------------
---error handling to remove the error
------------------------------------

begin try
declare @num1 float,@num2 float, @reasult float
set @num1=10
set @num2=0
set @reasult= @num1/@num2
print @reasult
end try
begin catch
     print 'some error in code'
	 end catch
---------------------------------------------------------------
--FUNCTION APPROCH----------------------------

create function getmsg1()
returns varchar(20)
as
begin
  return 'hi from getmsg'
  end

  select dbo.getmsg1()
---------------------------------------------

alter function getmsg1(@name varchar(20))
returns varchar(20)
as
begin
  return 'hi '+@name
  end

  select dbo.getmsg1('Ayush')

  ------------------------------------------------
  select * from t12
  select *,dbo.getmsg(tname) from t12
  ---------------------------------------------------

  select * from salesorder
  create function getdiscount (@cat varchar(20),@sales float)
  returns float 
  as 
  begin
      declare @discount float
	  if @cat='furniture' set @discount=@sales*.20
	  else if @cat='technology' set @discount=@sales*.10
	  else set @discount=0

	  return @discount
	  end

	  select category,sales from SalesOrder

select category,sales,
case
when category='furnitur' then sales*.20
when category='technology' then sales*.10
else 0
end 'sales discount'
 from SalesOrder



































