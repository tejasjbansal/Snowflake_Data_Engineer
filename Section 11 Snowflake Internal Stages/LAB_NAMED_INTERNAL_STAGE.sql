
========================================
'LAB1- Installing SnowSQL'
========================================
--Link to Download page
https://docs.snowflake.com/en/user-guide/snowsql-install-config


========================================
'LAB2 -Login to Snowflake using SnowSQL'
========================================


Syntax: snowSQL -a account_locator -u username 
Syntax: snowSQL -a csb35158        -u snair25

Password to be provided after hitting enter.

SHOW ACCOUNTS

SELECT CURRENT_ACCOUNT()


========================================
'LAB3 -named Internal Stage-PUT'
========================================

USE DATABASE HRMS;

USE SCHEMA ETL;


CREATE OR REPLACE FILE FORMAT HRMS.ETL.CSV_ETL_FILEFORMAT
TYPE = CSV
FIELD_DELIMITER = ','
SKIP_HEADER = 0
NULL_IF = ('Null','NULL')
FIELD_OPTIONALLY_ENCLOSED_BY = '"'        
TRIM_SPACE=TRUE
COMPRESSION=AUTO;


CREATE OR REPLACE STAGE INTERNAL_EMPLOYEES_STAGE
FILE_FORMAT = CSV_ETL_FILEFORMATUSE


LIST @INTERNAL_EMPLOYEES_STAGE

--4 CSV files are needed to be uploaded to Udemy

employees_part_001.csv
employees_part_002.csv
employees_part_003.csv
employees_part_004.csv


SnowSQL -o insure_mode=True -a CSB35158 -u snair25

USE DATABASE HRMS;

USE SCHEMA ETL;


PUT file:///Users/snair/Desktop/Internal_Stage_Files/employees_part_001.csv @INTERNAL_EMPLOYEES_STAGE;


LIST @INTERNAL_EMPLOYEES_STAGE;

PUT file:///Users/snair/Desktop/Internal_Stage_Files/employees_part_*.csv @INTERNAL_EMPLOYEES_STAGE;


PUT file:///Users/snair/Desktop/Internal_Stage_Files/employees_part_001.csv @INTERNAL_EMPLOYEES_STAGE/file_part_01;

LIST @INTERNAL_EMPLOYEES_STAGE;

================================================
'LAB-4-Named Internal Stage-GET'
================================================

LIST @INTERNAL_EMPLOYEES_STAGE;

GET @INTERNAL_EMPLOYEES_STAGE/employees_part_001.csv file:///Users/snair/Desktop/get_downloaded_files;

GET @INTERNAL_EMPLOYEES_STAGE file:///Users/snair/Desktop/get_downloaded_files;


================================================
'LAB-5-Named Internal Stage-REMOVE'
================================================

REMOVE @INTERNAL_EMPLOYEES_STAGE/employees_part_004.csv.gz;

LIST @INTERNAL_EMPLOYEES_STAGE;

REMOVE @INTERNAL_EMPLOYEES_STAGE/file_part_01/employees_part_001.csv.gz;

REMOVE @INTERNAL_EMPLOYEES_STAGE

LIST @INTERNAL_EMPLOYEES_STAGE;

snair25#COMPUTE_WH@HRMS.ETL>GET @INTERNAL_EMPLOYEES_STAGE file:///Users/snair/Desktop/get_downloaded_files PATTERN='.*' parallel=2;

??????????????????????????????????????????????????
'B-Roll-Remove-File-Parallel'--needs to be uploaded
===================================================



================================================
'LAB-6-UserStage'
================================================

LIST @~

PUT file:///Users/snair/Desktop/Internal_Stage_Files/employees_part_*.csv @~;

LIST @~

================================================
'LAB-7-TableStage'
================================================

USE DATABASE HRMS;

USE SCHEMA ETL;


CREATE OR REPLACE TABLE EMPLOYEES_TSTAGE 
(
    EMPLOYEE_ID     NUMBER(6),
    FIRST_NAME      VARCHAR(20),
    LAST_NAME       VARCHAR(25),
    EMAIL           VARCHAR(25),
    PHONE_NUMBER    VARCHAR(20),
    HIRE_DATE       VARCHAR(20),
    JOB_ID          VARCHAR(10),
    SALARY          NUMBER(8, 2),
    COMMISSION_PCT  VARCHAR(10),
    MANAGER_ID      NUMBER(6),
    DEPARTMENT_ID   NUMBER(4)
);

LIST @%EMPLOYEES_TSTAGE;


PUT file:///Users/snair/Desktop/Internal_Stage_Files/employees_part_001.csv @%EMPLOYEES_TSTAGE;


================================================
'LAB_8_COPY_INTERNAL_STAGE'
================================================

USE DATABASE HRMS;

USE SCHEMA ETL;

SHOW STAGES;

LIST @INTERNAL_EMPLOYEES_STAGE;

PUT file:///Users/snair/Desktop/Internal_Stage_Files/employees_part_*.csv @INTERNAL_EMPLOYEES_STAGE;


COPY INTO EMPLOYEES_TSTAGE FROM @INTERNAL_EMPLOYEES_STAGE
FILES=('employees_part_004.csv.gz')
PURGE=TRUE

SELECT * FROM EMPLOYEES_TSTAGE;


COPY INTO @INTERNAL_EMPLOYEES_STAGE/unloaded_internal FROM EMPLOYEES_TSTAGE;

LIST @INTERNAL_EMPLOYEES_STAGE;


B-Roll-GET
B-Roll-PUT
B-Roll-REMOVE
