--# Lesson 8 Homework Tasks

--These homework tasks cover the following topics:
--- **Table Relationships**
--- **One to One, One to Many, Many to Many Relationships**
--- **Cartesian Product (Cross Join)**
--- **INNER Join**
--- **Using Logical Operators in ON clause**

--Bahor Eshmirzayeva

--## 🟢 Easy-Level Tasks (10)

--1. Write a query to join the Customers and Orders tables using an INNER JOIN to get the CustomerName and their OrderDate.
select c.customerName, o.orderDate from customers c inner join orders o on c.customerID = o.orderID
select * from customers
select * from orders
select * from products
--2. Write a query to demonstrate a One to One relationship between the EmployeeDetails and Employees tables by joining them.
select * from EmployeeDetails ed inner join Employees e on ed.employeeID = e.employeeID 
--3. Write a query to join the Products and Categories tables to show ProductName along with CategoryName using INNER JOIN.
select productName, categoryName
from products p inner join categories c
on p.productName = c.categoryNameD
--4. Write a query to show all Customers and the corresponding OrderDate using LEFT JOIN between Customers and Orders.
select c.customerName, o.orderDate
from customers c left join orders o
on c.customerID = o.customerID
--5. Write a query that demonstrates a Many to Many relationship between Orders and Products tables using an intermediate OrderDetails table.

--6. Write a query to perform a CROSS JOIN between Products and Categories, showing all possible combinations of products and categories.
select p.productName, c.CustomerName
from products p cross join customers c
--7. Write a query to demonstrate the One to Many relationship between Customers and Orders using INNER JOIN.
select * from customers c inner join orders o
on c.customerID = o.customerID

select * from customers
select * from orders
--8. Write a query to filter a CROSS JOIN result using the WHERE clause, showing only combinations of Products and Orders where OrderAmount > 500.
select *
from products p cross join orders o 
where o.quantity * p.price > 500
--9. Write a query that uses INNER JOIN to join the Employees and Departments tables, showing employee names and their corresponding department names.
select e.EmpName, d.DeptName
from employees e inner join departments d
on e.departmentID = d.departmentID
--10. Write a query that uses the ON clause with a <> operator to join two tables and return rows where the values in the two columns are not equal.
select *
from employees e inner join departments d
on e.departmentID <> d.deptID                   

--## 🟠 Medium-Level Tasks (10)

--11. Write a query to demonstrate a One to Many relationship by joining the Customers and Orders tables using INNER JOIN, showing the CustomerName and the total number of orders.z2
select o.customerID, count(orderID)
from customers c inner join orders o
on c.customerID = o.customerID
group by o.customerID
--12. Write a query to demonstrate a Many to Many relationship between Students and Courses by joining through the StudentCourses table.
--13. Write a query to use a CROSS JOIN between Employees and Departments tables, and filter the results by Salary > 5000 using the WHERE clause.
select *
from employees e cross join department d
where e.salary > 5000
--14. Write a query to demonstrate a One to One relationship by joining the Employee and EmployeeDetails tables, showing each employee’s name and their details.
select *
from employee e inner join employeeDetails ed
on e.empId = ed.empID
--15. Write a query to perform an INNER JOIN between Products and Suppliers and use the WHERE clause to filter only products supplied by 'Supplier A'.
select * 
from products p inner join suppliers s
on p.supplierID = s.supplierID
where s.supplier = 'Supplier A'
--16. Write a query to perform a LEFT JOIN between Products and Sales, and display all products along with their sales quantity (including products with no sales).
select *
from products p left join sales s
on p.productID = s.productID
--17. Write a query to join Employees and Departments using a WHERE clause, and show all employees whose salary is greater than 4000 and who work in the ‘HR’ department.
select * 
from employees e inner join departments d 
on e.departmentID = d.departmentID
where e.salary > 4000 and d.departmentName = 'HR'
--18. Write a query to show how to use the >= operator in the ON clause to join two tables and return rows where the values meet the condition.
select * 
from table1 t1 inner join table2 t2
on t1.number >= t2.number
--19. Write a query to demonstrate INNER JOIN and use the >= operator to find all products with a price greater than or equal to 50, and their respective suppliers.
select * 
from products p inner join suppliers s
on p.supplierID = s.supplierID
where p.price >= 50
--20. Write a query to demonstrate a CROSS JOIN between Sales and Regions, and use the WHERE clause to show only regions with sales greater than 1000.
select r.region, s.sales 
from sales s cross join regions r
where s.quantity > 1000



--## 🔴 Hard-Level Tasks (10)

--21. Write a query that demonstrates a Many to Many relationship between Authors and Books using the intermediate AuthorBooks table, showing the AuthorName and the BookTitle.
--22. Write a query to join Products and Categories using INNER JOIN, and filter the result to only include products where the CategoryName is not ‘Electronics’.
select * 
from products p inner join categories c
on p.categoryID = c.categoryID
where c.CategoryName <> 'Electronics'
--23. Write a query to perform a CROSS JOIN between Orders and Products, and filter the result with a WHERE clause to show only orders where the quantity is greater than 100.
select o.orderName, o.order_quantity
from orders o cross join products p
where o.order_quantity > 100
--24. Write a query that joins the Employees and Departments tables and uses a logical operator in the ON clause to only return employees who have been with the company for over 5 years.
select employee_name
from employees e inner join departments d
on e.departmentID = d.departmentID
where e.working_year >= 5
--25. Write a query to show the difference between INNER JOIN and LEFT JOIN by returning employees and their departments, ensuring that employees without departments are included in the left join.
select name, d.deptName
from employees e left join departments d
on e.departmentID = d.deptID

select name, d.deptName
from employees e inner join departments d
on e.departmentID = d.deptID
--26. Write a query that uses a CROSS JOIN between Products and Suppliers, and filters the result using WHERE to include only suppliers that supply products in 'Category A'.
select *
from products p cross join suppliers s
where s.category = 'Category A'
--27. Write a query to demonstrate a One to Many relationship using INNER JOIN between Orders and Customers, and apply the >= operator to filter only customers with at least 10 orders.
--28. Write a query to demonstrate the Many to Many relationship between Courses and Students, showing all courses and the number of students enrolled using the COUNT function.
--29. Write a query to use a LEFT JOIN between Employees and Departments tables, and filter the result using the WHERE clause to show only employees in the 'Marketing' department.
select * 
from employees e left join departments d
on d.deptID = e.DepartmentID
where deptName = 'Marketing'
--30. Write a query that uses the ON clause with <= operator to join two tables and return rows where the values in the columns meet the condition.
select *
from customerss c inner join orderss o
on c.customerID = o.customerID
where orderID <= 5
