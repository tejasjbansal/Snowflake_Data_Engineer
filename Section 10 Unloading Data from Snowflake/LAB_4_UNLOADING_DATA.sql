USE DATABASE HRMS;

USE SCHEMA ETL;

COPY INTO @AWS_ETL_CSV_STAGE_UNLOAD/emp_dept_partition_by_dept FROM(
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
                                                                FROM HRMS.HR.EMPLOYEES E, 
                                                                     HRMS.HR.DEPARTMENTS D
                                                                WHERE E.DEPARTMENT_ID =D.DEPARTMENT_ID
                                                                 )
PARTITION BY  DEPARTMENT_NAME     
HEADER =TRUE
                                         

SELECT DISTINCT DEPARTMENT_NAME FROM HRMS.HR.DEPARTMENTS;

COPY INTO @AWS_ETL_CSV_STAGE_UNLOAD/emp_dept_partition_by_HIRE_YEAR FROM(SELECT 
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
                                                 WHERE E.DEPARTMENT_ID =D.DEPARTMENT_ID)

PARTITION BY YEAR(HIRE_DATE)
HEADER =TRUE

SELECT YEAR(HIRE_DATE) FROM HR.EMPLOYEES
            

SELECT * FROM VIEW_EMP_DEPT_UNLOAD


COPY INTO @AWS_ETL_CSV_STAGE_UNLOAD/emp_dept_view FROM VIEW_EMP_DEPT_UNLOAD
OVERWRITE =TRUE

LIST @AWS_ETL_CSV_STAGE_UNLOAD/emp_dept*
                                            
