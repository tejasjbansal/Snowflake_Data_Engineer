
CREATE OR REPLACE DATABASE WORKSPACE_DB;

CREATE OR REPLACE SCHEMA WORKSPACESQL_SCHEMA;

CREATE OR REPLACE TABLE STUDENTS (
    STUDENT_ID        NUMBER(10,0),
    FIRST_NAME        VARCHAR(50), 
    LAST_NAME         VARCHAR(50), 
    EMAIL             VARCHAR(100),
    DATE_OF_BIRTH     DATE,        
    ENROLLMENT_DATE   DATE,        
    MAJOR             VARCHAR(100),
    IS_ACTIVE         BOOLEAN      
);

INSERT INTO STUDENTS VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '2000-05-15', '2024-01-10', 'Computer Science', TRUE),
(2, 'Emma', 'Watson', 'emma.watson@example.com', '1999-11-22', '2024-01-11', 'Data Engineering', TRUE),
(3, 'Liam', 'Brown', 'liam.brown@example.com', '2001-02-03', '2024-01-12', 'Mathematics', TRUE),
(4, 'Sophia', 'Patel', 'sophia.patel@example.com', '1998-09-17', '2024-01-13', 'Information Systems', FALSE),
(5, 'Ethan', 'Garcia', 'ethan.garcia@example.com', '2000-07-29', '2024-01-14', 'Business Analytics', TRUE);