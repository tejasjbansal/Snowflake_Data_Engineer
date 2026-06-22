USE DATABASE HRMS;

USE SCHEMA ETL;

COPY INTO @AWS_ETL_CSV_STAGE_UNLOAD/emp_dept FROM( SELECT 
                                                        FIRST_NAME , 
                                                        LAST_NAME , 
                                                        CONCAT(FIRST_NAME,LAST_NAME) FULL_NAME,
                                                        TRIM(EMAIL) EMAIL , 
                                                        PHONE_NUMBER ,  
                                                        HIRE_DATE , 
                                                        JOB_ID , 
                                                        SALARY, 
                                                        DEPARTMENT_NAME 
                                                 FROM HRMS.HR.EMPLOYEES E, 
                                                      HRMS.HR.DEPARTMENTS D
                                                 WHERE E.DEPARTMENT_ID =D.DEPARTMENT_ID
                                                 )
HEADER =TRUE                                                 

CREATE OR REPLACE VIEW VIEW_EMP_DEPT_UNLOAD
AS
SELECT 
            FIRST_NAME , 
            LAST_NAME , 
            CONCAT(FIRST_NAME,LAST_NAME) FULL_NAME,
            TRIM(EMAIL) EMAIL , 
            PHONE_NUMBER ,  
            HIRE_DATE , 
            JOB_ID , 
            SALARY, 
            DEPARTMENT_NAME 
FROM HRMS.HR.EMPLOYEES E, HRMS.HR.DEPARTMENTS D
WHERE E.DEPARTMENT_ID =D.DEPARTMENT_ID


SELECT * FROM VIEW_EMP_DEPT_UNLOAD


COPY INTO @AWS_ETL_CSV_STAGE_UNLOAD/emp_dept_view FROM VIEW_EMP_DEPT_UNLOAD
OVERWRITE =TRUE

LIST @AWS_ETL_CSV_STAGE_UNLOAD
                                            
