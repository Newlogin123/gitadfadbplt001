delete from PROD_DNA_CORE.DBT_CLOUD_PR_5458_1220.PHLWKS_INTEGRATION__WKS_RPT_REGIONAL_PH_SELLOUT_OFFTAKE_NPD;

insert into PROD_DNA_CORE.DBT_CLOUD_PR_5458_1220.PHLWKS_INTEGRATION__WKS_RPT_REGIONAL_PH_SELLOUT_OFFTAKE_NPD (

with wks_philippines_regional_sellout_npd as
(
    select * from PROD_DNA_CORE.DBT_CLOUD_PR_5458_1220.PHLWKS_INTEGRATION__WKS_PHILIPPINES_REGIONAL_SELLOUT_NPD
),
itg_mds_ap_customer360_config as
(
    select * from PROD_DNA_CORE.aspitg_integration.itg_mds_ap_customer360_config
)
 SELECT *,
        CASE WHEN sellout_sales_quantity<>0 then sellout_sales_value/sellout_sales_quantity ELSE 0 END AS selling_price,
        COUNT(CASE WHEN FIRST_SCAN_FLAG_MARKET_LEVEL = 'Y' THEN FIRST_SCAN_FLAG_MARKET_LEVEL END) over (partition by country_name,pka_product_key) as cnt_mkt FROM (
    SELECT *,
        CASE WHEN FIRST_SCAN_FLAG_PARENT_CUSTOMER_LEVEL_INITIAL='Y' AND rn_cus=1 THEN 'Y' ELSE 'N' END AS FIRST_SCAN_FLAG_PARENT_CUSTOMER_LEVEL,
        CASE WHEN FIRST_SCAN_FLAG_MARKET_LEVEL_INITIAL='Y' AND FIRST_SCAN_FLAG_PARENT_CUSTOMER_LEVEL_INITIAL='Y' AND rn_mkt=1 THEN 'Y' ELSE 'N' END AS FIRST_SCAN_FLAG_MARKET_LEVEL FROM (
    SELECT *,
        CASE WHEN Customer_Product_Min_Date>dateadd(week,(select param_value from itg_mds_ap_customer360_config where code='npd_buffer_weeks')::integer,Customer_Min_Date) THEN 'Y' ELSE 'N' END AS FIRST_SCAN_FLAG_PARENT_CUSTOMER_LEVEL_INITIAL,
        CASE WHEN Market_Product_Min_Date>dateadd(week,(select param_value from itg_mds_ap_customer360_config where code='npd_buffer_weeks')::integer,Market_Min_Date) THEN 'Y' ELSE 'N' END AS FIRST_SCAN_FLAG_MARKET_LEVEL_INITIAL
    FROM (
    SELECT year ::INTEGER AS YEAR,
        qrtr_no,
        mnth_id,
        mnth_no ::INTEGER AS MNTH_NO,
        cal_date,
        univ_year,
        univ_month,
        country_code,
        country_name,
        data_source,
        Customer_Product_Desc,
        soldto_code,
        distributor_code,
        distributor_name,
        store_code,
        store_name,
        store_type,
        DISTRIBUTOR_ADDITIONAL_ATTRIBUTE1,
        DISTRIBUTOR_ADDITIONAL_ATTRIBUTE2,
        DISTRIBUTOR_ADDITIONAL_ATTRIBUTE3,
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
        pka_product_key,
        pka_product_key_description,
        from_currency,
        to_currency,
        exchange_rate,
        NVL(sellout_sales_quantity,0) as sellout_sales_quantity,
        NVL(sellout_sales_value,0) as sellout_sales_value,
        sellout_sales_value_usd,
        LIST_PRICE,
        SELLOUT_VALUE_LIST_PRICE,
        0 as sellout_value_list_price_usd,
        Customer_Min_Date,
        Customer_Product_Min_Date,
        Market_Min_Date,
        Market_Product_Min_Date,
        rn_cus,
        rn_mkt,
        msl_product_code,
        msl_product_desc,
        channel,
        retail_env,
        crtd_dttm,
        updt_dttm   
    FROM wks_philippines_regional_sellout_npd
    )))
);
