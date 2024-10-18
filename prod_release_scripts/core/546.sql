delete from PROD_DNA_CORE.DBT_CLOUD_PR_5458_1220.VNMWKS_INTEGRATION__WKS_VN_REGIONAL_SELLOUT_MAPPED_SKU_CD;

insert into PROD_DNA_CORE.DBT_CLOUD_PR_5458_1220.VNMWKS_INTEGRATION__WKS_VN_REGIONAL_SELLOUT_MAPPED_SKU_CD (
with edw_rpt_regional_sellout_offtake as (
    select * from PROD_DNA_CORE.DBT_CLOUD_PR_5458_1220.ASPEDW_INTEGRATION__EDW_RPT_REGIONAL_SELLOUT_OFFTAKE
)

    SELECT *
	FROM (SELECT DISTINCT LTRIM(MSL_PRODUCT_CODE,'0') AS EAN_NUM,
				 LTRIM(SKU_CODE,'0') AS SKU_CODE,
				 MSL_PRODUCT_DESC AS SKU_DESCRIPTION,
				 ROW_NUMBER() OVER (PARTITION BY LTRIM(MSL_PRODUCT_CODE,0) ORDER BY cal_date DESC,LENGTH(LTRIM(SKU_CODE,'0')) DESC) AS RNO
		  FROM EDW_RPT_REGIONAL_SELLOUT_OFFTAKE 
		  WHERE COUNTRY_CODE = 'VN'
		  AND   DATA_SOURCE in ('SELL-OUT', 'POS'))
	WHERE RNO = 1
);
------------------------

delete from PROD_DNA_CORE.DBT_CLOUD_PR_5458_1220.VNMWKS_INTEGRATION__WKS_VN_REGIONAL_SELLOUT_REGION;

insert into PROD_DNA_CORE.DBT_CLOUD_PR_5458_1220.VNMWKS_INTEGRATION__WKS_VN_REGIONAL_SELLOUT_REGION (

with edw_rpt_regional_sellout_offtake as (
    select * from PROD_DNA_CORE.DBT_CLOUD_PR_5458_1220.ASPEDW_INTEGRATION__EDW_RPT_REGIONAL_SELLOUT_OFFTAKE
)

    SELECT *
	FROM (SELECT DISTINCT
				 UPPER(LTRIM(STORE_CODE,'0')) AS STORE_CODE,
				 REGION,
				 ROW_NUMBER() OVER (PARTITION BY UPPER(LTRIM(STORE_CODE,'0')) ORDER BY cal_date DESC) AS RNO
		  FROM EDW_RPT_REGIONAL_SELLOUT_OFFTAKE  
		  WHERE COUNTRY_CODE = 'VN'
		  AND   DATA_SOURCE in ('SELL-OUT', 'POS'))
	WHERE RNO = 1
);

-------------------------
delete from PROD_DNA_CORE.DBT_CLOUD_PR_5458_1220.VNMWKS_INTEGRATION__WKS_VN_BASE_RETAIL_EXCELLENCE;

