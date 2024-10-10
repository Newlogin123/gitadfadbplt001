delete from  meta_raw.process where PARAMETER_GROUP_ID in (2186,2187) and PROCESS_NAME like '%rir_data_test%';


insert into meta_raw.process (PROCESS_ID,PARAMETER_GROUP_ID,PROCESS_NAME,PIPELINE_TYPE_ID,GROUP_ID,SEQUENCE_ID,IS_INCREMENTAL,IS_ACTIVE,USECASE_ID,SOURCE_ID,PHASE_ID,SCRIPT_GROUP_ID,SOURCE_CDC_COLUMN,SOURCE_CDC_DATATYPE,SNOWFLAKE_CDC_COLUMN,SNOWFLAKE_STAGE,SNOWFLAKE_FILE_FORMAT,PHASE_TYPE,DEPENDS_ON)
values 
(2188,2186,'pop6_th_trans_rir_data_test_sftp',2186,1,1,'false','true',319,4,1,null,'','','','','','',''),
(2187,2187,'pop6_th_rir_data_test_lists',2187,1,2,'false','true',319,1,1,null,'','','','THASDL_RAW.PROD_LOAD_STAGE_ADLS','','','');