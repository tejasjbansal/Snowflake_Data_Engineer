USE DATABASE HRMS;

USE SCHEMA ETL;


SELECT * FROM HRMS.HR.EMPLOYEES;


CREATE OR REPLACE FILE FORMAT HRMS.ETL.PARQUET_ETL_FILEFORMAT
TYPE = parquet;


CREATE OR REPLACE STAGE HRMS.ETL.AWS_ETL_PARQUET_STAGE_UNLOAD
STORAGE_INTEGRATION = AWS_S3_INT
URL = 's3://learn2cloud-snowflake/unloadingdata/parquetdata/'
FILE_FORMAT = PARQUET_ETL_FILEFORMAT



COPY INTO @AWS_ETL_PARQUET_STAGE_UNLOAD FROM (SELECT * FROM HRMS.HR.EMPLOYEES E1,HRMS.HR.EMPLOYEES E2,HRMS.HR.EMPLOYEES E3 ) 


COPY INTO @AWS_ETL_PARQUET_STAGE_UNLOAD FROM (SELECT    FIRST_NAME , 
                                                        LAST_NAME , 
                                                        EMAIL, 
                                                        PHONE_NUMBER ,                                                          
                                                        HIRE_DATE,
                                                        CAST(HIRE_DATE AS DATE) NEW_HIRE_DATE,
                                                        JOB_ID , 
                                                        SALARY
                                                FROM HRMS.HR.EMPLOYEES
                                                 ) 




