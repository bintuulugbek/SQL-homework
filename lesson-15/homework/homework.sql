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
select string_agg(Employees.FirstName, ' and '), cte.salary from cte join Employees on cte.Salary = Employees.Salary
where cte.firstName != Employees.Firstname
group by cte.salary
--3.Get the number of employees in each department. (CTE)
with cte as (
	select DepartmentID, count(DepartmentID) emp_num from Employees
	group by DepartmentID
)
select DepartmentName, emp_num from cte join Departments on cte.DepartmentID = Departments.DepartmentID
--4.Find employees whose salary is below the average salary. (Derived Table)
select concat(FirstName, ' ', LastName) from (
select avg(salary) avg_salary from Employees
) tb cross join Employees where tb.avg_salary > Employees.salary
--5.List products that have been sold at least twice. (CTE)
select * from Products
select * from Sales

--6.Find employees who made a single sale of more than $2000. (Derived Table)
--7.Retrieve the most expensive product. (Derived Table)
--8.Find the total sales made by each employee. (CTE)
--9.Find employees who have sold a "Laptop." (CTE)
--10.Find the highest-paid employee in each department. (Derived Table)

--Medium Tasks

--11.Find departments with no employees. (CTE)
--12.Find employees who have made the same total sales as another employee. (CTE)
--13.Find the total revenue generated per product category. (CTE)
--14.Find the top 3 highest-paid employees per department. (Derived Table)
--15.Find employees who have the highest number of sales transactions. (Derived Table)
--16.Find employees who sold more than 3 different products. (CTE)
--17.Find the department with the highest total salary. (Derived Table)
--18.Find employees who made sales higher than their department's average sales. (Derived Table)

--Difficult Tasks

--19.Find employees whose total sales exceed their own salary. (Derived Table)
--20.Find the department with the most sales transactions. (Derived Table)
--21.Find the top-selling employee for each product. (Derived Table)


