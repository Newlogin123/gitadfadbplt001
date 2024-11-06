create or replace TABLE DEV_DNA_CORE.INDEDW_INTEGRATION.EDW_PRODUCT_DIM_SYNC(
	JJ_SAP_PROD_ID VARCHAR(50),
	JJ_SAP_PROD_DESC VARCHAR(100),
	FRANCHISE VARCHAR(50),
	BRAND VARCHAR(50),
	VARIANT1 VARCHAR(50),
	VARIANT2 VARCHAR(50),
	VARIANT3 VARCHAR(50),
	STATUS VARCHAR(50),
	PUT_UP NUMBER(18,0),
	UOM NUMBER(18,0),
	JJ_SAP_UPGRD_PROD_ID VARCHAR(50),
	JJ_SAP_UPGRD_PROD_DESC VARCHAR(100),
	PRICE NUMBER(18,0),
	PROD_CLASS NUMBER(18,0),
	JJ_SAP_CD_MP_PROD_ID VARCHAR(50),
	JJ_SAP_CD_MP_PROD_DESC VARCHAR(100),
	PRICE_VMR NUMBER(18,0),
	PFT_SM VARCHAR(60),
	PFT_MM VARCHAR(60),
	PFT_WS VARCHAR(60),
	PFT_PROV VARCHAR(60),
	PFT_DS VARCHAR(60),
	PFT_MWS VARCHAR(60),
	PFT_APT VARCHAR(60),
	PFT_BS VARCHAR(60),
	PFT_CS VARCHAR(60),
	CRTD_DTTM TIMESTAMP_NTZ(9),
	UPTD_DTTM TIMESTAMP_NTZ(9),
	EFFECTIVE_FROM VARCHAR(10),
	EFFECTIVE_TO VARCHAR(10)
);