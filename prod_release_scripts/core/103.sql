truncate table ASPITG_INTEGRATION.ITG_WEEKLY_FORECAST;COPY INTO ASPITG_INTEGRATION.ITG_WEEKLY_FORECAST FROM '@UTILITY_RAW.PROD_CORE_STAGE_S3/RG_ITG_ITG_WEEKLY_FORECAST/' FILE_FORMAT = 'UTILITY_RAW.PROD_CORE_CSV_FILEFORMAT'