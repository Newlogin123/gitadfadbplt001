create or replace TABLE PROD_DNA_CORE.INDITG_INTEGRATION.ITG_PILOT_NUP_TARGET_tmp (
	RTRUNIQUECODE VARCHAR(50),
	NUP_TARGET NUMBER(18,0),
	MTH_MM NUMBER(18,0)
);
	
	INSERT INTO PROD_DNA_CORE.INDITG_INTEGRATION.ITG_PILOT_NUP_TARGET_tmp
  (SELECT * FROM PROD_DNA_LOAD.INDSDL_RAW.ITG_PILOT_NUP_TARGET_tmp);