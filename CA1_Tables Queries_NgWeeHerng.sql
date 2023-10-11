Create table Store
(StoreID Integer Not Null,
Address VarChar(100) Not Null,
Manager Integer Not Null,
Primary key (StoreID))

Create table Item
(Item_ID Integer Not Null,
Brand VarChar(50) Not Null,
Description VarChar(100) Not Null,
Price Decimal(3,2) Not Null,
Cost Decimal(3,2) Not Null,
Shape VarChar(50) Not Null,
Size VarChar(50) Not Null,
UPC Integer Not Null,
Weight Decimal(4,2) Not Null,
Taxable Integer Not Null,
Primary key (Item_ID))

Create table Customer
(Cust_ID Integer Not Null,
CustName VarChar(100) Not Null,
Phone VarChar(10) Null,
Email VarChar(100) Null,
Date_Joined Date Not Null,
Primary key (Cust_ID))

Create table Employee
(Emp_ID Integer Not Null,
Emp_Name VarChar(50) Not Null,
SSN VarChar(9) Not Null,
Phone VarChar(10) Not Null,
StoreRef_ID Integer Not Null,
Address VarChar(100) Not Null,
PayType Integer Not Null,
Password VarChar(50) Null,
Manager Integer Null,
Email VarChar(100) Null,
Date_Hired Date Null,
Date_Start Date Not Null,
Date_End Date Null,
Pay Decimal(7,2) Not Null,
PassChgDate Date Null,
Primary key (Emp_ID),
Foreign key (Manager) references Employee(Emp_ID),
Foreign key (StoreRef_ID) references Store(StoreID))

Create table Dependents
(Emp_ID Integer Not Null,
DependentName VarChar(50) Not Null,
Relationship VarChar(30) Not Null,
Email VarChar(100) Not Null,
Date_created Date Not Null,
Primary key (Emp_ID, DependentName),
Foreign key (Emp_ID) references Employee(Emp_ID))

Create table Inventory
(StoreID Integer Not Null,
Item_ID Integer Not Null,
Quantity Integer Not Null,
Primary key (StoreID, Item_ID),
Foreign key (StoreID) references Store(StoreID),
Foreign key (Item_ID) references Item(Item_ID))

Create table Checkout
(Checkout_ID Integer Not Null,
Emp_ID Integer Not Null,
Cust_ID Integer Not Null,
Store_ID Integer Not Null,
TransactionDate Date Not Null,
Primary key (Checkout_ID),
Foreign key (Emp_ID) references Employee(Emp_ID),
Foreign key (Cust_ID) references Customer(Cust_ID),
Foreign key (Store_ID) references Store(StoreID))

Create table Transactions
(Item_ID Integer Not Null,
Checkout_ID Integer Not Null,
Quantity Integer Not Null,
Primary key (Checkout_ID, Item_ID),
Foreign key (Checkout_ID) references Checkout(Checkout_ID),
Foreign key (Item_ID) references Item(Item_ID))

Insert into Store(StoreID, Address, Manager)
Values
	(159, '13636 Fir St', 14),
	(247, '999 Fake Rd', 10),
	(348, '888 Lucky St', 10),
	(354, '820 Birch Rd', 15),
	(369, '940 Green St', 6),
	(674, '14496 Maple Way', 6),
	(696, '710 Edison Dr', 4),
	(778, '341 Main St', 15),
	(854, '22556 Elm St', 14),
	(989, '313 Real Way', 15)

Insert into Customer(Cust_ID, CustName, Phone, Email, Date_Joined)
Values
	(105, 'Master Shake', '5555555555', 'MixMaster@crimefighter.org', '2000-08-25'),
	(178, 'Bruce Wayne', '6619872145', 'IamBatman@crimefighter.org', '2000-01-09'),
	(179, 'Seymoure Butes', '4789582145',	'SButes@education.edu',	'2001-01-01'),
	(50, 'Bob Hope', '6615552485', 'Bobhope@gmail.com', '2001-01-01'),
	(51, 'Renee Hicks', '4589854588', 'Dragonthing@aol.com', '2005-05-05'),
	(52, 'Scott Sheer', '4176521425', 'Scotts@hotmail.com', '2011-12-12'),
	(53, 'Colleen Mctyre', Null, 'CMCT@ct.com', '2008-08-12'),
	(58, 'Bart Simpson', Null, Null, '2001-06-06'),
	(67, 'Lisa Girl', '6619755896', Null, '1999-04-09'),
	(99, 'Jeremy Scott', '4586895847', 'TheBigMan@gmail.com','2000-01-09')

Insert into Item(Item_ID, Brand, Description, Price, Cost, Shape, Size, UPC, Weight, Taxable)
Values
	(12, 'Nabisco', 'Cookies', 2.25, 1.00, 'Oval', '23x5x20', 224852, 22.40, 1),
	(145, 'Kleenex', 'Tissues', 2.99, 1.00, 'Rectangle', '3x19x4', 178965, 34.00, 0),
	(1566, 'HomeBrand', 'Spaghetti', 0.99, 0.50, 'Round', '3x3x3', 698547, 3.00, 0),
	(2365, 'Kellogg', 'Cereal', 1.99, 0.50, 'Round', '10x10x10', 557858, 18.00, 1),
	(256, 'Hersey', 'Candy', 3.99, 2.00, 'Rectangle', '4x16x6', 123058, 52.80, 0),
	(335, 'DelMonte', 'Canned Fruit', 0.50, 0.10, 'Square', '3x3x3', 411255, 5.20, 1),
	(3521, 'Nabisco', 'Crackers', 4.00, 2.00, 'Round', '4x4x4', 254413, 2.00, 0),
	(4587, 'Kraft', 'Cheese', 6.00, 4.00, 'Rectangle', '6x12x3', 845532, 0.11, 0),
	(658, 'PhillpMorris', 'Cigarettes', 5.00, 3.00, 'Square', '8x8x8', 596543, 89.00, 0),
	(84854, 'Quaker', 'Oatmeal', 2.50, 1.00, 'Square', '2x2x2', 556487, 1.00, 0)

