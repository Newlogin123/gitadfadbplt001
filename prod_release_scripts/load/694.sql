TRUNCATE TABLE PROD_DNA_LOAD.IDNSDL_RAW.SDL_MDS_ID_Distributor_Customer_Update_ADFTemp;
CALL PROD_DNA_LOAD.IDNSDL_RAW.MDSTEMPADLSDATALOAD('ID_Distributor_Customer_Update_ADFTemp','prd/sql_server/MDS/MDS_Adhoc/','PROD_LOAD_STAGE_ADLS_IDN');