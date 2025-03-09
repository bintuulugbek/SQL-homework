--# Lesson 9 Homework Tasks

--These homework tasks cover the following topics:
--- **Logical Order of SQL Query Execution**
--- **Difference Between ON and WHERE Clauses**
--- **INNER JOIN with WHERE Clause**
--- **Outer Joins (LEFT, RIGHT, FULL)**
--- **Self Join**

--Bahor Eshmirzayeva

--## 🟢 Easy-Level Tasks (10)

--1. Write a query to join Employees and Departments using an INNER JOIN, and apply a WHERE clause to show only employees whose salary is greater than 5000.
select *
from employees e inner join departments d
on d.departmentID = e.departmentID
where e.salary > 5000
--2. Write a query to join Customers and Orders using an INNER JOIN, and apply the WHERE clause to return only orders placed in 2023.
select * 
from customers c inner join orders o
on c.customerID = o.customerID
where year = 2023
--3. Write a query to demonstrate a LEFT OUTER JOIN between Employees and Departments, showing all employees and their respective departments (including employees without departments).
select e.employeeName, d.departmentName
from employees e left outer join departments d
on e.departmentID = d.departmentID 
--4. Write a query to perform a RIGHT OUTER JOIN between Products and Suppliers, showing all suppliers and the products they supply (including suppliers without products).
select s.supplierName, p.productName
from products p right outer join suppliers s
on s.supplierID = p.supplierID
--5. Write a query to demonstrate a FULL OUTER JOIN between Orders and Payments, showing all orders and their corresponding payments (including orders without payments and payments without orders).
select o.orderName, p.payment
from orders o full outer join payments p
on o.paymentID = p.paymentID
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
--16. Write a query that uses the logical order of SQL execution to perform a LEFT OUTER JOIN between Orders and Customers, followed by a WHERE clause to filter orders placed in the year 2022.
--17. Write a query to use the ON clause with INNER JOIN to return only the employees from the 'Sales' department whose salary is greater than 5000.
--18. Write a query to join Employees and Departments using INNER JOIN, and use WHERE to filter employees whose department's DepartmentName is 'IT'.
--19. Write a query to join Orders and Payments using a FULL OUTER JOIN, and use the WHERE clause to show only the orders that have corresponding payments.
--20. Write a query to perform a LEFT OUTER JOIN between Products and Orders, and use the WHERE clause to show products that have no orders.

-----

--## 🔴 Hard-Level Tasks (10)

--21. Write a query that explains the logical order of SQL execution by using a JOIN between Employees and Departments, followed by a WHERE clause to show employees whose salary is higher than the average salary of their department.
--22. Write a query to perform a LEFT OUTER JOIN between Orders and Payments, and use the WHERE clause to return all orders placed before 2020 that have not been paid yet.
--23. Write a query to perform a FULL OUTER JOIN between Products and Categories, and use the WHERE clause to filter only products that have no category assigned.
--24. Write a query to perform a SELF JOIN on the Employees table to find employees who report to the same manager and earn more than 5000.
--25. Write a query to join Employees and Departments using a RIGHT OUTER JOIN, and use the WHERE clause to show employees from departments where the department name starts with ‘M’.
--26. Write a query to demonstrate the difference between the ON clause and the WHERE clause by joining Products and Sales, and using WHERE to filter only sales greater than 1000.
--27. Write a query to perform a LEFT OUTER JOIN between Students and Courses, and use the WHERE clause to show only students who have not enrolled in 'Math 101'.
--28. Write a query that explains the logical order of SQL execution by using a FULL OUTER JOIN between Orders and Payments, followed by a WHERE clause to filter out the orders with no payment.
--29. Write a query to join Products and Categories using an INNER JOIN, and use the WHERE clause to filter products that belong to either 'Electronics' or 'Furniture'.
--30. Write a query to perform a CROSS JOIN between Customers and Orders, and use the WHERE clause to filter the result to show customers with more than 2 orders placed in 2023.

