update META_RAW.HISTORICAL_OBJ_METADATA
set ISACTIVE = FALSE;

update META_RAW.HISTORICAL_OBJ_METADATA
set ISACTIVE = TRUE
where target_schema = 'THAITG_INTEGRATION';

update META_RAW.HISTORICAL_OBJ_METADATA
set ISACTIVE = FALSE
where id = 662;

ALTER TABLE THASDL_RAW.SDL_TH_DMS_CHANA_CUSTOMER_DIM
ALTER COLUMN ROUTESTEP10 SET DATA TYPE VARCHAR(255);

ALTER TABLE THASDL_RAW.SDL_TH_DMS_CHANA_CUSTOMER_DIM
ALTER COLUMN ROUTESTEP7 SET DATA TYPE VARCHAR(255);

ALTER TABLE THASDL_RAW.SDL_TH_DMS_CHANA_CUSTOMER_DIM
ALTER COLUMN ROUTESTEP8 SET DATA TYPE VARCHAR(255);

ALTER TABLE THASDL_RAW.SDL_TH_DMS_CHANA_CUSTOMER_DIM
ALTER COLUMN ROUTESTEP9 SET DATA TYPE VARCHAR(255);
