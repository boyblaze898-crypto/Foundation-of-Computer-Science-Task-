## Normalization 
### General Definition 

## General Overview for Task 3 
## Learning Objective
## Task Requirements 
## Installation Guide 
## Start
### CREATE ORIGINAL TALBE 
```
mysql> CREATE TABLE Student ( Studentid INT AUTO_INCREMENT PRIMARY KEY, Studentname VARCHAR(100) NOT NULL, Email VARCHAR
(100) NOT NULL);
Query OK, 0 rows affected (0.045 sec)
```
## Result 
```
mysql> describe Student;
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| Studentid   | int          | NO   | PRI | NULL    | auto_increment |
| Studentname | varchar(100) | NO   |     | NULL    |                |
| Email       | varchar(100) | NO   |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
3 rows in set (0.006 sec)
```
### query to create db, table, insert date , show relust

