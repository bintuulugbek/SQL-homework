--# Lesson 9 Homework Tasks

--These homework tasks cover the following topics:
--- **Logical Order of SQL Query Execution**
--- **Difference Between ON and WHERE Clauses**
--- **INNER JOIN with WHERE Clause**
--- **Outer Joins (LEFT, RIGHT, FULL)**
--- **Self Join**

--## 🟢 Easy-Level Tasks (10)
--1. Write a query to join Employees and Departments using an INNER JOIN, and apply a WHERE clause to show only employees whose salary is greater than 5000.
select *
from Employees inner join Departments 
on Departments.DepartmentID = Employees.DepartmentID
where Employees.Salary > 5000
--2. Write a query to join Customers and Orders using an INNER JOIN, and apply the WHERE clause to return only orders placed in 2023.
select * 
from Customers inner join Orders
on Customers.CustomerID = Orders.CustomerID
where year(Orders.OrderDate) = 2023
--3. Write a query to demonstrate a LEFT OUTER JOIN between Employees and Departments, showing all employees and their respective departments (including employees without departments).
select Employees.EmployeeName, Departments.DepartmentName
from Employees left outer join Departments
on Employees.DepartmentID = Departments.DepartmentID 
--4. Write a query to perform a RIGHT OUTER JOIN between Products and Suppliers, showing all suppliers and the products they supply (including suppliers without products).
select Suppliers.SupplierName, Products.ProductName
from Products right outer join Suppliers
on Suppliers.SupplierID = Products.SupplierID
--5. Write a query to demonstrate a FULL OUTER JOIN between Orders and Payments, showing all orders and their corresponding payments (including orders without payments and payments without orders).
select Orders.OrderName, P.Payment
from Orders full outer join Payments
on Orders.PaymentID = Payments.PaymentID
--6. Write a query to perform a SELF JOIN on the Employees table to display employees and their respective managers (showing EmployeeName and ManagerName).
select Manager.Name as Employee, Employee.Name as Manager
from Employees as Manager join Employees as Employee
on Employee.id = Manager.ManagerID 
--7. Write a query to demonstrate the logical order of SQL query execution by performing a JOIN between Products and Sales, followed by a WHERE clause to filter products with sales greater than 100.
select *
from Products join Sales
on Products.ProductID = Sales.ProductID
where Sales.Sales > 100
-- FROM finds asked table, JOIN joins the tables according to the condition with ON, WHERE works in the end and filter the values
--8. Write a query to join Students and Courses using INNER JOIN, and use the WHERE clause to show only students enrolled in 'Math 101'.
select *
from Students
inner join Courses
on Students.CourseID = Courses.CourseID
where Courses.Name = 'Math 101'
--9. Write a query that uses INNER JOIN between Customers and Orders, and filters the result with a WHERE clause to show customers who have placed more than 3 orders.
select Customer.Name
from Customers 
inner join Orders
	on Customers.CustomerID = Orders.CustomerID
group by Customer.CustomerID
having count(Orders.OrderID) > 3
--10. Write a query to join Employees and Departments using a LEFT OUTER JOIN and use the WHERE clause to filter employees in the 'HR' department.
select *
from Employees
left outer join Departments
on Employees.DepartmentID = Employees.DepartmentID
where Departments.Name = 'HR'

--## 🟠 Medium-Level Tasks (10)
--11. Write a query to perform an INNER JOIN between Employees and Departments, and use the WHERE clause to show employees who belong to departments with more than 10 employees.
select Employees.Name
from Employees
inner join (
	select DepartmentID, count(Employees.ID) EmployeeCount
	from Employees
	group by DepartmentID
	having count(Employees.ID) > 10
) as DepartmentEmployeesCount
on Employees.DepartmentID =  DepartmentEmployeesCount.DepartmentID
--12. Write a query to perform a LEFT OUTER JOIN between Products and Sales, and use the WHERE clause to filter only products with no sales.
select *
from Products
left outer join Sales
on Products.productID = Sales.productID
where sales.ProductID is null
--13. Write a query to perform a RIGHT OUTER JOIN between Customers and Orders, 
--and filter the result using the WHERE clause to show only customers who have placed at least one order.
select *
from Customers
right outer join Orders
on Customers.CustomerID = Orders.CustomerID
where Orders.OrderID is not null
--14. Write a query that uses a FULL OUTER JOIN between Employees and Departments, and filters out the results where the department is NULL.
select Employees.Name, Employees.DepartmentID
from Employees
full outer join Departments
on Employees.DepartmentID = Departments.DepartmentID
where Departments.DepartmentID is null
--15. Write a query to perform a SELF JOIN on the Employees table to show employees who report to the same manager.
select Manager.Name as Employee, Employee.Name as Manager
from Employees as Manager
join Employees as Employee
on Employee.ID = Manager.ManagerID  
--16. Write a query that uses the logical order of SQL execution to perform a LEFT OUTER JOIN between Orders and Customers, 
--followed by a WHERE clause to filter orders placed in the year 2022.
select *
from Orders
left outer join Customers
on Orders.CustomerID = Customer.CustomerID
where year(Orders.OrderDate) = 2022
--17. Write a query to use the ON clause with INNER JOIN to return only the employees from the 'Sales' department whose salary is greater than 5000.
select *
from Sales 
inner join Departments
on Sales.DepartmentID = Departments.DepartmentID
where Sales.department = 'Sales' and Sales.salary > 5000
--18. Write a query to join Employees and Departments using INNER JOIN, and use WHERE to filter employees whose department's DepartmentName is 'IT'.
select *
from Employees
inner join Departments
on Employees.DepartmentID = Departments.DepartmentID
where Departments.DepartmentName = 'IT'
--19. Write a query to join Orders and Payments using a FULL OUTER JOIN, and use the WHERE clause to show only the orders that have corresponding payments.
select *
from Orders
full outer join Payments
on Orders.orderID = Payments.OrderID
where Payments.OrderID is not null
--20. Write a query to perform a LEFT OUTER JOIN between Products and Orders, and use the WHERE clause to show products that have no orders.
select *
from Products
left outer join Orders
on Products.ProductID = Orders.ProductID
where Orders.OrderID is null

