CREATE DATABASE IF NOT EXISTS HRMS;

CREATE EXTERNAL TABLE HRMS.AWS_ATHENA_EMPLOYEES(
  EMPLOYEE_ID           BIGINT, 
  FIRST_NAME            STRING, 
  LAST_NAME             STRING, 
  EMAIL                 STRING, 
  PHONE_NUMBER          STRING, 
  HIRE_DATE             STRING, 
  JOB_ID                STRING, 
  SALARY                DOUBLE, 
  COMMISSION_PCT        DOUBLE, 
  MANAGER_ID            BIGINT, 
  DEPARTMENT_ID         BIGINT
  )
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://learn2cloud-iceberg/employees/';
  
  
SELECT * FROM   HRMS.AWS_ATHENA_EMPLOYEES;



CREATE TABLE HRMS.AWS_ICEBERG_EMPLOYEES
(
  EMPLOYEE_ID           BIGINT, 
  FIRST_NAME            string, 
  LAST_NAME             string, 
  EMAIL                 string, 
  PHONE_NUMBER          string, 
  HIRE_DATE             string, 
  JOB_ID                string, 
  SALARY                DOUBLE, 
  COMMISSION_PCT        DOUBLE, 
  MANAGER_ID            BIGINT, 
  DEPARTMENT_ID         BIGINT
  )
 PARTITIONED BY (department_id) 
 LOCATION 's3://learn2cloud-iceberg/employees_iceberg'
 tblproperties
 ( 
 'TABLE_TYPE'='ICEBERG',
 'FORMAT' ='parquet'
  )


SELECT * FROM   HRMS.AWS_ICEBERG_EMPLOYEES;

INSERT INTO HRMS.AWS_ICEBERG_EMPLOYEES
SELECT * FROM HRMS.AWS_ATHENA_EMPLOYEES;

SELECT COUNT(*) FROM HRMS.AWS_ICEBERG_EMPLOYEES;