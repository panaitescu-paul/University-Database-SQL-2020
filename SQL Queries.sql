
--######################################################################--
--#                                                                    #--
--#          SQL Queries for University Database [10.AUG.2020]         #--
--#                                                                    #--
--######################################################################--


-- ------------------------------------------------
-- Create Schema and Tables
-- ------------------------------------------------

CREATE SCHEMA University;

-- ------------------------------------------------
USE University;
CREATE TABLE College (
    name CHAR(50),
    main_office CHAR(50),
    phone CHAR(12),
    dean CHAR(50),
    PRIMARY KEY (name)
);

-- ------------------------------------------------
USE University;
CREATE TABLE Department (
    name CHAR(50),
	code_number INT(11),
    main_office CHAR(50),
    phone CHAR(50),
    chairman CHAR(50),
    chairman_start_date DATE,
    PRIMARY KEY (code_number)
);

-- ------------------------------------------------
USE University;
CREATE TABLE Course (
    name CHAR(50),
	code_number INT(11),
    level INT(1),
    credit_hours INT(5),
    description CHAR(100),
    PRIMARY KEY (code_number)
);

-- ------------------------------------------------
USE University;
CREATE TABLE Instructor (
    id INT,
    name CHAR(50),
    office CHAR(50),
    phone CHAR(50),
    inst_rank CHAR(50),
    department_code INT,
    PRIMARY KEY (id),
    FOREIGN KEY (department_code) REFERENCES Department(code_number)
);

-- ------------------------------------------------
USE University;
CREATE TABLE Student (
    id INT,
	name CHAR(50),
    first_name CHAR(50),
    middle_name CHAR(50),
    last_name CHAR(50),
    address CHAR(50),
    phone CHAR(50),
    major_code CHAR(50),
    birth_date DATE,
    department_code INT,
    PRIMARY KEY (id),
    FOREIGN KEY (department_code) REFERENCES Department(code_number)
);

-- ------------------------------------------------
USE University;
CREATE TABLE Classroom (
    id INT,
	building_code INT,
    room_number INT,
    PRIMARY KEY (id)
);

-- ------------------------------------------------
USE University;
CREATE TABLE Section (
    id INT,
    course_code INT,
    instructor_id INT,
    number INT,
    semester CHAR(50),
    year INT,
    classroom_id INT,
    days_times CHAR(50),
    PRIMARY KEY (id),
    FOREIGN KEY (course_code) REFERENCES Course(code_number),
    FOREIGN KEY (instructor_id) REFERENCES Instructor(id),
    FOREIGN KEY (classroom_id) REFERENCES Classroom(id)
);

-- ------------------------------------------------
USE University;
CREATE TABLE College_Department (
    college_name CHAR(50),
	department_code INT,
    FOREIGN KEY (college_name) REFERENCES College(name),
    FOREIGN KEY (department_code) REFERENCES Department(code_number)
);

-- ------------------------------------------------
USE University;
CREATE TABLE Level (
    id INT,
	level_name CHAR(10),
    PRIMARY KEY (id)
);

-- ------------------------------------------------
USE University;
CREATE TABLE Student_Section (
    section_id INT,
    student_id INT,
	student_grade CHAR(4),
    FOREIGN KEY (section_id) REFERENCES Section(id),
    FOREIGN KEY (student_id) REFERENCES Student(id)
);

-- ------------------------------------------------
-- Make fields UNIQUE 
-- ------------------------------------------------

USE University;
ALTER TABLE College
ADD UNIQUE (name);

-- ------------------------------------------------
USE University;
ALTER TABLE Department
ADD UNIQUE (name);

-- ------------------------------------------------
USE University;
ALTER TABLE Course
ADD FOREIGN KEY (level) REFERENCES Level(id);

-- ------------------------------------------------
USE University;
ALTER TABLE Course
ADD UNIQUE (name);

-- ------------------------------------------------
-- Add Referential Integrity
-- ------------------------------------------------

ALTER TABLE Course 
	DROP FOREIGN KEY course_ibfk_1;
    
ALTER TABLE Course
ADD CONSTRAINT course_ibfk_1 FOREIGN KEY (level)
	REFERENCES level (id)
	ON UPDATE CASCADE
	ON DELETE SET NULL;

