### General Definition 
```
Database normalization is a process of organizing data into separate related tables to reduce duplication and prevent errors.
It ensures each table stores only one type of information and uses primary keys and foreign keys to link tables together.
This makes the database more consistent, easier to update, and reduces insert, update, and delete anomalies.
```
## General Overview for Task 3
```
This project is based on a College Club Membership Management scenario where all student and club details are stored in one table.
The task is to first find data problems like repetition and anomalies, then improve the design by normalizing the data from 1NF to 2NF and 3NF by splitting it into Student, Club, and Membership tables.
After normalization, an ER diagram is created to show relationships (one student can join many clubs and one club can have many students).
Finally, SQL queries are written to insert and display data, and a JOIN query is used to show Student Name, Club Name, and Join Date. The final reflection explains how normalization improves accuracy and why JOINs are needed after splitting tables.
```
## Learning Objective
```
Identify data quality issues in the original Student_data table (redundancy, duplicates, and anomalies).
Normalize the dataset from 1NF → 2NF → 3NF to improve structure and consistency.
Design an ER-style relational model using primary keys and foreign keys (Students, Clubs, Memberships).
Implement and test the normalized database in MySQL (Docker) using SQL scripts and verification queries.
```
## Task Requirements 
## Installation Guide 
```
1) Install Requirements

Install Docker Desktop for Windows

Make sure Docker is running (Docker icon shows running)

2) Pull MySQL Image

Open CMD and run:
docker pull mysql:latest

3) Create and Run MySQL Container
docker run -d --name mysql-db -p 3705:3306 -e MYSQL_ROOT_PASSWORD=root mysql:latest

4) Check the Container
docker ps
You should see mysql-db running.

5) Login to MySQL (inside Docker)
docker exec -it mysql-db mysql -u root -p
```
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
### Problem of the tables 
```
Repeated student data (same student name/email appears in many rows).
Repeated club data (same club room/mentor repeats for every member).
Hard to maintain because one change may require updating many rows.

Redundant data: repeated extra info (e.g., same club room repeated).
Duplicate data: same details appear again in multiple rows (e.g., same student info).


Insert anomaly: can’t add a new club unless a student joins it.
Update anomaly: changing a mentor/room needs updates in many rows.
Delete anomaly: deleting the last member of a club can remove club info too.

The table is already in 1NF, so we normalize it into 2NF and 3NF to remove repetition and anomalies. In 2NF, we split the data into separate tables: Students (StudentID, StudentName, Email), Clubs (ClubName, ClubRoom, ClubMentor), and Memberships (StudentID, ClubName, JoinDate). In 3NF, we ensure non-key fields depend only on their own key (e.g., room and mentor stay only in the Clubs table), so updates happen once and the data stays consistent.
```
###  Normalization 
```
To normalize the table, we split it into 3 tables: Students, Clubs, and Memberships.


This makes the database 2NF because student details are stored only once in Students, and club details are stored only once in Clubs.


The Memberships table stores the relationship (who joined which club and the join date).


Memberships has two foreign keys:
StudentID → references Students(StudentID)
ClubName → references Clubs(ClubName)
This reduces repeated data and avoids insert, update, and delete anomalies.
```
### Tables 
```
mysql> CREATE TABLE Students (
    ->   StudentID INT PRIMARY KEY,
    ->   StudentName VARCHAR(50) NOT NULL,
    ->   Email VARCHAR(100) NOT NULL
    -> );
Query OK, 0 rows affected (0.034 sec)

mysql>
mysql> CREATE TABLE Clubs (
    ->   ClubName VARCHAR(50) PRIMARY KEY,
    ->   ClubRoom VARCHAR(10) NOT NULL,
    ->   ClubMentor VARCHAR(50) NOT NULL
    -> );
Query OK, 0 rows affected (0.041 sec)

mysql>
mysql> CREATE TABLE Memberships (
    ->   StudentID INT NOT NULL,
    ->   ClubName VARCHAR(50) NOT NULL,
    ->   JoinDate DATE NOT NULL,
    ->   PRIMARY KEY (StudentID, ClubName),
    ->   FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    ->   FOREIGN KEY (ClubName) REFERENCES Clubs(ClubName)
    -> );
Query OK, 0 rows affected (0.045 sec)
Value Inster
mysql> INSERT INTO Students (StudentID, StudentName, Email)
    -> SELECT DISTINCT StudentID, StudentName, Email
    -> FROM Student_data;
Query OK, 7 rows affected (0.012 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql>
mysql> INSERT INTO Clubs (ClubName, ClubRoom, ClubMentor)
    -> SELECT DISTINCT ClubName, ClubRoom, ClubMentor
    -> FROM Student_data;
Query OK, 4 rows affected (0.009 sec)
Records: 4  Duplicates: 0  Warnings: 0
mysql> INSERT INTO Memberships (StudentID, ClubName, JoinDate)
    -> SELECT StudentID, ClubName, STR_TO_DATE(JoinDate, '%Y-%m-%d')
    -> FROM Student_data;
Query OK, 10 rows affected (0.008 sec)
Records: 10  Duplicates: 0  Warnings: 0
```
### 2NF Table 
```
mysql> SELECT * FROM Students;
+-----------+-------------+------------------+
| StudentID | StudentName | Email            |
+-----------+-------------+------------------+
|         1 | Asha        | asha@email.com   |
|         2 | Bikash      | bikash@email.com |
|         3 | Nisha       | nisha@email.com  |
|         4 | Rohan       | rohan@email.com  |
|         5 | Suman       | suman@email.com  |
|         6 | Pooja       | pooja@email.com  |
|         7 | Aman        | aman@email.com   |
+-----------+-------------+------------------+
7 rows in set (0.001 sec)

mysql> SELECT * FROM Clubs;
+-------------+----------+------------+
| ClubName    | ClubRoom | ClubMentor |
+-------------+----------+------------+
| Coding Club | lab1     | Mr. Anil   |
| Drama Club  | R303     | Mr. Kiran  |
| Music Club  | R101     | Mr. Raman  |
| Sports Club | R202     | Ms. Sita   |
+-------------+----------+------------+
4 rows in set (0.001 sec)

mysql> SELECT * FROM Memberships;
+-----------+-------------+------------+
| StudentID | ClubName    | JoinDate   |
+-----------+-------------+------------+
|         1 | Music Club  | 2024-01-10 |
|         1 | Sports Club | 2024-01-15 |
|         2 | Drama Club  | 2024-01-25 |
|         2 | Sports Club | 2024-01-12 |
|         3 | Coding Club | 2024-01-28 |
|         3 | Music Club  | 2024-01-20 |
|         4 | Drama Club  | 2024-01-18 |
|         5 | Music Club  | 2024-01-22 |
|         6 | Sports Club | 2024-01-27 |
|         7 | Coding Club | 2024-01-30 |
+-----------+-------------+------------+
10 rows in set (0.000 sec)
```
### 3NF
```
The database is in 3NF because each table stores only one type of data (Students, Clubs, Memberships).


In each table, every non-key column depends only on the primary key:
Students: StudentName and Email depend on StudentID.
Clubs: ClubRoom and ClubMentor depend on ClubName.
Memberships: JoinDate depends on the combined key (StudentID, ClubName).


There are no transitive dependencies (no non-key column depends on another non-key column).


Because of this, updates happen in one place only, reducing redundancy and preventing insert/update/delete anomalies.

3NF Table
mysql> SELECT * FROM Students;
+-----------+-------------+------------------+
| StudentID | StudentName | Email            |
+-----------+-------------+------------------+
|         1 | Asha        | asha@email.com   |
|         2 | Bikash      | bikash@email.com |
|         3 | Nisha       | nisha@email.com  |
|         4 | Rohan       | rohan@email.com  |
|         5 | Suman       | suman@email.com  |
|         6 | Pooja       | pooja@email.com  |
|         7 | Aman        | aman@email.com   |
+-----------+-------------+------------------+
7 rows in set (0.001 sec)

mysql> SELECT * FROM Clubs;
+-------------+----------+------------+
| ClubName    | ClubRoom | ClubMentor |
+-------------+----------+------------+
| Coding Club | lab1     | Mr. Anil   |
| Drama Club  | R303     | Mr. Kiran  |
| Music Club  | R101     | Mr. Raman  |
| Sports Club | R202     | Ms. Sita   |
+-------------+----------+------------+
4 rows in set (0.001 sec)

mysql> SELECT * FROM Memberships;
+-----------+-------------+------------+
| StudentID | ClubName    | JoinDate   |
+-----------+-------------+------------+
|         1 | Music Club  | 2024-01-10 |
|         1 | Sports Club | 2024-01-15 |
|         2 | Drama Club  | 2024-01-25 |
|         2 | Sports Club | 2024-01-12 |
|         3 | Coding Club | 2024-01-28 |
|         3 | Music Club  | 2024-01-20 |
|         4 | Drama Club  | 2024-01-18 |
|         5 | Music Club  | 2024-01-22 |
|         6 | Sports Club | 2024-01-27 |
|         7 | Coding Club | 2024-01-30 |
+-----------+-------------+------------+
10 rows in set (0.000 sec)
```
## ER Diagram
```
+---------------------------+      +---------------------------+
|          STUDENTS         |      |           CLUBS           |
+---------------------------+      +---------------------------+
| PK  StudentID             |      | PK  ClubName              |
|     StudentName           |      |     ClubRoom              |
|     Email                 |      |     ClubMentor            |
+---------------------------+      +---------------------------+
            | 1                               1 |
            |                                   |
            |                                   |
            +-----------<  MANY    MANY  >-------+
                        +-------------------+
                        |    MEMBERSHIPS    |
                        +-------------------+
                        | PK/FK StudentID   |
                        | PK/FK ClubName    |
                        |     JoinDate      |
                        +-------------------+

Students 1-to-many Memberships
Clubs    1-to-many Memberships
Overall: Students many-to-many Clubs (via Memberships)
```
### Adding New Values And showcasing those values  
```
mysql> INSERT INTO Students (StudentID, StudentName, Email)
    -> VALUES (8, 'Rahul Thapa', 'rahul@gmail.com');
Query OK, 1 row affected (0.077 sec)

mysql>
mysql> INSERT INTO Clubs (ClubName, ClubRoom, ClubMentor)
    -> VALUES ('Robotics Club', 'R404', 'Mr. Bean');
Query OK, 1 row affected (0.012 sec)

mysql>
mysql> SELECT * FROM Students;
+-----------+-------------+------------------+
| StudentID | StudentName | Email            |
+-----------+-------------+------------------+
|         1 | Asha        | asha@email.com   |
|         2 | Bikash      | bikash@email.com |
|         3 | Nisha       | nisha@email.com  |
|         4 | Rohan       | rohan@email.com  |
|         5 | Suman       | suman@email.com  |
|         6 | Pooja       | pooja@email.com  |
|         7 | Aman        | aman@email.com   |
|         8 | Rahul Thapa | rahul@gmail.com  |
+-----------+-------------+------------------+
8 rows in set (0.006 sec)

mysql>
mysql> SELECT * FROM Clubs;
+---------------+----------+------------+
| ClubName      | ClubRoom | ClubMentor |
+---------------+----------+------------+
| Coding Club   | lab1     | Mr. Anil   |
| Drama Club    | R303     | Mr. Kiran  |
| Music Club    | R101     | Mr. Raman  |
| Robotics Club | R404     | Mr. Bean   |
| Sports Club   | R202     | Ms. Sita   |
+---------------+----------+------------+
5 rows in set (0.002 sec)
```
### Display of all the Tables 
```
mysql> SELECT * FROM Students;
+-----------+-------------+------------------+
| StudentID | StudentName | Email            |
+-----------+-------------+------------------+
|         1 | Asha        | asha@email.com   |
|         2 | Bikash      | bikash@email.com |
|         3 | Nisha       | nisha@email.com  |
|         4 | Rohan       | rohan@email.com  |
|         5 | Suman       | suman@email.com  |
|         6 | Pooja       | pooja@email.com  |
|         7 | Aman        | aman@email.com   |
|         8 | Rahul Thapa | rahul@gmail.com  |
+-----------+-------------+------------------+
8 rows in set (0.017 sec)

mysql> SELECT * FROM Clubs;
+---------------+----------+------------+
| ClubName      | ClubRoom | ClubMentor |
+---------------+----------+------------+
| Coding Club   | lab1     | Mr. Anil   |
| Drama Club    | R303     | Mr. Kiran  |
| Music Club    | R101     | Mr. Raman  |
| Robotics Club | R404     | Mr. Bean   |
| Sports Club   | R202     | Ms. Sita   |
+---------------+----------+------------+
5 rows in set (0.001 sec)

mysql> SELECT * FROM Memberships;
+-----------+-------------+------------+
| StudentID | ClubName    | JoinDate   |
+-----------+-------------+------------+
|         1 | Music Club  | 2024-01-10 |
|         1 | Sports Club | 2024-01-15 |
|         2 | Drama Club  | 2024-01-25 |
|         2 | Sports Club | 2024-01-12 |
|         3 | Coding Club | 2024-01-28 |
|         3 | Music Club  | 2024-01-20 |
|         4 | Drama Club  | 2024-01-18 |
|         5 | Music Club  | 2024-01-22 |
|         6 | Sports Club | 2024-01-27 |
|         7 | Coding Club | 2024-01-30 |
+-----------+-------------+------------+
10 rows in set (0.003 sec)
```
### SQl Join Operation
```
mysql> SELECT
    ->   s.StudentName,
    ->   c.ClubName,
    ->   m.JoinDate
    -> FROM Memberships m
    -> JOIN Students s ON m.StudentID = s.StudentID
    -> JOIN Clubs c ON m.ClubName = c.ClubName
    -> ORDER BY s.StudentName, m.JoinDate;
+-------------+-------------+------------+
| StudentName | ClubName    | JoinDate   |
+-------------+-------------+------------+
| Aman        | Coding Club | 2024-01-30 |
| Asha        | Music Club  | 2024-01-10 |
| Asha        | Sports Club | 2024-01-15 |
| Bikash      | Sports Club | 2024-01-12 |
| Bikash      | Drama Club  | 2024-01-25 |
| Nisha       | Music Club  | 2024-01-20 |
| Nisha       | Coding Club | 2024-01-28 |
| Pooja       | Sports Club | 2024-01-27 |
| Rohan       | Drama Club  | 2024-01-18 |
| Suman       | Music Club  | 2024-01-22 |
+-------------+-------------+------------+
10 rows in set (0.031 sec)
```
