create database BBS

use BBS

--2
create table User_login
(
user_id int identity(50,1)  Primary key,
password varchar(10) unique
)  

insert into User_login(password)
values ('ayush@'),('zack@'),('nick90@')

select * from User_login
-------------------------------------------------------------
create table Subscription
(
S_id int identity(20,1) Primary key,
S_cost float ,
S_details varchar(50),
S_area varchar(30),
S_speed varchar(20)
)

insert into Subscription(S_cost,S_details,S_area,S_speed)
values (23000,'Pikashow','noida','100mbps'),(25000,'movies','mumbai','1gb'),(30000,'web series','delhi','500mbps')

select * from Subscription
------------------------------------------------------------------
create table Cust_details
(
C_id int identity(40,1) Primary key,
C_mobile_no varchar(20) unique,
C_name varchar(20),
C_address varchar(20),
C_type varchar(20),
C_id_proof varchar(18),
User_id int foreign key references User_login(user_id),
Subscription_id int foreign key references Subscription(S_id) 
)

insert into Cust_details(C_mobile_no,C_name,C_address,C_type,C_id_proof,User_id,Subscription_id)
values(3564856748,'ayush','maujpur delhi 53','new','ayu123',50,20),
      (6574834757,'raj','bhajnpura delhi','regular','raj234',51,21),
	  (7464484747,'chandan','laxmi nagar','regular','chandan23',52,22) 

	  select * from Cust_details
------------------------------------------------------------------------------------------

create table Bills
(
bill_no int identity(5001,1) primary key,
month varchar(20),
cost money ,
stuatus varchar(20),
C_id int foreign key references Cust_details(C_id),
S_id int foreign key references Subscription(S_id)
)

insert into Bills(month,cost,stuatus,C_id,S_id)
values ('Jan',1000,'paid',40,20),('feb',1500,'Regular',41,21),('march',2000,'paid',42,22)

select * from Bills


Create Table Transaction_Details
(
T_id int Identity(200,1) Primary Key,
Date_of_Issue date,
Paid_Amount float,
Pay_Method varchar(50),
Bill_no int foreign key references Bills(Bill_no)
)
insert into Transaction_Details(Date_of_Issue,Paid_Amount,Pay_Method,Bill_no)
   values ('10-jan-2023',10000,'Cash',5001),('11-jan-2023',15000,'paid',5002),('12-jan-2023',11000,'online',5003)

--------------------------------------------------------------------------------------------

--Answer3
create proc SpInsertSub(@name varchar(20),@mobile varchar(20),@id_prof varchar(20),@type varchar(20),@city varchar(20),@area varchar(20),@password varchar(20))
as
begin
	Select c.C_id,c.C_Name,c.C_Address,CONCAT(s.S_Details,' @ ',s.S_Speed,' at Rs ',s.S_Cost) as [Subscription Plan] from Cust_details C
	Join Subscription S
		On C.Subscription_id = S.S_id
	where C.C_Name = @name    
	end

	exec SpInsertSub 'Ayush',6345673836,'631/23 maujpur','regular','Delhhi','maujpur','Incorrect@'
----------------------------------------------
--Answer 3 and 4 both are same
-----------

--Answer 5
create proc spSubscricipitionPlan(@sub_id varchar(20),@month varchar(20),@cust_details varchar(20))
as
 begin
     select C.c_id,C.c_name,C.c_address,CONCAT(S.s_details,' @ ',S.s_speed,' Rs ',S.s_cost) from Cust_details C
	 join Subscription S
	 on C.Subscription_id=S.S_id
	 join Bills B on
	 B.S_id=S.S_id
	 end

	execute spSubscricipitionPlan 20,'Jan',40

	------------------------------------------------------------------------------------

--Answer6
create proc SpBillGenrate(@sub_id int,@month varchar(20),@cust_id int)
as
 begin
 select B.bill_no,B.month,TD.t_id,TD.date_of_issue,C.c_id,C.c_name,C.c_address,CONCAT(S.s_details,' @ ',S.s_speed,' Rs ',S.s_cost) as 'Subscription details',B.cost,B.stuatus from Cust_details C
 join Subscription S  on C.Subscription_id=S.S_id
	 join Bills B on B.S_id=S.S_id
	 join Transaction_Details TD on
	 TD.Bill_no=B.bill_no
	 where @cust_id=C.C_id
end

execute SpBillGenrate 21,'Feb',42

---7Answer
create proc SptransactionStatus(@date_issue varchar(20),@paid_amt float,@pay_method Varchar(20),@bill_no int)
As
Begin
	Insert Into Transaction_Details(Date_of_Issue,Paid_Amount,Pay_Method,Bill_no) 
		Values(@date_issue,@paid_amt,@pay_method,@bill_no)

		select B.bill_no,B.month,TD.t_id,TD.date_of_issue,B.cost,B.stuatus from Bills B
		join Transaction_Details TD on
		TD.Bill_no=B.bill_no
		where td.Bill_no=B.bill_no
		end
    exec SptransactionStatus '09-jan-2023',23000,'cash',5002

--8Answer
Create Trigger tr_UpdateBillStatus on Bills for Update
as
begin
	
	declare @bill_num int
	Select @bill_num = Bill_no from deleted
	Update Bills set stuatus = 'Paid'
	where Bill_no = @bill_num	
end

select * from Bills
update Bills set cost=2000 where bill_no=5002