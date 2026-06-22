--SCALING UP

SHOW WAREHOUSES


CREATE OR REPLACE WAREHOUSE SCALE_LAB_WH
WITH 
WAREHOUSE_SIZE = 'XSMALL'  
AUTO_SUSPEND = 5
AUTO_RESUME = TRUE
INITIALLY_SUSPENDED = TRUE 
COMMENT = 'Create Date :1-Jan-2099, 
           Created by: Sujith Nair,
           Use-Case:Snowflake Scaling';


ALTER WAREHOUSE SCALE_LAB_WH SET WAREHOUSE_SIZE=XSMALL;
                                

SHOW WAREHOUSES



--SCALING OUT                                 

CREATE OR REPLACE WAREHOUSE SCALE_LAB_WH
WITH 
WAREHOUSE_SIZE = 'XSMALL'  
AUTO_SUSPEND = 5
AUTO_RESUME = TRUE
INITIALLY_SUSPENDED = TRUE 
MIN_CLUSTER_COUNT = 1
MAX_CLUSTER_COUNT = 5
COMMENT = 'Create Date :1-Jan-2099, 
           Created by: Sujith Nair,
           Use-Case:Snowflake Scaling';

ALTER WAREHOUSE SCALE_LAB_WH 
                        SET   
                            MIN_CLUSTER_COUNT = 2
                            MAX_CLUSTER_COUNT = 6
                            AUTO_SUSPEND = 5
                           

SHOW WAREHOUSES

















                    