--Lesson 13 ----Practice: String Functions, Mathematical Functions, Date and time Functions

--Bahor Eshmirzayeva

--## 🔰 Beginner Level (10 Puzzles)  
--1️⃣ Extract a Substring** → Extract the first 4 characters from **'DATABASE'. 
select left('Database', 4)
--2️⃣ Find Position of a Word → Find position of 'SQL' in 'I love SQL Server'. 
select charIndex('SQL', 'I love SQL Server')
--3️⃣ Replace a Word → Replace 'World' with 'SQL' in 'Hello World'.  
select replace('Hello World', 'World', 'SQL')
--4️⃣ Find String Length → Find length of **'Microsoft SQL Server'.  
select len('Microsoft SQL Server')
--5️⃣ Extract Last 3 Characters → Get last 3 characters from 'Database'.  
select right('Database', 3)
--6️⃣ Count a Character → Count occurrences of 'a' in 'apple', 'banana', 'grape'.  
select len('apple') - len((replace('apple', 'a', ''))) 
union all
select len('banana') - len((replace('banana', 'a', '')))
union all
select len('grape') - len((replace('grape', 'a', ''))) 
--7️⃣ Remove Part of a String → Remove first 5 characters from 'abcdefg'.
select right('abcdefg', len('abcdefg') - 5)
--8️⃣ Extract a Word → Extract second word from 'SQL is powerful', 'I love databases'.  
select substring('SQL is powerful', charIndex(' ', 'SQL is powerful') + 1, charIndex(' ', 'SQL is powerful', charIndex(' ', 'SQL is powerful') + 1) - (charIndex(' ', 'SQL is powerful') + 1))
select substring('I love database', charIndex(' ', 'I love database') + 1, charIndex(' ', 'I love databse', charIndex(' ', 'I love database') + 1) - (charIndex(' ', 'I love database') + 1))
--9️⃣ Round a Number → Round 15.6789 to 2 decimal places.  
select round(15.6789, 2)
--🔟 Absolute Value → Find absolute value of -345.67.  
select abs(-345.67)

--## 🏆 Intermediate Level (10 Puzzles)  
--1️⃣1️⃣ Find Middle Characters → Extract middle 3 characters from 'ABCDEFGHI'. 
select substring('ABCDEFGHI', floor(len('ABCDEFGHI')/2), 3)
--1️⃣2️⃣ Replace Part of String → Replace first 3 chars of 'Microsoft' with 'XXX'.  

--1️⃣3️⃣ Find First Space → Find position of first space in 'SQL Server 2025'.  
select charIndex(' ','SQL Server 2025')
--1️⃣4️⃣ Concatenate Names → Join FirstName & LastName with ', '.
select concat(FirstName, ', ', LastName) from PersonalInfo
--1️⃣5️⃣ Find Nth Word → Extract third word from 'The database is very efficient'.  

--1️⃣6️⃣ Extract Only Numbers → Get numeric part from 'INV1234', 'ORD5678'.

--1️⃣7️⃣ Round to Nearest Integer → Round 99.5 to the nearest integer.
select cast(99.5 as int)           ----------------------BACK
--1️⃣8️⃣ Find Day Difference → Days between '2025-01-01' & '2025-03-15'.  
select datediff(day, '2025-01-01', '2025-03-15')
--1️⃣9️⃣ Find Month Name → Retrieve month name from '2025-06-10'.  
select dateName(month, '2025-06-10')
--2️⃣0️⃣ Calculate Week Number → Week number for '2025-04-22'. 
select datepart(weekday, '2025-04-22')

-----  

--## 🚀 Advanced Level (10 Puzzles)  
--2️⃣1️⃣ **Extract After '@'** → Extract domain from **'user1@gmail.com', 'admin@company.org'**.  
--2️⃣2️⃣ **Find Last Occurrence** → Last **'e'** in **'experience'**.  
--2️⃣3️⃣ **Generate Random Number** → Random number **between 100-500**.  
--2️⃣4️⃣ **Format with Commas** → Format **9876543** as **"9,876,543"**.  
--2️⃣5️⃣ **Extract First Name** → Get first name from **CREATE TABLE Customers (FullName VARCHAR(100)); INSERT INTO Customers VALUES ('John Doe'), ('Jane Smith')**.  
--2️⃣6️⃣ **Replace Spaces with Dashes** → Change **'SQL Server is great'** → **'SQL-Server-is-great'**.  
--2️⃣7️⃣ **Pad with Zeros** → Convert **42** to **'00042'** (5-digit).  
--2️⃣8️⃣ **Find Longest Word Length** → Longest word in **'SQL is fast and efficient'**.  
--2️⃣9️⃣ **Remove First Word** → Remove first word from **'Error: Connection failed'**. Output: **: Connection failed'** 
--3️⃣0️⃣ **Find Time Difference** → Minutes between **'08:15:00'** & **'09:45:00'**.  
