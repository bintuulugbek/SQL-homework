--# Lesson 10 Homework Tasks

--These homework tasks cover the following topics:
--- **Advanced Joins**
--- **Cross Apply**
--- **Outer Apply**

--Bahor Eshmirzayeva

--## 🟢 Easy-Level Tasks (10)
--1. Write a query to perform an INNER JOIN between Orders and Customers using AND in the ON clause to filter orders placed after 2022.
select * from Orders
inner join Customers
on Orders.CustomerID = Customers.CustomerID and Year(Orderdate) > 2022
--2. Write a query to join Employees and Departments using OR in the ON clause to show employees in either the 'Sales' or 'Marketing' department.
select EmployeeName
from Employees
inner join Departments
on Employees.DepartmentID = Departments.DepartmentID and (DepartmentName = 'Sales' or DepartmentName = 'Marketing')
--3. Write a query to join a derived table (for example, SELECT * FROM Products WHERE Price > 100) with the Orders table to display products and their corresponding orders.
select ProductName, count(OrderID) as TotalOrders from Orders
inner join (select * from Products where Price > 100) as p
on Orders.ProductID = P.ProductID
group by ProductName 
--4. Write a query to join a Temp table (for example, Temp_Orders) and the Orders table to show orders that are present in both tables.
select * 
from #Temp_Orders t
join Orders o
on t.OrderID = o.OrderID
--5. Write a query to demonstrate a CROSS APPLY between Employees and a derived table that shows their department's top-performing sales (e.g., top 5 sales).
select * from Employees
cross apply (select top 5 * from Sales where Sales.DepartmentID = Employees.DepartmentID order by SalesAmount desc)
--6. Write a query to join Customers and Orders using AND in the ON clause to filter customers who have placed orders in 2023 and have a loyalty status of 'Gold'.
select *
from Customers c
join Orders o
on c.CustomerID = o.CustomerID and Year(OrderDate) = 2023 and LoyaltyStatus = 'Gold'
--7. Write a query to join a derived table (SELECT CustomerID, COUNT(*) FROM Orders GROUP BY CustomerID) with the Customers table to show the number of orders per customer.
select * from Customers c
inner join (SELECT CustomerID, COUNT(*) OrderCount FROM Orders GROUP BY CustomerID) total_orders
on c.CustomerID = total_orders.CustomerID
--8. Write a query to join Products and Suppliers using OR in the ON clause to show products supplied by either 'Supplier A' or 'Supplier B'.
select * from Products p
inner join Suppliers s
on p.SupplierID = s.SupplierID and s.Name in ('Supplier A', 'Supplier B')
--9. Write a query to demonstrate the use of OUTER APPLY between Employees and a derived table that returns each employee's most recent order.
select * from Employees e
outer apply (select top 1 o.orderID, o.OrderDate from Orders o where o.EmployeeID = e.EmployeeID order by o.OrderDate desc) o
--10. Write a query to perform a CROSS APPLY between Departments and a table-valued function that returns a list of employees working in that department.
--we haven't leaned table-valued functions

