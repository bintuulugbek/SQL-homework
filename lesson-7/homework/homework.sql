--# Lesson 7 Homework Tasks

--These homework tasks cover the following topics:
--- **Aggregate Functions** (MIN, MAX, COUNT, AVG, SUM)
--- **Filtering Aggregated Data with HAVING**
--- **Pivoting and Unpivoting**

--Bahor Eshmirzayeva

--## 🟢 Easy-Level Tasks (10)

--1. Write a query to find the minimum (MIN) price of a product in the Products table.
select min(price) from product
--2. Write a query to find the maximum (MAX) Salary from the Employees table.
select max(salary) from employees
--3. Write a query to count the number of rows in the Customers table using COUNT(*).
select count(*) from customers
--4. Write a query to count the number of unique product categories (COUNT(DISTINCT Category)) from the Products table.
select count(distinct category) from product
--5. Write a query to find the total (SUM) sales for a particular product in the Sales table.
select sum(sales) totalSale from sales
--6. Write a query to calculate the average (AVG) age of employees in the Employees table.
select avg(age) from employees
--7. Write a query that uses GROUP BY to count the number of employees in each department.
select department, count(empID) from employees
group by department
--8. Write a query to show the minimum and maximum Price of products grouped by Category.
select category, min(price) minPrice, max(price) maxPrice from products
group by category
--9. Write a query to calculate the total (SUM) sales per Region in the Sales table.
select region, sum(sales) totalSale from Sales
group by region
--10. Write a query to use HAVING to filter departments having more than 5 employees from the Employees table.
select department, count(empID) employee_count from employee
group by department
having count(empID) > 5

--## 🟠 Medium-Level Tasks (10)
--11. Write a query to calculate the total sales and average sales for each product category from the Sales table.
select category, sum(sales) total_sale, avg(sales) avg_sale from sales
group by category
--12. Write a query that uses COUNT(columnname) to count the number of employees with a specific JobTitle.
select JobTitle, count(columnName) empNumber from employees
group by JobTitle 
--13. Write a query that finds the highest (MAX) and lowest (MIN) Salary by department in the Employees table.
select department, max(salary) dept_max_salary, min(salary) dept_min_salary from employees
group by department
--14. Write a query that uses GROUP BY to calculate the average salary per Department.
select department, avg(salary) avg_salary from employees
group by department
--15. Write a query to show the AVG salary and COUNT(*) of employees working in each department.
select department, avg(salary) avg_salary, count(*) from employees
group by department
--16. Write a query that uses HAVING to filter products with an average price greater than 100.
select category avg(price) from products
group by category  --I added category
having avg(price) > 100
--17. Write a query to count how many products have sales above 100 units using COUNT(DISTINCT ProductID).
select category, count(distinct productID) from products
group by category
having count(distinct productID) > 100                                    
--18. Write a query that calculates the total sales for each year in the Sales table, and use GROUP BY to group them.
select year, sum(sales) total_sales from sales
group by year 
--19. Write a query that uses COUNT to show the number of customers who placed orders in each region.
select region, count(customer) countCustomer from orders
group by region
--20. Write a query that applies the HAVING clause to filter out Departments with total salary expenses greater than 100,000.
select department, sum(salary) total_salary from employees
group by department
having sum(salary) > 100000

--## 🔴 Hard-Level Tasks (10)

--21. Write a query that shows the average (AVG) sales for each product category, and then uses HAVING to filter categories with an average sales amount greater than 200.
select category, avg(sales) from product
group by category
having avg(sales) > 200
--22. Write a query to calculate the total (SUM) sales for each employee, then filter the results using HAVING to include only employees with total sales over 5000.
select employee, sum(sales) total_sale from employee
group by employee
having sum(sales) > 5000
--23. Write a query to find the total (SUM) and average (AVG) salary of employees grouped by department, and use HAVING to include only departments with an average salary greater than 6000.
select department, sum(salary) total_sale, avg(salary) avg_salary from employees
group by department
having avg_salary > 6000
--24. Write a query that finds the maximum (MAX) and minimum (MIN) order value for each customer, and then applies HAVING to exclude customers with an order value less than 50.
select customer, min(order) min_order, max(order) max_order from customers
group by customer
having min(order) >= 50
select * from employees
--25. Write a query that calculates the total sales (SUM) and counts distinct products sold in each Region, and then applies HAVING to filter regions with more than 10 products sold.
select region, sum(sales) total_sales, count(distinct product) from sales
group by region
having count(distinct product) > 10
--26. Write a query to find the MIN and MAX order quantity per product, and then use GROUP BY to group the results by ProductCategory.
select productCategory, max(order_quantity), min(order_quantity) from orders
group by productCategory
--27. Write a query to pivot the Sales table by Year and show the sum of SalesAmount for each Region. 
--28. Write a query to unpivot the Sales table, converting Q1, Q2, Q3, and Q4 columns into rows showing total sales per quarter.
--29. Write a query to count the number of orders per product, filter those with more than 50 orders using HAVING, and group them by ProductCategory.
select productCategory, count(orders) order_count from orders
group by productCategory
having count(orders) > 50
--30. Write a query to pivot the EmployeeSales table, displaying the total sales per employee for each quarter (Q1, Q2, Q3, Q4).
