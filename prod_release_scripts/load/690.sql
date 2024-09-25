CREATE OR REPLACE PROCEDURE PROD_DNA_LOAD.IDNSDL_RAW.MDSTEMPADLSDATALOAD (TableName VARCHAR(250), FilePath VARCHAR(250), StageName VARCHAR(100) )
RETURNS integer
LANGUAGE SQL
AS
$$
DECLARE
db VARCHAR DEFAULT 'PROD_DNA_LOAD';
SchemaName VARCHAR(150) DEFAULT 'IDNSDL_RAW';

TargetTableName VARCHAR(250) DEFAULT concat('SDL_MDS_',TableName);
query VARCHAR DEFAULT 
'
COPY INTO '||db||'.'||SchemaName||'.'||TargetTableName||'
FROM (
	SELECT *
	FROM ''@'||StageName||'''
)
FILES = ('''||FilePath||TableName||'.csv'') 
file_format= (TYPE=CSV,FIELD_DELIMITER="",RECORD_DELIMITER="\r\n",SKIP_HEADER=1)
ON_ERROR=ABORT_STATEMENT ;';

table_path string;
rowcount int;

BEGIN

    EXECUTE IMMEDIATE query;
    
    table_path := :DB || '.' || :SchemaName || '.' || :TargetTableName;
    SELECT COUNT(*) INTO :rowcount  FROM identifier(:table_path); 
    
RETURN :rowcount;
END;
$$;

CREATE OR REPLACE TABLE PROD_DNA_LOAD.IDNSDL_RAW.SDL_MDS_ID_DISTRIBUTOR_CUSTOMER_UPDATE_ADFTEMP (ID NUMBER(10,0), MUID VARCHAR(40), VERSIONNAME VARCHAR(100), VERSIONNUMBER NUMBER(10,0), VERSION_ID NUMBER(10,0), VERSIONFLAG VARCHAR(100), NAME VARCHAR(500), CODE VARCHAR(500), CHANGETRACKINGMASK NUMBER(10,0), KEY_OUTLET VARCHAR(200), SALES_OFFICE_ID_JNJ VARCHAR(200), SALES_OFFICE VARCHAR(400), CUST_ID VARCHAR(200), CUST_NAME VARCHAR(400), ADDRESS VARCHAR(600), CITY VARCHAR(200), CUST_GROUP1 VARCHAR(400), CHANNEL VARCHAR(200), OUTLET_TYPE VARCHAR(200), CHANNEL_GROUP1 VARCHAR(200), JJID VARCHAR(200), POSTAL_CODE VARCHAR(200), CUST_ID_MAP VARCHAR(200), CUST_NAME_MAP VARCHAR(400), CHANNEL_GROUP2 VARCHAR(200), CREATE_DATE TIMESTAMP_NTZ(9), CUST_GROUP2 VARCHAR(400), EFFECTIVE_FROM VARCHAR(12), EFFECTIVE_TO VARCHAR(12), ADDITIONAL_INFORMATION_1_CODE VARCHAR(500), ADDITIONAL_INFORMATION_1_NAME VARCHAR(500), ADDITIONAL_INFORMATION_1_ID NUMBER(10,0), ADDITIONAL_INFORMATION_2_CODE VARCHAR(500), ADDITIONAL_INFORMATION_2_NAME VARCHAR(500), ADDITIONAL_INFORMATION_2_ID NUMBER(10,0), ADDITIONAL_INFORMATION_3_CODE VARCHAR(500), ADDITIONAL_INFORMATION_3_NAME VARCHAR(500), ADDITIONAL_INFORMATION_3_ID NUMBER(10,0), ENTERDATETIME TIMESTAMP_NTZ(9), ENTERUSERNAME VARCHAR(200), ENTERVERSIONNUMBER NUMBER(10,0), LASTCHGDATETIME TIMESTAMP_NTZ(9), LASTCHGUSERNAME VARCHAR(200), LASTCHGVERSIONNUMBER NUMBER(10,0), VALIDATIONSTATUS VARCHAR(500));
CREATE OR REPLACE TABLE PROD_DNA_LOAD.IDNSDL_RAW.SDL_MDS_ID_5PS_STORE_MAPPING_ADFTEMP (ID NUMBER(10,0), MUID VARCHAR(40), VERSIONNAME VARCHAR(100), VERSIONNUMBER NUMBER(10,0), VERSION_ID NUMBER(10,0), VERSIONFLAG VARCHAR(100), NAME VARCHAR(500), CODE VARCHAR(500), CHANGETRACKINGMASK NUMBER(10,0), JNJID VARCHAR(200), ACCOUNT VARCHAR(200), DISTRIBUTOR_ID VARCHAR(200), DISTRIBUTOR_NAME VARCHAR(200), REGION VARCHAR(200), AREA VARCHAR(200), CITY VARCHAR(200), ADDRESS VARCHAR(2000), TIERING VARCHAR(200), ENTERDATETIME TIMESTAMP_NTZ(9), ENTERUSERNAME VARCHAR(200), ENTERVERSIONNUMBER NUMBER(10,0), LASTCHGDATETIME TIMESTAMP_NTZ(9), LASTCHGUSERNAME VARCHAR(200), LASTCHGVERSIONNUMBER NUMBER(10,0), VALIDATIONSTATUS VARCHAR(500));
CREATE OR REPLACE TABLE PROD_DNA_LOAD.IDNSDL_RAW.SDL_MDS_ID_REF_CHANNEL_ADFTEMP (ID NUMBER(10,0), MUID VARCHAR(40), VERSIONNAME VARCHAR(100), VERSIONNUMBER NUMBER(10,0), VERSION_ID NUMBER(10,0), VERSIONFLAG VARCHAR(100), NAME VARCHAR(500), CODE VARCHAR(500), CHANGETRACKINGMASK NUMBER(10,0), ENTERDATETIME TIMESTAMP_NTZ(9), ENTERUSERNAME VARCHAR(200), ENTERVERSIONNUMBER NUMBER(10,0), LASTCHGDATETIME TIMESTAMP_NTZ(9), LASTCHGUSERNAME VARCHAR(200), LASTCHGVERSIONNUMBER NUMBER(10,0), VALIDATIONSTATUS VARCHAR(500));
CREATE OR REPLACE TABLE PROD_DNA_LOAD.IDNSDL_RAW.SDL_MDS_ID_REF_MAPPING_CHANNEL_ADFTEMP (ID NUMBER(10,0), MUID VARCHAR(40), VERSIONNAME VARCHAR(100), VERSIONNUMBER NUMBER(10,0), VERSION_ID NUMBER(10,0), VERSIONFLAG VARCHAR(100), NAME VARCHAR(500), CODE VARCHAR(500), CHANGETRACKINGMASK NUMBER(10,0), DIST_GROUP VARCHAR(200), TYPE_DIST_ID VARCHAR(200), TYPE_DIST VARCHAR(200), TYPE_JNJ VARCHAR(200), TYPE_JNJ_ID VARCHAR(200), EFFECTIVE_FROM VARCHAR(12), EFFECTIVE_TO VARCHAR(12), ENTERDATETIME TIMESTAMP_NTZ(9), ENTERUSERNAME VARCHAR(200), ENTERVERSIONNUMBER NUMBER(10,0), LASTCHGDATETIME TIMESTAMP_NTZ(9), LASTCHGUSERNAME VARCHAR(200), LASTCHGVERSIONNUMBER NUMBER(10,0), VALIDATIONSTATUS VARCHAR(500));
CREATE OR REPLACE TABLE PROD_DNA_LOAD.IDNSDL_RAW.SDL_MDS_ID_REF_RETAIL_ENVIRONMENT_ADFTEMP (ID NUMBER(10,0), MUID VARCHAR(40), VERSIONNAME VARCHAR(100), VERSIONNUMBER NUMBER(10,0), VERSION_ID NUMBER(10,0), VERSIONFLAG VARCHAR(100), NAME VARCHAR(500), CODE VARCHAR(500), CHANGETRACKINGMASK NUMBER(10,0), ENTERDATETIME TIMESTAMP_NTZ(9), ENTERUSERNAME VARCHAR(200), ENTERVERSIONNUMBER NUMBER(10,0), LASTCHGDATETIME TIMESTAMP_NTZ(9), LASTCHGUSERNAME VARCHAR(200), LASTCHGVERSIONNUMBER NUMBER(10,0), VALIDATIONSTATUS VARCHAR(500));
CREATE OR REPLACE TABLE PROD_DNA_LOAD.IDNSDL_RAW.SDL_MDS_ID_REF_SUB_CHANNEL_ADFTEMP (ID NUMBER(10,0), MUID VARCHAR(40), VERSIONNAME VARCHAR(100), VERSIONNUMBER NUMBER(10,0), VERSION_ID NUMBER(10,0), VERSIONFLAG VARCHAR(100), NAME VARCHAR(500), CODE VARCHAR(500), CHANGETRACKINGMASK NUMBER(10,0), ENTERDATETIME TIMESTAMP_NTZ(9), ENTERUSERNAME VARCHAR(200), ENTERVERSIONNUMBER NUMBER(10,0), LASTCHGDATETIME TIMESTAMP_NTZ(9), LASTCHGUSERNAME VARCHAR(200), LASTCHGVERSIONNUMBER NUMBER(10,0), VALIDATIONSTATUS VARCHAR(500));
CREATE OR REPLACE TABLE PROD_DNA_LOAD.IDNSDL_RAW.SDL_MDS_ID_REF_TYPE_OUTLET_ADFTEMP (ID NUMBER(10,0), MUID VARCHAR(40), VERSIONNAME VARCHAR(100), VERSIONNUMBER NUMBER(10,0), VERSION_ID NUMBER(10,0), VERSIONFLAG VARCHAR(100), NAME VARCHAR(500), CODE VARCHAR(500), CHANGETRACKINGMASK NUMBER(10,0), CHANNEL VARCHAR(200), TYPE_OUTLET VARCHAR(200), ENTERDATETIME TIMESTAMP_NTZ(9), ENTERUSERNAME VARCHAR(200), ENTERVERSIONNUMBER NUMBER(10,0), LASTCHGDATETIME TIMESTAMP_NTZ(9), LASTCHGUSERNAME VARCHAR(200), LASTCHGVERSIONNUMBER NUMBER(10,0), VALIDATIONSTATUS VARCHAR(500));
CREATE OR REPLACE TABLE PROD_DNA_LOAD.IDNSDL_RAW.SDL_MDS_ID_TARGET_SCORECARD_MAO_ADFTEMP (ID NUMBER(10,0), MUID VARCHAR(40), VERSIONNAME VARCHAR(100), VERSIONNUMBER NUMBER(10,0), VERSION_ID NUMBER(10,0), VERSIONFLAG VARCHAR(100), NAME VARCHAR(500), CODE VARCHAR(500), CHANGETRACKINGMASK NUMBER(10,0), "DISTRIBUTOR CODE" VARCHAR(200), MONTH VARCHAR(200), "TARGET MAO" VARCHAR(200), "TARGET MAO AVG" VARCHAR(200), YEAR VARCHAR(200), CHANNEL VARCHAR(200), ENTERDATETIME TIMESTAMP_NTZ(9), ENTERUSERNAME VARCHAR(200), ENTERVERSIONNUMBER NUMBER(10,0), LASTCHGDATETIME TIMESTAMP_NTZ(9), LASTCHGUSERNAME VARCHAR(200), LASTCHGVERSIONNUMBER NUMBER(10,0), VALIDATIONSTATUS VARCHAR(500));
CREATE OR REPLACE TABLE PROD_DNA_LOAD.IDNSDL_RAW.SDL_MDS_ID_TARGET_SCORECARD_TDP_DIST_ADFTEMP (ID NUMBER(10,0), MUID VARCHAR(40), VERSIONNAME VARCHAR(100), VERSIONNUMBER NUMBER(10,0), VERSION_ID NUMBER(10,0), VERSIONFLAG VARCHAR(100), NAME VARCHAR(500), CODE VARCHAR(500), CHANGETRACKINGMASK NUMBER(10,0), "KODE DISTRIBUTOR" VARCHAR(200), CHANNEL VARCHAR(200), "SUB CHANNEL" VARCHAR(200), MONTH VARCHAR(200), "100 TDP" VARCHAR(200), "TARGET TDP" VARCHAR(200), "TARGET TDP AVG" VARCHAR(200), YEAR VARCHAR(200), ENTERDATETIME TIMESTAMP_NTZ(9), ENTERUSERNAME VARCHAR(200), ENTERVERSIONNUMBER NUMBER(10,0), LASTCHGDATETIME TIMESTAMP_NTZ(9), LASTCHGUSERNAME VARCHAR(200), LASTCHGVERSIONNUMBER NUMBER(10,0), VALIDATIONSTATUS VARCHAR(500));
CREATE OR REPLACE TABLE PROD_DNA_LOAD.IDNSDL_RAW.SDL_MDS_ID_TARGET_SCORECARD_TDP_REGION_ADFTEMP (ID NUMBER(10,0), MUID VARCHAR(40), VERSIONNAME VARCHAR(100), VERSIONNUMBER NUMBER(10,0), VERSION_ID NUMBER(10,0), VERSIONFLAG VARCHAR(100), NAME VARCHAR(500), CODE VARCHAR(500), CHANGETRACKINGMASK NUMBER(10,0), REGION VARCHAR(200), CHANNEL VARCHAR(200), "SUB CHANNEL" VARCHAR(200), MONTH VARCHAR(200), "TARGET REGION" VARCHAR(200), "100 TDP" VARCHAR(200), "TARGET REGION AVG" VARCHAR(200), YEAR VARCHAR(200), ENTERDATETIME TIMESTAMP_NTZ(9), ENTERUSERNAME VARCHAR(200), ENTERVERSIONNUMBER NUMBER(10,0), LASTCHGDATETIME TIMESTAMP_NTZ(9), LASTCHGUSERNAME VARCHAR(200), LASTCHGVERSIONNUMBER NUMBER(10,0), VALIDATIONSTATUS VARCHAR(500));
CREATE OR REPLACE TABLE PROD_DNA_LOAD.IDNSDL_RAW.SDL_MDS_ID_TARGET_SCORECARD_SELLOUT_ADFTEMP (ID NUMBER(10,0), MUID VARCHAR(40), VERSIONNAME VARCHAR(100), VERSIONNUMBER NUMBER(10,0), VERSION_ID NUMBER(10,0), VERSIONFLAG VARCHAR(100), NAME VARCHAR(500), CODE VARCHAR(500), CHANGETRACKINGMASK NUMBER(10,0), "BUSINESS UNIT" VARCHAR(200), REGION VARCHAR(200), DISTRIBUTOR VARCHAR(200), "DIST CODE" VARCHAR(200), FRANCHISE VARCHAR(200), CHANNEL VARCHAR(200), BRAND VARCHAR(200), "SALES TYPE" VARCHAR(200), "DIST GROUP" VARCHAR(200), YEAR VARCHAR(200), "1" VARCHAR(200), "2" VARCHAR(200), "3" VARCHAR(200), "4" VARCHAR(200), "5" VARCHAR(200), "6" VARCHAR(200), "7" VARCHAR(200), "8" VARCHAR(200), "9" VARCHAR(200), "10" VARCHAR(200), "11" VARCHAR(200), "12" VARCHAR(200), ENTERDATETIME TIMESTAMP_NTZ(9), ENTERUSERNAME VARCHAR(200), ENTERVERSIONNUMBER NUMBER(10,0), LASTCHGDATETIME TIMESTAMP_NTZ(9), LASTCHGUSERNAME VARCHAR(200), LASTCHGVERSIONNUMBER NUMBER(10,0), VALIDATIONSTATUS VARCHAR(500));
CREATE OR REPLACE TABLE PROD_DNA_LOAD.IDNSDL_RAW.SDL_MDS_ID_LAV_MCS_LIST_ADFTEMP (ID NUMBER(10,0), MUID VARCHAR(40), VERSIONNAME VARCHAR(100), VERSIONNUMBER NUMBER(10,0), VERSION_ID NUMBER(10,0), VERSIONFLAG VARCHAR(100), NAME VARCHAR(500), CODE VARCHAR(500), CHANGETRACKINGMASK NUMBER(10,0), TIERING VARCHAR(200), SKU VARCHAR(300), YEAR VARCHAR(200), JANUARY VARCHAR(200), FEBRUARY VARCHAR(200), MARCH VARCHAR(200), APRIL VARCHAR(200), MAY VARCHAR(200), JUNE VARCHAR(200), JULY VARCHAR(200), AUGUST VARCHAR(200), SEPTEMBER VARCHAR(200), OCTOBER VARCHAR(200), NOVEMBER VARCHAR(200), DECEMBER VARCHAR(200), ENTERDATETIME TIMESTAMP_NTZ(9), ENTERUSERNAME VARCHAR(200), ENTERVERSIONNUMBER NUMBER(10,0), LASTCHGDATETIME TIMESTAMP_NTZ(9), LASTCHGUSERNAME VARCHAR(200), LASTCHGVERSIONNUMBER NUMBER(10,0), VALIDATIONSTATUS VARCHAR(500));
CREATE OR REPLACE TABLE PROD_DNA_LOAD.IDNSDL_RAW.SDL_MDS_ID_PS_MSL_ADFTEMP (ID NUMBER(10,0), MUID VARCHAR(40), VERSIONNAME VARCHAR(100), VERSIONNUMBER NUMBER(10,0), VERSION_ID NUMBER(10,0), VERSIONFLAG VARCHAR(100), NAME VARCHAR(500), CODE VARCHAR(500), CHANGETRACKINGMASK NUMBER(10,0), BRAND VARCHAR(100), SUB_BRAND VARCHAR(100), SKU_VARIANT VARCHAR(200), SKU VARCHAR(200), CUST_GROUP VARCHAR(100), CHANNEL_GROUP VARCHAR(100), CHANNEL VARCHAR(100), QTY_MIN NUMBER(38,0), IDENTIFIER VARCHAR(100), FILE_NAME VARCHAR(200), ENTERDATETIME TIMESTAMP_NTZ(9), ENTERUSERNAME VARCHAR(200), ENTERVERSIONNUMBER NUMBER(10,0), LASTCHGDATETIME TIMESTAMP_NTZ(9), LASTCHGUSERNAME VARCHAR(200), LASTCHGVERSIONNUMBER NUMBER(10,0), VALIDATIONSTATUS VARCHAR(500));
CREATE OR REPLACE TABLE PROD_DNA_LOAD.IDNSDL_RAW.SDL_MDS_ID_RE_MSL_ADFTEMP (ID NUMBER(10,0), MUID VARCHAR(40), VERSIONNAME VARCHAR(100), VERSIONNUMBER NUMBER(10,0), VERSION_ID NUMBER(10,0), VERSIONFLAG VARCHAR(100), NAME VARCHAR(500), CODE VARCHAR(500), CHANGETRACKINGMASK NUMBER(10,0), SKU_UNIQUE_IDENTIFIER VARCHAR(200), UNIQUE_IDENTIFIER_MAPPING_CODE VARCHAR(500), UNIQUE_IDENTIFIER_MAPPING_NAME VARCHAR(500), UNIQUE_IDENTIFIER_MAPPING_ID NUMBER(10,0), SKU_DESCRIPTION VARCHAR(200), MARKET VARCHAR(200), REGION VARCHAR(200), ZONE VARCHAR(200), RETAIL_ENVIRONMENT_CODE VARCHAR(500), RETAIL_ENVIRONMENT_NAME VARCHAR(500), RETAIL_ENVIRONMENT_ID NUMBER(10,0), CHANNEL_CODE VARCHAR(500), CHANNEL_NAME VARCHAR(500), CHANNEL_ID NUMBER(10,0), SUB_CHANNEL_CODE VARCHAR(500), SUB_CHANNEL_NAME VARCHAR(500), SUB_CHANNEL_ID NUMBER(10,0), CUSTOMER VARCHAR(200), STORE_GRADE_CODE VARCHAR(500), STORE_GRADE_NAME VARCHAR(500), STORE_GRADE_ID NUMBER(10,0), START_DDMMYYYY TIMESTAMP_NTZ(9), END_DDMMYYYY TIMESTAMP_NTZ(9), SKU_CODE VARCHAR(200), PRODUCT_KEY VARCHAR(200), ACTIVE_STATUS_CODE VARCHAR(500), ACTIVE_STATUS_NAME VARCHAR(500), ACTIVE_STATUS_ID NUMBER(10,0), SOURCEEXISTENCEFLAG_CODE VARCHAR(500), SOURCEEXISTENCEFLAG_NAME VARCHAR(500), SOURCEEXISTENCEFLAG_ID NUMBER(10,0), ENTERDATETIME TIMESTAMP_NTZ(9), ENTERUSERNAME VARCHAR(200), ENTERVERSIONNUMBER NUMBER(10,0), LASTCHGDATETIME TIMESTAMP_NTZ(9), LASTCHGUSERNAME VARCHAR(200), LASTCHGVERSIONNUMBER NUMBER(10,0), VALIDATIONSTATUS VARCHAR(500));
