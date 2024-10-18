delete from PROD_DNA_CORE.DBT_CLOUD_PR_5458_1220.VNMWKS_INTEGRATION__WKS_VIETNAM_REGIONAL_SELLOUT_OFFTAKE_NPD;

insert into PROD_DNA_CORE.DBT_CLOUD_PR_5458_1220.VNMWKS_INTEGRATION__WKS_VIETNAM_REGIONAL_SELLOUT_OFFTAKE_NPD(

with wks_vietnam_regional_sellout_npd as (
select * from PROD_DNA_CORE.DBT_CLOUD_PR_5458_1220.VNMWKS_INTEGRATION__WKS_VIETNAM_REGIONAL_SELLOUT_NPD
),
itg_mds_ap_customer360_config as (
select * from PROD_DNA_CORE.ASPITG_INTEGRATION.ITG_MDS_AP_CUSTOMER360_CONFIG
)

select *,
	   case when sellout_sales_quantity<>0 then sellout_sales_value/sellout_sales_quantity else 0 end as selling_price,
	   count(case when first_scan_flag_market_level = 'Y' then first_scan_flag_market_level end) over (partition by country_name,pka_product_key) as cnt_mkt from (
select *,
	   case when first_scan_flag_parent_customer_level_initial='Y' and rn_cus=1 then 'Y' else 'N' end as first_scan_flag_parent_customer_level,
	   case when first_scan_flag_market_level_initial='Y' and first_scan_flag_parent_customer_level_initial='Y' and rn_mkt=1 then 'Y' else 'N' end as first_scan_flag_market_level from (
select *,
	   -- CASE WHEN rn_cus=1 AND Customer_Product_Min_Date>dateadd(week,(select param_value from rg_sdl.sdl_mds_ap_customer360_config where code='npd_buffer_weeks')::integer,Customer_Min_Date) THEN 'Y' else 'N' END AS FIRST_SCAN_FLAG_PARENT_CUSTOMER_LEVEL,
	   -- CASE WHEN rn_mkt=1 AND Market_Product_Min_Date>dateadd(week,(select param_value from rg_sdl.sdl_mds_ap_customer360_config where code='npd_buffer_weeks')::integer,Market_Min_Date) THEN 'Y' else 'N' END AS FIRST_SCAN_FLAG_MARKET_LEVEL
	   case when customer_product_min_date>dateadd(week,(select param_value from itg_mds_ap_customer360_config where code='npd_buffer_weeks')::integer,customer_min_date) then 'Y' else 'N' end as first_scan_flag_parent_customer_level_initial,
	   case when market_product_min_date>dateadd(week,(select param_value from itg_mds_ap_customer360_config where code='npd_buffer_weeks')::integer,market_min_date) then 'Y' else 'N' end as first_scan_flag_market_level_initial
from (
select year,
       qrtr_no,
       mnth_id,
       mnth_no,
       cal_date,
	   univ_year,
	   univ_month,
	   country_code,
       country_name,
       data_source,
       soldto_code,
       distributor_code,
       distributor_name,
       store_code,
       store_name,
	   store_type,
       distributor_additional_attribute1,
       distributor_additional_attribute2,
       distributor_additional_attribute3,
       sap_parent_customer_key,
       sap_parent_customer_description,
       sap_customer_channel_key,
       sap_customer_channel_description,
       sap_customer_sub_channel_key,
       sap_sub_channel_description,
       sap_go_to_mdl_key,
       sap_go_to_mdl_description,
       sap_banner_key,
       sap_banner_description,
       sap_banner_format_key,
       sap_banner_format_description,
       retail_environment,
       region,
       zone_or_area,
       customer_segment_key,
       customer_segment_description,
       global_product_franchise,
       global_product_brand,
       global_product_sub_brand,
       global_product_variant,
       global_product_segment,
       global_product_subsegment,
       global_product_category,
       global_product_subcategory,
       global_put_up_description,
       ean,
       sku_code,
       sku_description,
       --greenlight_sku_flag,
       pka_product_key,
       pka_product_key_description,
	   --sls_org,
	   customer_product_desc,
       from_currency,
       to_currency,
       exchange_rate,
       sellout_sales_quantity,
       sellout_sales_value,
       sellout_sales_value_usd,
       0 as sellout_value_list_price,
       0 as sellout_value_list_price_usd,
	   customer_min_date,
	   customer_product_min_date,
	   market_min_date,
	   market_product_min_date,
	   rn_cus,
	   rn_mkt,
       msl_product_code,
       msl_product_desc,
       retail_env,
       channel,
	   crtd_dttm,
	   updt_dttm   	   
from wks_vietnam_regional_sellout_npd
 )))
);
