delete from PROD_DNA_CORE.DBT_CLOUD_PR_5458_528.ASPEDW_INTEGRATION__EDW_RPT_RETAIL_EXCELLENCE_SUMMARY where market = 'Korea';
insert into PROD_DNA_CORE.DBT_CLOUD_PR_5458_528.ASPEDW_INTEGRATION__EDW_RPT_RETAIL_EXCELLENCE_SUMMARY select * from PROD_DNA_CORE.DBT_CLOUD_PR_5458_528.aspedw_integration__edw_kr_rpt_retail_excellence_summary;

delete from PROD_DNA_CORE.DBT_CLOUD_PR_5458_528.ASPEDW_INTEGRATION__EDW_RPT_RETAIL_EXCELLENCE_DETAILS where market = 'Korea';
insert into PROD_DNA_CORE.DBT_CLOUD_PR_5458_528.ASPEDW_INTEGRATION__EDW_RPT_RETAIL_EXCELLENCE_DETAILS select * from PROD_DNA_CORE.DBT_CLOUD_PR_5458_528.aspedw_integration__edw_kr_rpt_retail_excellence_details;
