UPDATE PROD_DNA_LOAD.META_RAW.PROCESS SET SNOWFLAKE_STAGE='VNMSDL_RAW.PROD_LOAD_STAGE_ADLS' WHERE parameter_group_id IN(438,452);
UPDATE PROD_DNA_LOAD.META_RAW.PROCESS SET SNOWFLAKE_STAGE='PCFSDL_RAWL_RAW.PROD_LOAD_STAGE_ADLS' WHERE parameter_group_id IN(1340,1341);