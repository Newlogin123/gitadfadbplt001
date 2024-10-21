delete from PROD_DNA_CORE.DBT_CLOUD_PR_5458_1220.VNMWKS_INTEGRATION__WKS_VN_RE_TARGET_COMPLIANCE;

insert into PROD_DNA_CORE.DBT_CLOUD_PR_5458_1220.VNMWKS_INTEGRATION__WKS_VN_RE_TARGET_COMPLIANCE (

with  wks_mds_reds_market_msl_target_vn as
(
    select * from PROD_DNA_CORE.aspedw_integration.wks_mds_reds_market_msl_target_final
),

vn_rpt_retail_excellence_gcph as 
 (
    select * from PROD_DNA_CORE.DBT_CLOUD_PR_5458_1220.VNMWKS_INTEGRATION__WKS_VN_RPT_RETAIL_EXCELLENCE_GCPH
 )
 
   select b.fisc_per,
   b.global_product_brand,
   (mds.mdp_target/total_mdp_target):: numeric(38,6) as target_complaince
   --round((mds.mdp_target/total_mdp_target)*100 ):: integer as target_complaince
   from 
        (select fisc_per,
        global_product_brand,
        count(1)   as total_mdp_target  
        from 
            (select  distinct fisc_per,
                distributor_code,
                 store_code, 
                 product_code,
                 global_product_brand
                from vn_rpt_retail_excellence_gcph
                where   mdp_flag = 'Y'
                ) a
        group by 1,2)b 
    inner join 
    (select * from wks_mds_reds_market_msl_target_vn where UPPER(market) = 'VIETNAM'
     ) mds 
        on ( fisc_per >= mds.start_month_id and fisc_per <= mds.end_month_id and upper(b.global_product_brand)=upper(mds.brand_code))
    group by 1,2,3 
 );

-----------------------------


delete from PROD_DNA_CORE.DBT_CLOUD_PR_5458_1220.VNMEDW_INTEGRATION__EDW_VN_RPT_RETAIL_EXCELLENCE;

