create view aspedw_integration.v_rpt_copa
as
(
  with edw_copa_trans_fact as(
      select * from aspedw_integration.edw_copa_trans_fact
  ),
  edw_calendar_dim as(
      select * from aspedw_integration.edw_calendar_dim
  ),
  edw_company_dim as(
      select * from aspedw_integration.edw_company_dim
  ),
  edw_material_dim as(
      select * from aspedw_integration.edw_material_dim
  ),
  v_intrm_reg_crncy_exch_fiscper as(
      select * from aspedw_integration.v_intrm_reg_crncy_exch_fiscper
  ),
  edw_invoice_fact as(
      select * from aspedw_integration.edw_invoice_fact
  ),
  v_edw_customer_sales_dim as(
      select * from aspedw_integration.v_edw_customer_sales_dim
  ),

  transformed as(

    select
    main.prev_fisc_yr_per as "prev_fisc_yr_per",
    main.latest_date as "latest_date",
    main.latest_fisc_yrmnth as "latest_fisc_yrmnth",
    main.fisc_yr as "fisc_yr",
    main.fisc_yr_per as "fisc_yr_per",
    main.fisc_day as "fisc_day",
    main.ctry_nm as "ctry_nm",
    main."cluster",
    main.obj_crncy_co_obj as "obj_crncy_co_obj",
    mat.mega_brnd_desc as "b1 mega-brand",
    mat.brnd_desc as "b2 brand",
    mat.base_prod_desc as "b3 base product",
    mat.varnt_desc as "b4 variant",
    mat.put_up_desc as "b5 put-up",
    mat.prodh1_txtmd as "prod h1 operating group",
    mat.prodh2_txtmd as "prod h2 franchise group",
    mat.prodh3_txtmd as "prod h3 franchise",
    mat.prodh4_txtmd as "prod h4 product franchise",
    mat.prodh5_txtmd as "prod h5 product major",
    mat.prodh6_txtmd as "prod h6 product minor",
    cus_sales_extn."parent customer",
    cus_sales_extn."banner" as "banner",
    cus_sales_extn."banner format",
    cus_sales_extn."channel" as "channel",
    cus_sales_extn."go to model",
    cus_sales_extn."sub channel",
    cus_sales_extn."retail_env" as "retail_env",
    SUM(main.nts_usd) as "nts_usd",
    SUM(main.nts_lcy) as "nts_lcy",
    SUM(main.gts_usd) as "gts_usd",
    SUM(main.gts_lcy) as "gts_lcy",
    SUM(main.eq_usd) as "eq_usd",
    SUM(main.eq_lcy) as "eq_lcy",
    main.from_crncy as "from_crncy",
    main.to_crncy as "to_crncy",
    SUM(main.nts_qty) as "nts_qty",
    SUM(main.gts_qty) as "gts_qty",
    SUM(main.eq_qty) as "eq_qty",
    SUM(main.ord_pc_qty) as "ord_pc_qty",
    SUM(main.unspp_qty) as "unspp_qty",
    main.cust_num as "cust_num"
  FROM (
    (
      (
        (
          SELECT
            cast((((
                  cast((
                    cast((
                      DATE_PART(
                        'YEAR',
                        (
                          TO_DATE(
                            (
                              cast((
                                cast((
                                  calendar.fisc_yr
                                ) as VARCHAR)
                              ) as TEXT) || SUBSTRING(cast((
                                cast((
                                  calendar.fisc_per
                                ) as VARCHAR)
                              ) as TEXT), 6)
                            ),
                            cast((
                              cast('yyyymm' as VARCHAR)
                            ) as TEXT)
                          ) -1
                        )
                      )
                    ) as VARCHAR)
                  ) as TEXT) || cast((
                    cast('0' as VARCHAR)
                  ) as TEXT)
                ) || cast((
                  cast((
                    DATE_PART(
                    'MONTH',
                      (
                        TO_DATE(
                          (
                            cast((
                              cast((
                                calendar.fisc_yr
                              ) AS VARCHAR)
                            ) AS TEXT) || SUBSTRING(cast((
                              cast((
                                calendar.fisc_per
                              ) AS VARCHAR)
                            ) AS TEXT), 6)
                          ),
                          cast((
                            cast('yyyymm' AS VARCHAR)
                          ) AS TEXT)
                        ) - 1
                      )
                    )
                  ) AS VARCHAR)
                ) AS TEXT)
              )
            ) AS VARCHAR) AS prev_fisc_yr_per,
              TO_CHAR(
            CONVERT_TIMEZONE(
              'Asia/Singapore',
              CURRENT_TIMESTAMP::TIMESTAMP_NTZ
            )::TIMESTAMP_NTZ,
            'YYYYMMDD'
        ) AS latest_date,
            cast((
              (
                cast((
                  cast((
                    calendar.fisc_yr
                  ) AS VARCHAR)
                ) AS TEXT) || SUBSTRING(cast((
                  cast((
                    calendar.fisc_per
                  ) AS VARCHAR)
                ) AS TEXT), 6)
              )
            ) AS VARCHAR) AS latest_fisc_yrmnth,
            copa.fisc_yr,
            copa.fisc_yr_per,
            TO_DATE(
              (
                (
                  SUBSTRING(cast((
                    cast((
                      copa.fisc_yr_per
                    ) AS VARCHAR)
                  ) AS TEXT), 6, 8) || cast((
                    cast('01' AS VARCHAR)
                  ) AS TEXT)
                ) || SUBSTRING(cast((
                  cast((
                    copa.fisc_yr_per
                  ) AS VARCHAR)
                ) AS TEXT), 1, 4)
              ),
              cast((
                cast('MMDDYYYY' AS VARCHAR)
              ) AS TEXT)
            ) AS fisc_day,
            CASE
              WHEN (
                (
                  (
                    (
                      (
                        (
                          (
                            LTRIM(
                              cast((
                                copa.cust_num
                              ) AS TEXT),
                              cast((
                                cast((
                                  0
                                ) AS VARCHAR)
                              ) AS TEXT)
                            ) = cast((
                              cast('134559' AS VARCHAR)
                            ) AS TEXT)
                          )
                          OR (
                            LTRIM(
                              cast((
                                copa.cust_num
                              ) AS TEXT),
                              cast((
                                cast((
                                  0
                                ) AS VARCHAR)
                              ) AS TEXT)
                            ) = cast((
                              cast('134106' AS VARCHAR)
                            ) AS TEXT)
                          )
                        )
                        OR (
                          LTRIM(
                            cast((
                              copa.cust_num
                            ) AS TEXT),
                            cast((
                              cast((
                                0
                              ) AS VARCHAR)
                            ) AS TEXT)
                          ) = cast((
                            cast('134258' AS VARCHAR)
                          ) AS TEXT)
                        )
                      )
                      OR (
                        LTRIM(
                          cast((
                            copa.cust_num
                          ) AS TEXT),
                          cast((
                            cast((
                              0
                            ) AS VARCHAR)
                          ) AS TEXT)
                        ) = cast((
                          cast('134855' AS VARCHAR)
                        ) AS TEXT)
                      )
                    )
                    AND (
                      LTRIM(
                        cast((
                          copa.acct_num
                        ) AS TEXT),
                        cast((
                          cast((
                            0
                          ) AS VARCHAR)
                        ) AS TEXT)
                      ) <> cast((
                        cast('403185' AS VARCHAR)
                      ) AS TEXT)
                    )
                  )
                  AND (
                    cast((
                      mat.mega_brnd_desc
                    ) AS TEXT) <> cast((
                      cast('Vogue Int''l' AS VARCHAR)
                    ) AS TEXT)
                  )
                )
                AND (
                  copa.fisc_yr = 2018
                )
              )
              THEN cast('China Selfcare' AS VARCHAR)
              ELSE cmp.ctry_group
            END AS ctry_nm,
            CASE
              WHEN (
                (
                  (
                    (
                      (
                        (
                          (
                            LTRIM(
                              cast((
                                copa.cust_num
                              ) AS TEXT),
                              cast((
                                cast((
                                  0
                                ) AS VARCHAR)
                              ) AS TEXT)
                            ) = cast((
                              cast('134559' AS VARCHAR)
                            ) AS TEXT)
                          )
                          OR (
                            LTRIM(
                              cast((
                                copa.cust_num
                              ) AS TEXT),
                              cast((
                                cast((
                                  0
                                ) AS VARCHAR)
                              ) AS TEXT)
                            ) = cast((
                              cast('134106' AS VARCHAR)
                            ) AS TEXT)
                          )
                        )
                        OR (
                          LTRIM(
                            cast((
                              copa.cust_num
                            ) AS TEXT),
                            cast((
                              cast((
                                0
                              ) AS VARCHAR)
                            ) AS TEXT)
                          ) = cast((
                            cast('134258' AS VARCHAR)
                          ) AS TEXT)
                        )
                      )
                      OR (
                        LTRIM(
                          cast((
                            copa.cust_num
                          ) AS TEXT),
                          cast((
                            cast((
                              0
                            ) AS VARCHAR)
                          ) AS TEXT)
                        ) = cast((
                          cast('134855' AS VARCHAR)
                        ) AS TEXT)
                      )
                    )
                    AND (
                      LTRIM(
                        cast((
                          copa.acct_num
                        ) AS TEXT),
                        cast((
                          cast((
                            0
                          ) AS VARCHAR)
                        ) AS TEXT)
                      ) <> cast((
                        cast('403185' AS VARCHAR)
                      ) AS TEXT)
                    )
                  )
                  AND (
                    cast((
                      mat.mega_brnd_desc
                    ) AS TEXT) <> cast((
                      cast('Vogue Int''l' AS VARCHAR)
                    ) AS TEXT)
                  )
                )
                AND (
                  copa.fisc_yr = 2018
                )
              )
              THEN cast('China' AS VARCHAR)
              ELSE cmp."cluster"
            END AS "cluster",
            CASE
              WHEN (
                cast((
                  cmp.ctry_group
                ) AS TEXT) = cast((
                  cast('India' AS VARCHAR)
                ) AS TEXT)
              )
              THEN cast('INR' AS VARCHAR)
              WHEN (
                cast((
                  cmp.ctry_group
                ) AS TEXT) = cast((
                  cast('Philippines' AS VARCHAR)
                ) AS TEXT)
              )
              THEN cast('PHP' AS VARCHAR)
              WHEN (
                (
                  cast((
                    cmp.ctry_group
                  ) AS TEXT) = cast((
                    cast('China Selfcare' AS VARCHAR)
                  ) AS TEXT)
                )
                OR (
                  cast((
                    cmp.ctry_group
                  ) AS TEXT) = cast((
                    cast('China Personal Care' AS VARCHAR)
                  ) AS TEXT)
                )
              )
              THEN cast('RMB' AS VARCHAR)
              ELSE copa.obj_crncy_co_obj
            END AS obj_crncy_co_obj,
            copa.matl_num,
            copa.co_cd,
            CASE
              WHEN (
                (
                  LTRIM(cast((
                    copa.cust_num
                  ) AS TEXT), cast((
                    cast('0' AS VARCHAR)
                  ) AS TEXT)) = cast((
                    cast('135520' AS VARCHAR)
                  ) AS TEXT)
                )
                AND (
                  (
                    cast((
                      copa.co_cd
                    ) AS TEXT) = cast((
                      cast('703A' AS VARCHAR)
                    ) AS TEXT)
                  )
                  OR (
                    cast((
                      copa.co_cd
                    ) AS TEXT) = cast((
                      cast('8888' AS VARCHAR)
                    ) AS TEXT)
                  )
                )
              )
              THEN cast('100A' AS VARCHAR)
              ELSE copa.sls_org
            END AS sls_org,
            CASE
              WHEN (
                (
                  LTRIM(cast((
                    copa.cust_num
                  ) AS TEXT), cast((
                    cast('0' AS VARCHAR)
                  ) AS TEXT)) = cast((
                    cast('135520' AS VARCHAR)
                  ) AS TEXT)
                )
                AND (
                  (
                    cast((
                      copa.co_cd
                    ) AS TEXT) = cast((
                      cast('703A' AS VARCHAR)
                    ) AS TEXT)
                  )
                  OR (
                    cast((
                      copa.co_cd
                    ) AS TEXT) = cast((
                      cast('8888' AS VARCHAR)
                    ) AS TEXT)
                  )
                )
              )
              THEN cast('15' AS VARCHAR)
              ELSE copa.dstr_chnl
            END AS dstr_chnl,
            copa.div,
            copa.cust_num,
            CASE
              WHEN (
                (
                  cast((
                    copa.acct_hier_shrt_desc
                  ) AS TEXT) = cast((
                    cast('NTS' AS VARCHAR)
                  ) AS TEXT)
                )
                AND (
                  cast((
                    exch_rate.to_crncy
                  ) AS TEXT) = cast((
                    cast('USD' AS VARCHAR)
                  ) AS TEXT)
                )
              )
              THEN SUM((
                copa.amt_obj_crncy * exch_rate.ex_rt
              ))
              ELSE cast((
                cast((
                  0
                ) AS DECIMAL)
              ) AS DECIMAL(18, 0))
            END AS nts_usd,
            CASE
              WHEN (
                (
                  cast((
                    copa.acct_hier_shrt_desc
                  ) AS TEXT) = cast((
                    cast('NTS' AS VARCHAR)
                  ) AS TEXT)
                )
                AND (
                  cast((
                    exch_rate.to_crncy
                  ) AS TEXT) = cast((
                    CASE
                      WHEN (
                        (
                          cast((
                            cmp.ctry_group
                          ) AS TEXT) = cast((
                            cast('India' AS VARCHAR)
                          ) AS TEXT)
                        )
                        OR (
                          (
                            cmp.ctry_group IS NULL
                          ) AND (
                            'India' IS NULL
                          )
                        )
                      )
                      THEN cast('INR' AS VARCHAR)
                      WHEN (
                        (
                          cast((
                            cmp.ctry_group
                          ) AS TEXT) = cast((
                            cast('Philippines' AS VARCHAR)
                          ) AS TEXT)
                        )
                        OR (
                          (
                            cmp.ctry_group IS NULL
                          ) AND (
                            'Philippines' IS NULL
                          )
                        )
                      )
                      THEN cast('PHP' AS VARCHAR)
                      WHEN (
                        (
                          cast((
                            cmp.ctry_group
                          ) AS TEXT) = cast((
                            cast('China Selfcare' AS VARCHAR)
                          ) AS TEXT)
                        )
                        OR (
                          (
                            cmp.ctry_group IS NULL
                          ) AND (
                            'China Selfcare' IS NULL
                          )
                        )
                      )
                      THEN cast('RMB' AS VARCHAR)
                      WHEN (
                        (
                          cast((
                            cmp.ctry_group
                          ) AS TEXT) = cast((
                            cast('China Personal Care' AS VARCHAR)
                          ) AS TEXT)
                        )
                        OR (
                          (
                            cmp.ctry_group IS NULL
                          ) AND (
                            'China Personal Care' IS NULL
                          )
                        )
                      )
                      THEN cast('RMB' AS VARCHAR)
                      ELSE copa.obj_crncy_co_obj
                    END
                  ) AS TEXT)
                )
              )
              THEN SUM((
                copa.amt_obj_crncy * exch_rate.ex_rt
              ))
              ELSE cast((
                cast((
                  0
                ) AS DECIMAL)
              ) AS DECIMAL(18, 0))
            END AS nts_lcy,
            CASE
              WHEN (
                (
                  cast((
                    copa.acct_hier_shrt_desc
                  ) AS TEXT) = cast((
                    cast('GTS' AS VARCHAR)
                  ) AS TEXT)
                )
                AND (
                  cast((
                    exch_rate.to_crncy
                  ) AS TEXT) = cast((
                    cast('USD' AS VARCHAR)
                  ) AS TEXT)
                )
              )
              THEN SUM((
                copa.amt_obj_crncy * exch_rate.ex_rt
              ))
              ELSE cast((
                cast((
                  0
                ) AS DECIMAL)
              ) AS DECIMAL(18, 0))
            END AS gts_usd,
            CASE
              WHEN (
                (
                  cast((
                    copa.acct_hier_shrt_desc
                  ) AS TEXT) = cast((
                    cast('GTS' AS VARCHAR)
                  ) AS TEXT)
                )
                AND (
                  cast((
                    exch_rate.to_crncy
                  ) AS TEXT) = cast((
                    CASE
                      WHEN (
                        (
                          cast((
                            cmp.ctry_group
                          ) AS TEXT) = cast((
                            cast('India' AS VARCHAR)
                          ) AS TEXT)
                        )
                        OR (
                          (
                            cmp.ctry_group IS NULL
                          ) AND (
                            'India' IS NULL
                          )
                        )
                      )
                      THEN cast('INR' AS VARCHAR)
                      WHEN (
                        (
                          cast((
                            cmp.ctry_group
                          ) AS TEXT) = cast((
                            cast('Philippines' AS VARCHAR)
                          ) AS TEXT)
                        )
                        OR (
                          (
                            cmp.ctry_group IS NULL
                          ) AND (
                            'Philippines' IS NULL
                          )
                        )
                      )
                      THEN cast('PHP' AS VARCHAR)
                      WHEN (
                        (
                          cast((
                            cmp.ctry_group
                          ) AS TEXT) = cast((
                            cast('China Selfcare' AS VARCHAR)
                          ) AS TEXT)
                        )
                        OR (
                          (
                            cmp.ctry_group IS NULL
                          ) AND (
                            'China Selfcare' IS NULL
                          )
                        )
                      )
                      THEN cast('RMB' AS VARCHAR)
                      WHEN (
                        (
                          cast((
                            cmp.ctry_group
                          ) AS TEXT) = cast((
                            cast('China Personal Care' AS VARCHAR)
                          ) AS TEXT)
                        )
                        OR (
                          (
                            cmp.ctry_group IS NULL
                          ) AND (
                            'China Personal Care' IS NULL
                          )
                        )
                      )
                      THEN cast('RMB' AS VARCHAR)
                      ELSE copa.obj_crncy_co_obj
                    END
                  ) AS TEXT)
                )
              )
              THEN SUM((
                copa.amt_obj_crncy * exch_rate.ex_rt
              ))
              ELSE cast((
                cast((
                  0
                ) AS DECIMAL)
              ) AS DECIMAL(18, 0))
            END AS gts_lcy,
            CASE
              WHEN (
                (
                  cast((
                    copa.acct_hier_shrt_desc
                  ) AS TEXT) = cast((
                    cast('EQ' AS VARCHAR)
                  ) AS TEXT)
                )
                AND (
                  cast((
                    exch_rate.to_crncy
                  ) AS TEXT) = cast((
                    cast('USD' AS VARCHAR)
                  ) AS TEXT)
                )
              )
              THEN SUM((
                copa.amt_obj_crncy * exch_rate.ex_rt
              ))
              ELSE cast((
                cast((
                  0
                ) AS DECIMAL)
              ) AS DECIMAL(18, 0))
            END AS eq_usd,
            CASE
              WHEN (
                (
                  cast((
                    copa.acct_hier_shrt_desc
                  ) AS TEXT) = cast((
                    cast('EQ' AS VARCHAR)
                  ) AS TEXT)
                )
                AND (
                  cast((
                    exch_rate.to_crncy
                  ) AS TEXT) = cast((
                    CASE
                      WHEN (
                        (
                          cast((
                            cmp.ctry_group
                          ) AS TEXT) = cast((
                            cast('India' AS VARCHAR)
                          ) AS TEXT)
                        )
                        OR (
                          (
                            cmp.ctry_group IS NULL
                          ) AND (
                            'India' IS NULL
                          )
                        )
                      )
                      THEN cast('INR' AS VARCHAR)
                      WHEN (
                        (
                          cast((
                            cmp.ctry_group
                          ) AS TEXT) = cast((
                            cast('Philippines' AS VARCHAR)
                          ) AS TEXT)
                        )
                        OR (
                          (
                            cmp.ctry_group IS NULL
                          ) AND (
                            'Philippines' IS NULL
                          )
                        )
                      )
                      THEN cast('PHP' AS VARCHAR)
                      WHEN (
                        (
                          cast((
                            cmp.ctry_group
                          ) AS TEXT) = cast((
                            cast('China Selfcare' AS VARCHAR)
                          ) AS TEXT)
                        )
                        OR (
                          (
                            cmp.ctry_group IS NULL
                          ) AND (
                            'China Selfcare' IS NULL
                          )
                        )
                      )
                      THEN cast('RMB' AS VARCHAR)
                      WHEN (
                        (
                          cast((
                            cmp.ctry_group
                          ) AS TEXT) = cast((
                            cast('China Personal Care' AS VARCHAR)
                          ) AS TEXT)
                        )
                        OR (
                          (
                            cmp.ctry_group IS NULL
                          ) AND (
                            'China Personal Care' IS NULL
                          )
                        )
                      )
                      THEN cast('RMB' AS VARCHAR)
                      ELSE copa.obj_crncy_co_obj
                    END
                  ) AS TEXT)
                )
              )
              THEN SUM((
                copa.amt_obj_crncy * exch_rate.ex_rt
              ))
              ELSE cast((
                cast(NULL AS DECIMAL)
              ) AS DECIMAL(18, 0))
            END AS eq_lcy,
            CASE
              WHEN (
                cast((
                  cmp.ctry_group
                ) AS TEXT) = cast((
                  cast('India' AS VARCHAR)
                ) AS TEXT)
              )
              THEN cast('INR' AS VARCHAR)
              WHEN (
                cast((
                  cmp.ctry_group
                ) AS TEXT) = cast((
                  cast('Philippines' AS VARCHAR)
                ) AS TEXT)
              )
              THEN cast('PHP' AS VARCHAR)
              WHEN (
                (
                  cast((
                    cmp.ctry_group
                  ) AS TEXT) = cast((
                    cast('China Selfcare' AS VARCHAR)
                  ) AS TEXT)
                )
                OR (
                  cast((
                    cmp.ctry_group
                  ) AS TEXT) = cast((
                    cast('China Personal Care' AS VARCHAR)
                  ) AS TEXT)
                )
              )
              THEN cast('RMB' AS VARCHAR)
              ELSE exch_rate.from_crncy
            END AS from_crncy,
            exch_rate.to_crncy,
            CASE
              WHEN (
                (
                  cast((
                    copa.acct_hier_shrt_desc
                  ) AS TEXT) = cast((
                    cast('NTS' AS VARCHAR)
                  ) AS TEXT)
                )
                AND (
                  cast((
                    exch_rate.to_crncy
                  ) AS TEXT) = cast((
                    cast('USD' AS VARCHAR)
                  ) AS TEXT)
                )
              )
              THEN SUM(copa.qty)
              ELSE cast((
                cast((
                  0
                ) AS DECIMAL)
              ) AS DECIMAL(18, 0))
            END AS nts_qty,
            CASE
              WHEN (
                (
                  cast((
                    copa.acct_hier_shrt_desc
                  ) AS TEXT) = cast((
                    cast('GTS' AS VARCHAR)
                  ) AS TEXT)
                )
                AND (
                  cast((
                    exch_rate.to_crncy
                  ) AS TEXT) = cast((
                    cast('USD' AS VARCHAR)
                  ) AS TEXT)
                )
              )
              THEN SUM(copa.qty)
              ELSE cast((
                cast((
                  0
                ) AS DECIMAL)
              ) AS DECIMAL(18, 0))
            END AS gts_qty,
            CASE
              WHEN (
                (
                  cast((
                    copa.acct_hier_shrt_desc
                  ) AS TEXT) = cast((
                    cast('EQ' AS VARCHAR)
                  ) AS TEXT)
                )
                AND (
                  cast((
                    exch_rate.to_crncy
                  ) AS TEXT) = cast((
                    cast('USD' AS VARCHAR)
                  ) AS TEXT)
                )
              )
              THEN SUM(copa.qty)
              ELSE cast((
                cast((
                  0
                ) AS DECIMAL)
              ) AS DECIMAL(18, 0))
            END AS eq_qty,
            0 AS ord_pc_qty,
            0 AS unspp_qty
          FROM (
            (
              (
                (
                  edw_copa_trans_fact AS copa
                    LEFT JOIN edw_calendar_dim AS calendar
                      ON (
                        (
                          calendar.cal_day = TO_DATE(
                            TO_CHAR(
                CONVERT_TIMEZONE(
                'Asia/Singapore',
            CURRENT_TIMESTAMP::TIMESTAMP_NTZ
                )::TIMESTAMP_NTZ,
                  'YYYY-MM-DD'
                  )::TEXT,
                  'YYYY-MM-DD'
                          )
                        )
                      )
                )
                LEFT JOIN edw_company_dim AS cmp
                  ON (
                    (
                      cast((
                        copa.co_cd
                      ) AS TEXT) = cast((
                        cmp.co_cd
                      ) AS TEXT)
                    )
                  )
              )
              LEFT JOIN edw_material_dim AS mat
                ON (
                  (
                    cast((
                      copa.matl_num
                    ) AS TEXT) = cast((
                      mat.matl_num
                    ) AS TEXT)
                  )
                )
            )
            LEFT JOIN aspedw_integration.v_intrm_reg_crncy_exch_fiscper AS exch_rate
              ON (
                (
                  (
                    (
                      cast((
                        copa.obj_crncy_co_obj
                      ) AS TEXT) = cast((
                        exch_rate.from_crncy
                      ) AS TEXT)
                    )
                    AND (
                      copa.fisc_yr_per = exch_rate.fisc_per
                    )
                  )
                  AND CASE
                    WHEN (
                      cast((
                        exch_rate.to_crncy
                      ) AS TEXT) <> cast((
                        cast('USD' AS VARCHAR)
                      ) AS TEXT)
                    )
                    THEN (
                      cast((
                        exch_rate.to_crncy
                      ) AS TEXT) = cast((
                        CASE
                          WHEN (
                            (
                              cast((
                                cmp.ctry_group
                              ) AS TEXT) = cast((
                                cast('India' AS VARCHAR)
                              ) AS TEXT)
                            )
                            OR (
                              (
                                cmp.ctry_group IS NULL
                              ) AND (
                                'India' IS NULL
                              )
                            )
                          )
                          THEN cast('INR' AS VARCHAR)
                          WHEN (
                            (
                              cast((
                                cmp.ctry_group
                              ) AS TEXT) = cast((
                                cast('Philippines' AS VARCHAR)
                              ) AS TEXT)
                            )
                            OR (
                              (
                                cmp.ctry_group IS NULL
                              ) AND (
                                'Philippines' IS NULL
                              )
                            )
                          )
                          THEN cast('PHP' AS VARCHAR)
                          WHEN (
                            (
                              cast((
                                cmp.ctry_group
                              ) AS TEXT) = cast((
                                cast('China Selfcare' AS VARCHAR)
                              ) AS TEXT)
                            )
                            OR (
                              (
                                cmp.ctry_group IS NULL
                              ) AND (
                                'China Selfcare' IS NULL
                              )
                            )
                          )
                          THEN cast('RMB' AS VARCHAR)
                          WHEN (
                            (
                              cast((
                                cmp.ctry_group
                              ) AS TEXT) = cast((
                                cast('China Personal Care' AS VARCHAR)
                              ) AS TEXT)
                            )
                            OR (
                              (
                                cmp.ctry_group IS NULL
                              ) AND (
                                'China Personal Care' IS NULL
                              )
                            )
                          )
                          THEN cast('RMB' AS VARCHAR)
                          ELSE copa.obj_crncy_co_obj
                        END
                      ) AS TEXT)
                    )
                    ELSE (
                      cast((
                        exch_rate.to_crncy
                      ) AS TEXT) = cast((
                        cast('USD' AS VARCHAR)
                      ) AS TEXT)
                    )
                  END
                )
              )
          )
          WHERE
            (
              (
                (
                  (
                    cast((
                      copa.acct_hier_shrt_desc
                    ) AS TEXT) = cast((
                      cast('GTS' AS VARCHAR)
                    ) AS TEXT)
                  )
                  OR (
                    cast((
                      copa.acct_hier_shrt_desc
                    ) AS TEXT) = cast((
                      cast('NTS' AS VARCHAR)
                    ) AS TEXT)
                  )
                )
                OR (
                  cast((
                    copa.acct_hier_shrt_desc
                  ) AS TEXT) = cast((
                    cast('EQ' AS VARCHAR)
                  ) AS TEXT)
                )
              )
              AND (
                cast((
                  cast((
                    copa.fisc_yr_per
                  ) AS VARCHAR)
                ) AS TEXT) >= (
                  (
                    (
                      cast((
                        cast((
                          (
                            DATE_PART(YEAR, CURRENT_DATE()) - 2
                          )
                        ) AS VARCHAR)
                      ) AS TEXT) || cast((
                        cast((
                          0
                        ) AS VARCHAR)
                      ) AS TEXT)
                    ) || cast((
                      cast((
                        0
                      ) AS VARCHAR)
                    ) AS TEXT)
                  ) || cast((
                    cast((
                      1
                    ) AS VARCHAR)
                  ) AS TEXT)
                )
              )
            )
          GROUP BY
            calendar.fisc_yr,
            calendar.fisc_per,
            copa.fisc_yr,
            copa.fisc_yr_per,
            copa.obj_crncy_co_obj,
            copa.matl_num,
            copa.co_cd,
            copa.sls_org,
            copa.dstr_chnl,
            copa.div,
            copa.cust_num,
            copa.acct_num,
            copa.acct_hier_shrt_desc,
            exch_rate.from_crncy,
            exch_rate.to_crncy,
            cmp.ctry_group,
            cmp."cluster",
            mat.mega_brnd_desc
          UNION ALL
          SELECT
            cast((((
                  cast((
                    cast((
                      DATE_PART(
                        'YEAR',
                        (
                          TO_DATE(
                            (
                              cast((
                                cast((
                                  calendar1.fisc_yr
                                ) AS VARCHAR)
                              ) AS TEXT) || SUBSTRING(cast((
                                cast((
                                  calendar1.fisc_per
                                ) AS VARCHAR)
                              ) AS TEXT), 6)
                            ),
                            cast((
                              cast('yyyymm' AS VARCHAR)
                            ) AS TEXT)
                          ) -1
                        )
                      )
                    ) AS VARCHAR)
                  ) AS TEXT) || cast((
                    cast('0' AS VARCHAR)
                  ) AS TEXT)
                ) || cast((
                  cast((
                    DATE_PART(
                    'MONTH',
                      (
                        TO_DATE(
                          (
                            cast((
                              cast((
                                calendar1.fisc_yr
                              ) AS VARCHAR)
                            ) AS TEXT) || SUBSTRING(cast((
                              cast((
                                calendar1.fisc_per
                              ) AS VARCHAR)
                            ) AS TEXT), 6)
                          ),
                          cast((
                            cast('yyyymm' AS VARCHAR)
                          ) AS TEXT)
                        ) - 1
                      )
                    )
                  ) AS VARCHAR)
                ) AS TEXT)
              )
            ) AS VARCHAR) AS prev_fisc_yr_per,
            TO_CHAR(
            CONVERT_TIMEZONE(
              'Asia/Singapore',
              CURRENT_TIMESTAMP::TIMESTAMP_NTZ
            )::TIMESTAMP_NTZ,
            'YYYYMMDD'
        ) AS latest_date,
            cast((
              (
                cast((
                  cast((
                    calendar1.fisc_yr
                  ) AS VARCHAR)
                ) AS TEXT) || SUBSTRING(cast((
                  cast((
                    calendar1.fisc_per
                  ) AS VARCHAR)
                ) AS TEXT), 6)
              )
            ) AS VARCHAR) AS latest_fisc_yrmnth,
            cast((
              SUBSTRING(cast((
                cast((
                  cal.fisc_per
                ) AS VARCHAR)
              ) AS TEXT), 1, 4)
            ) AS INT) AS fisc_yr,
            cal.fisc_per AS fisc_yr_per,
            TO_DATE(
              (
                (
                  SUBSTRING(cast((
                    cast((
                      cal.fisc_per
                    ) AS VARCHAR)
                  ) AS TEXT), 6, 8) || cast((
                    cast('01' AS VARCHAR)
                  ) AS TEXT)
                ) || SUBSTRING(cast((
                  cast((
                    cal.fisc_per
                  ) AS VARCHAR)
                ) AS TEXT), 1, 4)
              ),
              cast((
                cast('MMDDYYYY' AS VARCHAR)
              ) AS TEXT)
            ) AS fisc_day,
            cmp.ctry_group AS ctry_nm,
            cmp."cluster",
            invc.curr_key AS obj_crncy_co_obj,
            invc.matl_num,
            invc.co_cd,
            invc.sls_org,
            invc.dstr_chnl,
            invc.div,
            invc.cust_num,
            SUM(0) AS nts_usd,
            SUM(0) AS nts_lcy,
            SUM(0) AS gts_usd,
            SUM(0) AS gts_lcy,
            SUM(0) AS eq_usd,
            SUM(0) AS eq_lcy,
            cast('N/A' AS VARCHAR) AS from_crncy,
            cast('N/A' AS VARCHAR) AS to_crncy,
            SUM(0) AS nts_qty,
            SUM(0) AS gts_qty,
            SUM(0) AS eq_qty,
            SUM(invc.ord_pc_qty) AS ord_pc_qty,
            SUM(invc.unspp_qty) AS unspp_qty
          FROM (
            (
              (
                edw_invoice_fact AS invc
                  LEFT JOIN edw_company_dim AS cmp
                    ON (
                      (
                        cast((
                          invc.co_cd
                        ) AS TEXT) = cast((
                          cmp.co_cd
                        ) AS TEXT)
                      )
                    )
              )
              LEFT JOIN edw_calendar_dim AS cal
                ON (
                  (
                    invc.rqst_delv_dt = cal.cal_day
                  )
                )
            )
            LEFT JOIN edw_calendar_dim AS calendar1
              ON (
                (
                  calendar1.cal_day = TO_DATE(
                      TO_CHAR(
              CONVERT_TIMEZONE(
              'Asia/Singapore',
          CURRENT_TIMESTAMP::TIMESTAMP_NTZ
          )::TIMESTAMP_NTZ,
          'YYYY-MM-DD'
            )::TEXT,
            'YYYY-MM-DD'
                  )
                )
              )
          )
          WHERE
            (
              cast((
                cast((
                  cal.fisc_per
                ) AS VARCHAR)
              ) AS TEXT) >= (
                (
                  (
                    cast((
                      cast((
                        (
                          DATE_PART(YEAR, CURRENT_DATE()) - 2
                        )
                      ) AS VARCHAR)
                    ) AS TEXT) || cast((
                      cast((
                        0
                      ) AS VARCHAR)
                    ) AS TEXT)
                  ) || cast((
                    cast((
                      0
                    ) AS VARCHAR)
                  ) AS TEXT)
                ) || cast((
                  cast((
                    1
                  ) AS VARCHAR)
                ) AS TEXT)
              )
            )
          GROUP BY
            calendar1.fisc_yr,
            calendar1.fisc_per,
            cal.fisc_per,
            cmp.ctry_group,
            cmp."cluster",
            invc.curr_key,
            invc.matl_num,
            invc.co_cd,
            invc.sls_org,
            invc.dstr_chnl,
            invc.div,
            invc.cust_num
        ) AS main
        LEFT JOIN edw_material_dim AS mat
          ON (
            (
              cast((
                main.matl_num
              ) AS TEXT) = cast((
                mat.matl_num
              ) AS TEXT)
            )
          )
      )
      JOIN edw_company_dim AS company
        ON (
          (
            cast((
              main.co_cd
            ) AS TEXT) = cast((
              company.co_cd
            ) AS TEXT)
          )
        )
    )
    LEFT JOIN aspedw_integration.v_edw_customer_sales_dim AS cus_sales_extn
      ON (
        (
          (
            (
              (
                cast((
                  main.sls_org
                ) AS TEXT) = cast((
                  cus_sales_extn."sls_org"
                ) AS TEXT)
              )
              AND (
                cast((
                  main.dstr_chnl
                ) AS TEXT) = cast((
                  cus_sales_extn."dstr_chnl"
                ) AS TEXT)
              )
            )
            AND (
              cast((
                main.div
              ) AS TEXT) = cast((
                cus_sales_extn."div"
              ) AS TEXT)
            )
          )
          AND (
            cast((
              main.cust_num
            ) AS TEXT) = cast((
              cus_sales_extn."cust_num"
            ) AS TEXT)
          )
        )
      )
  )
  GROUP BY
    main.prev_fisc_yr_per,
    main.latest_date,
    main.latest_fisc_yrmnth,
    main.fisc_yr,
    main.fisc_yr_per,
    main.fisc_day,
    main.ctry_nm,
    main."cluster",
    main.obj_crncy_co_obj,
    mat.mega_brnd_desc,
    mat.brnd_desc,
    mat.base_prod_desc,
    mat.varnt_desc,
    mat.put_up_desc,
    mat.prodh1_txtmd,
    mat.prodh2_txtmd,
    mat.prodh3_txtmd,
    mat.prodh4_txtmd,
    mat.prodh5_txtmd,
    mat.prodh6_txtmd,
    cus_sales_extn."parent customer",
    cus_sales_extn."banner",
    cus_sales_extn."banner format",
    cus_sales_extn."channel",
    cus_sales_extn."go to model",
    cus_sales_extn."sub channel",
    cus_sales_extn."retail_env",
    main.from_crncy,
    main.to_crncy,
    main.cust_num
  )

  select * from transformed
);
create view aspedw_integration.v_rpt_copa_ciw
as
(
  with edw_copa_trans_fact as(
      select * from aspedw_integration.edw_copa_trans_fact
  ),
  edw_company_dim as(
      select * from aspedw_integration.edw_company_dim
  ),
  edw_material_dim as(
      select * from aspedw_integration.edw_material_dim
  ),
  v_edw_customer_sales_dim as(
      select * from aspedw_integration.v_edw_customer_sales_dim
  ),
  v_intrm_reg_crncy_exch_fiscper as(
      select * from aspedw_integration.v_intrm_reg_crncy_exch_fiscper
  ),
  edw_acct_ciw_hier as(
      select * from aspedw_integration.edw_acct_ciw_hier
  ),
  edw_account_ciw_dim as(
      select * from aspedw_integration.edw_account_ciw_dim
  ),

  edw_gch_producthierarchy as(
      select * from aspedw_integration.edw_gch_producthierarchy
  ),

  transformed as(
  SELECT
    fact.fisc_yr AS "fisc_yr",
    fact.fisc_yr_per AS "fisc_yr_per",
    fact.fisc_day AS "fisc_day",
    CASE
      WHEN (
        (
          (
            (
              (
                (
                  (
                    LTRIM(
                      CAST((
                        fact.cust_num
                      ) AS TEXT),
                      CAST((
                        CAST((
                          0
                        ) AS VARCHAR)
                      ) AS TEXT)
                    ) = CAST((
                      CAST('134559' AS VARCHAR)
                    ) AS TEXT)
                  )
                  OR (
                    LTRIM(
                      CAST((
                        fact.cust_num
                      ) AS TEXT),
                      CAST((
                        CAST((
                          0
                        ) AS VARCHAR)
                      ) AS TEXT)
                    ) = CAST((
                      CAST('134106' AS VARCHAR)
                    ) AS TEXT)
                  )
                )
                OR (
                  LTRIM(
                    CAST((
                      fact.cust_num
                    ) AS TEXT),
                    CAST((
                      CAST((
                        0
                      ) AS VARCHAR)
                    ) AS TEXT)
                  ) = CAST((
                    CAST('134258' AS VARCHAR)
                  ) AS TEXT)
                )
              )
              OR (
                LTRIM(
                  CAST((
                    fact.cust_num
                  ) AS TEXT),
                  CAST((
                    CAST((
                      0
                    ) AS VARCHAR)
                  ) AS TEXT)
                ) = CAST((
                  CAST('134855' AS VARCHAR)
                ) AS TEXT)
              )
            )
            AND (
              LTRIM(
                CAST((
                  fact.acct_num
                ) AS TEXT),
                CAST((
                  CAST((
                    0
                  ) AS VARCHAR)
                ) AS TEXT)
              ) <> CAST((
                CAST('403185' AS VARCHAR)
              ) AS TEXT)
            )
          )
          AND (
            CAST((
              mat.mega_brnd_desc
            ) AS TEXT) <> CAST((
              CAST('Vogue Int''l' AS VARCHAR)
            ) AS TEXT)
          )
        )
        AND (
          fact.fisc_yr = 2018
        )
      )
      THEN CAST('China Selfcare' AS VARCHAR)
      ELSE fact.ctry_group
    END AS "ctry_nm",
    CASE
      WHEN (
        (
          (
            (
              (
                (
                  (
                    LTRIM(
                      CAST((
                        fact.cust_num
                      ) AS TEXT),
                      CAST((
                        CAST((
                          0
                        ) AS VARCHAR)
                      ) AS TEXT)
                    ) = CAST((
                      CAST('134559' AS VARCHAR)
                    ) AS TEXT)
                  )
                  OR (
                    LTRIM(
                      CAST((
                        fact.cust_num
                      ) AS TEXT),
                      CAST((
                        CAST((
                          0
                        ) AS VARCHAR)
                      ) AS TEXT)
                    ) = CAST((
                      CAST('134106' AS VARCHAR)
                    ) AS TEXT)
                  )
                )
                OR (
                  LTRIM(
                    CAST((
                      fact.cust_num
                    ) AS TEXT),
                    CAST((
                      CAST((
                        0
                      ) AS VARCHAR)
                    ) AS TEXT)
                  ) = CAST((
                    CAST('134258' AS VARCHAR)
                  ) AS TEXT)
                )
              )
              OR (
                LTRIM(
                  CAST((
                    fact.cust_num
                  ) AS TEXT),
                  CAST((
                    CAST((
                      0
                    ) AS VARCHAR)
                  ) AS TEXT)
                ) = CAST((
                  CAST('134855' AS VARCHAR)
                ) AS TEXT)
              )
            )
            AND (
              LTRIM(
                CAST((
                  fact.acct_num
                ) AS TEXT),
                CAST((
                  CAST((
                    0
                  ) AS VARCHAR)
                ) AS TEXT)
              ) <> CAST((
                CAST('403185' AS VARCHAR)
              ) AS TEXT)
            )
          )
          AND (
            CAST((
              mat.mega_brnd_desc
            ) AS TEXT) <> CAST((
              CAST('Vogue Int''l' AS VARCHAR)
            ) AS TEXT)
          )
        )
        AND (
          fact.fisc_yr = 2018
        )
      )
      THEN CAST('China' AS VARCHAR)
      ELSE fact."cluster"
    END AS "cluster",
    fact.obj_crncy_co_obj AS "obj_crncy_co_obj",
    fact.from_crncy AS "from_crncy",
    ciw.acct_nm AS "acct_nm",
    LTRIM(CAST((
      ciw.acct_num
    ) AS TEXT), CAST((
      CAST((
        0
      ) AS VARCHAR)
    ) AS TEXT)) AS "acct_num",
    ciw.ciw_desc AS "ciw_desc",
    ciw.ciw_bucket AS "ciw_bucket",
    csw.csw_desc AS "csw_desc",
    mat.mega_brnd_desc AS "b1 mega-brand",
    mat.brnd_desc AS "b2 brand",
    mat.base_prod_desc AS "b3 base product",
    mat.varnt_desc AS "b4 variant",
    mat.put_up_desc AS "b5 put-up",
    fact.cust_num AS "cust_num",
    cus_sales_extn."parent customer",
    cus_sales_extn."banner" AS "banner",
    cus_sales_extn."banner format",
    cus_sales_extn."channel" AS "channel",
    cus_sales_extn."go to model",
    cus_sales_extn."sub channel",
    cus_sales_extn."retail_env" AS "retail_env",
    gph.gcph_franchise AS "gcph_franchise",
    gph.gcph_brand AS "gcph_brand",
    gph.gcph_subbrand AS "gcph_subbrand",
    gph.gcph_variant AS "gcph_variant",
    gph.put_up_description AS "put_up_description",
    gph.gcph_needstate AS "gcph_needstate",
    gph.gcph_category AS "gcph_category",
    gph.gcph_subcategory AS "gcph_subcategory",
    gph.gcph_segment AS "gcph_segment",
    gph.gcph_subsegment AS "gcph_subsegment",
    gch.gcch_total_enterprise AS "gcch_total_enterprise",
    gch.gcch_retail_banner AS "gcch_retail_banner",
    gch.primary_format AS "gcch_primary_format",
    gch.distributor_attribute AS "gcch_distributor_attribute",
    fact.acct_hier_shrt_desc AS "acct_hier_shrt_desc",
    SUM(fact.qty) AS "qty",
    SUM(fact.amt_lcy) AS "amt_lcy",
    SUM(fact.amt_usd) AS "amt_usd"
  FROM (
    (
      (
        (
          (
            (
              (
                SELECT
                  copa.fisc_yr,
                  copa.fisc_yr_per,
                  TO_DATE(
                    (
                      (
                        SUBSTRING(CAST((
                          CAST((
                            copa.fisc_yr_per
                          ) AS VARCHAR)
                        ) AS TEXT), 6, 8) || CAST((
                          CAST('01' AS VARCHAR)
                        ) AS TEXT)
                      ) || SUBSTRING(CAST((
                        CAST((
                          copa.fisc_yr_per
                        ) AS VARCHAR)
                      ) AS TEXT), 1, 4)
                    ),
                    CAST((
                      CAST('MMDDYYYY' AS VARCHAR)
                    ) AS TEXT)
                  ) AS fisc_day,
                  company.ctry_group,
                  company."cluster",
                  copa.acct_num,
                  copa.obj_crncy_co_obj,
                  copa.matl_num,
                  copa.co_cd,
                  CASE
                    WHEN (
                      (
                        LTRIM(CAST((
                          copa.cust_num
                        ) AS TEXT), CAST((
                          CAST('0' AS VARCHAR)
                        ) AS TEXT)) = CAST((
                          CAST('135520' AS VARCHAR)
                        ) AS TEXT)
                      )
                      AND (
                        (
                          CAST((
                            copa.co_cd
                          ) AS TEXT) = CAST((
                            CAST('703A' AS VARCHAR)
                          ) AS TEXT)
                        )
                        OR (
                          CAST((
                            copa.co_cd
                          ) AS TEXT) = CAST((
                            CAST('8888' AS VARCHAR)
                          ) AS TEXT)
                        )
                      )
                    )
                    THEN CAST('100A' AS VARCHAR)
                    ELSE copa.sls_org
                  END AS sls_org,
                  CASE
                    WHEN (
                      (
                        LTRIM(CAST((
                          copa.cust_num
                        ) AS TEXT), CAST((
                          CAST('0' AS VARCHAR)
                        ) AS TEXT)) = CAST((
                          CAST('135520' AS VARCHAR)
                        ) AS TEXT)
                      )
                      AND (
                        (
                          CAST((
                            copa.co_cd
                          ) AS TEXT) = CAST((
                            CAST('703A' AS VARCHAR)
                          ) AS TEXT)
                        )
                        OR (
                          CAST((
                            copa.co_cd
                          ) AS TEXT) = CAST((
                            CAST('8888' AS VARCHAR)
                          ) AS TEXT)
                        )
                      )
                    )
                    THEN CAST('15' AS VARCHAR)
                    ELSE copa.dstr_chnl
                  END AS dstr_chnl,
                  copa.div,
                  copa.cust_num,
                  CASE
                    WHEN (
                      CAST((
                        company.ctry_group
                      ) AS TEXT) = CAST((
                        CAST('India' AS VARCHAR)
                      ) AS TEXT)
                    )
                    THEN CAST('INR' AS VARCHAR)
                    WHEN (
                      CAST((
                        company.ctry_group
                      ) AS TEXT) = CAST((
                        CAST('Philippines' AS VARCHAR)
                      ) AS TEXT)
                    )
                    THEN CAST('PHP' AS VARCHAR)
                    WHEN (
                      (
                        CAST((
                          company.ctry_group
                        ) AS TEXT) = CAST((
                          CAST('China Selfcare' AS VARCHAR)
                        ) AS TEXT)
                      )
                      OR (
                        CAST((
                          company.ctry_group
                        ) AS TEXT) = CAST((
                          CAST('China Personal Care' AS VARCHAR)
                        ) AS TEXT)
                      )
                    )
                    THEN CAST('RMB' AS VARCHAR)
                    WHEN (
                      CAST((
                        company.ctry_group
                      ) AS TEXT) = CAST((
                        CAST('Australia' AS VARCHAR)
                      ) AS TEXT)
                    )
                    THEN CAST('AUD' AS VARCHAR)
                    WHEN (
                      CAST((
                        company.ctry_group
                      ) AS TEXT) = CAST((
                        CAST('New Zealand' AS VARCHAR)
                      ) AS TEXT)
                    )
                    THEN CAST('NZD' AS VARCHAR)
                    WHEN (
                      CAST((
                        company.ctry_group
                      ) AS TEXT) = CAST((
                        CAST('APSC Regional' AS VARCHAR)
                      ) AS TEXT)
                    )
                    THEN CAST('RMB' AS VARCHAR)
                    ELSE exch_rate.from_crncy
                  END AS from_crncy,
                  copa.acct_hier_shrt_desc,
                  CASE
                    WHEN (
                      CAST((
                        exch_rate.to_crncy
                      ) AS TEXT) = CAST((
                        CAST('USD' AS VARCHAR)
                      ) AS TEXT)
                    )
                    THEN SUM(copa.qty)
                    ELSE CAST((
                      CAST((
                        0
                      ) AS DECIMAL)
                    ) AS DECIMAL(18, 0))
                  END AS qty,
                  CASE
                    WHEN (
                      CAST((
                        exch_rate.to_crncy
                      ) AS TEXT) = CAST((
                        CASE
                          WHEN (
                            (
                              CAST((
                                company.ctry_group
                              ) AS TEXT) = CAST((
                                CAST('India' AS VARCHAR)
                              ) AS TEXT)
                            )
                            OR (
                              (
                                company.ctry_group IS NULL
                              ) AND (
                                'India' IS NULL
                              )
                            )
                          )
                          THEN CAST('INR' AS VARCHAR)
                          WHEN (
                            (
                              CAST((
                                company.ctry_group
                              ) AS TEXT) = CAST((
                                CAST('Philippines' AS VARCHAR)
                              ) AS TEXT)
                            )
                            OR (
                              (
                                company.ctry_group IS NULL
                              ) AND (
                                'Philippines' IS NULL
                              )
                            )
                          )
                          THEN CAST('PHP' AS VARCHAR)
                          WHEN (
                            (
                              CAST((
                                company.ctry_group
                              ) AS TEXT) = CAST((
                                CAST('China Selfcare' AS VARCHAR)
                              ) AS TEXT)
                            )
                            OR (
                              (
                                company.ctry_group IS NULL
                              ) AND (
                                'China Selfcare' IS NULL
                              )
                            )
                          )
                          THEN CAST('RMB' AS VARCHAR)
                          WHEN (
                            (
                              CAST((
                                company.ctry_group
                              ) AS TEXT) = CAST((
                                CAST('China Personal Care' AS VARCHAR)
                              ) AS TEXT)
                            )
                            OR (
                              (
                                company.ctry_group IS NULL
                              ) AND (
                                'China Personal Care' IS NULL
                              )
                            )
                          )
                          THEN CAST('RMB' AS VARCHAR)
                          WHEN (
                            (
                              CAST((
                                company.ctry_group
                              ) AS TEXT) = CAST((
                                CAST('Australia' AS VARCHAR)
                              ) AS TEXT)
                            )
                            OR (
                              (
                                company.ctry_group IS NULL
                              ) AND (
                                'Australia' IS NULL
                              )
                            )
                          )
                          THEN CAST('AUD' AS VARCHAR)
                          WHEN (
                            (
                              CAST((
                                company.ctry_group
                              ) AS TEXT) = CAST((
                                CAST('New Zealand' AS VARCHAR)
                              ) AS TEXT)
                            )
                            OR (
                              (
                                company.ctry_group IS NULL
                              ) AND (
                                'New Zealand' IS NULL
                              )
                            )
                          )
                          THEN CAST('NZD' AS VARCHAR)
                          WHEN (
                            (
                              CAST((
                                company.ctry_group
                              ) AS TEXT) = CAST((
                                CAST('APSC Regional' AS VARCHAR)
                              ) AS TEXT)
                            )
                            OR (
                              (
                                company.ctry_group IS NULL
                              ) AND (
                                'APSC Regional' IS NULL
                              )
                            )
                          )
                          THEN CAST('RMB' AS VARCHAR)
                          ELSE copa.obj_crncy_co_obj
                        END
                      ) AS TEXT)
                    )
                    THEN SUM((
                      copa.amt_obj_crncy * exch_rate.ex_rt
                    ))
                    ELSE CAST((
                      CAST((
                        0
                      ) AS DECIMAL)
                    ) AS DECIMAL(18, 0))
                  END AS amt_lcy,
                  CASE
                    WHEN (
                      CAST((
                        exch_rate.to_crncy
                      ) AS TEXT) = CAST((
                        CAST('USD' AS VARCHAR)
                      ) AS TEXT)
                    )
                    THEN SUM((
                      copa.amt_obj_crncy * exch_rate.ex_rt
                    ))
                    ELSE CAST((
                      CAST((
                        0
                      ) AS DECIMAL)
                    ) AS DECIMAL(18, 0))
                  END AS amt_usd
                FROM (
                  (
                    edw_copa_trans_fact AS copa
                      JOIN edw_company_dim AS company
                        ON (
                          (
                            CAST((
                              copa.co_cd
                            ) AS TEXT) = CAST((
                              company.co_cd
                            ) AS TEXT)
                          )
                        )
                  )
                  LEFT JOIN v_intrm_reg_crncy_exch_fiscper AS exch_rate
                    ON (
                      (
                        (
                          (
                            CAST((
                              copa.obj_crncy_co_obj
                            ) AS TEXT) = CAST((
                              exch_rate.from_crncy
                            ) AS TEXT)
                          )
                          AND (
                            copa.fisc_yr_per = exch_rate.fisc_per
                          )
                        )
                        AND CASE
                          WHEN (
                            CAST((
                              exch_rate.to_crncy
                            ) AS TEXT) <> CAST((
                              CAST('USD' AS VARCHAR)
                            ) AS TEXT)
                          )
                          THEN (
                            CAST((
                              exch_rate.to_crncy
                            ) AS TEXT) = CAST((
                              CASE
                                WHEN (
                                  (
                                    CAST((
                                      company.ctry_group
                                    ) AS TEXT) = CAST((
                                      CAST('India' AS VARCHAR)
                                    ) AS TEXT)
                                  )
                                  OR (
                                    (
                                      company.ctry_group IS NULL
                                    ) AND (
                                      'India' IS NULL
                                    )
                                  )
                                )
                                THEN CAST('INR' AS VARCHAR)
                                WHEN (
                                  (
                                    CAST((
                                      company.ctry_group
                                    ) AS TEXT) = CAST((
                                      CAST('Philippines' AS VARCHAR)
                                    ) AS TEXT)
                                  )
                                  OR (
                                    (
                                      company.ctry_group IS NULL
                                    ) AND (
                                      'Philippines' IS NULL
                                    )
                                  )
                                )
                                THEN CAST('PHP' AS VARCHAR)
                                WHEN (
                                  (
                                    CAST((
                                      company.ctry_group
                                    ) AS TEXT) = CAST((
                                      CAST('China Selfcare' AS VARCHAR)
                                    ) AS TEXT)
                                  )
                                  OR (
                                    (
                                      company.ctry_group IS NULL
                                    ) AND (
                                      'China Selfcare' IS NULL
                                    )
                                  )
                                )
                                THEN CAST('RMB' AS VARCHAR)
                                WHEN (
                                  (
                                    CAST((
                                      company.ctry_group
                                    ) AS TEXT) = CAST((
                                      CAST('China Personal Care' AS VARCHAR)
                                    ) AS TEXT)
                                  )
                                  OR (
                                    (
                                      company.ctry_group IS NULL
                                    ) AND (
                                      'China Personal Care' IS NULL
                                    )
                                  )
                                )
                                THEN CAST('RMB' AS VARCHAR)
                                WHEN (
                                  (
                                    CAST((
                                      company.ctry_group
                                    ) AS TEXT) = CAST((
                                      CAST('Australia' AS VARCHAR)
                                    ) AS TEXT)
                                  )
                                  OR (
                                    (
                                      company.ctry_group IS NULL
                                    ) AND (
                                      'Australia' IS NULL
                                    )
                                  )
                                )
                                THEN CAST('AUD' AS VARCHAR)
                                WHEN (
                                  (
                                    CAST((
                                      company.ctry_group
                                    ) AS TEXT) = CAST((
                                      CAST('New Zealand' AS VARCHAR)
                                    ) AS TEXT)
                                  )
                                  OR (
                                    (
                                      company.ctry_group IS NULL
                                    ) AND (
                                      'New Zealand' IS NULL
                                    )
                                  )
                                )
                                THEN CAST('NZD' AS VARCHAR)
                                WHEN (
                                  (
                                    CAST((
                                      company.ctry_group
                                    ) AS TEXT) = CAST((
                                      CAST('APSC Regional' AS VARCHAR)
                                    ) AS TEXT)
                                  )
                                  OR (
                                    (
                                      company.ctry_group IS NULL
                                    ) AND (
                                      'APSC Regional' IS NULL
                                    )
                                  )
                                )
                                THEN CAST('RMB' AS VARCHAR)
                                ELSE copa.obj_crncy_co_obj
                              END
                            ) AS TEXT)
                          )
                          ELSE (
                            CAST((
                              exch_rate.to_crncy
                            ) AS TEXT) = CAST((
                              CAST('USD' AS VARCHAR)
                            ) AS TEXT)
                          )
                        END
                      )
                    )
                )
                WHERE
                  (
                    (
                      CAST((
                        copa.acct_hier_shrt_desc
                      ) AS TEXT) = CAST((
                        CAST('NTS' AS VARCHAR)
                      ) AS TEXT)
                    )
                    AND (
                      CAST((
                        CAST((
                          copa.fisc_yr_per
                        ) AS VARCHAR)
                      ) AS TEXT) >= (
                        (
                          (
                            CAST((
                              CAST((
                                (
                                DATE_PART(YEAR, to_date('2020-02-28 06:02:34.194913')) - 2 
                                )
                              ) AS VARCHAR)
                            ) AS TEXT) || CAST((
                              CAST((
                                0
                              ) AS VARCHAR)
                            ) AS TEXT)
                          ) || CAST((
                            CAST((
                              0
                            ) AS VARCHAR)
                          ) AS TEXT)
                        ) || CAST((
                          CAST((
                            1
                          ) AS VARCHAR)
                        ) AS TEXT)
                      )
                    )
                  )
                GROUP BY
                  company.ctry_group,
                  company."cluster",
                  copa.fisc_yr,
                  copa.fisc_yr_per,
                  copa.obj_crncy_co_obj,
                  copa.acct_num,
                  copa.matl_num,
                  copa.co_cd,
                  copa.sls_org,
                  copa.dstr_chnl,
                  copa.div,
                  copa.cust_num,
                  copa.acct_hier_shrt_desc,
                  exch_rate.from_crncy,
                  exch_rate.to_crncy
              ) AS fact
              LEFT JOIN edw_acct_ciw_hier AS ciw
                ON (
                  (
                    (
                      LTRIM(
                        CAST((
                          fact.acct_num
                        ) AS TEXT),
                        CAST((
                          CAST((
                            0
                          ) AS VARCHAR)
                        ) AS TEXT)
                      ) = LTRIM(CAST((
                        ciw.acct_num
                      ) AS TEXT), CAST((
                        CAST((
                          0
                        ) AS VARCHAR)
                      ) AS TEXT))
                    )
                    AND (
                      CAST((
                        fact.acct_hier_shrt_desc
                      ) AS TEXT) = CAST((
                        ciw.measure_code
                      ) AS TEXT)
                    )
                  )
                )
            )
            LEFT JOIN (
              SELECT
                a.acct_num,
                b.csw_acct_hier_name AS csw_desc
              FROM (
                (
                  SELECT
                    edw_account_ciw_dim.acct_num,
                    edw_account_ciw_dim.bravo_acct_l3,
                    edw_account_ciw_dim.bravo_acct_l4
                  FROM edw_account_ciw_dim
                  WHERE
                    (
                      (
                        CAST((
                          edw_account_ciw_dim.chrt_acct
                        ) AS TEXT) = CAST((
                          CAST('CCOA' AS VARCHAR)
                        ) AS TEXT)
                      )
                      AND (
                        CAST((
                          edw_account_ciw_dim.bravo_acct_l2
                        ) AS TEXT) = CAST((
                          CAST('JJPLAC510001' AS VARCHAR)
                        ) AS TEXT)
                      )
                    )
                ) AS a
                LEFT JOIN (
                  (
                    (
                      (
                        SELECT
                          CAST('JJPLAC512200' AS VARCHAR) AS csw_acct_hier_no,
                          CAST('Sales Return' AS VARCHAR) AS csw_acct_hier_name
                        UNION ALL
                        SELECT
                          CAST('JJPLAC512001' AS VARCHAR) AS csw_acct_hier_no,
                          CAST('Sales Discount & Reserve' AS VARCHAR) AS csw_acct_hier_name
                      )
                      UNION ALL
                      SELECT
                        CAST('JJPLAC513001' AS VARCHAR) AS csw_acct_hier_no,
                        CAST('Sales Incentive' AS VARCHAR) AS csw_acct_hier_name
                    )
                    UNION ALL
                    SELECT
                      CAST('JJPLAC514001' AS VARCHAR) AS csw_acct_hier_no,
                      CAST('Promo & Trade related' AS VARCHAR) AS csw_acct_hier_name
                  )
                  UNION ALL
                  SELECT
                    CAST('JJPLAC511000' AS VARCHAR) AS csw_acct_hier_no,
                    CAST('Gross Trade Prod Sales' AS VARCHAR) AS csw_acct_hier_name
                ) AS b
                  ON (
                    CASE
                      WHEN (
                        CAST((
                          a.bravo_acct_l4
                        ) AS TEXT) = CAST((
                          CAST('JJPLAC512200' AS VARCHAR)
                        ) AS TEXT)
                      )
                      THEN (
                        CAST((
                          b.csw_acct_hier_no
                        ) AS TEXT) = CAST((
                          a.bravo_acct_l4
                        ) AS TEXT)
                      )
                      ELSE (
                        CAST((
                          b.csw_acct_hier_no
                        ) AS TEXT) = CAST((
                          a.bravo_acct_l3
                        ) AS TEXT)
                      )
                    END
                  )
              )
            ) AS csw
              ON (
                (
                  LTRIM(
                    CAST((
                      fact.acct_num
                    ) AS TEXT),
                    CAST((
                      CAST((
                        0
                      ) AS VARCHAR)
                    ) AS TEXT)
                  ) = LTRIM(CAST((
                    csw.acct_num
                  ) AS TEXT), CAST((
                    CAST((
                      0
                    ) AS VARCHAR)
                  ) AS TEXT))
                )
              )
          )
          LEFT JOIN edw_material_dim AS mat
            ON (
              (
                CAST((
                  fact.matl_num
                ) AS TEXT) = CAST((
                  mat.matl_num
                ) AS TEXT)
              )
            )
        )
        LEFT JOIN v_edw_customer_sales_dim AS cus_sales_extn
          ON (
            (
              (
                (
                  (
                    CAST((
                      fact.sls_org
                    ) AS TEXT) = CAST((
                      cus_sales_extn."sls_org"
                    ) AS TEXT)
                  )
                  AND (
                    CAST((
                      fact.dstr_chnl
                    ) AS TEXT) = CAST((
                      cus_sales_extn."dstr_chnl"
                    ) AS TEXT)
                  )
                )
                AND (
                  CAST((
                    fact.div
                  ) AS TEXT) = CAST((
                    cus_sales_extn."div"
                  ) AS TEXT)
                )
              )
              AND (
                CAST((
                  fact.cust_num
                ) AS TEXT) = CAST((
                  cus_sales_extn."cust_num"
                ) AS TEXT)
              )
            )
          )
      )
      LEFT JOIN edw_gch_producthierarchy AS gph
        ON (
          (
            CAST((
              fact.matl_num
            ) AS TEXT) = CAST((
              gph.materialnumber
            ) AS TEXT)
          )
        )
    )
    LEFT JOIN edw_gch_customerhierarchy AS gch
      ON (
        (
          CAST((
            fact.cust_num
          ) AS TEXT) = CAST((
            gch.customer
          ) AS TEXT)
        )
      )
  )
  GROUP BY
    fact.fisc_yr,
    fact.fisc_yr_per,
    fact.fisc_day,
    fact.ctry_group,
    fact."cluster",
    fact.obj_crncy_co_obj,
    fact.from_crncy,
    ciw.acct_nm,
    ciw.acct_num,
    ciw.ciw_desc,
    ciw.ciw_bucket,
    csw.csw_desc,
    mat.mega_brnd_desc,
    mat.brnd_desc,
    mat.base_prod_desc,
    mat.varnt_desc,
    mat.put_up_desc,
    fact.cust_num,
    fact.acct_num,
    cus_sales_extn."parent customer",
    cus_sales_extn."banner",
    cus_sales_extn."banner format",
    cus_sales_extn."channel",
    cus_sales_extn."go to model",
    cus_sales_extn."sub channel",
    cus_sales_extn."retail_env",
    gph.gcph_franchise,
    gph.gcph_brand,
    gph.gcph_subbrand,
    gph.gcph_variant,
    gph.put_up_description,
    gph.gcph_needstate,
    gph.gcph_category,
    gph.gcph_subcategory,
    gph.gcph_segment,
    gph.gcph_subsegment,
    gch.gcch_total_enterprise,
    gch.gcch_retail_banner,
    gch.primary_format,
    gch.distributor_attribute,
    fact.acct_hier_shrt_desc
  )

  select * from transformed
);
create view aspedw_integration.v_rpt_copa_sku
as
(
  with edw_copa_trans_fact as(
      select * from aspedw_integration.edw_copa_trans_fact
  ),
  edw_company_dim as(
      select * from aspedw_integration.edw_company_dim
  ),
  edw_material_dim as(
      select * from aspedw_integration.edw_material_dim
  ),
  v_edw_customer_sales_dim as(
      select * from aspedw_integration.v_edw_customer_sales_dim
  ),
  edw_vw_greenlight_skus as(
      select * from aspedw_integration.edw_vw_greenlight_skus
  ),
  v_intrm_reg_crncy_exch_fiscper as(
      select * from aspedw_integration.v_intrm_reg_crncy_exch_fiscper
  ),
  transformed as(
  SELECT
    derived_table1.fisc_yr AS "fisc_yr",
    derived_table1.fisc_yr_per AS "fisc_yr_per",
    derived_table1.fisc_day AS "fisc_day",
    derived_table1.ctry_nm AS "ctry_nm",
    derived_table1."cluster" as "cluster",
    derived_table1.obj_crncy_co_obj AS "obj_crncy_co_obj",
    derived_table1."b1 mega-brand" as "b1 mega-brand",
    derived_table1."b2 brand" as "b2 brand",
    derived_table1."b3 base product" as "b3 base product",
    derived_table1."b4 variant" as "b4 variant",
    derived_table1."b5 put-up" as "b5 put-up",
    derived_table1."prod h1 operating group" as "prod h1 operating group",
    derived_table1."prod h2 franchise group" as "prod h2 franchise group",
    derived_table1."prod h3 franchise" as "prod h3 franchise",
    derived_table1."prod h4 product franchise" as "prod h4 product franchise",
    derived_table1."prod h5 product major" as "prod h5 product major",
    derived_table1."prod h6 product minor" as "prod h6 product minor",
    derived_table1.pka_franchise_desc AS "pka_franchise_desc",
    derived_table1.pka_brand_desc AS "pka_brand_desc",
    derived_table1.pka_sub_brand_desc AS "pka_sub_brand_desc",
    derived_table1.pka_variant_desc AS "pka_variant_desc",
    derived_table1.pka_sub_variant_desc AS "pka_sub_variant_desc",
    derived_table1.pka_flavor_desc AS "pka_flavor_desc",
    derived_table1.pka_ingredient_desc AS "pka_ingredient_desc",
    derived_table1.pka_application_desc AS "pka_application_desc",
    derived_table1.pka_length_desc AS "pka_length_desc",
    derived_table1.pka_shape_desc AS "pka_shape_desc",
    derived_table1.pka_spf_desc AS "pka_spf_desc",
    derived_table1.pka_cover_desc AS "pka_cover_desc",
    derived_table1.pka_form_desc AS "pka_form_desc",
    derived_table1.pka_size_desc AS "pka_size_desc",
    derived_table1.pka_character_desc AS "pka_character_desc",
    derived_table1.pka_package_desc AS "pka_package_desc",
    derived_table1.pka_attribute_13_desc AS "pka_attribute_13_desc",
    derived_table1.pka_attribute_14_desc AS "pka_attribute_14_desc",
    derived_table1.pka_sku_identification_desc AS "pka_sku_identification_desc",
    derived_table1.pka_one_time_relabeling_desc AS "pka_one_time_relabeling_desc",
    derived_table1.pka_product_key AS "pka_product_key",
    derived_table1.pka_product_key_description AS "pka_product_key_description",
    derived_table1.pka_product_key_description_2 AS "pka_product_key_description_2",
    derived_table1.pka_root_code AS "pka_root_code",
    derived_table1.pka_root_code_desc_1 AS "pka_root_code_desc_1",
    derived_table1.pka_root_code_desc_2 AS "pka_root_code_desc_2",
    derived_table1.greenlight_sku_flag AS "greenlight_sku_flag",
    derived_table1."parent customer" as "parent customer",
    derived_table1.banner AS "banner",
    derived_table1."banner format",
    derived_table1.channel AS "channel",
    derived_table1."go to model" as "go to model",
    derived_table1."sub channel" as "sub channel",
    derived_table1.retail_env AS "retail_env",
    SUM(derived_table1.nts_usd) AS "nts_usd",
    SUM(derived_table1.nts_lcy) AS "nts_lcy",
    SUM(derived_table1.gts_usd) AS "gts_usd",
    SUM(derived_table1.gts_lcy) AS "gts_lcy",
    SUM(derived_table1.eq_usd) AS "eq_usd",
    SUM(derived_table1.eq_lcy) AS "eq_lcy",
    derived_table1.from_crncy AS "from_crncy",
    derived_table1.to_crncy AS "to_crncy",
    SUM(derived_table1.nts_qty) AS "nts_qty",
    SUM(derived_table1.gts_qty) AS "gts_qty",
    SUM(derived_table1.eq_qty) AS "eq_qty",
    derived_table1."product code" as "product code",
    derived_table1."product name" as "product name"
  FROM (
    SELECT
      copa.fisc_yr,
      copa.fisc_yr_per,
      TO_DATE(
        (
          (
            SUBSTRING(CAST((
              CAST((
                copa.fisc_yr_per
              ) AS VARCHAR)
            ) AS TEXT), 6, 8) || CAST((
              CAST('01' AS VARCHAR)
            ) AS TEXT)
          ) || SUBSTRING(CAST((
            CAST((
              copa.fisc_yr_per
            ) AS VARCHAR)
          ) AS TEXT), 1, 4)
        ),
        CAST((
          CAST('MMDDYYYY' AS VARCHAR)
        ) AS TEXT)
      ) AS fisc_day,
      CASE
        WHEN (
          (
            (
              (
                (
                  (
                    LTRIM(
                      CAST((
                        copa.cust_num
                      ) AS TEXT),
                      CAST((
                        CAST((
                          0
                        ) AS VARCHAR)
                      ) AS TEXT)
                    ) = CAST((
                      CAST('134559' AS VARCHAR)
                    ) AS TEXT)
                  )
                  OR (
                    LTRIM(
                      CAST((
                        copa.cust_num
                      ) AS TEXT),
                      CAST((
                        CAST((
                          0
                        ) AS VARCHAR)
                      ) AS TEXT)
                    ) = CAST((
                      CAST('134106' AS VARCHAR)
                    ) AS TEXT)
                  )
                )
                OR (
                  LTRIM(
                    CAST((
                      copa.cust_num
                    ) AS TEXT),
                    CAST((
                      CAST((
                        0
                      ) AS VARCHAR)
                    ) AS TEXT)
                  ) = CAST((
                    CAST('134258' AS VARCHAR)
                  ) AS TEXT)
                )
              )
              OR (
                LTRIM(
                  CAST((
                    copa.cust_num
                  ) AS TEXT),
                  CAST((
                    CAST((
                      0
                    ) AS VARCHAR)
                  ) AS TEXT)
                ) = CAST((
                  CAST('134855' AS VARCHAR)
                ) AS TEXT)
              )
            )
            AND (
              LTRIM(
                CAST((
                  copa.acct_num
                ) AS TEXT),
                CAST((
                  CAST((
                    0
                  ) AS VARCHAR)
                ) AS TEXT)
              ) <> CAST((
                CAST('403185' AS VARCHAR)
              ) AS TEXT)
            )
          )
          AND (
            copa.fisc_yr = 2018
          )
        )
        THEN CAST('China Selfcare' AS VARCHAR)
        ELSE cmp.ctry_group
      END AS ctry_nm,
      CASE
        WHEN (
          (
            (
              (
                (
                  (
                    LTRIM(
                      CAST((
                        copa.cust_num
                      ) AS TEXT),
                      CAST((
                        CAST((
                          0
                        ) AS VARCHAR)
                      ) AS TEXT)
                    ) = CAST((
                      CAST('134559' AS VARCHAR)
                    ) AS TEXT)
                  )
                  OR (
                    LTRIM(
                      CAST((
                        copa.cust_num
                      ) AS TEXT),
                      CAST((
                        CAST((
                          0
                        ) AS VARCHAR)
                      ) AS TEXT)
                    ) = CAST((
                      CAST('134106' AS VARCHAR)
                    ) AS TEXT)
                  )
                )
                OR (
                  LTRIM(
                    CAST((
                      copa.cust_num
                    ) AS TEXT),
                    CAST((
                      CAST((
                        0
                      ) AS VARCHAR)
                    ) AS TEXT)
                  ) = CAST((
                    CAST('134258' AS VARCHAR)
                  ) AS TEXT)
                )
              )
              OR (
                LTRIM(
                  CAST((
                    copa.cust_num
                  ) AS TEXT),
                  CAST((
                    CAST((
                      0
                    ) AS VARCHAR)
                  ) AS TEXT)
                ) = CAST((
                  CAST('134855' AS VARCHAR)
                ) AS TEXT)
              )
            )
            AND (
              LTRIM(
                CAST((
                  copa.acct_num
                ) AS TEXT),
                CAST((
                  CAST((
                    0
                  ) AS VARCHAR)
                ) AS TEXT)
              ) <> CAST((
                CAST('403185' AS VARCHAR)
              ) AS TEXT)
            )
          )
          AND (
            copa.fisc_yr = 2018
          )
        )
        THEN CAST('China' AS VARCHAR)
        ELSE cmp."cluster"
      END AS "cluster",
      CASE
        WHEN (
          CAST((
            cmp.ctry_group
          ) AS TEXT) = CAST((
            CAST('India' AS VARCHAR)
          ) AS TEXT)
        )
        THEN CAST('INR' AS VARCHAR)
        WHEN (
          CAST((
            cmp.ctry_group
          ) AS TEXT) = CAST((
            CAST('Philippines' AS VARCHAR)
          ) AS TEXT)
        )
        THEN CAST('PHP' AS VARCHAR)
        WHEN (
          (
            CAST((
              cmp.ctry_group
            ) AS TEXT) = CAST((
              CAST('China Selfcare' AS VARCHAR)
            ) AS TEXT)
          )
          OR (
            CAST((
              cmp.ctry_group
            ) AS TEXT) = CAST((
              CAST('China Personal Care' AS VARCHAR)
            ) AS TEXT)
          )
        )
        THEN CAST('RMB' AS VARCHAR)
        ELSE copa.obj_crncy_co_obj
      END AS obj_crncy_co_obj,
      mat.mega_brnd_desc AS "b1 mega-brand",
      mat.brnd_desc AS "b2 brand",
      mat.base_prod_desc AS "b3 base product",
      mat.varnt_desc AS "b4 variant",
      mat.put_up_desc AS "b5 put-up",
      mat.prodh1_txtmd AS "prod h1 operating group",
      mat.prodh2_txtmd AS "prod h2 franchise group",
      mat.prodh3_txtmd AS "prod h3 franchise",
      mat.prodh4_txtmd AS "prod h4 product franchise",
      mat.prodh5_txtmd AS "prod h5 product major",
      mat.prodh6_txtmd AS "prod h6 product minor",
      mat.pka_franchise_desc,
      mat.pka_brand_desc,
      mat.pka_sub_brand_desc,
      mat.pka_variant_desc,
      mat.pka_sub_variant_desc,
      mat.pka_flavor_desc,
      mat.pka_ingredient_desc,
      mat.pka_application_desc,
      mat.pka_length_desc,
      mat.pka_shape_desc,
      mat.pka_spf_desc,
      mat.pka_cover_desc,
      mat.pka_form_desc,
      mat.pka_size_desc,
      mat.pka_character_desc,
      mat.pka_package_desc,
      mat.pka_attribute_13_desc,
      mat.pka_attribute_14_desc,
      mat.pka_sku_identification_desc,
      mat.pka_one_time_relabeling_desc,
      mat.pka_product_key,
      mat.pka_product_key_description,
      mat.pka_product_key_description_2,
      mat.pka_root_code,
      mat.pka_root_code_desc_1,
      mat.pka_root_code_desc_2,
      COALESCE(gn.greenlight_sku_flag, CAST('N/A' AS VARCHAR)) AS greenlight_sku_flag,
      cus_sales_extn."parent customer",
      cus_sales_extn."banner",
      cus_sales_extn."banner format",
      cus_sales_extn."channel",
      cus_sales_extn."go to model",
      cus_sales_extn."sub channel",
      cus_sales_extn."retail_env",
      CASE
        WHEN (
          (
            CAST((
              copa.acct_hier_shrt_desc
            ) AS TEXT) = CAST((
              CAST('NTS' AS VARCHAR)
            ) AS TEXT)
          )
          AND (
            CAST((
              exch_rate.to_crncy
            ) AS TEXT) = CAST((
              CAST('USD' AS VARCHAR)
            ) AS TEXT)
          )
        )
        THEN SUM((
          copa.amt_obj_crncy * exch_rate.ex_rt
        ))
        ELSE CAST((
          CAST((
            0
          ) AS DECIMAL)
        ) AS DECIMAL(18, 0))
      END AS nts_usd,
      CASE
        WHEN (
          (
            CAST((
              copa.acct_hier_shrt_desc
            ) AS TEXT) = CAST((
              CAST('NTS' AS VARCHAR)
            ) AS TEXT)
          )
          AND (
            CAST((
              exch_rate.to_crncy
            ) AS TEXT) = CAST((
              CASE
                WHEN (
                  (
                    CAST((
                      cmp.ctry_group
                    ) AS TEXT) = CAST((
                      CAST('India' AS VARCHAR)
                    ) AS TEXT)
                  )
                  OR (
                    (
                      cmp.ctry_group IS NULL
                    ) AND (
                      'India' IS NULL
                    )
                  )
                )
                THEN CAST('INR' AS VARCHAR)
                WHEN (
                  (
                    CAST((
                      cmp.ctry_group
                    ) AS TEXT) = CAST((
                      CAST('Philippines' AS VARCHAR)
                    ) AS TEXT)
                  )
                  OR (
                    (
                      cmp.ctry_group IS NULL
                    ) AND (
                      'Philippines' IS NULL
                    )
                  )
                )
                THEN CAST('PHP' AS VARCHAR)
                WHEN (
                  (
                    CAST((
                      cmp.ctry_group
                    ) AS TEXT) = CAST((
                      CAST('China Selfcare' AS VARCHAR)
                    ) AS TEXT)
                  )
                  OR (
                    (
                      cmp.ctry_group IS NULL
                    ) AND (
                      'China Selfcare' IS NULL
                    )
                  )
                )
                THEN CAST('RMB' AS VARCHAR)
                WHEN (
                  (
                    CAST((
                      cmp.ctry_group
                    ) AS TEXT) = CAST((
                      CAST('China Personal Care' AS VARCHAR)
                    ) AS TEXT)
                  )
                  OR (
                    (
                      cmp.ctry_group IS NULL
                    ) AND (
                      'China Personal Care' IS NULL
                    )
                  )
                )
                THEN CAST('RMB' AS VARCHAR)
                ELSE copa.obj_crncy_co_obj
              END
            ) AS TEXT)
          )
        )
        THEN SUM((
          copa.amt_obj_crncy * exch_rate.ex_rt
        ))
        ELSE CAST((
          CAST((
            0
          ) AS DECIMAL)
        ) AS DECIMAL(18, 0))
      END AS nts_lcy,
      CASE
        WHEN (
          (
            CAST((
              copa.acct_hier_shrt_desc
            ) AS TEXT) = CAST((
              CAST('GTS' AS VARCHAR)
            ) AS TEXT)
          )
          AND (
            CAST((
              exch_rate.to_crncy
            ) AS TEXT) = CAST((
              CAST('USD' AS VARCHAR)
            ) AS TEXT)
          )
        )
        THEN SUM((
          copa.amt_obj_crncy * exch_rate.ex_rt
        ))
        ELSE CAST((
          CAST((
            0
          ) AS DECIMAL)
        ) AS DECIMAL(18, 0))
      END AS gts_usd,
      CASE
        WHEN (
          (
            CAST((
              copa.acct_hier_shrt_desc
            ) AS TEXT) = CAST((
              CAST('GTS' AS VARCHAR)
            ) AS TEXT)
          )
          AND (
            CAST((
              exch_rate.to_crncy
            ) AS TEXT) = CAST((
              CASE
                WHEN (
                  (
                    CAST((
                      cmp.ctry_group
                    ) AS TEXT) = CAST((
                      CAST('India' AS VARCHAR)
                    ) AS TEXT)
                  )
                  OR (
                    (
                      cmp.ctry_group IS NULL
                    ) AND (
                      'India' IS NULL
                    )
                  )
                )
                THEN CAST('INR' AS VARCHAR)
                WHEN (
                  (
                    CAST((
                      cmp.ctry_group
                    ) AS TEXT) = CAST((
                      CAST('Philippines' AS VARCHAR)
                    ) AS TEXT)
                  )
                  OR (
                    (
                      cmp.ctry_group IS NULL
                    ) AND (
                      'Philippines' IS NULL
                    )
                  )
                )
                THEN CAST('PHP' AS VARCHAR)
                WHEN (
                  (
                    CAST((
                      cmp.ctry_group
                    ) AS TEXT) = CAST((
                      CAST('China Selfcare' AS VARCHAR)
                    ) AS TEXT)
                  )
                  OR (
                    (
                      cmp.ctry_group IS NULL
                    ) AND (
                      'China Selfcare' IS NULL
                    )
                  )
                )
                THEN CAST('RMB' AS VARCHAR)
                WHEN (
                  (
                    CAST((
                      cmp.ctry_group
                    ) AS TEXT) = CAST((
                      CAST('China Personal Care' AS VARCHAR)
                    ) AS TEXT)
                  )
                  OR (
                    (
                      cmp.ctry_group IS NULL
                    ) AND (
                      'China Personal Care' IS NULL
                    )
                  )
                )
                THEN CAST('RMB' AS VARCHAR)
                ELSE copa.obj_crncy_co_obj
              END
            ) AS TEXT)
          )
        )
        THEN SUM((
          copa.amt_obj_crncy * exch_rate.ex_rt
        ))
        ELSE CAST((
          CAST((
            0
          ) AS DECIMAL)
        ) AS DECIMAL(18, 0))
      END AS gts_lcy,
      CASE
        WHEN (
          (
            CAST((
              copa.acct_hier_shrt_desc
            ) AS TEXT) = CAST((
              CAST('EQ' AS VARCHAR)
            ) AS TEXT)
          )
          AND (
            CAST((
              exch_rate.to_crncy
            ) AS TEXT) = CAST((
              CAST('USD' AS VARCHAR)
            ) AS TEXT)
          )
        )
        THEN SUM((
          copa.amt_obj_crncy * exch_rate.ex_rt
        ))
        ELSE CAST((
          CAST((
            0
          ) AS DECIMAL)
        ) AS DECIMAL(18, 0))
      END AS eq_usd,
      CASE
        WHEN (
          (
            CAST((
              copa.acct_hier_shrt_desc
            ) AS TEXT) = CAST((
              CAST('EQ' AS VARCHAR)
            ) AS TEXT)
          )
          AND (
            CAST((
              exch_rate.to_crncy
            ) AS TEXT) = CAST((
              CASE
                WHEN (
                  (
                    CAST((
                      cmp.ctry_group
                    ) AS TEXT) = CAST((
                      CAST('India' AS VARCHAR)
                    ) AS TEXT)
                  )
                  OR (
                    (
                      cmp.ctry_group IS NULL
                    ) AND (
                      'India' IS NULL
                    )
                  )
                )
                THEN CAST('INR' AS VARCHAR)
                WHEN (
                  (
                    CAST((
                      cmp.ctry_group
                    ) AS TEXT) = CAST((
                      CAST('Philippines' AS VARCHAR)
                    ) AS TEXT)
                  )
                  OR (
                    (
                      cmp.ctry_group IS NULL
                    ) AND (
                      'Philippines' IS NULL
                    )
                  )
                )
                THEN CAST('PHP' AS VARCHAR)
                WHEN (
                  (
                    CAST(
                      cmp.ctry_group
                    AS TEXT) = CAST((
                      CAST('China Selfcare' AS VARCHAR)
                    ) AS TEXT)
                  )
                  OR (
                    (
                      cmp.ctry_group IS NULL
                    ) AND (
                      'China Selfcare' IS NULL
                    )
                  )
                )
                THEN CAST('RMB' AS VARCHAR)
                WHEN (
                  (
                    CAST((
                      cmp.ctry_group
                    ) AS TEXT) = CAST((
                      CAST('China Personal Care' AS VARCHAR)
                    ) AS TEXT)
                  )
                  OR (
                    (
                      cmp.ctry_group IS NULL
                    ) AND (
                      'China Personal Care' IS NULL
                    )
                  )
                )
                THEN CAST('RMB' AS VARCHAR)
                ELSE copa.obj_crncy_co_obj
              END
            ) AS TEXT)
          )
        )
        THEN SUM((
          copa.amt_obj_crncy * exch_rate.ex_rt
        ))
        ELSE CAST((
          CAST(NULL AS DECIMAL)
        ) AS DECIMAL(18, 0))
      END AS eq_lcy,
      CASE
        WHEN (
          CAST((
            cmp.ctry_group
          ) AS TEXT) = CAST((
            CAST('India' AS VARCHAR)
          ) AS TEXT)
        )
        THEN CAST('INR' AS VARCHAR)
        WHEN (
          CAST((
            cmp.ctry_group
          ) AS TEXT) = CAST((
            CAST('Philippines' AS VARCHAR)
          ) AS TEXT)
        )
        THEN CAST('PHP' AS VARCHAR)
        WHEN (
          (
            CAST((
              cmp.ctry_group
            ) AS TEXT) = CAST((
              CAST('China Selfcare' AS VARCHAR)
            ) AS TEXT)
          )
          OR (
            CAST((
              cmp.ctry_group
            ) AS TEXT) = CAST((
              CAST('China Personal Care' AS VARCHAR)
            ) AS TEXT)
          )
        )
        THEN CAST('RMB' AS VARCHAR)
        ELSE exch_rate.from_crncy
      END AS from_crncy,
      CAST('USD' AS VARCHAR) AS to_crncy,
      CASE
        WHEN (
          (
            CAST((
              copa.acct_hier_shrt_desc
            ) AS TEXT) = CAST((
              CAST('NTS' AS VARCHAR)
            ) AS TEXT)
          )
          AND (
            CAST((
              exch_rate.to_crncy
            ) AS TEXT) = CAST((
              CAST('USD' AS VARCHAR)
            ) AS TEXT)
          )
        )
        THEN SUM(copa.qty)
        ELSE CAST((
          CAST((
            0
          ) AS DECIMAL)
        ) AS DECIMAL(18, 0))
      END AS nts_qty,
      CASE
        WHEN (
          (
            CAST((
              copa.acct_hier_shrt_desc
            ) AS TEXT) = CAST((
              CAST('GTS' AS VARCHAR)
            ) AS TEXT)
          )
          AND (
            CAST((
              exch_rate.to_crncy
            ) AS TEXT) = CAST((
              CAST('USD' AS VARCHAR)
            ) AS TEXT)
          )
        )
        THEN SUM(copa.qty)
        ELSE CAST((
          CAST((
            0
          ) AS DECIMAL)
        ) AS DECIMAL(18, 0))
      END AS gts_qty,
      CASE
        WHEN (
          (
            CAST((
              copa.acct_hier_shrt_desc
            ) AS TEXT) = CAST((
              CAST('EQ' AS VARCHAR)
            ) AS TEXT)
          )
          AND (
            CAST((
              exch_rate.to_crncy
            ) AS TEXT) = CAST((
              CAST('USD' AS VARCHAR)
            ) AS TEXT)
          )
        )
        THEN SUM(copa.qty)
        ELSE CAST((
          CAST((
            0
          ) AS DECIMAL)
        ) AS DECIMAL(18, 0))
      END AS eq_qty,
      mat.matl_num AS "product code",
      mat.matl_desc AS "product name"
    FROM (
      (
        (
          (
            (
              edw_copa_trans_fact AS copa
                LEFT JOIN edw_material_dim AS mat
                  ON (
                    (
                      CAST((
                        copa.matl_num
                      ) AS TEXT) = CAST((
                        mat.matl_num
                      ) AS TEXT)
                    )
                  )
            )
            LEFT JOIN v_edw_customer_sales_dim AS cus_sales_extn
              ON (
                (
                  (
                    (
                      (
                        CAST((
                          cus_sales_extn."sls_org"
                        ) AS TEXT) = CAST((
                          CASE
                            WHEN (
                              (
                                (
                                  copa.sls_org IS NULL
                                )
                                AND (
                                  LTRIM(CAST((
                                    copa.cust_num
                                  ) AS TEXT), CAST((
                                    CAST('0' AS VARCHAR)
                                  ) AS TEXT)) = CAST((
                                    CAST('135520' AS VARCHAR)
                                  ) AS TEXT)
                                )
                              )
                              AND (
                                CAST((
                                  copa.co_cd
                                ) AS TEXT) = CAST((
                                  CAST('703A' AS VARCHAR)
                                ) AS TEXT)
                              )
                            )
                            THEN CAST('100A' AS VARCHAR)
                            ELSE copa.sls_org
                          END
                        ) AS TEXT)
                      )
                      AND (
                        CAST((
                          cus_sales_extn."dstr_chnl"
                        ) AS TEXT) = CAST((
                          CASE
                            WHEN (
                              (
                                (
                                  copa.dstr_chnl IS NULL
                                )
                                AND (
                                  LTRIM(CAST((
                                    copa.cust_num
                                  ) AS TEXT), CAST((
                                    CAST('0' AS VARCHAR)
                                  ) AS TEXT)) = CAST((
                                    CAST('135520' AS VARCHAR)
                                  ) AS TEXT)
                                )
                              )
                              AND (
                                CAST((
                                  copa.co_cd
                                ) AS TEXT) = CAST((
                                  CAST('703A' AS VARCHAR)
                                ) AS TEXT)
                              )
                            )
                            THEN CAST('15' AS VARCHAR)
                            ELSE copa.dstr_chnl
                          END
                        ) AS TEXT)
                      )
                    )
                    AND (
                      CAST((
                        copa.div
                      ) AS TEXT) = CAST((
                        cus_sales_extn."div"
                      ) AS TEXT)
                    )
                  )
                  AND (
                    CAST((
                      copa.cust_num
                    ) AS TEXT) = CAST((
                      cus_sales_extn."cust_num"
                    ) AS TEXT)
                  )
                )
              )
          )
          JOIN edw_company_dim AS cmp
            ON (
              (
                CAST((
                  copa.co_cd
                ) AS TEXT) = CAST((
                  cmp.co_cd
                ) AS TEXT)
              )
            )
        )
        LEFT JOIN (
          SELECT
            edw_vw_greenlight_skus.co_cd,
            edw_vw_greenlight_skus.matl_num,
            edw_vw_greenlight_skus.pka_product_key,
            edw_vw_greenlight_skus.greenlight_sku_flag
          FROM edw_vw_greenlight_skus
          GROUP BY
            edw_vw_greenlight_skus.co_cd,
            edw_vw_greenlight_skus.matl_num,
            edw_vw_greenlight_skus.pka_product_key,
            edw_vw_greenlight_skus.greenlight_sku_flag
        ) AS gn
          ON (
            (
              (
                LTRIM(
                  CAST((
                    copa.matl_num
                  ) AS TEXT),
                  CAST((
                    CAST((
                      0
                    ) AS VARCHAR)
                  ) AS TEXT)
                ) = LTRIM(gn.matl_num, CAST((
                  CAST((
                    0
                  ) AS VARCHAR)
                ) AS TEXT))
              )
              AND (
                CAST((
                  copa.co_cd
                ) AS TEXT) = CAST((
                  gn.co_cd
                ) AS TEXT)
              )
            )
          )
      )
      LEFT JOIN v_intrm_reg_crncy_exch_fiscper AS exch_rate
        ON (
          (
            (
              (
                CAST((
                  copa.obj_crncy_co_obj
                ) AS TEXT) = CAST((
                  exch_rate.from_crncy
                ) AS TEXT)
              )
              AND (
                copa.fisc_yr_per = exch_rate.fisc_per
              )
            )
            AND CASE
              WHEN (
                CAST((
                  exch_rate.to_crncy
                ) AS TEXT) <> CAST((
                  CAST('USD' AS VARCHAR)
                ) AS TEXT)
              )
              THEN (
                CAST((
                  exch_rate.to_crncy
                ) AS TEXT) = CAST((
                  CASE
                    WHEN (
                      (
                        CAST((
                          cmp.ctry_group
                        ) AS TEXT) = CAST((
                          CAST('India' AS VARCHAR)
                        ) AS TEXT)
                      )
                      OR (
                        (
                          cmp.ctry_group IS NULL
                        ) AND (
                          'India' IS NULL
                        )
                      )
                    )
                    THEN CAST('INR' AS VARCHAR)
                    WHEN (
                      (
                        CAST((
                          cmp.ctry_group
                        ) AS TEXT) = CAST((
                          CAST('Philippines' AS VARCHAR)
                        ) AS TEXT)
                      )
                      OR (
                        (
                          cmp.ctry_group IS NULL
                        ) AND (
                          'Philippines' IS NULL
                        )
                      )
                    )
                    THEN CAST('PHP' AS VARCHAR)
                    WHEN (
                      (
                        CAST((
                          cmp.ctry_group
                        ) AS TEXT) = CAST((
                          CAST('China Selfcare' AS VARCHAR)
                        ) AS TEXT)
                      )
                      OR (
                        (
                          cmp.ctry_group IS NULL
                        ) AND (
                          'China Selfcare' IS NULL
                        )
                      )
                    )
                    THEN CAST('RMB' AS VARCHAR)
                    WHEN (
                      (
                        CAST((
                          cmp.ctry_group
                        ) AS TEXT) = CAST((
                          CAST('China Personal Care' AS VARCHAR)
                        ) AS TEXT)
                      )
                      OR (
                        (
                          cmp.ctry_group IS NULL
                        ) AND (
                          'China Personal Care' IS NULL
                        )
                      )
                    )
                    THEN CAST('RMB' AS VARCHAR)
                    ELSE copa.obj_crncy_co_obj
                  END
                ) AS TEXT)
              )
              ELSE (
                CAST((
                  exch_rate.to_crncy
                ) AS TEXT) = CAST((
                  CAST('USD' AS VARCHAR)
                ) AS TEXT)
              )
            END
          )
        )
    )
    WHERE
      (
        (
          (
            (
              CAST((
                copa.acct_hier_shrt_desc
              ) AS TEXT) = CAST((
                CAST('GTS' AS VARCHAR)
              ) AS TEXT)
            )
            OR (
              CAST((
                copa.acct_hier_shrt_desc
              ) AS TEXT) = CAST((
                CAST('NTS' AS VARCHAR)
              ) AS TEXT)
            )
          )
          OR (
            CAST((
              copa.acct_hier_shrt_desc
            ) AS TEXT) = CAST((
              CAST('EQ' AS VARCHAR)
            ) AS TEXT)
          )
        )
        AND (
          CAST((
            CAST((
              copa.fisc_yr_per
            ) AS VARCHAR)
          ) AS TEXT) >= (
            (
              (
                CAST((
                  CAST((
                    (
                      DATE_PART(YEAR, CURRENT_DATE()) - 2
                    )
                  ) AS VARCHAR)
                ) AS TEXT) || CAST((
                  CAST((
                    0
                  ) AS VARCHAR)
                ) AS TEXT)
              ) || CAST((
                CAST((
                  0
                ) AS VARCHAR)
              ) AS TEXT)
            ) || CAST((
              CAST((
                1
              ) AS VARCHAR)
            ) AS TEXT)
          )
        )
      )
    GROUP BY
      copa.fisc_yr,
      copa.fisc_yr_per,
      copa.obj_crncy_co_obj,
      copa.cust_num,
      copa.acct_num,
      cmp.ctry_group,
      cmp."cluster",
      mat.mega_brnd_desc,
      mat.brnd_desc,
      mat.varnt_desc,
      mat.base_prod_desc,
      mat.put_up_desc,
      mat.prodh1_txtmd,
      mat.prodh2_txtmd,
      mat.prodh3_txtmd,
      mat.prodh4_txtmd,
      mat.prodh5_txtmd,
      mat.prodh6_txtmd,
      mat.pka_franchise_cd,
      mat.pka_franchise_desc,
      mat.pka_brand_cd,
      mat.pka_brand_desc,
      mat.pka_sub_brand_cd,
      mat.pka_sub_brand_desc,
      mat.pka_variant_cd,
      mat.pka_variant_desc,
      mat.pka_sub_variant_cd,
      mat.pka_sub_variant_desc,
      mat.pka_flavor_cd,
      mat.pka_flavor_desc,
      mat.pka_ingredient_cd,
      mat.pka_ingredient_desc,
      mat.pka_application_cd,
      mat.pka_application_desc,
      mat.pka_length_cd,
      mat.pka_length_desc,
      mat.pka_shape_cd,
      mat.pka_shape_desc,
      mat.pka_spf_cd,
      mat.pka_spf_desc,
      mat.pka_cover_cd,
      mat.pka_cover_desc,
      mat.pka_form_cd,
      mat.pka_form_desc,
      mat.pka_size_cd,
      mat.pka_size_desc,
      mat.pka_character_cd,
      mat.pka_character_desc,
      mat.pka_package_cd,
      mat.pka_package_desc,
      mat.pka_attribute_13_cd,
      mat.pka_attribute_13_desc,
      mat.pka_attribute_14_cd,
      mat.pka_attribute_14_desc,
      mat.pka_sku_identification_cd,
      mat.pka_sku_identification_desc,
      mat.pka_one_time_relabeling_cd,
      mat.pka_one_time_relabeling_desc,
      mat.pka_product_key,
      mat.pka_product_key_description,
      mat.pka_product_key_description_2,
      mat.pka_root_code,
      mat.pka_root_code_desc_1,
      mat.pka_root_code_desc_2,
      gn.greenlight_sku_flag,
      cus_sales_extn."parent customer",
      cus_sales_extn."banner",
      cus_sales_extn."banner format",
      cus_sales_extn."channel",
      cus_sales_extn."go to model",
      cus_sales_extn."sub channel",
      cus_sales_extn."retail_env",
      exch_rate.from_crncy,
      exch_rate.to_crncy,
      copa.acct_hier_shrt_desc,
      mat.matl_num,
      mat.matl_desc
  ) AS derived_table1
  GROUP BY
    derived_table1.fisc_yr,
    derived_table1.fisc_yr_per,
    derived_table1.fisc_day,
    derived_table1.ctry_nm,
    derived_table1."cluster",
    derived_table1.obj_crncy_co_obj,
    derived_table1."b1 mega-brand",
    derived_table1."b2 brand",
    derived_table1."b3 base product",
    derived_table1."b4 variant",
    derived_table1."b5 put-up",
    derived_table1."prod h1 operating group",
    derived_table1."prod h2 franchise group",
    derived_table1."prod h3 franchise",
    derived_table1."prod h4 product franchise",
    derived_table1."prod h5 product major",
    derived_table1."prod h6 product minor",
    derived_table1.pka_franchise_desc,
    derived_table1.pka_brand_desc,
    derived_table1.pka_sub_brand_desc,
    derived_table1.pka_variant_desc,
    derived_table1.pka_sub_variant_desc,
    derived_table1.pka_flavor_desc,
    derived_table1.pka_ingredient_desc,
    derived_table1.pka_application_desc,
    derived_table1.pka_length_desc,
    derived_table1.pka_shape_desc,
    derived_table1.pka_spf_desc,
    derived_table1.pka_cover_desc,
    derived_table1.pka_form_desc,
    derived_table1.pka_size_desc,
    derived_table1.pka_character_desc,
    derived_table1.pka_package_desc,
    derived_table1.pka_attribute_13_desc,
    derived_table1.pka_attribute_14_desc,
    derived_table1.pka_sku_identification_desc,
    derived_table1.pka_one_time_relabeling_desc,
    derived_table1.pka_product_key,
    derived_table1.pka_product_key_description,
    derived_table1.pka_product_key_description_2,
    derived_table1.pka_root_code,
    derived_table1.pka_root_code_desc_1,
    derived_table1.pka_root_code_desc_2,
    derived_table1.greenlight_sku_flag,
    derived_table1."parent customer",
    derived_table1.banner,
    derived_table1."banner format",
    derived_table1.channel,
    derived_table1."go to model",
    derived_table1."sub channel",
    derived_table1.retail_env,
    derived_table1.from_crncy,
    derived_table1.to_crncy,
    derived_table1."product code",
    derived_table1."product name"
  )
  select * from transformed
);
