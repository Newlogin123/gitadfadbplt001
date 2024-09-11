use schema meta_raw;

INSERT INTO USECASE (USECASE_ID, USECASE_NAME,CATEGORY,USECASE_DESCRIPTION,IS_ACTIVE,SEQUENCE_ID) VALUES (361,'hcp_master_dbt','HCP360_IN_Ventasys_Load','hcp_master_edw_dbt_jobs','TRUE',2);
INSERT INTO USECASE (USECASE_ID, USECASE_NAME,CATEGORY,USECASE_DESCRIPTION,IS_ACTIVE,SEQUENCE_ID) VALUES (357,'in_hcp360_iqvia_kpi_datamart','in_hcp360_iqvia_kpi_datamart','in_hcp360_iqvia_kpi_datamart_desc','TRUE',1);


INSERT INTO PROCESS VALUES (1865,1865,'in_ga360_dbt_tran',1865,1,1,FALSE,TRUE,310,NULL,2,NULL,'','','','','','');
INSERT INTO PROCESS VALUES (1866,1866,'in_hcp_mastering_dbt_tran',1866,1,1,FALSE,TRUE,361,NULL,2,NULL,'','','','','','');
INSERT INTO PROCESS VALUES (1867,1867,'in_hcp360_call_fact_dbt_tran',1867,1,3,FALSE,TRUE,361,NULL,2,NULL,'','','','','','');
INSERT INTO PROCESS VALUES (1868,1868,'in_hcp360_data_mart_dbt_tran',1868,1,4,FALSE,TRUE,361,NULL,2,NULL,'','','','','','');
INSERT INTO PROCESS VALUES (1869,1869,'in_hcp360_investor_dashboard_dbt_tran',1869,1,5,FALSE,TRUE,361,NULL,2,NULL,'','','','','','');
INSERT INTO PROCESS VALUES (1870,1870,'in_hcp360_iqvia_kpi_datamart_dbt_tran',1870,1,1,FALSE,TRUE,357,NULL,2,NULL,'','','','','','');
INSERT INTO PROCESS VALUES (1871,1871,'in_hcp360_mds_data_refresh_dbt_ing',1871,1,1,FALSE,TRUE,272,NULL,2,NULL,'','','','','','');
INSERT INTO PROCESS VALUES (1872,1872,'in_iqvia_load_dbt_ing',1872,1,1,FALSE,TRUE,287,NULL,2,NULL,'','','','','','');
INSERT INTO PROCESS VALUES (1873,1873,'in_iqvia_edw_load_dbt_tran',1873,1,2,FALSE,TRUE,287,NULL,2,NULL,'','','','','','');
INSERT INTO PROCESS VALUES (1874,1874,'in_orsl_datamart_dbt_ing',1874,1,2,FALSE,TRUE,302,NULL,2,NULL,'','','','','','');
INSERT INTO PROCESS VALUES (1875,1875,'in_orsl_datamart_dbt_tran',1875,1,3,FALSE,TRUE,302,NULL,2,NULL,'','','','','','');
INSERT INTO PROCESS VALUES (1876,1876,'in_pob_to_cx_datamart_dbt_tran',1876,1,2,FALSE,TRUE,289,NULL,2,NULL,'','','','','','');
INSERT INTO PROCESS VALUES (1877,1877,'in_rx_to_cx_datamart_dbt_tran',1877,1,2,FALSE,TRUE,289,NULL,2,NULL,'','','','','','');
INSERT INTO PROCESS VALUES (1878,1878,'in_rx_to_cx_extracts_data_mart_dbt_tran',1878,1,3,FALSE,TRUE,289,NULL,2,NULL,'','','','','','');
INSERT INTO PROCESS VALUES (1879,1879,'in_sfmc_load_dbt_ing',1879,1,1,FALSE,TRUE,280,NULL,2,NULL,'','','','','','');
INSERT INTO PROCESS VALUES (1880,1880,'in_sfmc_edw_load_dbt_tran',1880,1,2,FALSE,TRUE,361,NULL,2,NULL,'','','','','','');
INSERT INTO PROCESS VALUES (1881,1881,'in_veeva_edw_load_dbt_tran',1881,1,2,FALSE,TRUE,361,NULL,2,NULL,'','','','','','');
INSERT INTO PROCESS VALUES (1882,1882,'in_ventasys_load_dbt_ing',1882,1,1,FALSE,TRUE,289,NULL,2,NULL,'','','','','','');
INSERT INTO PROCESS VALUES (1883,1883,'in_ventasys_edw_load_dbt_tran',1883,1,2,FALSE,TRUE,361,NULL,2,NULL,'','','','','','');


INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20844,1863,'j_kr_generic_query_execution_dbt_tran_group','jobId','15831',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20845,1863,'j_kr_generic_query_execution_dbt_tran_group','accountId','99',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20846,1863,'j_kr_generic_query_execution_dbt_tran_group','waitTime','20',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20847,1863,'j_kr_generic_query_execution_dbt_tran_group','tempId','0',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20848,1863,'j_kr_generic_query_execution_dbt_tran_group','transformationType','transformation',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20849,1863,'j_kr_generic_query_execution_dbt_tran_group','container','kor',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20850,1864,'KR_SFMC_naver_data_sftp','file_spec','PROD_Naver_KR_Lounge_Data',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20851,1864,'KR_SFMC_naver_data_sftp','folder_path','SFMC',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20852,1864,'KR_SFMC_naver_data_sftp','container','kor',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20853,1864,'KR_SFMC_naver_data_sftp','source_extn','csv',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20854,1864,'KR_SFMC_naver_data_sftp','isUnzipNeeded','N',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20855,1864,'KR_SFMC_naver_data_sftp','ftpName','marketingcloudopstha',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20856,1864,'KR_SFMC_naver_data_sftp','ftpDirectory','/Import/KR_Naver',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20857,1865,'in_ga360_dbt_tran_group','jobId','15835',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20858,1865,'in_ga360_dbt_tran_group','accountId','99',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20859,1865,'in_ga360_dbt_tran_group','waitTime','20',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20860,1865,'in_ga360_dbt_tran_group','tempId','0',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20861,1865,'in_ga360_dbt_tran_group','transformationType','transformation',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20862,1865,'in_ga360_dbt_tran_group','container','hcp',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20863,1866,'in_hcp_mastering_dbt_tran_group','jobId','15836',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20864,1866,'in_hcp_mastering_dbt_tran_group','accountId','99',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20865,1866,'in_hcp_mastering_dbt_tran_group','waitTime','20',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20866,1866,'in_hcp_mastering_dbt_tran_group','tempId','0',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20867,1866,'in_hcp_mastering_dbt_tran_group','transformationType','transformation',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20868,1866,'in_hcp_mastering_dbt_tran_group','container','hcp',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20869,1867,'in_hcp360_call_fact_dbt_tran_group','jobId','15837',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20870,1867,'in_hcp360_call_fact_dbt_tran_group','accountId','99',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20871,1867,'in_hcp360_call_fact_dbt_tran_group','waitTime','20',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20872,1867,'in_hcp360_call_fact_dbt_tran_group','tempId','0',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20873,1867,'in_hcp360_call_fact_dbt_tran_group','transformationType','transformation',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20874,1867,'in_hcp360_call_fact_dbt_tran_group','container','hcp',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20875,1868,'in_hcp360_data_mart_dbt_tran_group','jobId','15838',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20876,1868,'in_hcp360_data_mart_dbt_tran_group','accountId','99',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20877,1868,'in_hcp360_data_mart_dbt_tran_group','waitTime','20',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20878,1868,'in_hcp360_data_mart_dbt_tran_group','tempId','0',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20879,1868,'in_hcp360_data_mart_dbt_tran_group','transformationType','transformation',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20880,1868,'in_hcp360_data_mart_dbt_tran_group','container','hcp',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20881,1869,'in_hcp360_investor_dashboard_dbt_tran_group','jobId','15839',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20882,1869,'in_hcp360_investor_dashboard_dbt_tran_group','accountId','99',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20883,1869,'in_hcp360_investor_dashboard_dbt_tran_group','waitTime','20',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20884,1869,'in_hcp360_investor_dashboard_dbt_tran_group','tempId','0',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20885,1869,'in_hcp360_investor_dashboard_dbt_tran_group','transformationType','transformation',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20886,1869,'in_hcp360_investor_dashboard_dbt_tran_group','container','hcp',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20887,1870,'in_hcp360_iqvia_kpi_datamart_dbt_tran_group','jobId','15840',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20888,1870,'in_hcp360_iqvia_kpi_datamart_dbt_tran_group','accountId','99',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20889,1870,'in_hcp360_iqvia_kpi_datamart_dbt_tran_group','waitTime','20',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20890,1870,'in_hcp360_iqvia_kpi_datamart_dbt_tran_group','tempId','0',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20891,1870,'in_hcp360_iqvia_kpi_datamart_dbt_tran_group','transformationType','transformation',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20892,1870,'in_hcp360_iqvia_kpi_datamart_dbt_tran_group','container','hcp',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20893,1871,'in_hcp360_mds_data_refresh_dbt_ing_group','jobId','15841',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20894,1871,'in_hcp360_mds_data_refresh_dbt_ing_group','accountId','99',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20895,1871,'in_hcp360_mds_data_refresh_dbt_ing_group','waitTime','20',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20896,1871,'in_hcp360_mds_data_refresh_dbt_ing_group','tempId','137',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20897,1871,'in_hcp360_mds_data_refresh_dbt_ing_group','transformationType','ingestion',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20898,1871,'in_hcp360_mds_data_refresh_dbt_ing_group','container','hcp',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20899,1872,'in_iqvia_load_dbt_ing_group','jobId','15842',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20900,1872,'in_iqvia_load_dbt_ing_group','accountId','99',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20901,1872,'in_iqvia_load_dbt_ing_group','waitTime','20',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20902,1872,'in_iqvia_load_dbt_ing_group','tempId','138',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20903,1872,'in_iqvia_load_dbt_ing_group','transformationType','ingestion',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20904,1872,'in_iqvia_load_dbt_ing_group','container','hcp',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20905,1873,'in_iqvia_edw_load_dbt_tran_group','jobId','15843',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20906,1873,'in_iqvia_edw_load_dbt_tran_group','accountId','99',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20907,1873,'in_iqvia_edw_load_dbt_tran_group','waitTime','20',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20908,1873,'in_iqvia_edw_load_dbt_tran_group','tempId','0',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20909,1873,'in_iqvia_edw_load_dbt_tran_group','transformationType','transformation',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20910,1873,'in_iqvia_edw_load_dbt_tran_group','container','hcp',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20911,1874,'in_orsl_datamart_dbt_ing_group','jobId','15844',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20912,1874,'in_orsl_datamart_dbt_ing_group','accountId','99',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20913,1874,'in_orsl_datamart_dbt_ing_group','waitTime','20',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20914,1874,'in_orsl_datamart_dbt_ing_group','tempId','139',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20915,1874,'in_orsl_datamart_dbt_ing_group','transformationType','ingestion',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20916,1874,'in_orsl_datamart_dbt_ing_group','container','hcp',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20917,1875,'in_orsl_datamart_dbt_tran_group','jobId','15845',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20918,1875,'in_orsl_datamart_dbt_tran_group','accountId','99',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20919,1875,'in_orsl_datamart_dbt_tran_group','waitTime','20',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20920,1875,'in_orsl_datamart_dbt_tran_group','tempId','0',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20921,1875,'in_orsl_datamart_dbt_tran_group','transformationType','transformation',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20922,1875,'in_orsl_datamart_dbt_tran_group','container','hcp',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20923,1876,'in_pob_to_cx_datamart_dbt_tran_group','jobId','15846',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20924,1876,'in_pob_to_cx_datamart_dbt_tran_group','accountId','99',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20925,1876,'in_pob_to_cx_datamart_dbt_tran_group','waitTime','20',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20926,1876,'in_pob_to_cx_datamart_dbt_tran_group','tempId','0',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20927,1876,'in_pob_to_cx_datamart_dbt_tran_group','transformationType','transformation',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20928,1876,'in_pob_to_cx_datamart_dbt_tran_group','container','hcp',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20929,1877,'in_rx_to_cx_datamart_dbt_tran_group','jobId','15847',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20930,1877,'in_rx_to_cx_datamart_dbt_tran_group','accountId','99',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20931,1877,'in_rx_to_cx_datamart_dbt_tran_group','waitTime','20',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20932,1877,'in_rx_to_cx_datamart_dbt_tran_group','tempId','0',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20933,1877,'in_rx_to_cx_datamart_dbt_tran_group','transformationType','transformation',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20934,1877,'in_rx_to_cx_datamart_dbt_tran_group','container','hcp',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20935,1878,'in_rx_to_cx_extracts_data_mart_dbt_tran_group','jobId','15848',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20936,1878,'in_rx_to_cx_extracts_data_mart_dbt_tran_group','accountId','99',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20937,1878,'in_rx_to_cx_extracts_data_mart_dbt_tran_group','waitTime','20',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20938,1878,'in_rx_to_cx_extracts_data_mart_dbt_tran_group','tempId','0',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20939,1878,'in_rx_to_cx_extracts_data_mart_dbt_tran_group','transformationType','transformation',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20940,1878,'in_rx_to_cx_extracts_data_mart_dbt_tran_group','container','hcp',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20941,1879,'in_sfmc_load_dbt_ing_group','jobId','15849',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20942,1879,'in_sfmc_load_dbt_ing_group','accountId','99',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20943,1879,'in_sfmc_load_dbt_ing_group','waitTime','20',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20944,1879,'in_sfmc_load_dbt_ing_group','tempId','140',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20945,1879,'in_sfmc_load_dbt_ing_group','transformationType','ingestion',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20946,1879,'in_sfmc_load_dbt_ing_group','container','hcp',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20947,1880,'in_sfmc_edw_load_dbt_tran_group','jobId','15850',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20948,1880,'in_sfmc_edw_load_dbt_tran_group','accountId','99',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20949,1880,'in_sfmc_edw_load_dbt_tran_group','waitTime','20',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20950,1880,'in_sfmc_edw_load_dbt_tran_group','tempId','0',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20951,1880,'in_sfmc_edw_load_dbt_tran_group','transformationType','transformation',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20952,1880,'in_sfmc_edw_load_dbt_tran_group','container','hcp',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20953,1881,'in_veeva_edw_load_dbt_tran_group','jobId','15851',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20954,1881,'in_veeva_edw_load_dbt_tran_group','accountId','99',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20955,1881,'in_veeva_edw_load_dbt_tran_group','waitTime','20',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20956,1881,'in_veeva_edw_load_dbt_tran_group','tempId','0',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20957,1881,'in_veeva_edw_load_dbt_tran_group','transformationType','transformation',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20958,1881,'in_veeva_edw_load_dbt_tran_group','container','hcp',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20959,1882,'in_ventasys_load_dbt_ing_group','jobId','15852',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20960,1882,'in_ventasys_load_dbt_ing_group','accountId','99',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20961,1882,'in_ventasys_load_dbt_ing_group','waitTime','20',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20962,1882,'in_ventasys_load_dbt_ing_group','tempId','141',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20963,1882,'in_ventasys_load_dbt_ing_group','transformationType','ingestion',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20964,1882,'in_ventasys_load_dbt_ing_group','container','hcp',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20965,1883,'in_ventasys_edw_load_dbt_tran_group','jobId','15853',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20966,1883,'in_ventasys_edw_load_dbt_tran_group','accountId','99',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20967,1883,'in_ventasys_edw_load_dbt_tran_group','waitTime','20',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20968,1883,'in_ventasys_edw_load_dbt_tran_group','tempId','0',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20969,1883,'in_ventasys_edw_load_dbt_tran_group','transformationType','transformation',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20970,1883,'in_ventasys_edw_load_dbt_tran_group','container','hcp',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20971,1884,'In_Finance_Simulator_Dashboard_group','contentUrl','ADB',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20972,1884,'In_Finance_Simulator_Dashboard_group','tableauSourceName','Finance TDE',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20973,1884,'In_Finance_Simulator_Dashboard_group','waitTime','60',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20974,1884,'In_Finance_Simulator_Dashboard_group','refreshType','datasource',FALSE,TRUE);
INSERT INTO PARAMETERS (PARAMETER_ID, PARAMETER_GROUP_ID,PARAMETER_GROUP_NAME,PARAMETER_NAME,PARAMETER_VALUE,IS_SENSITIVE,IS_ACTIVE) VALUES (20975,1884,'In_Finance_Simulator_Dashboard_group','container','ind',FALSE,TRUE);