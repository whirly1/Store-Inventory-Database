/* 
Query 1:
Write a query to show the name of customer, the date of transaction made by
the customer, the store where the transaction takes place, its manager’s name,
the item brand, description and quantity purchased for the transaction and the
employee who serves the transaction. A sample output should be as shown
below.
*/

Select cus.CustName, co.Store_ID, s.Address As 'Store Address', e1.Emp_Name As 'Manager of the Store', co.TransactionDate, i.Brand, i.Description, t.Quantity As 'Quantity Purchased', e2.Emp_Name As 'Served By'
From Customer cus, Checkout co, Store s, Item i, Transactions t, Employee e1, Employee e2
Where co.Cust_ID = cus.Cust_ID 
And co.Store_ID = s.StoreID 
And co.Emp_ID = e2.Emp_ID
And co.Checkout_ID = t.Checkout_ID
And t.Item_ID = i.Item_ID
And e1.Emp_ID = s.Manager

/*
Query 2:
Write a query to show the following store details and their item inventories.
*/

Select s.Manager As 'Store Manager ID', e.Emp_Name As 'Name of Manager', s.StoreID as 'Store Managed', i.Item_ID As Item, i.Quantity As 'Quantity on Inventory'
From Store s, Employee e, Inventory i
Where e.Emp_ID = s.Manager
And i.StoreID = s.StoreID

/*
Query 3:
Write a query to list all customers who bought not more than 2 items on any
single transaction.
*/

Select Cust_ID, CustName
From Customer
Where Cust_ID in 
	(
	Select Cust_ID 
	from Checkout 
	Where Checkout_ID in 
		(
		Select Checkout_ID 
		From Transactions 
		Group By Checkout_ID 
		Having Count(Checkout_ID) <= 2
		)
	)

/*
Query 4:
Write a query to show the item_ID, its description, total amount ‘Retail’, based
on Price and total amount based on cost ‘Wholesale’ for those items which are
kept by at least 2 stores.
*/

Select inv.Item_ID, i.Description, i.Price * Sum(inv.Quantity) As Retail, i.Cost * Sum(inv.Quantity) As Wholesale
from Inventory inv, Item i
Where inv.Item_ID = i.Item_ID
Group By inv.Item_ID, i.Description, i.Price, i.Cost
Having Count(inv.StoreID) >= 2

/*
Query 5:
Write a query to show the ID and name of employees and the ID and names
their managers
*/

Select e1.Emp_ID, e1.Emp_Name, e2.Emp_ID As 'Manager_ID', e2.Emp_Name As 'Manager Name'
From Employee e1, Employee e2
Where e2.Emp_ID = e1.Manager

/*
Query 6:
Write a query to list the emp_ID, name of manager and the boss’ ID and name
together with the store_ID and its address where both the manager and the
boss are stationed at the same store
*/

Select e1.Emp_Name As 'Name of Manager', e1.Manager As 'Boss ID', s.Manager As 'Manager ID', e2.Emp_Name As 'Name of Boss', s.StoreID, s.Address
From Employee e1, Employee e2, Store s
Where e1.Emp_ID = s.Manager
And e2.Emp_ID = e1.Manager
And s.StoreID = e1.StoreRef_ID
And e1.StoreRef_ID = e2.StoreRef_ID