--## 🟠 Medium-Level Tasks (10)
--11. Write a query that uses the AND logical operator in the ON clause to join Orders and Customers, 
--and filter customers who placed an order with a total amount greater than 5000.
select o.customer_id, totalAmount from Orders o
inner join Customers c
on o.Customer_ID = c.Customer_ID and totalAmount > 5000
--12. Write a query that uses the OR logical operator in the ON clause to join Products and 
--Sales to filter products that were either sold in 2022 or have a discount greater than 20%.
select * 
from Products p
inner join Sales s
on p.product_id = s.product_id and (year(SalesDate) = 2022 or discount > 20)
--13. Write a query to join a derived table that calculates the total sales (SELECT ProductID, SUM(Amount) FROM Sales GROUP BY ProductID) 
--with the Products table to show total sales for each product.
select *
from Products p
inner join  (select ProductID, sum(amount) totalAmount from Sales group by ProductID) total_sales
on p.ProductID = total_sales.ProductID
--14. Write a query to join a Temp table (Temp_Products) and the Products table to show the products that have been discontinued in the Temp table.
select * from #Temp_Products tp
inner join Products p
on tp.product_id = p.product_id 
where tp.discontinued = 'Yes'
--15. Write a query to demonstrate CROSS APPLY by applying a table-valued function to each row of the Employees table to return the sales performance for each employee.
--we didn't learn this topic
--16. Write a query to join Employees and Departments using AND in the ON clause to filter employees who belong to the 'HR' department and whose salary is greater than 5000.
select * from Employees e
inner join Departments d
on e.departmentID = d.departmentID and d.name = 'HR' and e.Salary > 5000
--17. Write a query to join Orders and Payments using OR in the ON clause to show orders that have either been paid fully or partially.
select o.OrderID from Orders o
inner join Payments p
on o.OrderID = p.OrderID and (p.PaymentAmount = o.TotalAmount or p.PaymentAmount < o.TotalAmount)
--18. Write a query to use OUTER APPLY to return all customers along with their most recent orders, including customers who have not placed any orders.
select * from customers c
outer apply (select top 1 * from Orders o where o.CustomerID = c.CustomerID order by o.OrderDate desc) o
--19. Write a query to join Products and Sales using AND in the ON clause to filter products that were sold in 2023 and have a rating greater than 4.
select * from Products p
inner join Sales s
on p.ProductID = s.ProductID and year(SalesDate) = 2023 and rates > 4
--20. Write a query to join Employees and Departments using OR in the ON clause 
--to show employees who either belong to the 'Sales' department or have a job title that contains 'Manager'.
select * from Employees e 
inner join Departments d
on e.DepartmentID = d.DepartmentID and (d.name = 'Sales' or e.position like '%Manager%')

--## 🔴 Hard-Level Tasks (10)  
--21. Write a query to demonstrate the use of the AND logical operator in the ON clause between Orders and Customers, 
--and filter orders made by customers who are located in 'New York' and have made more than 10 orders.
select * from Orders o
inner join Customers c
on o.CustomerID = c.CustomerID 
	and c.location = 'New York' 
	and orderAmount > 10
--22. Write a query to demonstrate the use of OR in the ON clause when joining Products and Sales 
--to show products that are either part of the 'Electronics' category or have a discount greater than 15%.
select * from Products p
inner join Sales s
on p.ProductID = s.ProductID
	and (p.Category = 'Electronics' or discount > 15)
--23. Write a query to join a derived table that returns a count of products per category (SELECT CategoryID, COUNT(*) FROM Products GROUP BY CategoryID) 
--with the Categories table to show the count of products in each category.
select * from Categories c
inner join (SELECT CategoryID, COUNT(*) productCount FROM Products GROUP BY CategoryID) count_product
on c.CategoryID = count_product.CategoryID
--24. Write a query to join a Temp table (Temp_Employees) with the Employees table using a complex condition in the ON clause (e.g., salary > 4000 AND department = 'IT').
select * from #Temp_Employees te
inner join Employees e
on te.employeeID = e.EmployeeID and e.salary > 4000 and e.department = 'IT'
--25. Write a query to demonstrate CROSS APPLY by applying a table-valued function that returns the number of employees working in each department for every row in the Departments table.
-- we haven't learned table-valued function
--26. Write a query to join Orders and Customers using AND in the ON clause to show orders where the customer is from 'California' and the order amount is greater than 1000.
select * from Orders o
inner join Customers c
on o.CustomerID = c.CustomerID and c.state = 'California' and o.orderAmount > 1000
--27. Write a query to join Employees and Departments using a complex OR condition in the ON clause 
--to show employees who are in the 'HR' or 'Finance' department, or have an 'Executive' job title.
select * from Employees e
inner join Departments d
on d.DepartmentID = e.DepartmentID and (d.name in ('HR', 'Finance') or e.position like '%Executive%')
--28. Write a query to use OUTER APPLY between Customers and a table-valued function that returns all orders placed by each customer, and show customers who have not placed any orders.
--we haven't learned this topic
--29. Write a query to join Sales and Products using AND in the ON clause to filter products that have both a sales quantity greater than 100 and a price above 50.
select * from Sales s
inner join Products p
on s.ProductID = p.ProductID and s.quantity > 100 and s.price > 50
--30. Write a query to join Employees and Departments using OR in the ON clause to show employees in either the 'Sales' or 'Marketing' department, and with a salary greater than 6000.
select * from Employees e
inner join Departments d
on e.DepartmentID = d.DepartmentID and (d.name in ('Sales', 'Marketing') or e.salary > 6000)