--## 🔴 Hard-Level Tasks (10)
--21. Write a query that explains the logical order of SQL execution by using a JOIN between Employees and Departments, 
--followed by a WHERE clause to show employees whose salary is higher than the average salary of their department.

select *
from Employees
join (
	select Employees.Department, avg(Employees.Salary) avg_salary
	from Employees
	group by Employees.Department
) Department_avg_salary
on Employees.Department = Department_avg_salary.Department
where Employees.Salary > Department_avg_salary.avg_salary) 
--Logical order of sql execustion =>  1. from Employees; 2. creates Department_avg_salary; 3. joins two tables according to ON condition; 4. where conditon; 5 select works
--22. Write a query to perform a LEFT OUTER JOIN between Orders and Payments, and use the WHERE clause to return all orders placed before 2020 that have not been paid yet.
select * 
from Orders
left outer join Payments
on Orders.OrderID = Payments.OrderID
where year(Orders.OrderDate) < 2020 and Payments.OrderID is null 
--23. Write a query to perform a FULL OUTER JOIN between Products and Categories, and use the WHERE clause to filter only products that have no category assigned.
select * 
from Products
full outer join Categories 
on Products.CategoryID = Categories.CategoryID
where Categories.CategoryID is null
--24. Write a query to perform a SELF JOIN on the Employees table to find employees who report to the same manager and earn more than 5000.
select Employee.Name as Employee, Employee.Salary as emp_sal, Manager.Name as Manager, Manager.Salary as man_sal
from Employees as Manager
inner join Employees as Employee
on Manager.ID = Employee.ID
where Employee.Salary > 5000
--25. Write a query to join Employees and Departments using a RIGHT OUTER JOIN, and use the WHERE clause to show employees from departments where the department name starts with ‘M’.
select Employees.Name, Employees.Department
from Employees
right outer join Departments 
on Employees.Department = Departments.Name
where Departments.Name like 'M%'
--26. Write a query to demonstrate the difference between the ON clause and the WHERE clause by joining Products and Sales, 
--and using WHERE to filter only sales greater than 1000.
select * 
from Products
inner join Sales
on Products.ProductID = Sales.ProductID
where Sales.sales > 1000

select *
from Products
inner join Sales
on Products.ProductID = Sales.ProductID and Sales.sales > 1000
--27. Write a query to perform a LEFT OUTER JOIN between Students and Courses, and use the WHERE clause to show only students who have not enrolled in 'Math 101'.
select * 
from Students
left outer join Courses
on Courses.CourseID = Students.CourseID
where Courses.name <> 'Math 101' or Courses.Name is null
--28. Write a query that explains the logical order of SQL execution by using a FULL OUTER JOIN between Orders and Payments, 
--followed by a WHERE clause to filter out the orders with no payment.
select *
from Orders
full outer join Payments
on Orders.orderID = Payments.OrderID
where Payments.OrderID is null
--29. Write a query to join Products and Categories using an INNER JOIN, and use the WHERE clause to filter products that belong to either 'Electronics' or 'Furniture'.
select * 
from Products
inner join Categories
on Products.CategoryID = Categories.CategoryID
where Categories.Name in ('Electronics', 'Furniture')
--30. Write a query to perform a CROSS JOIN between Customers and Orders, and use the WHERE clause to filter the result to show customers with more than 2 orders placed in 2023.
select Customers.CustomerID, Customers.Name, count(Orders.OrderID) OrdersIn2023
from Customers  
cross join Orders
where Customers.CustomerID = Orders.CustomerID and year(Orders.OrderDate) = 2023
group by Customers.CustomerID
having count(orders.OrderID) > 2







