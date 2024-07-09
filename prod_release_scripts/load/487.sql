USE SCHEMA META_RAW;
INSERT INTO USECASE (USECASE_ID, USECASE_NAME,CATEGORY,USECASE_DESCRIPTION,IS_ACTIVE,SEQUENCE_ID) VALUES (160,'India_SSS_Scorecard_Ingestion','IN_SSS_Scorecard','SSS Scorecard Ingestion','TRUE',1);
INSERT INTO PROCESS VALUES (590,590,'India_SSS_Scorcard_ingestion',590,1,1,FALSE,TRUE,160,1,1,NULL,'','','','INDSDL_RAW.PROD_LOAD_STAGE_ADLS','','');

INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (7123,590,'India_SSS_Scorcard_ingestion_group','val_file_header','Program_Type|JNJ_ID|RS_ID|Outlet_Name|Region|Zone|Territory|City|Franchise|KPI|Quarter|Year|Reference/Target|Actual',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (7124,590,'India_SSS_Scorcard_ingestion_group','file_spec','sss_scorecard_data',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (7125,590,'India_SSS_Scorcard_ingestion_group','val_file_name','sss_scorecard_data',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (7126,590,'India_SSS_Scorcard_ingestion_group','val_file_extn','xlsx',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (7127,590,'India_SSS_Scorcard_ingestion_group','load_method','sp',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (7128,590,'India_SSS_Scorcard_ingestion_group','sp_name','INDSDL_RAW.IN_SSS_SCORECARD_DATA_PREPROCESSING',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (7129,590,'India_SSS_Scorcard_ingestion_group','sheet_index','0',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (7130,590,'India_SSS_Scorcard_ingestion_group','folder_path','sss_scorecard',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (7131,590,'India_SSS_Scorcard_ingestion_group','target_table','sdl_sss_scorecard_data',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (7132,590,'India_SSS_Scorcard_ingestion_group','container','ind',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (7133,590,'India_SSS_Scorcard_ingestion_group','target_schema','INDSDL_RAW',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (7134,590,'India_SSS_Scorcard_ingestion_group','validation','36892',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (7135,590,'India_SSS_Scorcard_ingestion_group','index','last',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (7136,590,'India_SSS_Scorcard_ingestion_group','source_extn','xlsx',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (7137,590,'India_SSS_Scorcard_ingestion_group','file_header_row_num','0',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (7138,590,'India_SSS_Scorcard_ingestion_group','is_truncate','Y',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (7139,590,'India_SSS_Scorcard_ingestion_group','startRange','A1',FALSE,TRUE);

INSERT INTO PROCESS VALUES (1079,1079,'j_in_sku_recom_etl_framework_ing',1079,1,1,FALSE,TRUE,258,1,1,NULL,'','','','INDSDL_RAW.PROD_LOAD_STAGE_ADLS','','');
INSERT INTO USECASE (USECASE_ID, USECASE_NAME,CATEGORY,USECASE_DESCRIPTION,IS_ACTIVE,SEQUENCE_ID) VALUES (258,'SKU_RECOMMENDATION_LOAD','IN_SKU_RECOMMENDATION','processing of SKU Recommendation file','TRUE',1);

INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (13288,1079,'j_in_sku_recom_etl_framework_ing','trigger_mail','Y',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (13289,1079,'j_in_sku_recom_etl_framework_ing','business_mail_trigger','Y',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (13290,1079,'j_in_sku_recom_etl_framework_ing','val_file_header','PRODUCT|OUTLET|DISTRIBUTOR|OOS_FLAG|MS_FLAG|CS_FLAG|SOQ|URCCode|CsrtrCode|RT_Code|SM_Code',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (13291,1079,'j_in_sku_recom_etl_framework_ing','file_spec','SKURecommendation',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (13292,1079,'j_in_sku_recom_etl_framework_ing','val_file_name','SKURecommendation',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (13293,1079,'j_in_sku_recom_etl_framework_ing','val_file_extn','CSV',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (13294,1079,'j_in_sku_recom_etl_framework_ing','load_method','sp',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (13295,1079,'j_in_sku_recom_etl_framework_ing','sp_name','INDSDL_RAW.IN_SKU_RECOM_FLAG_PREPROCESSING',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (13296,1079,'j_in_sku_recom_etl_framework_ing','folder_path','sku_recommender',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (13297,1079,'j_in_sku_recom_etl_framework_ing','target_table','SDL_SKU_RECOM_FLAG',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (13298,1079,'j_in_sku_recom_etl_framework_ing','container','ind',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (13299,1079,'j_in_sku_recom_etl_framework_ing','target_schema','INDSDL_RAW',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (13300,1079,'j_in_sku_recom_etl_framework_ing','validation','1-1-1',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (13301,1079,'j_in_sku_recom_etl_framework_ing','index','first',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (13302,1079,'j_in_sku_recom_etl_framework_ing','source_extn','CSV',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (13303,1079,'j_in_sku_recom_etl_framework_ing','file_header_row_num','0',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (13304,1079,'j_in_sku_recom_etl_framework_ing','is_truncate','Y',FALSE,TRUE);

INSERT INTO PROCESS VALUES (1316,1316,'m_sdl_rdssize',1316,1,1,FALSE,TRUE,250,1,1,NULL,'','','','INDSDL_RAW.PROD_LOAD_STAGE_ADLS','','');
INSERT INTO PROCESS VALUES (1353,1353,'m_sdl_ittarget',1353,1,1,FALSE,TRUE,250,1,1,NULL,'','','','INDSDL_RAW.PROD_LOAD_STAGE_ADLS','','','');
INSERT INTO PROCESS VALUES (1354,1354,'sdl_csl_rdssmweeklytarget_output',1354,1,1,FALSE,TRUE,250,5,1,NULL,'','','','INDSDL_RAW.PROD_LOAD_STAGE_ADLS','','');
INSERT INTO PROCESS VALUES (1355,1355,'sdl_csl_scheme_header',1355,1,1,FALSE,TRUE,250,5,1,NULL,'','','','INDSDL_RAW.PROD_LOAD_STAGE_ADLS','','');

INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15720,1353,'m_sdl_ittarget_group','trigger_mail','Y',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15721,1353,'m_sdl_ittarget_group','business_mail_trigger','Y',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15722,1353,'m_sdl_ittarget_group','val_file_header','Lakshya Territory Name,Target Variant,Jan-16,Feb-16,Mar-16,Apr-16,May-16,Jun-16,Jul-16,Aug-16,Sep-16,Oct-16,Nov-16,Dec-16, YTD 16 ',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15723,1353,'m_sdl_ittarget_group','file_spec','IT Target',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15724,1353,'m_sdl_ittarget_group','val_file_name','it_target',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15725,1353,'m_sdl_ittarget_group','val_file_extn','xlsx',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15726,1353,'m_sdl_ittarget_group','load_method','sp',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15727,1353,'m_sdl_ittarget_group','sp_name','INDSDL_RAW.M_SDL_ITTARGET_PREPROCESSING',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15728,1353,'m_sdl_ittarget_group','sheet_index','0',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15729,1353,'m_sdl_ittarget_group','folder_path','master_target',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15730,1353,'m_sdl_ittarget_group','target_table','sdl_ittarget',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15731,1353,'m_sdl_ittarget_group','container','ind',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15732,1353,'m_sdl_ittarget_group','target_schema','INDSDL_RAW',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15733,1353,'m_sdl_ittarget_group','validation','0-0-0',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15734,1353,'m_sdl_ittarget_group','index','full',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15735,1353,'m_sdl_ittarget_group','source_extn','xlsx',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15736,1353,'m_sdl_ittarget_group','file_header_row_num','0',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15737,1353,'m_sdl_ittarget_group','is_truncate','Y',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15738,1353,'m_sdl_ittarget_group','start_range','A1',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15224,1316,'m_sdl_rdssize_group','trigger_mail','Y',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15225,1316,'m_sdl_rdssize_group','business_mail_trigger','Y',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15226,1316,'m_sdl_rdssize_group','val_file_header','RDSCODE,RDSSIZE',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15227,1316,'m_sdl_rdssize_group','file_spec','RDS Size',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15228,1316,'m_sdl_rdssize_group','val_file_name','rds_size',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15229,1316,'m_sdl_rdssize_group','val_file_extn','xlsx',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15230,1316,'m_sdl_rdssize_group','load_method','sp',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15231,1316,'m_sdl_rdssize_group','sp_name','INDSDL_RAW.M_SDL_RDSSIZE_PREPROCESSING',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15232,1316,'m_sdl_rdssize_group','sheet_index','0',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15233,1316,'m_sdl_rdssize_group','folder_path','master_customer',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15234,1316,'m_sdl_rdssize_group','target_table','sdl_rdssize',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15235,1316,'m_sdl_rdssize_group','container','ind',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15236,1316,'m_sdl_rdssize_group','target_schema','INDSDL_RAW',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15237,1316,'m_sdl_rdssize_group','validation','0-0-0',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15238,1316,'m_sdl_rdssize_group','index','full',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15239,1316,'m_sdl_rdssize_group','source_extn','xlsx',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15240,1316,'m_sdl_rdssize_group','file_header_row_num','0',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15241,1316,'m_sdl_rdssize_group','is_truncate','Y',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15242,1316,'m_sdl_rdssize_group','start_range','A1',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15739,1354,'sdl_csl_rdssmweeklytarget_output_group','container','ind',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15740,1354,'sdl_csl_rdssmweeklytarget_output_group','landing_file_path','india_xdm/master/rdssmweeklytarget_output/rdssmweeklytarget_output',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15741,1354,'sdl_csl_rdssmweeklytarget_output_group','landing_file_name','rdssmweeklytarget_output',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15742,1354,'sdl_csl_rdssmweeklytarget_output_group','target_table','sdl_csl_rdssmweeklytarget_output',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15743,1354,'sdl_csl_rdssmweeklytarget_output_group','target_schema','INDSDL_RAW',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15744,1354,'sdl_csl_rdssmweeklytarget_output_group','ms_query','SELECT csngjnjreport.rrdssmweeklytarget_output.DistCode,
       csngjnjreport.rrdssmweeklytarget_output.TargetRefNo,
       csngjnjreport.rrdssmweeklytarget_output.TargetDate,
       csngjnjreport.rrdssmweeklytarget_output.SMCode,
       csngjnjreport.rrdssmweeklytarget_output.SMName,
       csngjnjreport.rrdssmweeklytarget_output.RMCode,
       csngjnjreport.rrdssmweeklytarget_output.RMName,
       csngjnjreport.rrdssmweeklytarget_output.TargetYear,
       csngjnjreport.rrdssmweeklytarget_output.TargetMonth,
       csngjnjreport.rrdssmweeklytarget_output.TargetValue,
       csngjnjreport.rrdssmweeklytarget_output.TargetName,
       csngjnjreport.rrdssmweeklytarget_output.WEEK1,
       csngjnjreport.rrdssmweeklytarget_output.WEEK2,
       csngjnjreport.rrdssmweeklytarget_output.WEEK3,
       csngjnjreport.rrdssmweeklytarget_output.WEEK4,
       csngjnjreport.rrdssmweeklytarget_output.WEEK5,
       csngjnjreport.rrdssmweeklytarget_output.TargetStatus,
       csngjnjreport.rrdssmweeklytarget_output.TargetType,
       csngjnjreport.rrdssmweeklytarget_output.DownloadStatus,
       csngjnjreport.rrdssmweeklytarget_output.Createddate,
       csngjnjreport.rrdssmweeklytarget_output.CreatedDt
FROM csngjnjreport.rrdssmweeklytarget_output;',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15745,1354,'sdl_csl_rdssmweeklytarget_output_group','truncate_and_load','Y',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15746,1354,'sdl_csl_rdssmweeklytarget_output_group','decide_source','mysql_server_csngjnjreport',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15747,1354,'sdl_csl_rdssmweeklytarget_output_group','load_method','sp',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15748,1354,'sdl_csl_rdssmweeklytarget_output_group','sp_name','INDSDL_RAW.SDL_CSL_RDSSMWEEKLYTARGET_OUTPUT_PREPROCESSING',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15749,1355,'sdl_csl_scheme_header_group','container','ind',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15750,1355,'sdl_csl_scheme_header_group','landing_file_path','india_xdm/master/scheme_header/scheme_header',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15751,1355,'sdl_csl_scheme_header_group','landing_file_name','scheme_header',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15752,1355,'sdl_csl_scheme_header_group','target_table','sdl_csl_scheme_header',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15753,1355,'sdl_csl_scheme_header_group','target_schema','INDSDL_RAW',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15754,1355,'sdl_csl_scheme_header_group','ms_query','SELECT csngjnjreport.rschememaster.CmpCode,
       csngjnjreport.rschememaster.SchemeCode,
       csngjnjreport.rschememaster.CmpSchemeCode,
       csngjnjreport.rschememaster.SchemeName,
       csngjnjreport.rschememaster.SchemeBase,
       csngjnjreport.rschememaster.SchemeType,
       csngjnjreport.rschememaster.SchemeStartDt,
       csngjnjreport.rschememaster.SchemeEndDt,
       csngjnjreport.rschememaster.PayOutCount,
       csngjnjreport.rschememaster.PayOutType,
       csngjnjreport.rschememaster.PayoutFrequency,
       csngjnjreport.rschememaster.IsOpen,
       csngjnjreport.rschememaster.IsClaimable,
       csngjnjreport.rschememaster.ClaimableOn,
       csngjnjreport.rschememaster.ClaimGroup,
       csngjnjreport.rschememaster.IsCombi,
       csngjnjreport.rschememaster.IsFlexi,
       csngjnjreport.rschememaster.FlexiType,
       csngjnjreport.rschememaster.UseProrata,
       csngjnjreport.rschememaster.BudgetType,
       csngjnjreport.rschememaster.TotalBudget,
       csngjnjreport.rschememaster.RetailerCap,
       csngjnjreport.rschememaster.InvoiceCap,
       csngjnjreport.rschememaster.UnCheckScheme,
       csngjnjreport.rschememaster.ModUserCode,
       csngjnjreport.rschememaster.ModDt,
       csngjnjreport.rschememaster.CreatedDt
FROM csngjnjreport.rschememaster ;',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15755,1355,'sdl_csl_scheme_header_group','truncate_and_load','Y',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15756,1355,'sdl_csl_scheme_header_group','decide_source','mysql_server_csngjnjreport',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15757,1355,'sdl_csl_scheme_header_group','load_method','sp',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (15758,1355,'sdl_csl_scheme_header_group','sp_name','INDSDL_RAW.SDL_CSL_SCHEME_HEADER_PREPROCESSING',FALSE,TRUE);


create or replace TABLE PROD_DNA_LOAD.NTASDL_RAW.SDL_POP6_S3_PHOTOS (
	FILENAME VARCHAR(255),
	PATH VARCHAR(255)
);

delete from meta_raw.historical_obj_metadata
where id in(3681,3682);
INSERT INTO META_RAW.HISTORICAL_OBJ_METADATA (ID,SOURCE_SCHEMA,SOURCE_TABLE, TARGET_DB,TARGET_SCHEMA,TARGET_TABLE,STAGE_SCHEMA,ISACTIVE,MARKET,TYPE_OF_LOAD,PRIORITY) VALUES (3683,'NA_SDL','SDL_POP6_S3_PHOTOS','PROD_DNA_LOAD','NTASDL_RAW','SDL_POP6_S3_PHOTOS','META_RAW',TRUE,'NORTH_ASIA','FULL_REFRESH',3);
INSERT INTO META_RAW.HISTORICAL_OBJ_METADATA (ID,SOURCE_SCHEMA,SOURCE_TABLE, TARGET_DB,TARGET_SCHEMA,TARGET_TABLE,STAGE_SCHEMA,ISACTIVE,MARKET,TYPE_OF_LOAD,PRIORITY) VALUES (3684,'RG_SDL','SDL_MYSLS_CUST_BASE','PROD_DNA_LOAD','NTASDL_RAW','SDL_MYSLS_CUST_BASE','META_RAW',TRUE,'NORTH_ASIA','FULL_REFRESH',3);
INSERT INTO META_RAW.HISTORICAL_OBJ_METADATA (ID,SOURCE_SCHEMA,SOURCE_TABLE, TARGET_DB,TARGET_SCHEMA,TARGET_TABLE,STAGE_SCHEMA,ISACTIVE,MARKET,TYPE_OF_LOAD,PRIORITY) VALUES (3685,'RG_SDL','SDL_MYSLS_CUST_HIER','PROD_DNA_LOAD','NTASDL_RAW','SDL_MYSLS_CUST_HIER','META_RAW',TRUE,'NORTH_ASIA','FULL_REFRESH',3);
INSERT INTO META_RAW.HISTORICAL_OBJ_METADATA (ID,SOURCE_SCHEMA,SOURCE_TABLE, TARGET_DB,TARGET_SCHEMA,TARGET_TABLE,STAGE_SCHEMA,ISACTIVE,MARKET,TYPE_OF_LOAD,PRIORITY) VALUES (3686,'RG_SDL','SDL_MYSALES_PROD_TRANS','PROD_DNA_LOAD','NTASDL_RAW','SDL_MYSALES_PROD_TRANS','META_RAW',TRUE,'NORTH_ASIA','FULL_REFRESH',3);
INSERT INTO META_RAW.HISTORICAL_OBJ_METADATA (ID,SOURCE_SCHEMA,SOURCE_TABLE, TARGET_DB,TARGET_SCHEMA,TARGET_TABLE,STAGE_SCHEMA,ISACTIVE,MARKET,TYPE_OF_LOAD,PRIORITY) VALUES (3687,'RG_SDL','SDL_MYSLS_PROD_BASE','PROD_DNA_LOAD','NTASDL_RAW','SDL_MYSLS_PROD_BASE','META_RAW',TRUE,'NORTH_ASIA','FULL_REFRESH',3);
INSERT INTO META_RAW.HISTORICAL_OBJ_METADATA (ID,SOURCE_SCHEMA,SOURCE_TABLE, TARGET_DB,TARGET_SCHEMA,TARGET_TABLE,STAGE_SCHEMA,ISACTIVE,MARKET,TYPE_OF_LOAD,PRIORITY) VALUES (3688,'RG_SDL','SDL_MYSLS_PROD_HIER','PROD_DNA_LOAD','NTASDL_RAW','SDL_MYSLS_PROD_HIER','META_RAW',TRUE,'NORTH_ASIA','FULL_REFRESH',3);
INSERT INTO META_RAW.HISTORICAL_OBJ_METADATA (ID,SOURCE_SCHEMA,SOURCE_TABLE, TARGET_DB,TARGET_SCHEMA,TARGET_TABLE,STAGE_SCHEMA,ISACTIVE,MARKET,TYPE_OF_LOAD,PRIORITY) VALUES (3681,'JP_ITG','ITG_MDS_JP_PS_WEIGHTS','PROD_DNA_CORE','JPNITG_INTEGRATION','ITG_MDS_JP_PS_WEIGHTS','UTILITY_RAW',TRUE,'Japan','FULL_REFRESH',4);
INSERT INTO META_RAW.HISTORICAL_OBJ_METADATA (ID,SOURCE_SCHEMA,SOURCE_TABLE, TARGET_DB,TARGET_SCHEMA,TARGET_TABLE,STAGE_SCHEMA,ISACTIVE,MARKET,TYPE_OF_LOAD,PRIORITY) VALUES (3682,'JP_ITG','ITG_MDS_JP_PS_TARGETS','PROD_DNA_CORE','JPNITG_INTEGRATION','ITG_MDS_JP_PS_TARGETS','UTILITY_RAW',TRUE,'Japan','FULL_REFRESH',4);


