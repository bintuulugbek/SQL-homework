--Lesson 13 ----Practice: String Functions, Mathematical Functions, Date and time Functions

--Bahor Eshmirzayeva

--## 🔰 Beginner Level (10 Puzzles)  
--1️ Extract a Substring** → Extract the first 4 characters from **'DATABASE'. 
select left('Database', 4)
--2️ Find Position of a Word → Find position of 'SQL' in 'I love SQL Server'. 
select charIndex('SQL', 'I love SQL Server')
--3️ Replace a Word → Replace 'World' with 'SQL' in 'Hello World'.  
select replace('Hello World', 'World', 'SQL')
--4️ Find String Length → Find length of **'Microsoft SQL Server'.  
select len('Microsoft SQL Server')
--5️ Extract Last 3 Characters → Get last 3 characters from 'Database'.  
select right('Database', 3)
--6️ Count a Character → Count occurrences of 'a' in 'apple', 'banana', 'grape'.  
select len('apple') - len((replace('apple', 'a', ''))) 
union all
select len('banana') - len((replace('banana', 'a', '')))
union all
select len('grape') - len((replace('grape', 'a', ''))) 
--7️ Remove Part of a String → Remove first 5 characters from 'abcdefg'.
select right('abcdefg', len('abcdefg') - 5)
--8️ Extract a Word → Extract second word from 'SQL is powerful', 'I love databases'.  
select substring('SQL is powerful', charIndex(' ', 'SQL is powerful') + 1, charIndex(' ', 'SQL is powerful', charIndex(' ', 'SQL is powerful') + 1) - (charIndex(' ', 'SQL is powerful') + 1))
select substring('I love database', charIndex(' ', 'I love database') + 1, charIndex(' ', 'I love databse', charIndex(' ', 'I love database') + 1) - (charIndex(' ', 'I love database') + 1))
--9️ Round a Number → Round 15.6789 to 2 decimal places.  
select round(15.6789, 2)
--10 Absolute Value → Find absolute value of -345.67.  
select abs(-345.67)

--## 🏆 Intermediate Level (10 Puzzles)  
--1️1 Find Middle Characters → Extract middle 3 characters from 'ABCDEFGHI'. 
select substring('ABCDEFGHI', floor(len('ABCDEFGHI')/2), 3)
--1️2️ Replace Part of String → Replace first 3 chars of 'Microsoft' with 'XXX'.  
select replace('Microsoft', left('Microsoft', 3), 'xxx')
--1️3️ Find First Space → Find position of first space in 'SQL Server 2025'.  
select charIndex(' ','SQL Server 2025')
--1️4️ Concatenate Names → Join FirstName & LastName with ', '.
select concat(FirstName, ', ', LastName) from PersonalInfo
--1️5️ Find Nth Word → Extract third word from 'The database is very efficient'.  
select substring('The database is very efficient', charIndex(' ', 'The database is very efficient', charIndex(' ', 'The database is very efficient') + 1) + 1, charIndex(' ', 'The database is very efficient', charIndex(' ', 'The database is very efficient', charIndex(' ', 'The database is very efficient') + 1) + 1) - charIndex(' ', 'The database is very efficient', charIndex(' ', 'The database is very efficient') + 1))
--1️6️ Extract Only Numbers → Get numeric part from 'INV1234', 'ORD5678'.
select right('INV1234', patIndex('%[0-9]%', 'INV1234'))
select right('ORD5678', patIndex('%[0-9]%', 'ORD5678'))
--1️7️ Round to Nearest Integer → Round 99.5 to the nearest integer.
select round(cast(99.5 as  float), 0)      
--1️8️ Find Day Difference → Days between '2025-01-01' & '2025-03-15'.  
select datediff(day, '2025-01-01', '2025-03-15')
--1️9️ Find Month Name → Retrieve month name from '2025-06-10'.  
select dateName(month, '2025-06-10')
--2️0️ Calculate Week Number → Week number for '2025-04-22'. 
select datepart(weekday, '2025-04-22') 

--## 🚀 Advanced Level (10 Puzzles)  
--2️1 Extract After '@' → Extract domain from 'user1@gmail.com', 'admin@company.org'.  
select substring('user1@gmail.com', charIndex('@', 'user1@gmail.com') + 1, len('user1@gmail.com') -  charIndex('@', 'user1@gmail.com'))
--2️2️ Find Last Occurrence → Last 'e' in 'experience'.  
select len('experience') - charIndex('e', reverse('experience')) + 1 
--2️3️ Generate Random Number → Random number between 100-500. 
select rand()*(500-100) + 100
--2️4️ Format with Commas → Format 9876543 as "9,876,543".  
select format(9876543, '#,###,###')
--2️5️ Extract First Name → Get first name from 
select right(FullName, len(FullName) - charIndex(' ', FullName)) from Customers
--2️6️ Replace Spaces with Dashes → Change 'SQL Server is great' → 'SQL-Server-is-great'.
select replace('SQL Server is great', ' ', '-')
--2️7️ Pad with Zeros → Convert 42 to '00042' (5-digit).
select replace(space(3), ' ', '0') + '42'
--2️8️ Find Longest Word Length → Longest word in 'SQL is fast and efficient'.  
select value from string_split('SQL is fast and efficient', ' ')
--2️9️ Remove First Word → Remove first word from 'Error: Connection failed'. Output: : Connection failed'
SELECT trim(substring('Error: Connection failed. Output: : Connection failed', charindex(' ', 'Error: Connection failed. Output: : Connection failed') + 1, len('Error: Connection failed. Output: : Connection failed'))) as Result;
--3️0️ Find Time Difference → Minutes between '08:15:00' & '09:45:00'.  
select datediff(minute, '08:15:00', '09:45:00')
