DROP TABLE PROD_DNA_LOAD.IDNSDL_RAW.SDL_MDS_ID_LAV_CUSTOMER_HIERARCHY;

CREATE OR REPLACE TABLE PROD_DNA_LOAD.IDNSDL_RAW.SDL_MDS_ID_LAV_CUSTOMER_HIERARCHY (ID NUMBER(10,0),
MUID VARCHAR(40),
VERSIONNAME VARCHAR(100),
VERSIONNUMBER NUMBER(10,0),
VERSION_ID NUMBER(10,0),
VERSIONFLAG VARCHAR(100),
NAME VARCHAR(500),
CODE VARCHAR(500),
CHANGETRACKINGMASK NUMBER(10,0),
DISTRIBUTOR_GROUP VARCHAR(20),
DISTRIBUTOR_ID VARCHAR(20),
CUSTOMER_ID VARCHAR(20),
CUSTOMER_NAME VARCHAR(50),
CITY VARCHAR(100),
AREA VARCHAR(50),
REGION VARCHAR(50),
BDM VARCHAR(50),
RBM VARCHAR(50),
STATUS VARCHAR(50),
LEAD_TIME VARCHAR(18),
PROV_ID VARCHAR(50),
EFFECTIVE_FROM VARCHAR(10),
EFFECTIVE_TO VARCHAR(10),
ENTERDATETIME TIMESTAMP_NTZ(9),
ENTERUSERNAME VARCHAR(200),
ENTERVERSIONNUMBER NUMBER(10,0),
LASTCHGDATETIME TIMESTAMP_NTZ(9),
LASTCHGUSERNAME VARCHAR(200),
LASTCHGVERSIONNUMBER NUMBER(10,0),
VALIDATIONSTATUS VARCHAR(500));