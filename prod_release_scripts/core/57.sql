
--------------------------------------------------

insert into CORE_INTEGRATION.DBTTEST_TABLES_METADATA values('sdl_vn_dms_call_details','select * from TRATBL_sdl_vn_dms_call_details__duplicate_test;');
insert into CORE_INTEGRATION.DBTTEST_TABLES_METADATA values('sdl_vn_dms_customer_dim','select * from TRATBL_sdl_vn_dms_customer_dim__null_test
union all
select * from TRATBL_sdl_vn_dms_customer_dim__duplicate_test;');
insert into CORE_INTEGRATION.DBTTEST_TABLES_METADATA values('sdl_vn_dms_distributor_dim','select * from TRATBL_sdl_vn_dms_distributor_dim__null_test
union all
select * from TRATBL_sdl_vn_dms_distributor_dim__duplicate_test;');
insert into CORE_INTEGRATION.DBTTEST_TABLES_METADATA values('sdl_vn_interface_notes','select * from TRATBL_sdl_vn_interface_notes__null_test
union all
select * from TRATBL_sdl_vn_interface_notes__duplicate_test;');
insert into CORE_INTEGRATION.DBTTEST_TABLES_METADATA values('sdl_vn_interface_choices','select * from TRATBL_sdl_vn_interface_choices__null_test
union all
select * from TRATBL_sdl_vn_interface_choices__duplicate_test;');
insert into CORE_INTEGRATION.DBTTEST_TABLES_METADATA values('sdl_vn_interface_answers','select * from TRATBL_sdl_vn_interface_answers__null_test
union all
select * from TRATBL_sdl_vn_interface_answers__duplicate_test;');
insert into CORE_INTEGRATION.DBTTEST_TABLES_METADATA values('sdl_vn_interface_customer_visited','select * from TRATBL_sdl_vn_interface_customer_visited__null_test
union all
select * from TRATBL_sdl_vn_interface_customer_visited__duplicate_test;');
insert into CORE_INTEGRATION.DBTTEST_TABLES_METADATA values('sdl_vn_interface_branch','select * from TRATBL_sdl_vn_interface_branch__null_test
union all
select * from TRATBL_sdl_vn_interface_branch__duplicate_test;');
insert into CORE_INTEGRATION.DBTTEST_TABLES_METADATA values('sdl_vn_interface_ise_header','select * from TRATBL_sdl_vn_interface_ise_header__null_test
union all
select * from TRATBL_sdl_vn_interface_ise_header__duplicate_test;');
insert into CORE_INTEGRATION.DBTTEST_TABLES_METADATA values('sdl_vn_interface_question','select * from TRATBL_sdl_vn_interface_question__null_test
union all
select * from TRATBL_sdl_vn_interface_question__duplicate_test;');
insert into CORE_INTEGRATION.DBTTEST_TABLES_METADATA values('sdl_vn_interface_cpg','select * from TRATBL_sdl_vn_interface_cpg__null_test
union all
select * from TRATBL_sdl_vn_interface_cpg__duplicate_test;');
insert into CORE_INTEGRATION.DBTTEST_TABLES_METADATA values('sdl_vn_dms_forecast','select * from TRATBL_sdl_vn_dms_forecast__null_test
union all
select * from TRATBL_sdl_vn_dms_forecast__duplicate_test;');
insert into CORE_INTEGRATION.DBTTEST_TABLES_METADATA values('sdl_vn_dms_kpi','select * from TRATBL_sdl_vn_dms_kpi__duplicate_test
union all
select * from TRATBL_sdl_vn_dms_kpi__null_test;');
insert into CORE_INTEGRATION.DBTTEST_TABLES_METADATA values('sdl_vn_dms_kpi_sellin_sellthrgh','select * from TRATBL_sdl_vn_dms_kpi_sellin_sellthrgh__null_test
union all
select * from TRATBL_sdl_vn_dms_kpi_sellin_sellthrgh__duplicate_test;');
insert into CORE_INTEGRATION.DBTTEST_TABLES_METADATA values('sdl_spiral_mti_offtake','select * from TRATBL_sdl_spiral_mti_offtake__null_test;');
insert into CORE_INTEGRATION.DBTTEST_TABLES_METADATA values('sdl_vn_oneview_otc','select * from TRATBL_sdl_vn_oneview_otc__null_test
union all
select * from TRATBL_sdl_vn_oneview_otc__format_test;');
insert into CORE_INTEGRATION.DBTTEST_TABLES_METADATA values('sdl_vn_dms_product_dim','select * from TRATBL_sdl_vn_dms_product_dim__null_test
union all
select * from TRATBL_sdl_vn_dms_product_dim__duplicate_test;');
insert into CORE_INTEGRATION.DBTTEST_TABLES_METADATA values('sdl_vn_product_mapping','select * from TRATBL_sdl_vn_product_mapping__null_test
union all
select * from TRATBL_sdl_vn_product_mapping__duplicate_test;');
insert into CORE_INTEGRATION.DBTTEST_TABLES_METADATA values('sdl_vn_dms_promotion_list','select * from TRATBL_sdl_vn_dms_promotion_list__null_test
union all
select * from TRATBL_sdl_vn_dms_promotion_list__duplicate_test;');
insert into CORE_INTEGRATION.DBTTEST_TABLES_METADATA values('sdl_vn_gt_topdoor_target','select * from TRATBL_sdl_vn_gt_topdoor_target__duplicate_test
union all
select * from TRATBL_sdl_vn_gt_topdoor_target__null_test
union all
select * from TRATBL_sdl_vn_gt_topdoor_target__format_test;');
insert into CORE_INTEGRATION.DBTTEST_TABLES_METADATA values('sdl_vn_dms_order_promotion','select * from TRATBL_sdl_vn_dms_order_promotion__duplicate_test;');
insert into CORE_INTEGRATION.DBTTEST_TABLES_METADATA values('sdl_vn_dms_sales_org_dim','select * from TRATBL_sdl_vn_dms_sales_org_dim__null_test
union all
select * from TRATBL_sdl_vn_dms_sales_org_dim__duplicate_test
union all
select * from TRATBL_sdl_vn_dms_sales_org_dim__test_format
union all
select * from TRATBL_sdl_vn_dms_sales_org_dim__test_format2;');
insert into CORE_INTEGRATION.DBTTEST_TABLES_METADATA values('sdl_vn_dms_sales_stock_fact','select * from TRATBL_sdl_vn_dms_sales_stock_fact__null_test
union all
select * from TRATBL_sdl_vn_dms_sales_stock_fact__duplicate_test;');
insert into CORE_INTEGRATION.DBTTEST_TABLES_METADATA values('sdl_vn_dksh_daily_sales','select * from TRATBL_sdl_vn_dksh_daily_sales__null_test;');
insert into CORE_INTEGRATION.DBTTEST_TABLES_METADATA values('sdl_vn_dms_msl','select * from TRATBL_sdl_vn_dms_msl__null_test
union all
select * from TRATBL_sdl_vn_dms_msl__duplicate_test;');
insert into CORE_INTEGRATION.DBTTEST_TABLES_METADATA values('sdl_vn_mt_sellin_coop','select * from TRATBL_sdl_vn_mt_sellin_coop__lookup_test2
union all
select * from TRATBL_sdl_vn_mt_sellin_coop__null_test
union all
select * from TRATBL_sdl_vn_mt_sellin_coop__lookup_test;');
insert into CORE_INTEGRATION.DBTTEST_TABLES_METADATA values('sdl_vn_mt_sellin_dksh','select * from TRATBL_sdl_vn_mt_sellin_dksh__null_test;');
insert into CORE_INTEGRATION.DBTTEST_TABLES_METADATA values('sdl_vn_dms_yearly_target','select * from TRATBL_sdl_vn_dms_yearly_target__null_test
union all
select * from TRATBL_sdl_vn_dms_yearly_target__duplicate_test;');
insert into CORE_INTEGRATION.DBTTEST_TABLES_METADATA values('sdl_vn_mt_sellout_con_cung','select * from TRATBL_sdl_vn_mt_sellout_con_cung__null_test;');
insert into CORE_INTEGRATION.DBTTEST_TABLES_METADATA values('sdl_vn_mt_sellout_guardian','select * from TRATBL_sdl_vn_mt_sellout_guardian__null_test;');
insert into CORE_INTEGRATION.DBTTEST_TABLES_METADATA values('sdl_vn_dms_d_sellout_sales_fact','select * from TRATBL_sdl_vn_dms_d_sellout_sales_fact__duplicate_test;');
insert into CORE_INTEGRATION.DBTTEST_TABLES_METADATA values('sdl_vn_mt_sellout_mega','select * from TRATBL_sdl_vn_mt_sellout_mega__null_test
union all
select * from TRATBL_sdl_vn_mt_sellout_mega__duplicate_test;');
insert into CORE_INTEGRATION.DBTTEST_TABLES_METADATA values('sdl_vn_mt_sellout_coop','select * from TRATBL_sdl_vn_mt_sellout_coop__null_test
union all
select * from TRATBL_sdl_vn_mt_sellout_coop__duplicate_test;');
insert into CORE_INTEGRATION.DBTTEST_TABLES_METADATA values('sdl_vn_mt_sellout_vinmart','select * from TRATBL_sdl_vn_mt_sellout_vinmart__null_test
union all
select * from TRATBL_sdl_vn_mt_sellout_vinmart__duplicate_test;');
insert into CORE_INTEGRATION.DBTTEST_TABLES_METADATA values('sdl_vn_dms_history_saleout','select * from TRATBL_sdl_vn_dms_history_saleout__duplicate_test;');
insert into CORE_INTEGRATION.DBTTEST_TABLES_METADATA values('sdl_vn_dms_sellthrgh_sales_fact','select * from TRATBL_sdl_vn_dms_sellthrgh_sales_fact__null_test
union all
select * from TRATBL_sdl_vn_dms_sellthrgh_sales_fact__duplicate_test;');