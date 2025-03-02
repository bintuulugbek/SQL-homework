--# Lesson 5: Aliases, Joins, and Grouping

--Here are 30 homework tasks for Lesson 5, categorized into easy, medium, and hard levels. These tasks cover:
--✅ Aliases, Joining Tables
--✅ UNION, UNION ALL, INTERSECT, EXCEPT
--✅ Creating Conditional Columns with CASE and IIF
--✅ Using IF, WHILE
--✅ GROUP BY

--Bahor Eshmirzayeva

--## 🟢 Easy-Level Tasks (10)
--1. Write a query that uses an alias to rename the ProductName column as Name in the Products table.
select product_name ProductName from products
--2. Write a query that uses an alias to rename the Customers table as Client for easier reference.
select CustomerID, Name as client, Email from Customers
--3. Use UNION to combine results from two queries that select ProductName from Products and ProductName from Products_Discontinued.
select ProductName from Products
union
select ProductName from Products_Discontinued
--4. Write a query to find the intersection of Products and Products_Discontinued tables using INTERSECT.
select ProductName, otherColumn from Products
intersect
select ProductName, otherColumn from Products_Discontinued
--5. Use UNION ALL to combine two tables, Products and Orders, that have the same structure.
select * from Products
union all
select * from Orders
--6. Write a query to select distinct customer names (CustomerName) and their corresponding Country using SELECT DISTINCT.
select distinct customerName, country from customers
--7. Write a query that uses CASE to create a conditional column that displays 'High' if Price > 100, and 'Low' if Price <= 100.
select 
	*,
	case
		when price > 100 then 'High'
		else 'Low'
	end as type
from employee
--8. Write a query to filter Employees by Department and group them by Country.
---------------------------------------------------------BACK
--9. Use GROUP BY to find the number of products (ProductID) in each Category.
----------------------------------------------------------BACK
--10. Use IIF to create a column that shows 'Yes' if Stock > 100, and 'No' otherwise.
select iif(stock > 100, 'Yes', 'No') from example_table

--## 🟠 Medium-Level Tasks (10)
--11. Write a query that joins the Orders and Customers tables using INNER JOIN and aliases the CustomerName as ClientName.
--12. Use UNION to combine results from two queries that select ProductName from Products and ProductName from OutOfStock tables.
select ProductName from Products 
union
select ProductName from Out0fStock
--13. Write a query that returns the difference between the Products and DiscontinuedProducts tables using EXCEPT.
select * from Products
except
select * from DiscontinuedProducts
--14. Write a query that uses CASE to assign a value of 'Eligible' to customers who have placed more than 5 orders, otherwise 'Not Eligible'.
select * from products
select 
	*,
	case
		when orders > 5 then 'Eligible'
		else 'Not Eligible'
	end as Eligibility
	from products
--15. Create a conditional column using IIF that shows 'Expensive' if the Price is greater than 100, and 'Affordable' if less.
select iif(price > 100, 'Expensive', 'Affordable') Affordibility from products
--16. Write a query that uses GROUP BY to count the number of orders per CustomerID in the Orders table.
select CustomerID, count(orders) order_count
from orders
group by CustomerID

--17. Write a query to find employees in the Employees table who have either Age < 25 or Salary > 6000.
select * from employees
where age < 25 or salary > 6000
--18. Use GROUP BY to find the total sales (SalesAmount) per Region in the Sales table.
select sum(freight) from [TSQL2012].[Sales].[Orders]
group by shipperid 
select region, sum(SalesAmount) total_sales from sales GROUP BY region;
--19. Write a query that combines data from the Customers and Orders tables using LEFT JOIN, and create an alias for OrderDate.
--20. Use IF statement to update the salary of an employee based on their department, increase by 10% if they work in 'HR'.
--create table myemployee (employee varchar(10), salary int, department varchar(20))
--insert into myemployee values ('Bill', 1200, 'Finance'),('John', 2000, 'Sales'),('Green', 3000, 'Marketing'),('George', 2500, 'HR'),('Bill', 3000, 'Marketing'),('Jack', 4000, 'Finance'),('Ann', 2600, 'HR'),('Kate', 2300, 'HR')
select employee, departmentName, iif(departmentName = 'HR', salary * 1.1, salary) from Employees


select * from departments
select * from EmployeeProjects

--## 🔴 Hard-Level Tasks (10)
--21. Write a query that uses UNION ALL to combine two tables, Sales and Returns, and calculate the total sales and returns for each product.
select sale_amount from sales
union all
select return_amount from returns                  ------------------------------------BACK

select * from sales
select * from returns

--22. Use INTERSECT to show products that are common between Products and DiscontinuedProducts tables.
select productName from Products
intersect
select productName from Discontinuedproducts
--23. Write a query that uses CASE to assign 'Top Tier' if TotalSales > 10000, 'Mid Tier' if TotalSales BETWEEN 5000 AND 10000, and 'Low Tier' otherwise.
select
	*,
	case
	when TotalSales > 10000 then 'Top Tier'
	when TotalSales > 5000 then 'Mid Tier'
	else 'Low Tier'
	end as sales_tier
from TableName

--24. Write a query that combines multiple conditions using IF and WHILE to iterate over all rows of the Employees table and update their salary based on certain criteria.
--25. Use EXCEPT to find customers who have placed orders but do not have a corresponding record in the Invoices table.
select customer_id
from Orders
except
select customer_id
from Invoices;

--26. Write a query that uses GROUP BY on three columns: CustomerID, ProductID, and Region, and calculates the total sales.
create table Calc (customerID int, ProductID int, region varchar(20), sale int)             --------------------BACK

--27. Write a query that uses CASE to apply multiple conditions and returns a Discount column based on the Quantity purchased.
select 
	*,
	case 
		when quantity > value1 then '10% discount'
		when quantity > value2 then '5% discount'
		else 'no discount'
	end as discount
from tableName
--28. Use UNION and INNER JOIN to return all products that are either in the Products or DiscontinuedProducts table and also show if they are currently in stock.
--29. Write a query that uses IIF to create a new column StockStatus, where the status is 'Available' if Stock > 0, and 'Out of Stock' if Stock = 0.
select iif(stock > 0, 'available', iif(stock=0, 'out of stock','no stock')) from tableName 
--30. Write a query that uses EXCEPT to find customers in the Customers table who are not in the VIP_Customers table based on CustomerID.
select customerID from customers
except
select vip-customers from customers


