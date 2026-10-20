-- =============================================================================
-- AWS Database Foundations: Capstone Database Challenge Script
-- Infrastructure Base: Amazon RDS MySQL Instance (db.t3.micro / Private Network)
-- Client Interface: LinuxServer EC2 Instance Host via MariaDB/MySQL Client
-- =============================================================================

-- Establish database initialization context
CREATE DATABASE restart_challenge;
USE restart_challenge;


-- STEP 1: Engineering the RESTART Table Schema
CREATE TABLE RESTART (
    StudentID INT NOT NULL,
    StudentName VARCHAR(100) NOT NULL,
    RestartCity VARCHAR(100) NOT NULL,
    GraduationDate DATETIME NOT NULL,
    PRIMARY KEY (StudentID)
);

DESCRIBE RESTART;


-- STEP 2: Ingesting 10 Sample Rows into RESTART Table
INSERT INTO RESTART VALUES 
(101, 'Maria Nyaboke', 'Nairobi', '2026-12-15 10:00:00'),
(102, 'John Doe', 'Mombasa', '2026-12-15 10:00:00'),
(103, 'Alex Kamau', 'Nairobi', '2026-12-15 11:30:00'),
(104, 'Sarah Jenkins', 'Cape Town', '2026-12-16 09:00:00'),
(105, 'Michael Chang', 'Singapore', '2026-12-16 09:00:00'),
(106, 'Amina Yusuf', 'Mombasa', '2026-12-16 14:00:00'),
(107, 'David Kwesi', 'Accra', '2026-12-17 10:00:00'),
(108, 'Elena Rostova', 'London', '2026-12-17 11:00:00'),
(109, 'Carlos Santana', 'Madrid', '2026-12-18 09:00:00'),
(110, 'Fatima Al-Sayed', 'Dubai', '2026-12-18 15:00:00');


-- STEP 3: Selecting All Rows from RESTART

SELECT * FROM RESTART;


-- STEP 4: Engineering the CLOUD_PRACTITIONER Table Schema
CREATE TABLE CLOUD_PRACTITIONER (
    StudentID INT NOT NULL,
    CertificationDate DATETIME NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES RESTART(StudentID)
);


DESCRIBE CLOUD_PRACTITIONER;


-- STEP 5: Ingesting 5 Sample Rows into CLOUD_PRACTITIONER Table
INSERT INTO CLOUD_PRACTITIONER VALUES 
(101, '2026-10-01 14:22:00'),
(103, '2026-10-02 09:15:00'),
(105, '2026-10-02 16:45:00'),
(106, '2026-10-05 11:00:00'),
(110, '2026-10-09 13:30:00');


-- STEP 6: Selecting All Rows from CLOUD_PRACTITIONER

SELECT * FROM CLOUD_PRACTITIONER;


-- STEP 7: Performing the Relational Inner Join Operation
-- Requirement: Display StudentID, StudentName, and CertificationDate by joining tables on common ID attributes
SELECT 
    R.StudentID AS "Student ID",
    R.StudentName AS "Student Name",
    C.CertificationDate AS "AWS Certification Date"
FROM RESTART R
INNER JOIN CLOUD_PRACTITIONER C ON R.StudentID = C.StudentID;

