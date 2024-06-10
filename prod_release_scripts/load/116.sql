update META_RAW.HISTORICAL_OBJ_METADATA
set ISACTIVE = FALSE;

update META_RAW.HISTORICAL_OBJ_METADATA
set ISACTIVE = TRUE
WHERE TARGET_SCHEMA IN ('THAITG_INTEGRATION','THASDL_RAW','THAWKS_INTEGRATION','THAEDW_INTEGRATION');

UPDATE META_RAW.HISTORICAL_OBJ_METADATA 
set ISACTIVE = TRUE  
WHERE ID IN (936,937,938,939,940,941,942,943,944,945,946);

INSERT INTO META_RAW.HISTORICAL_OBJ_METADATA (ID,SOURCE_SCHEMA,SOURCE_TABLE, TARGET_DB,TARGET_SCHEMA,TARGET_TABLE,STAGE_SCHEMA,ISACTIVE,MARKET,TYPE_OF_LOAD,PRIORITY) VALUES (1546,'OS_ITG','ITG_QUERY_PARAMETERS','PROD_DNA_CORE','THAITG_INTEGRATION','ITG_QUERY_PARAMETERS','UTILITY_RAW',TRUE,'OneSea','FULL_REFRESH',1);