insert into PROD_DNA_CORE.DBT_CLOUD_PR_5458_1220.VNMWKS_INTEGRATION__WKS_VN_BASE_RETAIL_EXCELLENCE (
with edw_rpt_regional_sellout_offtake as (
    select * from PROD_DNA_CORE.DBT_CLOUD_PR_5458_1220.ASPEDW_INTEGRATION__EDW_RPT_REGIONAL_SELLOUT_OFFTAKE
),
edw_vw_cal_retail_excellence_dim as (
    select * from PROD_DNA_CORE.aspedw_integration.v_edw_vw_cal_Retail_excellence_dim
),
wks_vn_regional_sellout_mapped_sku_cd as (
    select * from PROD_DNA_CORE.DBT_CLOUD_PR_5458_1220.VNMWKS_INTEGRATION__WKS_VN_REGIONAL_SELLOUT_MAPPED_SKU_CD
),
wks_vn_regional_sellout_region as (
    select * from PROD_DNA_CORE.DBT_CLOUD_PR_5458_1220.VNMWKS_INTEGRATION__WKS_VN_REGIONAL_SELLOUT_REGION
)

    SELECT COUNTRY_CODE AS CNTRY_CD,
       COUNTRY_NAME AS CNTRY_NM,
       DATA_SOURCE AS DATA_SRC,
       MD5(nvl (SOLDTO_CODE,'stc') || NVL (DISTRIBUTOR_CODE,'DC') ||NVL (STORE_CODE,'SC') ||
       NVL (DISTRIBUTOR_NAME,'DN') ||nvl (SKU_Code,'SKU') || 
       nvl (EAN,'EAN') || NVL (STORE_TYPE,'ST') || NVL (STORE_NAME,'SN') ||
       NVL (SAP_PARENT_CUSTOMER_KEY,'SPCK') ||NVL (SAP_PARENT_CUSTOMER_DESCRIPTION,'SPSCD') || 
       NVL (SAP_CUSTOMER_CHANNEL_KEY,'SCCK') ||NVL (SAP_CUSTOMER_CHANNEL_DESCRIPTION,'SCCD') ||
       NVL (SAP_CUSTOMER_SUB_CHANNEL_KEY,'SCSCK') ||NVL (SAP_SUB_CHANNEL_DESCRIPTION,'SSCD') ||
       NVL (CUSTOMER_SEGMENT_KEY,'CSK') ||NVL (CUSTOMER_SEGMENT_DESCRIPTION,'CSD') || 
       NVL (SAP_GO_TO_MDL_KEY,'SGMK') ||NVL (SAP_GO_TO_MDL_DESCRIPTION,'SGMD') ||
       NVL (SAP_BANNER_KEY,'SBK') ||NVL (SAP_BANNER_DESCRIPTION,'SBD') ||
       NVL (SAP_BANNER_FORMAT_KEY,'SBFK') ||NVL (SAP_BANNER_FORMAT_DESCRIPTION,'SBFD') ||
       NVL (RETAIL_ENVIRONMENT,'RE') || NVL (GLOBAL_PRODUCT_FRANCHISE,'GPF') ||
       NVL (GLOBAL_PRODUCT_BRAND,'GPB') ||NVL (GLOBAL_PRODUCT_SUB_BRAND,'GPSB') || 
       NVL (GLOBAL_PRODUCT_VARIANT,'GPV') ||NVL (GLOBAL_PRODUCT_SEGMENT,'GPS') ||
       NVL (GLOBAL_PRODUCT_SUBSEGMENT,'GPSS') || NVL (GLOBAL_PRODUCT_CATEGORY,'GPC') ||
       NVL (GLOBAL_PRODUCT_SUBCATEGORY,'GPSC') ||NVL (GLOBAL_PUT_UP_DESCRIPTION,'GPUD') ||
       NVL (PKA_PRODUCT_KEY,'PK') ||NVL (PKA_PRODUCT_KEY_DESCription,'PKD') ||
       NVL (CHANNEL,'CN') || nvl (Region,'rg') ||
       nvl (zone,'zn') ||NVL (SKU_DESCRIPTION,'mpd')) AS SELLOUT_DIM_KEY,
       YEAR,
       MNTH_ID,
       SOLDTO_CODE,
       DISTRIBUTOR_CODE,
       DISTRIBUTOR_NAME,
       STORE_CODE,
	   STORE_NAME,
       STORE_TYPE,
	   LIST_PRICE,
       --CUSTOMER_PRODUCT_DESC,
       SAP_PARENT_CUSTOMER_KEY,
       SAP_PARENT_CUSTOMER_DESCRIPTION,
       SAP_CUSTOMER_CHANNEL_KEY,
       SAP_CUSTOMER_CHANNEL_DESCRIPTION,
       SAP_CUSTOMER_SUB_CHANNEL_KEY,
       SAP_SUB_CHANNEL_DESCRIPTION,
       SAP_GO_TO_MDL_KEY,
       SAP_GO_TO_MDL_DESCRIPTION,
       SAP_BANNER_KEY,
       SAP_BANNER_DESCRIPTION,
       SAP_BANNER_FORMAT_KEY,
       SAP_BANNER_FORMAT_DESCRIPTION,
       RETAIL_ENVIRONMENT,
       REGION,
       ZONE,
       CHANNEL,
       CUSTOMER_SEGMENT_KEY,
       CUSTOMER_SEGMENT_DESCRIPTION,
       GLOBAL_PRODUCT_FRANCHISE,
       GLOBAL_PRODUCT_BRAND,
       GLOBAL_PRODUCT_SUB_BRAND,
       GLOBAL_PRODUCT_VARIANT,
       GLOBAL_PRODUCT_SEGMENT,
       GLOBAL_PRODUCT_SUBSEGMENT,
       GLOBAL_PRODUCT_CATEGORY,
       GLOBAL_PRODUCT_SUBCATEGORY,
       GLOBAL_PUT_UP_DESCRIPTION,
       EAN,
       SKU_CODE,
       SKU_DESCRIPTION,
       PKA_PRODUCT_KEY,
       PKA_PRODUCT_KEY_DESCRIPTION,
       SUM(SELLOUT_SALES_QUANTITY) :: DECIMAL(38,6) AS SO_SLS_QTY,
       SUM(SELLOUT_SALES_VALUE) :: NUMERIC(38,6) AS SO_SLS_VALUE,
       AVG(SELLOUT_SALES_QUANTITY) :: DECIMAL(38,6) AS SO_AVG_QTY,
       SUM(SALES_VALUE_LIST_PRICE) AS SALES_VALUE_LIST_PRICE,
       SYSDATE() AS CRT_DTTM
FROM (SELECT COUNTRY_CODE,
             COUNTRY_NAME,
             DATA_SOURCE,
             YEAR,
             MNTH_ID,
             SOLDTO_CODE,
             UPPER(DISTRIBUTOR_CODE) AS DISTRIBUTOR_CODE,
			 DISTRIBUTOR_NAME|| '#' ||LTRIM(DISTRIBUTOR_CODE,'0') AS DISTRIBUTOR_NAME,
             MAIN.STORE_CODE,
			 STORE_NAME|| '#' ||LTRIM(MAIN.STORE_CODE,'0') AS STORE_NAME,
             STORE_TYPE,
             LIST_PRICE,
             Channel,
             SAP_PARENT_CUSTOMER_KEY,
             SAP_PARENT_CUSTOMER_DESCRIPTION,
             SAP_CUSTOMER_CHANNEL_KEY,
             SAP_CUSTOMER_CHANNEL_DESCRIPTION,
             SAP_CUSTOMER_SUB_CHANNEL_KEY,
             SAP_SUB_CHANNEL_DESCRIPTION,
             SAP_GO_TO_MDL_KEY,
             SAP_GO_TO_MDL_DESCRIPTION,
             SAP_BANNER_KEY,
             SAP_BANNER_DESCRIPTION,
             SAP_BANNER_FORMAT_KEY,
             SAP_BANNER_FORMAT_DESCRIPTION,
             RETAIL_ENVIRONMENT,
             REG.REGION,
             ZONE,
             --CITY,
             CUSTOMER_SEGMENT_KEY,
             CUSTOMER_SEGMENT_DESCRIPTION,
             GLOBAL_PRODUCT_FRANCHISE,
             GLOBAL_PRODUCT_BRAND,
             GLOBAL_PRODUCT_SUB_BRAND,
             GLOBAL_PRODUCT_VARIANT,
             GLOBAL_PRODUCT_SEGMENT,
             GLOBAL_PRODUCT_SUBSEGMENT,
             GLOBAL_PRODUCT_CATEGORY,
             GLOBAL_PRODUCT_SUBCATEGORY,
             GLOBAL_PUT_UP_DESCRIPTION,
             MSCD.EAN_NUM AS EAN,
             MSCD.SKU_CODE,	
             MSCD.SKU_DESCRIPTION,
             PKA_PRODUCT_KEY,
             PKA_PRODUCT_KEY_DESCription,
             SELLOUT_SALES_QUANTITY,
             SELLOUT_SALES_VALUE,
             SALES_VALUE_LIST_PRICE
      FROM (SELECT COUNTRY_CODE,
                   COUNTRY_NAME,
                   DATA_Source,
                   YEAR AS YEAR,
                   MNTH_ID AS MNTH_ID,
                   MAX(SOLDTO_CODE) OVER (PARTITION BY LTRIM(DISTRIBUTOR_CODE,'0') ORDER BY cal_date DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS SOLDTO_CODE,
                   --LTRIM(DISTRIBUTOR_CODE,'0') AS DISTRIBUTOR_CODE,
                   CASE WHEN data_source = 'POS' THEN MD5(DISTRIBUTOR_NAME)
                   ELSE LTRIM(DISTRIBUTOR_CODE,'0') 
                   END AS DISTRIBUTOR_CODE,
                   MAX(DISTRIBUTOR_NAME) OVER (PARTITION BY CASE WHEN data_source = 'POS' THEN MD5(DISTRIBUTOR_NAME)
                   ELSE LTRIM(DISTRIBUTOR_CODE,'0') 
                   END ORDER BY cal_date DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS DISTRIBUTOR_NAME,
                   LTRIM(STORE_CODE,'0') AS STORE_CODE,
                   MAX(STORE_NAME) OVER (PARTITION BY LTRIM(STORE_CODE,'0') ORDER BY cal_date DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS STORE_NAME,
                   UPPER(STORE_TYPE) AS STORE_TYPE,
                   MAX(LIST_PRICE) OVER (PARTITION BY LTRIM(msl_product_code,0) ORDER BY LENGTH(SKU_CODE) DESC,cal_date DESC,SKU_CODE DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS LIST_PRICE,
                   Channel,
                   SAP_PARENT_CUSTOMER_KEY,
                   SAP_PARENT_CUSTOMER_DESCRIPTION,
                   SAP_CUSTOMER_CHANNEL_KEY,
                   SAP_CUSTOMER_CHANNEL_DESCRIPTION,
                   SAP_CUSTOMER_SUB_CHANNEL_KEY,
                   SAP_SUB_CHANNEL_DESCRIPTION,
                   SAP_GO_TO_MDL_KEY,
                   SAP_GO_TO_MDL_DESCRIPTION,
                   SAP_BANNER_KEY,
                   SAP_BANNER_DESCRIPTION,
                   SAP_BANNER_FORMAT_KEY,
                   SAP_BANNER_FORMAT_DESCRIPTION,
                   RETAIL_ENV AS RETAIL_ENVIRONMENT,
                   --REGION,
                   ZONE_OR_AREA AS ZONE,
                   --CITY,
                   CUSTOMER_SEGMENT_KEY,
                   CUSTOMER_SEGMENT_DESCRIPTION,
                   GLOBAL_PRODUCT_FRANCHISE,
                   GLOBAL_PRODUCT_BRAND,
                   GLOBAL_PRODUCT_SUB_BRAND,
                   GLOBAL_PRODUCT_VARIANT,
                   GLOBAL_PRODUCT_SEGMENT,
                   GLOBAL_PRODUCT_SUBSEGMENT,
                   GLOBAL_PRODUCT_CATEGORY,
                   GLOBAL_PRODUCT_SUBCATEGORY,
                   GLOBAL_PUT_UP_DESCRIPTION,
                   LTRIM(msl_product_code,'0') AS EAN,
                   PKA_PRODUCT_KEY,
                   PKA_PRODUCT_KEY_DESCRIPTION,
                   SELLOUT_SALES_QUANTITY,
                   SELLOUT_SALES_VALUE,
                   SELLOUT_VALUE_LIST_PRICE AS SALES_VALUE_LIST_PRICE
            FROM EDW_RPT_REGIONAL_SELLOUT_OFFTAKE
            WHERE COUNTRY_CODE = 'VN'
            AND   DATA_SOURCE in ('SELL-OUT', 'POS')
            AND   MNTH_ID >= (SELECT last_27mnths
                  FROM edw_vw_cal_retail_excellence_dim)::NUMERIC
            AND   MNTH_ID <= (SELECT prev_mnth FROM edw_vw_cal_retail_excellence_dim)::NUMERIC
            ) MAIN
            LEFT JOIN WKS_VN_REGIONAL_SELLOUT_MAPPED_SKU_CD MSCD ON LTRIM (MAIN.EAN,'0') = LTRIM (MSCD.EAN_NUM,'0')
            LEFT JOIN WKS_VN_REGIONAL_SELLOUT_REGION REG ON UPPER(LTRIM(MAIN.STORE_CODE, '0')) = UPPER(LTRIM(REG.STORE_CODE, '0')))
GROUP BY COUNTRY_CODE,
         COUNTRY_NAME,
         DATA_SOURCE,
         YEAR,
         MNTH_ID,
         SOLDTO_CODE,
         DISTRIBUTOR_CODE,
         DISTRIBUTOR_NAME,
         STORE_CODE,
         STORE_NAME,
         STORE_TYPE,
         sku_code,
         sku_description,
         LIST_PRICE,
         SAP_PARENT_CUSTOMER_KEY,
         SAP_PARENT_CUSTOMER_DESCRIPTION,
         SAP_CUSTOMER_CHANNEL_KEY,
         SAP_CUSTOMER_CHANNEL_DESCRIPTION,
         SAP_CUSTOMER_SUB_CHANNEL_KEY,
         SAP_SUB_CHANNEL_DESCRIPTION,
         SAP_GO_TO_MDL_KEY,
         SAP_GO_TO_MDL_DESCRIPTION,
         SAP_BANNER_KEY,
         SAP_BANNER_DESCRIPTION,
         SAP_BANNER_FORMAT_KEY,
         SAP_BANNER_FORMAT_DESCRIPTION,
         RETAIL_ENVIRONMENT,
         REGION,
         ZONE,
         CUSTOMER_SEGMENT_KEY,
         CUSTOMER_SEGMENT_DESCRIPTION,
         GLOBAL_PRODUCT_FRANCHISE,
         GLOBAL_PRODUCT_BRAND,
         GLOBAL_PRODUCT_SUB_BRAND,
         GLOBAL_PRODUCT_VARIANT,
         GLOBAL_PRODUCT_SEGMENT,
         GLOBAL_PRODUCT_SUBSEGMENT,
         GLOBAL_PRODUCT_CATEGORY,
         GLOBAL_PRODUCT_SUBCATEGORY,
         GLOBAL_PUT_UP_DESCRIPTION,
         EAN,
         channel,
         SKU_CODE,
         SKU_DESCRIPTION,
         PKA_PRODUCT_KEY,
         PKA_PRODUCT_KEY_DESCRIPTION
);