-- ------------------------------------------------
ALTER TABLE Instructor 
	DROP FOREIGN KEY instructor_ibfk_1;
    
ALTER TABLE Instructor
ADD CONSTRAINT instructor_ibfk_1 FOREIGN KEY (department_code)
	REFERENCES Department (code_number)
	ON UPDATE CASCADE
	ON DELETE SET NULL;

-- ------------------------------------------------
ALTER TABLE Student 
	DROP FOREIGN KEY student_ibfk_1;
    
ALTER TABLE Student
ADD CONSTRAINT student_ibfk_1 FOREIGN KEY (department_code)
	REFERENCES Department (code_number)
	ON UPDATE CASCADE
	ON DELETE SET NULL;

-- ------------------------------------------------
ALTER TABLE Section 
	DROP FOREIGN KEY section_ibfk_1;
    
ALTER TABLE Section
ADD CONSTRAINT section_ibfk_1 FOREIGN KEY (course_code)
	REFERENCES Course (code_number)
	ON UPDATE CASCADE
	ON DELETE SET NULL;

-- ------------------------------------------------
ALTER TABLE Section 
	DROP FOREIGN KEY section_ibfk_2;
    
ALTER TABLE Section
ADD CONSTRAINT section_ibfk_2 FOREIGN KEY (instructor_id)
	REFERENCES Instructor (id)
	ON UPDATE CASCADE
	ON DELETE SET NULL;

-- ------------------------------------------------
ALTER TABLE Section 
	DROP FOREIGN KEY section_ibfk_3;
    
ALTER TABLE Section
ADD CONSTRAINT section_ibfk_3 FOREIGN KEY (classroom_id)
	REFERENCES Classroom (id)
	ON UPDATE CASCADE
	ON DELETE SET NULL;

-- ------------------------------------------------
ALTER TABLE College_Department 
	DROP FOREIGN KEY college_department_ibfk_1;
    
ALTER TABLE College_Department
ADD CONSTRAINT college_department_ibfk_1 FOREIGN KEY (college_name)
	REFERENCES College (name)
	ON UPDATE CASCADE
	ON DELETE SET NULL;

-- ------------------------------------------------
ALTER TABLE College_Department 
	DROP FOREIGN KEY college_department_ibfk_2;
    
ALTER TABLE College_Department
ADD CONSTRAINT college_department_ibfk_2 FOREIGN KEY (department_code)
	REFERENCES Department (code_number)
	ON UPDATE CASCADE
	ON DELETE SET NULL;

-- ------------------------------------------------
ALTER TABLE Student_Section 
	DROP FOREIGN KEY student_section_ibfk_1;
    
ALTER TABLE Student_Section
ADD CONSTRAINT student_section_ibfk_1 FOREIGN KEY (section_id)
	REFERENCES Section (id)
	ON UPDATE CASCADE
	ON DELETE SET NULL;

-- ------------------------------------------------
ALTER TABLE Student_Section 
	DROP FOREIGN KEY student_section_ibfk_2;
    
ALTER TABLE Student_Section
ADD CONSTRAINT student_section_ibfk_2 FOREIGN KEY (student_id)
	REFERENCES Student (id)
	ON UPDATE CASCADE
	ON DELETE SET NULL;

-- ------------------------------------------------
-- Create Users
-- ------------------------------------------------

CREATE USER 'paul1'@'%' IDENTIFIED BY 'password';
CREATE USER 'constantin1'@'%' IDENTIFIED BY 'password';
CREATE USER 'marius1'@'%' IDENTIFIED BY 'password';

-- ------------------------------------------------
GRANT ALL ON *.* TO 'paul1'@'%' WITH GRANT OPTION;
GRANT SELECT ON *.* TO 'constantin1'@'%' WITH GRANT OPTION;
GRANT UPDATE, DELETE ON *.* TO 'marius1'@'%' WITH GRANT OPTION;

-- ------------------------------------------------
SHOW GRANTS for 'paul1'@'%';
SHOW GRANTS for 'constantin1'@'%';
SHOW GRANTS for 'marius1'@'%';
SELECT * FROM mysql.user;

-- ------------------------------------------------
-- Create View
-- ------------------------------------------------

