-- update META_RAW.HISTORICAL_OBJ_METADATA
-- set target_schema = 'SNAPASPWKS_INTEGRATION'
-- where ID in(132,185,176,186, 172, 177, 181, 171, 198, 178, 182, 175, 187,180, 201, 197, 199, 183, 189, 184, 174, 179, 196,200, 155, 142, 170, 162, 154, 157, 158, 168, 166,143, 127, 159, 156, 163, 141, 145, 153, 165, 161,167, 140, 144, 169, 160, 135, 164, 136, 128, 139,122, 125, 137, 134, 130, 131, 133, 138);

-- update META_RAW.HISTORICAL_OBJ_METADATA
-- set ISACTIVE = TRUE;

-- update META_RAW.HISTORICAL_OBJ_METADATA
-- set ISACTIVE = TRUE
-- WHERE ID IN (552,553);

-- update META_RAW.HISTORICAL_OBJ_METADATA
-- set TARGET_SCHEMA = 'SGPSDL_RAW'
-- where id in (310,324);

-- update META_RAW.HISTORICAL_OBJ_METADATA
-- set ISACTIVE = FALSE
-- where TARGET_SCHEMA in ('MYSSDL_RAW','MYSITG_INTEGRATION','MYSEDW_INTEGRATION','MYSWKS_INTEGRATION');

update META_RAW.HISTORICAL_OBJ_METADATA
set ISACTIVE = TRUE
--WHERE ID IN (552,553);


-- USE DATABASE PROD_DNA_LOAD;

-- update meta_raw.usecase
-- set USECASE_NAME='POP6_refresh' ,CATEGORY='POP6_refresh', USECASE_DESCRIPTION='Tableau Refresh Adhoc FOR POP6'
-- where usecase_id=13;

-- INSERT INTO meta_raw.USECASE (USECASE_ID, USECASE_NAME,CATEGORY,USECASE_DESCRIPTION,IS_ACTIVE,SEQUENCE_ID) VALUES (39,'CUSTOMER360_refresh','CUSTOMER360_refresh','Tableau Refresh Adhoc FOR CUSTOMER360','TRUE',1);

-- update meta_raw.process
-- set USECASE_ID=39
-- where process_id=31;