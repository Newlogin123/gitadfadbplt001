use WAREHOUSE PROD_DNA_CORE_APP2_WH;

delete 
from PROD_DNA_CORE.PCFEDW_INTEGRATION.EDW_DEMAND_FORECAST_SNAPSHOT_temp
WHERE PAC_SUBSOURCE_TYPE  in ('PX_FORECAST')
and to_char(snap_shot_dt, 'YYYYMM') =202403
and jj_period < 201303;
