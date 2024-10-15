create or replace TABLE PROD_DNA_LOAD.ASPSDL_RAW.SDL_MDS_MDS_REDS_MARKET_MSL (
	NAME VARCHAR(500),
	CODE VARCHAR(500),
	SKU_UNIQUE_IDENTIFIER VARCHAR(200),
	UNIQUE_IDENTIFIER_MAPPING_CODE VARCHAR(500),
	SKU_DESCRIPTION VARCHAR(200),
	MARKET VARCHAR(200),
	REGION VARCHAR(200),
	ZONE VARCHAR(200),
	RETAIL_ENVIRONMENT_CODE VARCHAR(500),
	CHANNEL VARCHAR(500),
	SUB_CHANNEL VARCHAR(500),
	CUSTOMER VARCHAR(200),
	STORE_GRADE_CODE VARCHAR(500),
	START_DDMMYYYY TIMESTAMP_NTZ(9),
	END_DDMMYYYY TIMESTAMP_NTZ(9),
	SKU_CODE VARCHAR(200),
	PRODUCT_KEY VARCHAR(500),
	ACTIVE_STATUS_CODE VARCHAR(500),
	SOURCEEXISTENCEFLAG_CODE VARCHAR(500)
);