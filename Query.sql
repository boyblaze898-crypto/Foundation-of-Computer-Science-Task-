-- CREATE DATABASE assignment_rohan_db;
Use assignment_rohan_db;


--  CREATE TABLE Student (
-- Studentid INT AUTO_INCREMENT PRIMARY KEY,
-- Studentname VARCHAR(100) NOT NULL,
-- Email VARCHAR(100) NOT NULL
--   );

-- INSERT INTO Student VALUES 
-- (1, 'Asha', 'asha@email.com'),
-- (2, 'Bikash', 'bikash@email.com'),
-- (3, 'Nisha','nisha@email.com'),
-- (4, 'Rohan', 'rohanemail.com'),
-- (5, 'Suman', 'suman@email.com'),
-- (6, 'Pooja', 'pooja@email.com'),
-- (7, 'Aman','aman@email.com ')


--  CREATE TABLE Club (
-- 	Clubname VARCHAR(100) NOT NULL PRIMARY KEY,
-- 	Clubroom VARCHAR(100) NOT NULL ,
--  	Clubmentor VARCHAR(100) NOT NULL
--     );

-- Insert into Club Values
-- ('Music Club','R101','Mr. Raman'),
-- ('Sports Club','R202','Ms. Sita'),
-- ('Drama Club','R303','Mr. Kiran'),
-- ('Coding Club','Lab1','Mr. Anil')

-- CREATE table membership (
-- Studentid INT,
-- FOREIGN KEY (Studentid) references Student(Studentid),
-- Clubname VARCHAR(100),
-- Foreign key (Clubname) references Club(Clubname),
-- Joindate VARCHAR(100) NOT NULL
-- );

-- Insert into membership Values
-- (1,'Music Club','1/10/2024'),
-- (1,'Sports Club','1/15/2024'),
-- (2,'Sports Club','1/12/2024'),
-- (2,'Drama Club','1/25/2024'),
-- (3,'Music Club','1/20/2024'),
-- (3,'Coding Club','1/28/2024'),
-- (4,'Drama Club','1/18/2024'),
-- (5,'Music Club','1/22/2024'),
-- (6,'Sports Club','1/27/2024'),
-- (7,'Coding Club','1/30/2024')



-- INSERT INTO Student VALUE
-- (8, 'Rahul', 'rahul@gmail.com');

-- INSERT INTO Club VALUES
-- ('Robotics Club', 'R404', 'Mr. Bean');



-- SELECT * FROM Student;
-- SELECT * FROM Club;








SELECT StudentName FROM Student;
SELECT ClubName FROM Club;
SELECT JoinDate FROM Membership;


-- SELECT Student.Studentid, Club.ClubName, Membership.JoinDate
-- FROM Membership
-- JOIN Student ON Membership.StudentID = Student.StudentID
-- JOIN Club ON Membership.ClubName = Club.ClubName;



































