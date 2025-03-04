--# Lesson 4: Filtering and Ordering Data
--Here are 30 homework tasks for Lesson 4, categorized into easy, medium, and hard levels. These tasks cover:
--? Filtering and Ordering Data
--? Using SELECT TOP, OFFSET-FETCH
--? Using ISNULL and COALESCE
--? Order By (ASC, DESC)
--? Where Clause Filtering
--? LIKE operator
--? Wildcard Characters
--? ANY and ALL Operators

--## ? Easy-Level Tasks (10)
--1. Write a query to select the top 5 employees from the Employees table.
select top 5 * from Employees
--2. Use SELECT DISTINCT to select unique ProductName values from the Products table.
select distinct product_name from products
--3. Write a query that filters the Products table to show products with Price > 100.
select * from products where price > 100
--4. Write a query to select all CustomerName values that start with 'A' using the LIKE operator.
select customerName from customers where customerName like 'A%'
--5. Order the results of a Products query by Price in ascending order.
select * from products
order by price asc
--6. Write a query that uses the WHERE clause to filter for employees with Salary >= 5000 and Department = 'HR'.
select * from employees
where salary >= 5000 and Department = 'HR'
--7. Use ISNULL to replace NULL values in the Email column with the text "noemail@example.com".
select isnull(email, 'noemail@example.com') from customers
--8. Write a query that shows all products with Price BETWEEN 50 AND 100.
select * from products
where price between 50 and 100
--9. Use SELECT DISTINCT on two columns (Category and ProductName) in the Products table.
select distinct category, product_name from products
--10. Order the results by ProductName in descending order.
select * from customers
where product_name asc

--## ? Medium-Level Tasks (10)
--11. Write a query to select the top 10 products from the Products table, ordered by Price DESC.
select top 10 * from products
order by price desc
--12. Use COALESCE to return the first non-NULL value from FirstName or LastName in the Employees table.
select coalesce(first_name, last_name, 'not found') from customers
--13. Write a query that selects distinct Category and Price from the Products table.
select * from products
select distinct category, price from products
--14. Write a query that filters the Employees table to show employees whose Age is either between 30 and 40 or Department = 'Marketing'.
select * from Employees
where (age between 30 and 40) or  Department = 'Marketing'
--15. Use OFFSET-FETCH to select rows 11 to 20 from the Employees table, ordered by Salary DESC.
select * from Employees
order by age desc
offset 10 rows
fetch next 20 rows only
--16. Write a query to display all products with Price <= 1000 and Stock > 50, sorted by Stock in ascending order.
select product_name from products
where price <= 1000 and stock_quantity > 50
order by stock_quantity asc
--17. Write a query that filters the Products table for ProductName values containing the letter 'e' using LIKE.
select * from products
where product_name like '%e%'
--18. Use IN operator to filter for employees who work in either 'HR', 'IT', or 'Finance'.
select * from employees
where department in ('HR','IT','Finance')
--19. Write a query that uses the ANY operator to find employees who earn more than the average salary of all employees.
select name from employee
where salary > any (select avg(salary) from employee)
--20. Use ORDER BY to display a list of customers ordered by City in ascending and PostalCode in descending order.
select * from customers
order by city asc, postcal_code desc

--## ? Hard-Level Tasks (10)
--21. Write a query that selects the top 10 products with the highest sales, using TOP(10) and ordered by SalesAmount DESC.
select top 10 product_name from products
order by price desc
--22. Use COALESCE to combine FirstName and LastName into one column named FullName in the Employees table.
select coalesce(first_name, '') + ' ' + coalesce(last_name, '') as FullName from employees
--23. Write a query to select the distinct Category, ProductName, and Price for products that are priced above $50, using DISTINCT on three columns.
select distinct category, product_name, price from products where price > 50
--24. Write a query that selects products whose Price is within 10% of the average price in the Products table.
-----------------------------------------------------GO BACK
--25. Use WHERE clause to filter for employees whose Age is less than 30 and who work in either the 'HR' or 'IT' department.
select * from employees
where age < 30 and (department = 'HR' or departmenat = 'IT')
--26. Use LIKE with wildcard to select all customers whose Email contains the domain '@gmail.com'.
select * from customers
where email like '%@gmail.com'
--27. Write a query that uses the ALL operator to find employees whose salary is greater than all employees in the 'Sales' department.
-----------------------------------------------------GO BACK
--28. Use ORDER BY with OFFSET-FETCH to show employees with the highest salaries, displaying 10 employees at a time (pagination).
-----------------------------------------------------GO BACK
----select * from Employees
----order by age desc
----offset 10 rows
----fetch next 20 rows only

--29. Write a query that filters the Orders table for orders placed in the last 30 days using BETWEEN and CURRENT_DATE.  BACK
--30. Use ANY with a subquery to select all employees who earn more than the average salary for their department.  BACK


















