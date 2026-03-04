## Normalization 
### General Definition 

## General Overview for Task 3 
## Learning Objective
## Task Requirements 
## Installation Guide 
## Start
### CREATE ORIGINAL TALBE 
```
mysql> CREATE TABLE Student_data (
    ->   MembershipID INT AUTO_INCREMENT PRIMARY KEY,
    ->   StudentID INT NOT NULL,
    ->   StudentName VARCHAR(50) NOT NULL,
    ->   Email VARCHAR(100) NOT NULL,
    ->   ClubName VARCHAR(50) NOT NULL,
    ->   ClubRoom VARCHAR(10) NOT NULL,
    ->   ClubMentor VARCHAR(50) NOT NULL,
    ->   JoinDate DATE NOT NULL
    -> );
Query OK, 0 rows affected (0.047 sec)

mysql> INSERT INTO Student_data
    -> (StudentID, StudentName, Email, ClubName, ClubRoom, ClubMentor, JoinDate)
    -> VALUES
    -> (1, 'Asha',  'asha@email.com',  'Music Club',  'R101', 'Mr. Raman', '2024-01-10'),
    -> (2, 'Bikash','bikash@email.com','Sports Club', 'R202', 'Ms. Sita',  '2024-01-12'),
    -> (1, 'Asha',  'asha@email.com',  'Sports Club', 'R202', 'Ms. Sita',  '2024-01-15'),
    -> (3, 'Nisha', 'nisha@email.com', 'Music Club',  'R101', 'Mr. Raman', '2024-01-20'),
    -> (4, 'Rohan', 'rohan@email.com', 'Drama Club',  'R303', 'Mr. Kiran', '2024-01-18'),
    -> (5, 'Suman', 'suman@email.com', 'Music Club',  'R101', 'Mr. Raman', '2024-01-22'),
    -> (2, 'Bikash','bikash@email.com','Drama Club',  'R303', 'Mr. Kiran', '2024-01-25'),
    -> (6, 'Pooja', 'pooja@email.com', 'Sports Club', 'R202', 'Ms. Sita',  '2024-01-27'),
    -> (3, 'Nisha', 'nisha@email.com', 'Coding Club', 'lab1', 'Mr. Anil',  '2024-01-28'),
    -> (7, 'Aman',  'aman@email.com',  'Coding Club', 'Lab1', 'Mr. Anil',  '2024-01-30');
Query OK, 10 rows affected (0.020 sec)
Records: 10  Duplicates: 0  Warnings: 0
```
```
mysql> SELECT * FROM Student_data;
+--------------+-----------+-------------+------------------+-------------+----------+------------+------------+
| MembershipID | StudentID | StudentName | Email            | ClubName    | ClubRoom | ClubMentor | JoinDate   |
+--------------+-----------+-------------+------------------+-------------+----------+------------+------------+
|            1 |         1 | Asha        | asha@email.com   | Music Club  | R101     | Mr. Raman  | 2024-01-10 |
|            2 |         2 | Bikash      | bikash@email.com | Sports Club | R202     | Ms. Sita   | 2024-01-12 |
|            3 |         1 | Asha        | asha@email.com   | Sports Club | R202     | Ms. Sita   | 2024-01-15 |
|            4 |         3 | Nisha       | nisha@email.com  | Music Club  | R101     | Mr. Raman  | 2024-01-20 |
|            5 |         4 | Rohan       | rohan@email.com  | Drama Club  | R303     | Mr. Kiran  | 2024-01-18 |
|            6 |         5 | Suman       | suman@email.com  | Music Club  | R101     | Mr. Raman  | 2024-01-22 |
|            7 |         2 | Bikash      | bikash@email.com | Drama Club  | R303     | Mr. Kiran  | 2024-01-25 |
|            8 |         6 | Pooja       | pooja@email.com  | Sports Club | R202     | Ms. Sita   | 2024-01-27 |
|            9 |         3 | Nisha       | nisha@email.com  | Coding Club | lab1     | Mr. Anil   | 2024-01-28 |
|           10 |         7 | Aman        | aman@email.com   | Coding Club | Lab1     | Mr. Anil   | 2024-01-30 |
+--------------+-----------+-------------+------------------+-------------+----------+------------+------------+
10 rows in set (0.003 sec)
```
### query to create db, table, insert date , show relust

