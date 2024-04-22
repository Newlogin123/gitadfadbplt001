DELETE FROM META_RAW.HISTORICAL_OBJ_METADATA
WHERE ID IN(1526,1428,1587);


INSERT INTO META_RAW.HISTORICAL_OBJ_METADATA (ID,SOURCE_SCHEMA,SOURCE_TABLE, TARGET_DB,TARGET_SCHEMA,TARGET_TABLE,STAGE_SCHEMA,ISACTIVE,MARKET,TYPE_OF_LOAD,PRIORITY) VALUES (1526,'RG_ITG','ITG_WEEKLY_FORECAST','PROD_DNA_CORE','ASPITG_INTEGRATION','ITG_WEEKLY_FORECAST','UTILITY_RAW',TRUE,'Pacific','FULL_REFRESH',1);

INSERT INTO META_RAW.HISTORICAL_OBJ_METADATA (ID,SOURCE_SCHEMA,SOURCE_TABLE, TARGET_DB,TARGET_SCHEMA,TARGET_TABLE,STAGE_SCHEMA,ISACTIVE,MARKET,TYPE_OF_LOAD,PRIORITY) VALUES (1428,'AU_SDL','SDL_PX_UOM','PROD_DNA_LOAD','PCFSDL_RAW','SDL_PX_UOM','META_RAW',TRUE,'Pacific','FULL_REFRESH',1);

INSERT INTO META_RAW.HISTORICAL_OBJ_METADATA (ID,SOURCE_SCHEMA,SOURCE_TABLE, TARGET_DB,TARGET_SCHEMA,TARGET_TABLE,STAGE_SCHEMA,ISACTIVE,MARKET,TYPE_OF_LOAD,PRIORITY) VALUES (1587,'AU_WKS','WKS_PACIFIC_SISO_PROPAGATE_TO_EXISTING_DTLS','PROD_DNA_CORE','PCFWKS_INTEGRATION','WKS_PACIFIC_SISO_PROPAGATE_TO_EXISTING_DTLS','UTILITY_RAW',TRUE,'Pacific','FULL_REFRESH',3);

update meta_raw.process
set process_name = 'j_pacific_dna_etl_framework_TAB_Sales_Reporting' ,
  USECASE_ID = 141
where PARAMETER_GROUP_ID = 363 ;

update meta_raw.parameters
set PARAMETER_GROUP_NAME = 'j_pacific_dna_etl_framework_TAB_Sales_Reporting'
where PARAMETER_GROUP_ID = 363;

update meta_raw.process
set usecase_id = 142
where where PARAMETER_GROUP_ID = 419;
