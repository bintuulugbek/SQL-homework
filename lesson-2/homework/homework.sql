--hw_2
--🟢 Easy-Level Tasks (10)
--1.	Define and explain DDL and DML. Give two examples of each.
/*
DDL - Data Defintion Language is used to create, define and delete database and its structures(create, alter, drop, truncate)
create database databaseName; drop database databaseName
-- DML - Data Manipulation Language is used to manage database and its structures(insert, update, delete) 
insert into tableName values (name varchar(10), age int)
delete employees
where empID = 2
*/
--2.	Write a query to create a table Employees with columns: EmpID (INT, PRIMARY KEY), Name (VARCHAR(50)), Salary (DECIMAL(10,2)).
create table Employees (EmpID int primary key, [name] varchar(50), salary decimal(10,2))
--3.	Insert three records into the Employees table using the INSERT INTO statement.
insert into Employees values (1, 'Bill', 2000), (2, 'John', 2500), (3, 'Ann', 3000)
--4.	Write a query to update the Salary of an employee where EmpID = 1.
update Employees
set salary = 5000
where EmpID = 1
--5.	Delete a record from the Employees table where EmpID = 2.
delete Employees
where EmpID = 2
--6.	Explain the difference between DELETE, DROP, and TRUNCATE with examples.
/* 
drop - deletes entire database from database
delete - can delete some rows according to condition(where), structure doesn't change
truncate - for cleaning table information, but the column names(structures) are kept unchanged
*/
--7.	Modify the Name column in the Employees table to VARCHAR(100).
alter table Employees
alter column name varchar(100)
--8.	Use the ALTER TABLE statement to add a new column Department (VARCHAR(50)) to the Employees table.
alter table Employees
add Department varchar(50)
--9.	Use SSMS graphical tools to create a database named CompanyDB. Take a screenshot. done!
--10.	Describe the purpose of the TRUNCATE TABLE command.
--Purpose of truncate table is to remove all information in the rows without changing the structure of database

--🟠 Medium-Level Tasks (10)
--11.	Create a table Departments with a PRIMARY KEY on DeptID and a FOREIGN KEY referencing Employees.EmpID.
create table Departments (DeptID int, DeptName varchar(20), constraint Pk_deptID primary key (DeptID))
create table employees (EmpID int, Employee varchar(20), constraint Fk_EmpID foreign key(EmpID) references Departments(DeptID))
--12.	Insert five records into the Departments table using INSERT INTO SELECT from another table.
insert into employees(employee)
select deptName
from Departments
where deptName = 'Marketing'
--13.	Write a query that updates the Department of all employees where Salary > 5000 to 'Management'.
Update departments
set department = 'Management'
where salary > 5000
--14.	Write a query to remove all records from the Employees table without removing its structure
truncate table employees
select * from employees
--15.	Explain the difference between VARCHAR and NVARCHAR when creating tables.
--varchar = not unicode, it stores 1 byte per character(includes english)
--nvarchar = unicode characters, it stores 2 bytes per character (arabic, chinese, symbols).
--16.	Modify an existing column Salary to change its data type to FLOAT.
alter table employee
alter column salary float
--17.	Drop the column Department from the Employees table using ALTER TABLE.
alter table Employee
drop column department
--18.	Use SSMS graphical tools to modify the Employees table by adding a new column JoinDate (DATE). Take a screenshot. done!
--19.	Create a temporary table and insert two records into it.
create table #temp_table (id int, name varchar(10), age int)
--20.	Write a query to remove the Departments table completely from the database.
drop table departments
--🟠Hard-level task
--21.Write a script that creates a Customers table with a CHECK constraint ensuring Age > 18.
create table customers (ID int, name varchar(15), age int, constraint Ck_age check (age>18))
insert into customers values (1, 'Bill', 20), (2, 'John', 19), (3, 'Ann', 24), (4, 'Kate', 23), (5, 'Alex', 25)

--22.Write a query to delete all employees who have not received a salary increase in the last two years. GO BACK AND COMPLETE
--create table employees (empID int, name varchar(15), salary_increated bool)
--insert into employees values (1, 'Bill', 1), (2, 'John', 2), (3, 'Ann', FALSE), (4, 'Kate', FALSE), (5, 'Alex', TRUE)

--23.Create a stored procedure that inserts a new employee record into the Employees table.
create procedure spGetEmployees
@name varchar(15)
@department varchar(15)
@position varchar(15)
@salary int
as
begin
	insert into employees (name, department, position, salary) values (@name, @department, @position, @salary)
end

--24.Write a query that creates a backup table Employees_Backup with the same structure as Employees
select * into employees_backup
from employees

--25.Write a query to insert multiple rows using MERGE INTO from another table
--26.Drop the CompanyDB database and recreate it using a script.
--27.Use SSMS graphical tools to rename the Employees table to StaffMembers. Take a screenshot. done!
--28.Explain the difference between CASCADE DELETE and CASCADE UPDATE with an example.
--29.Write a query to reset the IDENTITY column seed of Employees after deleting all records.

--30.Write a query that creates a table with both PRIMARY KEY and UNIQUE constraints on different columns
create table consts (ID int primary key, name varchar(20) unique, age int)
