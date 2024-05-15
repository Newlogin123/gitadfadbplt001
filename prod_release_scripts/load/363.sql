CREATE OR REPLACE PROCEDURE PCFSDL_RAW.PCF_PERENSO_ORDER_PREPROCESSING("PARAM" ARRAY)
RETURNS VARCHAR(16777216)
LANGUAGE PYTHON
RUNTIME_VERSION = '3.8'
PACKAGES = ('openpyxl==3.0.10','snowflake-snowpark-python==*')
HANDLER = 'main'
EXECUTE AS OWNER
AS 'import snowflake.snowpark as snowpark
from snowflake.snowpark.types import StringType, StructType, StructField ,DecimalType
from snowflake.snowpark.functions import lit
from datetime import datetime
import pytz


def get_schema(file_name):
    df_schema=""
    select_col=""
    if file_name.startswith("OrderHdr"):
        df_schema=StructType([
        StructField("ORDER_KEY" , StringType()),
        StructField("ORDER_TYPE_KEY" , StringType()),
        StructField("ACCT_KEY" , StringType()),
        StructField("ORDER_DATE" , StringType()),
        StructField("STATUS" , StringType()),
        StructField("CHARGE" , StringType()),
        StructField("CONFIRMATION" , StringType()),
        StructField("DIARY_ITEM_KEY" , StringType()),
        StructField("WORK_ITEM_KEY" , StringType()),
        StructField("ACCOUNT_ORDER_NO" , StringType()),
        StructField("DELVRY_INSTNS" , StringType()),
            ])
        select_col=["ORDER_KEY","ORDER_TYPE_KEY","ACCT_KEY","ORDER_DATE","STATUS","CHARGE","CONFIRMATION","DIARY_ITEM_KEY","WORK_ITEM_KEY","ACCOUNT_ORDER_NO","DELVRY_INSTNS","RUN_ID","CREATE_DT"]
    if file_name.startswith("OrderType"):
        df_schema=StructType([
        StructField("ORDER_TYPE_KEY" , StringType()),
        StructField("ORDER_TYPE_DESC" , StringType()),
        StructField("SOURCE" , StringType())
            ])
        select_col=["ORDER_TYPE_KEY","ORDER_TYPE_DESC","SOURCE","run_id","create_dt"]
    if file_name.startswith("OrderBatch"):
        df_schema=StructType([
        StructField("ORDER_KEY" , StringType()),
        StructField("BATCH_KEY" , StringType()),
        StructField("BRANCH_KEY" , StringType()),
        StructField("DIST_ACCT" , StringType()),
        StructField("DELVRY_DT" , StringType()),
        StructField("STATUS" , StringType()),
        StructField("SUFFIX" , StringType()),
        StructField("SENT_DT" , StringType()),
            ])
        select_col=["ORDER_KEY","BATCH_KEY","BRANCH_KEY","DIST_ACCT","DELVRY_DT","STATUS","SUFFIX","SENT_DT","RUN_ID","CREATE_DT"]
    if file_name.startswith("OrderDetail"):
        df_schema=StructType([
         StructField("ORDER_KEY", StringType()),
        StructField("BATCH_KEY", StringType()),
        StructField("LINE_KEY", StringType()),
        StructField("PROD_KEY", StringType()),
        StructField("UNIT_QTY", StringType()),
        StructField("ENTERED_QTY", StringType()),
        StructField("ENTERED_UNIT_KEY", StringType()),
        StructField("LIST_PRICE", StringType()),
        StructField("NIS", StringType()),
        StructField("RRP", StringType()),
        StructField("DISC_KEY", StringType()),
        StructField("CREDIT_LINE_KEY", StringType()),
        StructField("CREDITED", StringType())
            ])
        select_col=["ORDER_KEY","BATCH_KEY","LINE_KEY","PROD_KEY","UNIT_QTY","ENTERED_QTY","ENTERED_UNIT_KEY","LIST_PRICE","NIS","RRP","DISC_KEY","CREDIT_LINE_KEY","CREDITED", "RUN_ID", "CREATE_DT"]
    return df_schema,select_col
    

def main(session: snowpark.Session,Param):
    try:
        # Extracting parameters from the input

        file_name       = Param[0]     
        stage_name      = Param[1]
        temp_stage_path = Param[2]
        db_name         = stage_name.split(".")[0]
        target_table    = db_name+"."+Param[3]
        current_date = datetime.now()
        formatted_year = current_date.strftime("%Y")
        formatted_month = current_date.strftime("%m")


        # Define the schema for the DataFrame
        df_schema,select_col=get_schema(file_name)
        

        df = session.read\\
        .schema(df_schema)\\
        .option("skip_header",1)\\
        .option("field_delimiter", ",")\\
        .option("field_optionally_enclosed_by", "\\"")\\
        .csv("@"+stage_name+"/"+temp_stage_path+"/"+file_name)
        
        df=df.na.drop("all")
        if df.count()==0:
            return "No Data in file"

            
        df = df.withColumn("run_id",lit(datetime.now(pytz.timezone("Asia/Singapore")).strftime("%Y%m%d%H%M%S")))
        df = df.withColumn("create_dt",lit(datetime.now(pytz.timezone("Asia/Singapore")).strftime("%Y-%m-%d %H:%M:%S")))
            
        
                    
        final_df=df.select(select_col)
                        


        file_name=file_name+"_"+datetime.now().strftime("%Y%m%d%H%M%S")
        
        # write to target table
        final_df.write.mode("append").saveAsTable(target_table)
        
        #move to success
        final_df.write.copy_into_location("@"+stage_name+"/"+temp_stage_path+"/"+"processed/success/"+formatted_year+"/"+formatted_month+"/"+file_name,header=True,OVERWRITE=True)


        return "Success"

    except KeyError as key_error:
        # Handle KeyError (missing columns) here
        error_message = f"KeyError: {str(key_error)}"
        return error_message

    
    except Exception as e:
        # Handle exceptions here
        error_message = f"Error: {str(e)}"
        return error_message';