create or replace TABLE PROD_DNA_CORE.INDITG_INTEGRATION.ITG_MT_TP_SPENDS (
	ACCOUNT_NAME VARCHAR(255),
	YEAR VARCHAR(20),
	MTHMM VARCHAR(20),
	ARTICLE_CODE VARCHAR(255),
	ARTICLE_DESC VARCHAR(255),
	CLAIM_AMNT NUMBER(38,6),
	SAP_CODE_JNTL VARCHAR(100),
	MOTHERSKUNAME VARCHAR(255),
	VOLUME NUMBER(38,6),
	FRANCHISE VARCHAR(255),
	REMARK VARCHAR(255),
	CRT_DTTM TIMESTAMP_NTZ(9),
	SOURCE_FILE_NAME VARCHAR(255),
	FILE_UPLOAD_DATE DATE,
	RUN_ID NUMBER(14,0)
);