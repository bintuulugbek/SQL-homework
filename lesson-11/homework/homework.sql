---Basic Level

--Task 1: Basic INNER JOIN
--Question: Retrieve all employee names along with their corresponding department names.
select EmployeeID, name, DepartmentName from Employees e
inner join Departments d 
on e.departmentID = d.DepartmentID

--Task 2: LEFT JOIN
--Question: List all students along with their class names, including students who are not assigned to any class.
select s.studentName, c.className from students s
left join classes c
on s.classID = c.classID

 --Task 3: RIGHT JOIN
--Question: List all customers and their orders, including customers who haven’t placed any orders.
select CustomerName, orderID from Orders o
right join Customers c
on c.customerID = o.CustomerID

--Task 4: FULL OUTER JOIN
--Question: Retrieve a list of all products and their sales, including products with no sales and sales with invalid product references.
select ProductName, Quantity from Products p
full outer join Sales s
on p.ProductID = s.ProductID

--Task 5: SELF JOIN
--Question: Find the names of employees along with the names of their managers.
select Employee.Name, Manager.Name from Employees as Employee
inner join Employees as Manager
on Manager.EmployeeID = Employee.ManagerID


--Task 6: CROSS JOIN
--Question: Generate all possible combinations of colors and sizes.
select colorName, sizeName from colors
cross join sizes 

--Task 7: Join with WHERE Clause
--Question: Find all movies released after 2015 and their associated actors.
select * from movies m
inner join actors a 
on m.movieID = a.movieID
where ReleaseYear > 2015

--Task 8: MULTIPLE JOINS
--Question: Retrieve the order date, customer name, and the product ID for all orders.
select OrderDate, CustomerName, od.productID from Orders o 
inner join Customers c on o.customerID = c.customerID
inner join OrderDetails od on od.orderID = o.orderID

--Task 9: JOIN with Aggregation
--Question: Calculate the total revenue generated for each product.
select s.ProductID, sum(Price) total_revenue from Sales s
inner join Products p
on s.ProductID = p.ProductID
group by s.ProductID