USE University;
CREATE VIEW User_role_information AS
	SELECT User, Select_priv, Insert_priv, Update_priv, Delete_priv, Create_priv 
		FROM mysql.user
		WHERE Select_priv = 'Y' OR Insert_priv = 'Y' OR Update_priv = 'Y' OR Delete_priv = 'Y' OR Create_priv = 'Y'; 

-- ------------------------------------------------
-- Populate Tables
-- ------------------------------------------------

USE University;
INSERT INTO Classroom (id, building_code, room_number) VALUES ('1', '1001', '1');
INSERT INTO Classroom (id, building_code, room_number) VALUES ('2', '1002', '16');
INSERT INTO Classroom (id, building_code, room_number) VALUES ('3', '1003', '17');
INSERT INTO Classroom (id, building_code, room_number) VALUES ('4', '1004', '24');
INSERT INTO Classroom (id, building_code, room_number) VALUES ('5', '1005', '36');

-- ------------------------------------------------
USE University;
INSERT INTO College (name, main_office, phone, dean) VALUES ('Kea1', 'L37', '123456789', 'Jesper N');
INSERT INTO College (name, main_office, phone, dean) VALUES ('Kea2', 'L38', '123456788', 'Maria I');
INSERT INTO College (name, main_office, phone, dean) VALUES ('Kea3', 'L16', '123456787', 'Christian L');
INSERT INTO College (name, main_office, phone, dean) VALUES ('Kea4', 'L98', '123456786', 'Christoffer K');
INSERT INTO College (name, main_office, phone, dean) VALUES ('Kea5', 'L101', '123456781', 'Peter D');

-- ------------------------------------------------
USE University;
INSERT INTO Level (id, level_name) VALUES ('1', 'Freshman');
INSERT INTO Level (id, level_name) VALUES ('2', 'Sophomore');
INSERT INTO Level (id, level_name) VALUES ('3', 'Junior');
INSERT INTO Level (id, level_name) VALUES ('4', 'Senior');
INSERT INTO Level (id, level_name) VALUES ('5', 'MS');
INSERT INTO Level (id, level_name) VALUES ('6', 'PhD');

-- ------------------------------------------------
USE University;
INSERT INTO Course (name, code_number, level, credit_hours, description) VALUES ('Databases', '1234', '4', '30', 'description 1');
INSERT INTO Course (name, code_number, level, credit_hours, description) VALUES ('Testing', '1235', '4', '15', 'description 2');
INSERT INTO Course (name, code_number, level, credit_hours, description) VALUES ('Microservices', '1236', '4', '10', 'description 3');
INSERT INTO Course (name, code_number, level, credit_hours, description) VALUES ('Android Game', '1237', '3', '15', 'description 4');
INSERT INTO Course (name, code_number, level, credit_hours, description) VALUES ('Python', '1238', '3', '10', 'description 5');

-- ------------------------------------------------
USE University;
INSERT INTO Department (name, code_number, main_office, phone, chairman, chairman_start_date) VALUES ('Computer Science', '5678', 'Lygten', '123456789', 'Jakob P', '2015-06-11');
INSERT INTO Department (name, code_number, main_office, phone, chairman, chairman_start_date) VALUES ('Software Development', '1678', 'GBG', '123456783', 'Martin M', '2007-10-20');
INSERT INTO Department (name, code_number, main_office, phone, chairman, chairman_start_date) VALUES ('Web Development', '2678', 'GBG', '123456786', 'Daniel E', '2009-12-30');
INSERT INTO Department (name, code_number, main_office, phone, chairman, chairman_start_date) VALUES ('IT Security', '3678', 'GBG', '123456781', 'Mark T', '2008-02-08');
INSERT INTO Department (name, code_number, main_office, phone, chairman, chairman_start_date) VALUES ('Datamatiker', '4678', 'Lygten', '123456788', 'Thomas S', '2019-07-10');

-- ------------------------------------------------
USE University;
INSERT INTO College_Department (college_name, department_code) VALUES ('Kea1', '1678');
INSERT INTO College_Department (college_name, department_code) VALUES ('Kea2', '2678');
INSERT INTO College_Department (college_name, department_code) VALUES ('Kea3', '3678');
INSERT INTO College_Department (college_name, department_code) VALUES ('Kea1', '4678');
INSERT INTO College_Department (college_name, department_code) VALUES ('Kea1', '5678');

