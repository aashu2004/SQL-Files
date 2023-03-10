
/****** Object:  Table [dbo].[Salesmen]    Script Date: 05/06/2021 12:14:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salesmen](
	[salesman_id] [float] NULL,
	[name] [nvarchar](255) NULL,
	[city] [nvarchar](255) NULL,
	[commission] [float] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Salesmen] ([salesman_id], [name], [city], [commission]) VALUES (5001, N'James Hoog', N'New York', 0.15)
INSERT [dbo].[Salesmen] ([salesman_id], [name], [city], [commission]) VALUES (5002, N'Nail Knite', N'Paris', 0.13)
INSERT [dbo].[Salesmen] ([salesman_id], [name], [city], [commission]) VALUES (5005, N'Pit Alex', N'London', 0.11)
INSERT [dbo].[Salesmen] ([salesman_id], [name], [city], [commission]) VALUES (5006, N'Mc Lyon', N'Paris', 0.14)
INSERT [dbo].[Salesmen] ([salesman_id], [name], [city], [commission]) VALUES (5003, N'Lauson Hen', NULL, 0.12)
INSERT [dbo].[Salesmen] ([salesman_id], [name], [city], [commission]) VALUES (5007, N'Paul Adam', N'Rome', 0.13)
/****** Object:  Table [dbo].[Product]    Script Date: 05/06/2021 12:14:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[PRO_ID] [float] NULL,
	[PRO_NAME] [nvarchar](255) NULL,
	[PRO_PRICE] [float] NULL,
	[PRO_COM] [float] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Product] ([PRO_ID], [PRO_NAME], [PRO_PRICE], [PRO_COM]) VALUES (101, N'Mother Board', 3200, 15)
INSERT [dbo].[Product] ([PRO_ID], [PRO_NAME], [PRO_PRICE], [PRO_COM]) VALUES (102, N'Key Board', 450, 16)
INSERT [dbo].[Product] ([PRO_ID], [PRO_NAME], [PRO_PRICE], [PRO_COM]) VALUES (103, N'ZIP drive', 250, 14)
INSERT [dbo].[Product] ([PRO_ID], [PRO_NAME], [PRO_PRICE], [PRO_COM]) VALUES (104, N'Speaker', 550, 16)
INSERT [dbo].[Product] ([PRO_ID], [PRO_NAME], [PRO_PRICE], [PRO_COM]) VALUES (105, N'Monitor', 5000, 11)
INSERT [dbo].[Product] ([PRO_ID], [PRO_NAME], [PRO_PRICE], [PRO_COM]) VALUES (106, N'DVD drive', 900, 12)
INSERT [dbo].[Product] ([PRO_ID], [PRO_NAME], [PRO_PRICE], [PRO_COM]) VALUES (107, N'CD drive', 800, 12)
INSERT [dbo].[Product] ([PRO_ID], [PRO_NAME], [PRO_PRICE], [PRO_COM]) VALUES (108, N'Printer', 2600, 13)
INSERT [dbo].[Product] ([PRO_ID], [PRO_NAME], [PRO_PRICE], [PRO_COM]) VALUES (109, N'Refill cartridge', 350, 13)
INSERT [dbo].[Product] ([PRO_ID], [PRO_NAME], [PRO_PRICE], [PRO_COM]) VALUES (110, N'Mouse', 250, 12)
/****** Object:  Table [dbo].[Orders]    Script Date: 05/06/2021 12:14:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ord_no] [float] NULL,
	[purch_amt] [float] NULL,
	[ord_date] [datetime] NULL,
	[customer_id] [float] NULL,
	[salesman_id] [float] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Orders] ([ord_no], [purch_amt], [ord_date], [customer_id], [salesman_id]) VALUES (70001, 150.5, CAST(0x0000A0E100000000 AS DateTime), 3005, 5002)
INSERT [dbo].[Orders] ([ord_no], [purch_amt], [ord_date], [customer_id], [salesman_id]) VALUES (70009, 270.65, CAST(0x0000A0C800000000 AS DateTime), 3001, 5005)
INSERT [dbo].[Orders] ([ord_no], [purch_amt], [ord_date], [customer_id], [salesman_id]) VALUES (70002, 65.26, CAST(0x0000A0E100000000 AS DateTime), 3002, 5001)
INSERT [dbo].[Orders] ([ord_no], [purch_amt], [ord_date], [customer_id], [salesman_id]) VALUES (70004, 110.5, CAST(0x0000A0B000000000 AS DateTime), 3009, 5003)
INSERT [dbo].[Orders] ([ord_no], [purch_amt], [ord_date], [customer_id], [salesman_id]) VALUES (70007, 948.5, CAST(0x0000A0C800000000 AS DateTime), 3005, 5002)
INSERT [dbo].[Orders] ([ord_no], [purch_amt], [ord_date], [customer_id], [salesman_id]) VALUES (70005, 2400.6, CAST(0x0000A09B00000000 AS DateTime), 3007, 5001)
INSERT [dbo].[Orders] ([ord_no], [purch_amt], [ord_date], [customer_id], [salesman_id]) VALUES (70008, 5760, CAST(0x0000A0C800000000 AS DateTime), 3002, 5001)
INSERT [dbo].[Orders] ([ord_no], [purch_amt], [ord_date], [customer_id], [salesman_id]) VALUES (70010, 1983.43, CAST(0x0000A0E600000000 AS DateTime), 3004, 5006)
INSERT [dbo].[Orders] ([ord_no], [purch_amt], [ord_date], [customer_id], [salesman_id]) VALUES (70003, 2480.4, CAST(0x0000A0E600000000 AS DateTime), 3009, 5003)
INSERT [dbo].[Orders] ([ord_no], [purch_amt], [ord_date], [customer_id], [salesman_id]) VALUES (70012, 250.45, CAST(0x0000A07D00000000 AS DateTime), 3008, 5002)
INSERT [dbo].[Orders] ([ord_no], [purch_amt], [ord_date], [customer_id], [salesman_id]) VALUES (70011, 75.29, CAST(0x0000A0B000000000 AS DateTime), 3003, 5007)
/****** Object:  Table [dbo].[NobalPrize]    Script Date: 05/06/2021 12:14:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NobalPrize](
	[YEAR] [float] NULL,
	[SUBJECT] [nvarchar](255) NULL,
	[WINNER] [nvarchar](255) NULL,
	[COUNTRY] [nvarchar](255) NULL,
	[CATEGORY] [nvarchar](255) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[NobalPrize] ([YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (1970, N'Physics', N'Hannes Alfven', N'Sweden', N'Scientist')
INSERT [dbo].[NobalPrize] ([YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (1970, N'Physics', N'Louis Neel', N'France', N'Scientist')
INSERT [dbo].[NobalPrize] ([YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (1970, N'Chemistry', N'Luis Federico Leloir', N'France', N'Scientist')
INSERT [dbo].[NobalPrize] ([YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (1970, N'Physiology', N'Ulf von Euler', N'Sweden', N'Scientist')
INSERT [dbo].[NobalPrize] ([YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (1970, N'Physiology', N'Bernard Katz', N'Germany', N'Scientist')
INSERT [dbo].[NobalPrize] ([YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (1970, N'Literature', N'Aleksandr Solzhenitsyn', N'Russia', N'Linguist')
INSERT [dbo].[NobalPrize] ([YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (1970, N'Economics', N'Paul Samuelson', N'USA', N'Economist')
INSERT [dbo].[NobalPrize] ([YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (1970, N'Physiology', N'Julius Axelrod', N'USA', N'Scientist')
INSERT [dbo].[NobalPrize] ([YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (1971, N'Physics', N'Dennis Gabor', N'Hungary', N'Scientist')
INSERT [dbo].[NobalPrize] ([YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (1971, N'Chemistry', N'Gerhard Herzberg', N'Germany', N'Scientist')
INSERT [dbo].[NobalPrize] ([YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (1971, N'Peace', N'Willy Brandt', N'Germany', N'Chancellor')
INSERT [dbo].[NobalPrize] ([YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (1971, N'Literature', N'Pablo Neruda', N'Chile', N'Linguist')
INSERT [dbo].[NobalPrize] ([YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (1971, N'Economics', N'Simon Kuznets', N'Russia', N'Economist')
INSERT [dbo].[NobalPrize] ([YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (1978, N'Peace', N'Anwar al-Sadat', N'Egypt', N'President')
INSERT [dbo].[NobalPrize] ([YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (1978, N'Peace', N'Menachem Begin', N'Israel', N'Prime Minister')
INSERT [dbo].[NobalPrize] ([YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (1987, N'Chemistry', N'Donald J. Cram', N'USA', N'Scientist')
INSERT [dbo].[NobalPrize] ([YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (1987, N'Chemistry', N'Jean-Marie Lehn', N'France', N'Scientist')
INSERT [dbo].[NobalPrize] ([YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (1987, N'Physiology', N'Susumu Tonegawa', N'Japan', N'Scientist')
INSERT [dbo].[NobalPrize] ([YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (1994, N'Economics', N'Reinhard Selten', N'Germany', N'Economist')
INSERT [dbo].[NobalPrize] ([YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (1994, N'Peace', N'Yitzhak Rabin', N'Israel', N'Prime Minister')
INSERT [dbo].[NobalPrize] ([YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (1987, N'Physics', N'Johannes Georg Bednorz', N'Germany', N'Scientist')
INSERT [dbo].[NobalPrize] ([YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (1987, N'Literature', N'Joseph Brodsky', N'Russia', N'Linguist')
INSERT [dbo].[NobalPrize] ([YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (1987, N'Economics', N'Robert Solow', N'USA', N'Economist')
INSERT [dbo].[NobalPrize] ([YEAR], [SUBJECT], [WINNER], [COUNTRY], [CATEGORY]) VALUES (1994, N'Literature', N'Kenzaburo Oe', N'Japan', N'Linguist')
/****** Object:  Table [dbo].[Employee]    Script Date: 05/06/2021 12:14:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EMP_IDNO] [float] NULL,
	[EMP_FNAME] [nvarchar](255) NULL,
	[EMP_LNAME] [nvarchar](255) NULL,
	[EMP_DEPT] [float] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Employee] ([EMP_IDNO], [EMP_FNAME], [EMP_LNAME], [EMP_DEPT]) VALUES (127323, N'Michale', N'Robbin', 57)
INSERT [dbo].[Employee] ([EMP_IDNO], [EMP_FNAME], [EMP_LNAME], [EMP_DEPT]) VALUES (526689, N'Carlos', N'Snares', 63)
INSERT [dbo].[Employee] ([EMP_IDNO], [EMP_FNAME], [EMP_LNAME], [EMP_DEPT]) VALUES (843795, N'Enric', N'Dosio', 57)
INSERT [dbo].[Employee] ([EMP_IDNO], [EMP_FNAME], [EMP_LNAME], [EMP_DEPT]) VALUES (328717, N'Jhon', N'Snares', 63)
INSERT [dbo].[Employee] ([EMP_IDNO], [EMP_FNAME], [EMP_LNAME], [EMP_DEPT]) VALUES (444527, N'Joseph', N'Dosni', 47)
INSERT [dbo].[Employee] ([EMP_IDNO], [EMP_FNAME], [EMP_LNAME], [EMP_DEPT]) VALUES (659831, N'Zanifer', N'Emily', 47)
INSERT [dbo].[Employee] ([EMP_IDNO], [EMP_FNAME], [EMP_LNAME], [EMP_DEPT]) VALUES (847674, N'Kuleswar', N'Sitaraman', 57)
INSERT [dbo].[Employee] ([EMP_IDNO], [EMP_FNAME], [EMP_LNAME], [EMP_DEPT]) VALUES (748681, N'Henrey', N'Gabriel', 47)
INSERT [dbo].[Employee] ([EMP_IDNO], [EMP_FNAME], [EMP_LNAME], [EMP_DEPT]) VALUES (555935, N'Alex', N'Manuel', 57)
INSERT [dbo].[Employee] ([EMP_IDNO], [EMP_FNAME], [EMP_LNAME], [EMP_DEPT]) VALUES (539569, N'George', N'Mardy', 27)
INSERT [dbo].[Employee] ([EMP_IDNO], [EMP_FNAME], [EMP_LNAME], [EMP_DEPT]) VALUES (733843, N'Mario', N'Saule', 63)
INSERT [dbo].[Employee] ([EMP_IDNO], [EMP_FNAME], [EMP_LNAME], [EMP_DEPT]) VALUES (631548, N'Alan', N'Snappy', 27)
INSERT [dbo].[Employee] ([EMP_IDNO], [EMP_FNAME], [EMP_LNAME], [EMP_DEPT]) VALUES (839139, N'Maria', N'Foster', 57)
/****** Object:  Table [dbo].[Customer]    Script Date: 05/06/2021 12:14:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customer_id] [float] NULL,
	[cust_name] [nvarchar](255) NULL,
	[city] [nvarchar](255) NULL,
	[grade] [float] NULL,
	[salesman_id] [float] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Customer] ([customer_id], [cust_name], [city], [grade], [salesman_id]) VALUES (3002, N'Nick Rimando', N'New York', 100, 5001)
INSERT [dbo].[Customer] ([customer_id], [cust_name], [city], [grade], [salesman_id]) VALUES (3005, N'Graham Zusi', N'California', 200, 5002)
INSERT [dbo].[Customer] ([customer_id], [cust_name], [city], [grade], [salesman_id]) VALUES (3001, N'Brad Guzan', N'London', NULL, 5005)
INSERT [dbo].[Customer] ([customer_id], [cust_name], [city], [grade], [salesman_id]) VALUES (3004, N'Fabian Johns', N'Paris', 300, 5006)
INSERT [dbo].[Customer] ([customer_id], [cust_name], [city], [grade], [salesman_id]) VALUES (3007, N'Brad Davis', N'New York', 200, 5001)
INSERT [dbo].[Customer] ([customer_id], [cust_name], [city], [grade], [salesman_id]) VALUES (3009, N'Geoff Camero', N'Berlin', 100, 5003)
INSERT [dbo].[Customer] ([customer_id], [cust_name], [city], [grade], [salesman_id]) VALUES (3008, N'Julian Green', N'London', 300, 5002)
INSERT [dbo].[Customer] ([customer_id], [cust_name], [city], [grade], [salesman_id]) VALUES (3003, N'Jozy Altidor', N'Moscow', 200, 5007)