insert into PROD_DNA_CORE.DBT_CLOUD_PR_5458_1220.VNMEDW_INTEGRATION__EDW_VN_RPT_RETAIL_EXCELLENCE (

with wks_vn_rpt_retail_excellence_gcph as 
(
    select * from PROD_DNA_CORE.DBT_CLOUD_PR_5458_1220.VNMWKS_INTEGRATION__WKS_VN_RPT_RETAIL_EXCELLENCE_GCPH
),
wks_vn_re_target_compliance as 
(
    select * from PROD_DNA_CORE.DBT_CLOUD_PR_5458_1220.VNMWKS_INTEGRATION__WKS_VN_RE_TARGET_COMPLIANCE
)

    SELECT FISC_YR,
       GCPH.FISC_PER,
       "cluster",
       MARKET,
       DATA_SRC,
       CHANNEL_NAME,
       SOLDTO_CODE AS SOLD_TO_CODE,
       DISTRIBUTOR_CODE,
       DISTRIBUTOR_NAME,
       SELL_OUT_CHANNEL,
       STORE_TYPE,
       PRIORITIZATION_SEGMENTATION,
       STORE_CATEGORY,
       STORE_CODE,
       STORE_NAME,
       STORE_GRADE,
       STORE_SIZE,
       REGION,
       ZONE_NAME,
       POST_CODE,
       CITY,
       RTRLATITUDE,
       RTRLONGITUDE,
       CUSTOMER_SEGMENT_KEY,
       CUSTOMER_SEGMENT_DESCRIPTION,
       RETAIL_ENVIRONMENT,
       SAP_CUSTOMER_CHANNEL_KEY,
       SAP_CUSTOMER_CHANNEL_DESCRIPTION,
       SAP_CUSTOMER_SUB_CHANNEL_KEY,
       SAP_SUB_CHANNEL_DESCRIPTION,
       SAP_PARENT_CUSTOMER_KEY,
       SAP_PARENT_CUSTOMER_DESCRIPTION,
       SAP_BANNER_KEY,
       SAP_BANNER_DESCRIPTION,
       SAP_BANNER_FORMAT_KEY,
       SAP_BANNER_FORMAT_DESCRIPTION,
       CUSTOMER_NAME,
       CUSTOMER_CODE,
       PRODUCT_CODE,
       PRODUCT_NAME,
       PROD_HIER_L1,
       PROD_HIER_L2,
       PROD_HIER_L3,
       PROD_HIER_L4,
       PROD_HIER_L5,
       PROD_HIER_L6,
       PROD_HIER_L7,
       PROD_HIER_L8,
       PROD_HIER_L9,
       MAPPED_SKU_CD,
       SAP_PROD_SGMT_CD,
       SAP_PROD_SGMT_DESC,
       SAP_BASE_PROD_DESC,
       SAP_MEGA_BRND_DESC,
       SAP_BRND_DESC,
       SAP_VRNT_DESC,
       SAP_PUT_UP_DESC,
       SAP_GRP_FRNCHSE_CD,
       SAP_GRP_FRNCHSE_DESC,
       SAP_FRNCHSE_CD,
       SAP_FRNCHSE_DESC,
       SAP_PROD_FRNCHSE_CD,
       SAP_PROD_FRNCHSE_DESC,
       SAP_PROD_MJR_CD,
       SAP_PROD_MJR_DESC,
       SAP_PROD_MNR_CD,
       SAP_PROD_MNR_DESC,
       SAP_PROD_HIER_CD,
       SAP_PROD_HIER_DESC,
       PKA_FRANCHISE_DESC,
       PKA_BRAND_DESC,
       PKA_SUB_BRAND_DESC,
       PKA_VARIANT_DESC,
       PKA_SUB_VARIANT_DESC,
       GLOBAL_PRODUCT_FRANCHISE,
       GCPH.GLOBAL_PRODUCT_BRAND,
       GLOBAL_PRODUCT_SUB_BRAND,
       GLOBAL_PRODUCT_VARIANT,
       GLOBAL_PRODUCT_SEGMENT,
       GLOBAL_PRODUCT_SUBSEGMENT,
       GLOBAL_PRODUCT_CATEGORY,
       GLOBAL_PRODUCT_SUBCATEGORY,
       GLOBAL_PUT_UP_DESCRIPTION,
       PRODUCT_CODE AS EAN,
       MAPPED_SKU_CD AS SKU_CODE,
       PRODUCT_NAME AS SKU_DESCRIPTION,
       PKA_PRODUCT_KEY,
       PKA_PRODUCT_KEY_DESCRIPTION,
       SALES_VALUE,
       SALES_QTY,
       AVG_SALES_QTY,
	   SALES_VALUE_LIST_PRICE,
       LM_SALES,
       LM_SALES_QTY,
       LM_AVG_SALES_QTY,
	   LM_SALES_LP,
       P3M_SALES,
       P3M_QTY,
       P3M_AVG_QTY,
	   P3M_SALES_LP,
       P6M_SALES,
       P6M_QTY,
       P6M_AVG_QTY,
	   P6M_SALES_LP,
       P12M_SALES,
       P12M_QTY,
       P12M_AVG_QTY,
	   P12M_SALES_LP,
       F3M_SALES,
       F3M_QTY,
       F3M_AVG_QTY,
       LM_SALES_FLAG,
       P3M_SALES_FLAG,
       P6M_SALES_FLAG,
       P12M_SALES_FLAG,
       MDP_FLAG,
       --TARGET_COMPLAINCE,
       CASE 
            WHEN (MDP_FLAG = 'Y' AND UPPER(GCPH.global_product_brand) = UPPER(TRGT_CMP.global_product_brand)) THEN TRGT_CMP.TARGET_COMPLAINCE
            ELSE 1
            END AS TARGET_COMPLAINCE,
       LIST_PRICE,
       TOTAL_SALES_LM,
       TOTAL_SALES_P3M,
       TOTAL_SALES_P6M,
       TOTAL_SALES_P12M,
       TOTAL_SALES_BY_STORE_LM,
       TOTAL_SALES_BY_STORE_P3M,
       TOTAL_SALES_BY_STORE_P6M,
       TOTAL_SALES_BY_STORE_P12M,
       TOTAL_SALES_BY_SKU_LM,
       TOTAL_SALES_BY_SKU_P3M,
       TOTAL_SALES_BY_SKU_P6M,
       TOTAL_SALES_BY_SKU_P12M,
       STORE_CONTRIBUTION_LM,
       SKU_CONTRIBUTION_LM,
       SIZE_OF_PRICE_LM,
       STORE_CONTRIBUTION_P3M,
       SKU_CONTRIBUTION_P3M,
       SIZE_OF_PRICE_P3M,
       STORE_CONTRIBUTION_P6M,
       SKU_CONTRIBUTION_P6M,
       SIZE_OF_PRICE_P6M,
       STORE_CONTRIBUTION_P12M,
       SKU_CONTRIBUTION_P12M,
       SIZE_OF_PRICE_P12M,
	   TOTAL_SALES_LM_LP,
       TOTAL_SALES_P3M_LP,
       TOTAL_SALES_P6M_LP,
       TOTAL_SALES_P12M_LP,
       TOTAL_SALES_BY_STORE_LM_LP,
       TOTAL_SALES_BY_STORE_P3M_LP,
       TOTAL_SALES_BY_STORE_P6M_LP,
       TOTAL_SALES_BY_STORE_P12M_LP,
       TOTAL_SALES_BY_SKU_LM_LP,
       TOTAL_SALES_BY_SKU_P3M_LP,
       TOTAL_SALES_BY_SKU_P6M_LP,
       TOTAL_SALES_BY_SKU_P12M_LP,
       STORE_CONTRIBUTION_LM_LP,
       SKU_CONTRIBUTION_LM_LP,
       SIZE_OF_PRICE_LM_LP,
       STORE_CONTRIBUTION_P3M_LP,
       SKU_CONTRIBUTION_P3M_LP,
       SIZE_OF_PRICE_P3M_LP,
       STORE_CONTRIBUTION_P6M_LP,
       SKU_CONTRIBUTION_P6M_LP,
       SIZE_OF_PRICE_P6M_LP,
       STORE_CONTRIBUTION_P12M_LP,
       SKU_CONTRIBUTION_P12M_LP,
       SIZE_OF_PRICE_P12M_LP,
       COUNT(LM_SALES_FLAG) OVER (PARTITION BY CUSTOMER_AGG_DIM_KEY,PRODUCT_AGG_DIM_KEY,LM_SALES_FLAG,MDP_FLAG) AS lM_SALES_FLAG_COUNT,
       COUNT(P3M_SALES_FLAG) OVER (PARTITION BY CUSTOMER_AGG_DIM_KEY,PRODUCT_AGG_DIM_KEY,P3M_SALES_FLAG,MDP_FLAG) AS P3M_SALES_FLAG_COUNT,
       COUNT(P6M_SALES_FLAG) OVER (PARTITION BY CUSTOMER_AGG_DIM_KEY,PRODUCT_AGG_DIM_KEY,P6M_SALES_FLAG,MDP_FLAG) AS P6M_SALES_FLAG_COUNT,
       COUNT(P12M_SALES_FLAG) OVER (PARTITION BY CUSTOMER_AGG_DIM_KEY,PRODUCT_AGG_DIM_KEY,P12M_SALES_FLAG,MDP_FLAG) AS P12M_SALES_FLAG_COUNT,
       COUNT(MDP_FLAG) OVER (PARTITION BY CUSTOMER_AGG_DIM_KEY,PRODUCT_AGG_DIM_KEY,MDP_FLAG) AS MDP_FLAG_COUNT,
       SYSDATE() AS CRTD_DTTM
FROM WKS_VN_RPT_RETAIL_EXCELLENCE_GCPH GCPH
    LEFT JOIN wks_vn_re_target_compliance TRGT_CMP on (GCPH.fisc_per=TRGT_CMP.fisc_per and UPPER(GCPH.global_product_brand)=UPPER(TRGT_CMP.global_product_brand))
);
