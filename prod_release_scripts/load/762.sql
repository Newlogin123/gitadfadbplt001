create or replace TABLE PROD_DNA_LOAD.IDNSDL_RAW.SDL_DISTRIBUTOR_CUSTOMER_DIM_ADFTEMP (
	KEY_OUTLET VARCHAR(100),
	JJ_SAP_DSTRBTR_ID VARCHAR(50),
	JJ_SAP_DSTRBTR_NM VARCHAR(100),
	CUST_ID VARCHAR(100),
	CUST_NM VARCHAR(100),
	ADDRESS VARCHAR(500),
	CITY VARCHAR(100),
	CUST_GRP VARCHAR(100),
	CHNL VARCHAR(100),
	OUTLET_TYPE VARCHAR(100),
	CHNL_GRP VARCHAR(100),
	JJID VARCHAR(100),
	PST_CD VARCHAR(100),
	CUST_ID_MAP VARCHAR(100),
	CUST_NM_MAP VARCHAR(100),
	CHNL_GRP2 VARCHAR(100),
	CUST_CRTD_DT VARCHAR(50),
	CUST_GRP2 VARCHAR(100),
	CRTD_DTTM VARCHAR(50),
	UPDT_DTTM VARCHAR(50),
	FILE_NAME VARCHAR(255)
);

call IDNSDL_RAW.ID_SERVER_DATA_CUSTOMERMASTER_PREPROCESSING(['Customer_1.csv','IDNSDL_RAW.PROD_LOAD_STAGE_ADLS_IDN','prd/test/alteryx/transaction/customermaster/','SDL_DISTRIBUTOR_CUSTOMER_DIM_ADFTEMP']);
