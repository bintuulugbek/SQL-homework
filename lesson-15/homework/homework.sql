--Easy Tasks

--1.Find employees whose salary is above the average salary. (Derived Table)
select concat(Firstname, ' ', LastName) from 
(
select avg(salary) avg_salary from Employees
) avgSalary 
cross join Employees
where avgSalary.avg_salary < Employees.salary
--2.Find employees who have the same salary as another employee. (CTE)

with cte as (
	select EmployeeID, FirstName, salary from Employees
)
select string_agg(Employees.FirstName, ' and '), cte.salary from cte join Employees on cte.Salary = Employees.Salary and cte.firstName != Employees.Firstname
group by cte.salary

--3.Get the number of employees in each department. (CTE)
with cte as (
	select DepartmentID, count(DepartmentID) emp_num from Employees
	group by DepartmentID
)
select DepartmentName, emp_num from cte join Departments on cte.3DepartmentID = Departments.DepartmentID
--4.Find employees whose salary is below the average salary. (Derived Table)
select concat(FirstName, ' ', LastName) from (
select avg(salary) avg_salary from Employees
) tb cross join Employees where tb.avg_salary > Employees.salary
--5.List products that have been sold at least twice. (CTE)
with cte as (
select ProductID, count(ProductID) product_count from Sales
group by ProductID
having count(ProductID) >= 2
) 
select ProductName, product_count from cte inner join Products on Products.ProductID = cte.ProductID
--6.Find employees who made a single sale of more than $2000. (Derived Table)
select * from (
select EmployeeID, count(EmployeeID) count_emp from Sales
group by EmployeeID
) tb join Sales on Sales.EmployeeID = tb.EmployeeID
where salesamount > 2000 and count_emp = 1
--7.Retrieve the most expensive product. (Derived Table)
select ProductName, max_price from (
select max(price) max_price from Products
) tb join Products on tb.max_price = Products.price
--8.Find the total sales made by each employee. (CTE)
with cte as (
select EmployeeID, sum(salesamount) total_sale from Sales 
group by EmployeeID
) 
select * from cte
--9.Find employees who have sold a "Laptop." (CTE)
with cte as (
	select Sales.EmployeeID from Sales join Products on Sales.ProductID = Products.ProductID where productname = 'Laptop'
)
select FirstName from cte
join Employees on Employees.EmployeeID = cte.EmployeeID
--10.Find the highest-paid employee in each department. (Derived Table)
select FirstName from (
select DepartmentID, max(salary) max_salary from Employees 
group by DepartmentID
) tb inner join Employees on max_salary = Employees.Salary

--Medium Tasks
--11.Find departments with no employees. (CTE)
with cte as (
select DepartmentID from Departments
except (select DepartmentID from Employees group by DepartmentID) 
) 
select Departments.Departmentname from cte join Departments on Departments.DepartmentID = cte.DepartmentID
--12.Find employees who have made the same total sales as another employee. (CTE)
with cte as (
select employeeID, sum(salesamount) total_sales from sales
group by employeeID
)
select string_agg(firstName, ' and ') from cte join (select employeeID, sum(salesamount) total_sales from sales group by employeeID) tb on cte.employeeID != tb.employeeID and cte.total_sales = tb.total_sales
join Employees on Employees.employeeid = cte.employeeiD
--13.Find the total revenue generated per product category. (CTE)
with cte as (
	select productID, sum(salesamount) sales_amount from Sales
	group by productID
)
select categoryID, sum(sales_amount) total_revenue from cte join Products on Products.ProductID = cte.productID
group by CategoryID
--14.Find the top 3 highest-paid employees per department. (Derived Table)
select * from Employees
select * from Departments



select distinct departmentID from Employees
order by salary desc

select departmentID, salary from Employees
group by departmentID, salary
order by departmentID, salary desc

--15.Find employees who have the highest number of sales transactions. (Derived Table)
select max(sale_count) from (
select EmployeeID, count(salesID) sale_count from Sales
group by EmployeeID
) tb join (select FirstName, EmployeeID from Employees) tb2 on tb2.EmployeeID = tb.EmployeeID

select * from Sales
--16.Find employees who sold more than 3 different products. (CTE)
with cte as (
select employeeID, count(distinct productID) distinct_product_count from sales
group by employeeID
) 
select FirstName from cte join Employees on cte.EmployeeID = Employees.EmployeeID
where distinct_product_count > 3
--17.Find the department with the highest total salary. (Derived Table)
select departmentName from (select top 1 DepartmentID, sum(salary) total_salary from Employees
group by DepartmentID
order by total_salary desc) tb join Departments on Departments.DepartmentID = tb.DepartmentID
--18.Find employees who made sales higher than their department's average sales. (Derived Table)
-- this is a wrong question. the department's average sales cannot be found 

--Difficult Tasks
--19.Find employees whose total sales exceed their own salary. (Derived Table)
select * from (
select employeeId, sum(salesamount) sales_amount from sales 
group by EmployeeID
) tb join employees on employees.EmployeeID = tb.employeeID
where sales_amount > salary
--20.Find the department with the most sales transactions. (Derived Table)
select max(sale_count) from (
select EmployeeID, count(salesID) sale_count from Sales
group by EmployeeID
) tb join (select FirstName, EmployeeID from Employees) tb2 on tb2.EmployeeID = tb.EmployeeID

--21.Find the top-selling employee for each product. (Derived Table)
select ProductID, count(employeeID) selling_count from Sales
group by ProductID