-- ------------------------------------------------
USE University;
INSERT INTO Instructor (id, name, office, phone, inst_rank, department_code) VALUES ('007', 'Andrea Corradini', 'Norrebro', '123456789', '1', '1678');
INSERT INTO Instructor (id, name, office, phone, inst_rank, department_code) VALUES ('012', 'Arturo M', 'Norrebro', '123456787', '2', '2678');
INSERT INTO Instructor (id, name, office, phone, inst_rank, department_code) VALUES ('067', 'Christian K', 'Norrebro', '123456784', '3', '4678');
INSERT INTO Instructor (id, name, office, phone, inst_rank, department_code) VALUES ('031', 'Kristoffer Mikklas', 'Norrebro', '123456782', '2', '2678');
INSERT INTO Instructor (id, name, office, phone, inst_rank, department_code) VALUES ('090', 'Jon', 'Norrebro', '123456781', '5', '1678');

-- ------------------------------------------------
USE University;
INSERT INTO Section (id, course_code, instructor_id, number, semester, year, classroom_id, days_times) VALUES ('1', '1234', '7', '10', '1', '2020', '5', 'TuWeTh 9:00 AM - 12:00 AM');
INSERT INTO Section (id, course_code, instructor_id, number, semester, year, classroom_id, days_times) VALUES ('2', '1235', '31', '11', '2', '2018', '1', 'MoTuFr 9:00 AM - 14:00 AM');
INSERT INTO Section (id, course_code, instructor_id, number, semester, year, classroom_id, days_times) VALUES ('3', '1236', '12', '12', '3', '2016', '3', 'TuWeTh 9:00 AM - 10:00 AM');
INSERT INTO Section (id, course_code, instructor_id, number, semester, year, classroom_id, days_times) VALUES ('4', '1237', '67', '13', '4', '2018', '4', 'MoTuFr 9:00 AM - 14:00 AM');
INSERT INTO Section (id, course_code, instructor_id, number, semester, year, classroom_id, days_times) VALUES ('5', '1238', '90', '14', '5', '2019', '1', 'TuWeTh 9:00 AM - 12:00 AM');

-- ------------------------------------------------
USE University;
INSERT INTO Student (id, name, first_name, middle_name, last_name, address, phone, major_code, birth_date, department_code) VALUES ('1', 'Paul Panaitescu', 'Paul', NULL, 'Panaitescu', 'Albertslund', '087654321', '1111', '1900-10-20', '1678');
INSERT INTO Student (id, name, first_name, middle_name, last_name, address, phone, major_code, birth_date, department_code) VALUES ('2',  'Constantin Razvan Tarau', 'Constantin', 'Razvan', 'Tarau', 'Albertslund', '287654321', '1112', '1800-10-20', '1678');
INSERT INTO Student (id, name, first_name, middle_name, last_name, address, phone, major_code, birth_date, department_code) VALUES ('3',  'Marius Daniel Munteanu', 'Marius', 'Daniel', 'Munteanu', 'Albertslund', '387654321', '1113', '2000-10-20', '2678');
INSERT INTO Student (id, name, first_name, middle_name, last_name, address, phone, major_code, birth_date, department_code) VALUES ('4', 'Jakob M',  'Jakob', NULL, 'M', 'Norrrebro', '587654321', '1198', '2015-10-20', '2678');
INSERT INTO Student (id, name, first_name, middle_name, last_name, address, phone, major_code, birth_date, department_code) VALUES ('5',  'Dragos Andrei Mocanasu', 'Dragos', 'Andrei', 'Mocanasu', 'Valby', '787654321', '2113', '2100-01-20', '4678');

-- ------------------------------------------------
USE University;
INSERT INTO Student_Section (section_id, student_id, student_grade) VALUES ('1', '1', '12');
INSERT INTO Student_Section (section_id, student_id, student_grade) VALUES ('1', '2', '12');
INSERT INTO Student_Section (section_id, student_id, student_grade) VALUES ('1', '3', '12');
INSERT INTO Student_Section (section_id, student_id, student_grade) VALUES ('2', '1', '4');
INSERT INTO Student_Section (section_id, student_id, student_grade) VALUES ('4', '1', '10');

-- ------------------------------------------------
