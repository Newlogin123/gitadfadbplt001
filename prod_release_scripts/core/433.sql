drop table PROD_DNA_CORE.dbt_cloud_pr_5458_1435.aspitg_integration__itg_pop6_rir_data;

create table PROD_DNA_CORE.dbt_cloud_pr_5458_1435.aspitg_integration__itg_pop6_rir_data
 (
	cntry_cd varchar(10),
    VISIT_ID VARCHAR(255),
	PHOTO VARCHAR(500),
	RELATED_ATTRIBUTE VARCHAR(255),
	SKU_ID VARCHAR(255),
	SKU VARCHAR(255),
	LAYER NUMBER(18,0),
	TOTAL_LAYER NUMBER(18,0),
	FACING_OF_THIS_LAYER NUMBER(18,0),
	FILE_NAME VARCHAR(100),
	RUN_ID NUMBER(14,0),
	CRTD_DTTM TIMESTAMP_NTZ(9),
	UPDT_DTTM TIMESTAMP_NTZ(9)
);