Insert into Employee(Emp_ID, Emp_Name, SSN, Phone, StoreRef_ID, Address, PayType, Password, Manager, Email, Date_Hired, Date_Start, Date_End, Pay) 
Values 
	(1, 'Darrel Philbin', '654269856', '5489659874', 854, '258 Cumberland dr', 0, '1234', 14, 'baldman@gmail.com', Null, '1985-04-05', '2011-02-02', 20.00),
	(10, 'Jerry Garcia', '758965897', '6521458569', 247, '214 Q st', 1, '1234', 9, 'govperson@gov.gov', Null, '1990-09-24', Null, 52000.00),
	(11, 'Lawarnce Tom', '625458569', '9658745632', 159, '2154 Beech st', 0, Null, 14, Null, Null, '1989-01-20', '2011-09-01', 15.00),
	(12, 'Dexter Robert', '254125478', '1111111111', 778, '365 Moon dr', 0, Null, 15, Null, Null, '1990-05-06', Null, 12.25),
	(13, 'Mark Nick', '563258965', '2225478512', 989, '65412 B St', 0, Null, 15, Null, Null, '1998-02-05', Null, 8.25),
	(14, 'Jeremy David', '111111112', '2356895654', 159, '2 Molly Way', 1, Null, 9, Null, Null, '2000-06-03', Null, 16000.00),
	(15, 'Luke Ted', '111111144', '2144544123', 354, '65 Southland Av', 1, Null, 9, Null, Null, '2004-09-09', Null, 20000.00),
	(2, 'Ricky Tanner', '125651452', '6988532587', 696, '1587 H st', 0, 'Abcdef', 4, 'omegaman@aol.com', Null, '1990-06-08', '1999-06-10', 10.00),
	(3, 'Susan Philips', '145969658', '9856984523', 369, '695 LMNOP st', 0, 'Password', 4, 'streetsmartkid@hampster.edu', Null, '1972-06-09', Null, 15.00),
	(4, 'George Scott', '147589652', '2586521452', 696, '4521 Gold st', 1, 'Alpha', 9, Null, Null, '1999-07-25', Null, 42000.00),
	(5, 'Erin Abernathy', '256985698', '5896583541', 369, '635 Number In', 0, 'Bottle', 6, 'drinkerster@gmail.com', Null, '1998-12-20', Null, 30.00),
	(6, 'Ted Smith', '352956587', '4736593569', 369, '12 S st', 1, 'Workshop', 9, Null, Null, '1989-06-08', Null, 50000.00),
	(7, 'Harry Buts', '458521658', '2586584763', 674, '1 wonder st', 0, 'Password', 6, Null, Null, '1970-10-20', Null, 12.00),
	(8, 'Myanar Teener', '256656521', '2596573257', 674, '24 nice In', 0, 'Password', 6, 'Meme585@gmail.com', Null, '2005-06-04', Null, 9.25),
	(9, 'Matt Longfellow', '958786548', '5249868525', 354, '6144 Computer In', 1, 'Password', Null, 'thisisshort@az.com', Null, '2000-09-21', Null, 60000.00)	

Insert into Inventory(StoreID, Item_ID, Quantity)
Values
	(159, 1566, 31),
	(159, 335, 27),
	(247, 145, 56), 
	(348, 256, 100),
	(354, 1566, 4),
	(369, 3521, 113),
	(674, 2365, 0),
	(674, 4587, 23),
	(696, 12, 23),
	(696, 658, 38),
	(778, 84854, 350),
	(854, 12, 10), 
	(854, 658, 10),
	(989, 145, 560)

Insert into Checkout(Checkout_ID, Emp_ID, Cust_ID, Store_ID, TransactionDate)
Values
	(1, 1, 50, 854, '2011-06-10'),
	(2, 12, 178, 778, '2011-12-12'),
	(3, 11, 99, 159, '2010-06-05'),
	(4, 3, 105, 369, '2007-04-05'),
	(5, 15, 51, 354, '2011-06-09'),
	(6, 2, 52, 696, '2010-08-12'),
	(7, 7, 179, 674, '2009-11-05')

Insert into Transactions(Checkout_ID, Item_ID, Quantity)
Values
	(1, 256, 2),
	(1, 2365, 2),
	(2, 145, 10),
	(3, 4587, 2),
	(4, 4587, 4),
	(5, 1566, 4),
	(5, 145, 3),
	(5, 3521, 2),
	(5, 84854, 2),
	(6, 2365, 2),
	(6, 4587, 2),
	(7, 12, 2),
	(7, 658, 2)

Alter table Store
Add foreign key (Manager) references Employee(Emp_ID)




