CREATE or replace TABLE PROD_DNA_CORE.ASPEDW_INTEGRATION.EDW_RPT_REGIONAL_SELLOUT_OFFTAKE (	
    year numeric(18,0),		
    qrtr_no varchar(14),	
    mnth_id varchar(23),	
    mnth_no numeric(18,0),	
    cal_date date,		
    week_start_date date,		
    univ_year numeric(18,0),	
    univ_month numeric(18,0),	
    country_code varchar(2),	
    country_name varchar(50),	
    data_source varchar(14),	
    soldto_code varchar(255),	
    distributor_code varchar(100),	
    distributor_name varchar(255),	
    store_code varchar(100),		
    store_name varchar(500),		
    store_type varchar(255),		
    distributor_additional_attribute1 varchar(150),	
    distributor_additional_attribute2 varchar(150),	
    distributor_additional_attribute3 varchar(150),	
    sap_parent_customer_key varchar(12),		
    sap_parent_customer_description varchar(75),
    sap_customer_channel_key varchar(12),		
    sap_customer_channel_description varchar(75),	
    sap_customer_sub_channel_key varchar(12),		
    sap_sub_channel_description varchar(75),		
    sap_go_to_mdl_key varchar(12),		
    sap_go_to_mdl_description varchar(75),		
    sap_banner_key varchar(12),		
    sap_banner_description varchar(75),		
    sap_banner_format_key varchar(12),		
    sap_banner_format_description varchar(75),		
    retail_environment varchar(50),		
    region varchar(150),		
    zone_or_area varchar(150),		
    customer_segment_key varchar(12),	
    customer_segment_description varchar(50),
    global_product_franchise varchar(30),		
    global_product_brand varchar(30),	
    global_product_sub_brand varchar(100),		
    global_product_variant varchar(100),		
    global_product_segment varchar(50),		
    global_product_subsegment varchar(100),		
    global_product_category varchar(50),		
    global_product_subcategory varchar(50),		
    global_put_up_description varchar(100),		
    ean varchar(50),		
    sku_code varchar(40),	
    sku_description varchar(150),		
    pka_product_key varchar(68),		
    pka_product_key_description varchar(255),		
    from_currency varchar(5),	
    to_currency varchar(5),		
    exchange_rate numeric(15,5),
    sellout_sales_quantity numeric(38,6),	
    sellout_sales_value numeric(38,6),		
    sellout_sales_value_usd numeric(38,11),	
    list_price numeric(38,6),		
    sellout_value_list_price numeric(38,12),		
    sellout_value_list_price_usd numeric(38,17),	
    selling_price numeric(38,4),		
    first_scan_flag_parent_customer_level varchar(1),		
    first_scan_flag_market_level varchar(1),		
    npd_flag_market_level varchar(1),		
    npd_flag_parent_customer_level varchar(1),		
    customer_product_desc varchar(300),
    msl_product_code varchar(150),		
    msl_product_desc varchar(300),		
    store_grade varchar(150),		
    retail_env varchar(150),		
    channel varchar(150),		
    crtd_dttm timestamp without time zone,	
    updt_dttm timestamp without time zone,	
    numeric_distribution numeric(20,4),		
    weighted_distribution numeric(20,4),	
    store_count_where_scanned numeric(20,4)	
)