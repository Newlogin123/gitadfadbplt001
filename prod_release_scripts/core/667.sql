
create table PROD_DNA_CORE.HCPITG_INTEGRATION.SDL_HCP360_IN_VENTASYS_DETAILINGDATA_RAW_backup_21_11_2024 
as select * from PROD_DNA_CORE.HCPITG_INTEGRATION.SDL_HCP360_IN_VENTASYS_DETAILINGDATA_RAW;

create table PROD_DNA_CORE.HCPEDW_INTEGRATION.EDW_HCP360_IN_VENTASYS_PRESCRIPTION_FACT_backup_21_11_2024 
as select * from PROD_DNA_CORE.HCPEDW_INTEGRATION.EDW_HCP360_IN_VENTASYS_PRESCRIPTION_FACT;


alter table PROD_DNA_CORE.HCPITG_INTEGRATION.SDL_HCP360_IN_VENTASYS_DETAILINGDATA_RAW alter column P3_DTL type VARCHAR (100);
alter table PROD_DNA_CORE.HCPITG_INTEGRATION.SDL_HCP360_IN_VENTASYS_DETAILINGDATA_RAW alter column P4_DTL type VARCHAR (100);
alter table PROD_DNA_CORE.HCPEDW_INTEGRATION.EDW_HCP360_IN_VENTASYS_PRESCRIPTION_FACT alter column PRODUCT type VARCHAR (100);
commit

