--# Lesson 1: Introduction to SQL Server and SSMS

--## Easy
--1. Define the following terms: data, database, relational database, and table.
--data - can be object, collection of some information, that we can use to learn analyse in order to make appropriate decisions
--database is place to keep data. 
--relational database is database which keeps data as tables
--table - is collection of data which contains row and column that are related to each other.

--2. List five key features of SQL Server.
-- We have only learned the part which is related to Integration with BI tools.
--I don't have information about others but on google it is:
----High Availability and Disaster Recovery
----Security Features
----Performance Optimization
----Integration with BI Tools
----Scalability and Flexibility

--3. Open SSMS and connect to a SQL Server instance. Take a screenshot of the interface. done!

--## Medium
--4. Create a new database in SSMS named SchoolDB.
create database SchoolDB
--5. Write and execute a query to create a table called Students with columns: StudentID (INT, PRIMARY KEY), Name (VARCHAR(50)), Age (INT).
create table Students (StudentID int primary key identity, name varchar(50), age int)
--6. Describe the differences between SQL Server, SSMS, and SQL
--SQL Server - is the place to store and manage data
--SSMS - SQL Server Management Studio is place that we write query to work with database, it connects us to database when we write query
--SQL is just structured query language that we use to talk with database for it to understand and do what we ask to do

--we get data from SQL server using SQL and SSMS

--## Hard
--7. Research and explain the different SQL commands: DQL, DML, DDL, DCL, TCL with examples.
--DQL - Data Query Language - select - to get(see, find) data we want
--DML - Data Manipulation Language - insert, update, delete - is for (manipulating) inserting data, updating existing data and deleting it
--DDL - Data Definition Language - create, drop, alter, truncate - for managing the structure of database, can create/drop/alter/truncate database, table, schema
--TCL - Transiction Control Language - rollback, commit - for managing transactions

--8. Write a query to insert three records into the Students table.
insert into Students values ('Bill', 20),('John', 25),('Ann', 19)

--9. Create a backup of your SchoolDB database and restore it.
backup database SchoolDB
to disk= 'C:\Backup\SchoolDB_Backup.bak'  --we haven't learned I researched

