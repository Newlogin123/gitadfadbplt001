DELETE FROM PROD_DNA_LOAD.META_RAW.PARAMETERS WHERE PARAMETER_ID=25009 AND PARAMETER_GROUP_ID=2001;
DELETE FROM PROD_DNA_LOAD.META_RAW.PARAMETERS WHERE PARAMETER_GROUP_ID in (2002,2003);

INSERT INTO PROD_DNA_LOAD.META_RAW.PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (25009,2001,'OTIFD_Data_Ingestion','map_names','N',FALSE,TRUE);

INSERT INTO PROD_DNA_LOAD.META_RAW.PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (25010,2002,'otif_etl_framework_ing','tempId','1',FALSE,TRUE);
INSERT INTO PROD_DNA_LOAD.META_RAW.PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (25011,2002,'otif_etl_framework_ing','jobId','9083',FALSE,TRUE);
INSERT INTO PROD_DNA_LOAD.META_RAW.PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (25012,2002,'otif_etl_framework_ing','accountId','99',FALSE,TRUE);
INSERT INTO PROD_DNA_LOAD.META_RAW.PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (25013,2002,'otif_etl_framework_ing','waitTime','20',FALSE,TRUE);
INSERT INTO PROD_DNA_LOAD.META_RAW.PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (25014,2002,'otif_etl_framework_ing','transformationType','ingestion',FALSE,TRUE);
INSERT INTO PROD_DNA_LOAD.META_RAW.PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (25015,2002,'otif_etl_framework_ing','container','asp',FALSE,TRUE);
INSERT INTO PROD_DNA_LOAD.META_RAW.PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (25016,2003,'otif_etl_framework_tran','tempId','1',FALSE,TRUE);
INSERT INTO PROD_DNA_LOAD.META_RAW.PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (25017,2003,'otif_etl_framework_tran','jobId','9116',FALSE,TRUE);
INSERT INTO PROD_DNA_LOAD.META_RAW.PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (25018,2003,'otif_etl_framework_tran','accountId','99',FALSE,TRUE);
INSERT INTO PROD_DNA_LOAD.META_RAW.PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (25019,2003,'otif_etl_framework_tran','waitTime','20',FALSE,TRUE);
INSERT INTO PROD_DNA_LOAD.META_RAW.PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (25020,2003,'otif_etl_framework_tran','transformationType','transformation',FALSE,TRUE);
INSERT INTO PROD_DNA_LOAD.META_RAW.PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (25021,2003,'otif_etl_framework_tran','container','asp',FALSE,TRUE);
  
 