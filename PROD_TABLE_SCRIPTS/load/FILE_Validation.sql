create or replace stage THASDL_RAW.PROD_LOAD_STAGE_ADLS
 storage_integration = PROD_DNA_LOAD_AZURE34_SI
 url = 'azure://dlsadbplt001.blob.core.windows.net/tha/';

CREATE OR REPLACE PROCEDURE THASDL_RAW.FILE_VALIDATION("PARAM" ARRAY)
RETURNS VARCHAR(16777216)
LANGUAGE PYTHON
RUNTIME_VERSION = '3.11'
PACKAGES = ('regex==2023.10.3','snowflake-snowpark-python==*')
HANDLER = 'main'
EXECUTE AS OWNER
AS '

import snowflake.snowpark as snowpark
from snowflake.snowpark.functions import col
import math
import regex

def main(session: snowpark.Session,Param): 
    try:


        CURRENT_FILE        =  Param[0]
        index               =  Param[1]
        validation          =  Param[2]
        val_file_name       =  Param[3]
        val_file_extn       =  Param[4]
        val_header          =  Param[5]
        file_header_row_num	=  Param[6]
        stage_name     		=  Param[7]
        temp_stage_path		=  Param[8]
        header_reg          =  Param[9]

        FileNameValidation,FileExtnValidation,FileHeaderValidation = validation.split("-")
        counter             =  0 

    
        
    
        if stage_name.split(".")[0]=="ASPSDL_RAW":
            processed_file_name=rg_travel_validation(CURRENT_FILE)
            
        
        elif stage_name.split(".")[0]=="THASDL_RAW":
           processed_file_name=thailand_processing(CURRENT_FILE)

        else:
            processed_file_name=CURRENT_FILE

    
        
        
        if index.lower() == "last":
            extracted_filename = processed_file_name.rsplit("_", 1)[0]
        elif index.lower() == "first":
            extracted_filename = processed_file_name.split("_")[0]
        elif index.lower() == "full":
            extracted_filename = processed_file_name.rsplit(".", 1)[0]
    
    
        
    
        if FileNameValidation=="1":
            file_name_validation_status,counter=file_validation(counter,extracted_filename,val_file_name)
        else :
            print("File Name Validation not required")
    
    
        
    
        if FileExtnValidation == "1":
            file_ext_validation_status,counter=file_extn_validation(counter,CURRENT_FILE,val_file_extn)
        else:
            print("File extension Validation not required")
    
    
        # Check for File Header Validation
    
        if FileHeaderValidation == "1":

            
            if "CRM_Children" in CURRENT_FILE or "TH_CRM_Consumer" in CURRENT_FILE:
                utf_encoding= ''UTF-16''
            else:
                utf_encoding= ''UTF-8''
            
            if "NTUC" in CURRENT_FILE:
                
                file="CORE"
                file_name=file +".csv"
                data_core = session.read.option("INFER_SCHEMA", True).option("field_optionally_enclosed_by", "\\"").csv("@"+stage_name+"/"+temp_stage_path+"/"+file_name)
                df_core=data_core.to_pandas()
                header_core=df_core.iloc[int(file_header_row_num)].tolist()

                file="OTC"
                file_name=file +".csv"
                data_otc = session.read.option("INFER_SCHEMA", True).option("field_optionally_enclosed_by", "\\"").csv("@"+stage_name+"/"+temp_stage_path+"/"+file_name)
                df_otc=data_otc.to_pandas()
                header_otc=df_otc.iloc[int(file_header_row_num)].tolist()

                if header_core!=header_otc:
                    return "File Validation Failed; Columns from both the sheets are not matching"
                else:
                    header=header_core
                
            else:
                file_name= CURRENT_FILE.replace("xlsx","csv")
                file_name = file_name.replace("(", "").replace(")", "").replace(" ","_")
                df = session.read.option("INFER_SCHEMA", True).option("field_optionally_enclosed_by", "\\"").option("encoding",utf_encoding).csv("@"+stage_name+"/"+temp_stage_path+"/"+file_name)
            
                df_pandas=df.to_pandas()
                header=df_pandas.iloc[int(file_header_row_num)].tolist()
                    
                

            

            header_pipe_split = header[0].split(''|'')
            if val_file_extn==''xlsx'':
                result_list = header[0].split(''\\x01'')
            elif len(header_pipe_split)>1:
                result_list = header_pipe_split
            else:
                result_list = header
            
            result_list=list(filter(None,result_list))
            filtered_list = [value for value in result_list if value is not None and not (isinstance(value, float) and math.isnan(value))]
            file_header= [item.replace(" ", "_").replace(".", "_") for item in filtered_list]
            val_header= val_header.lower()

            
            
            comma_split = val_header.split('','')
            if len(comma_split) > 1:
                final_val_header=comma_split
    
            pipe_split = val_header.split(''|'')
            if len(pipe_split) > 1:
                final_val_header=pipe_split

            header_reg = header_reg.lower()
            regex_list = header_reg.split(''^'')
            
            file_header_validation_status,counter=file_header_validation(counter,final_val_header,file_header, regex_list)
        
        else:
            print("File Header Validation not required")


        if counter == 0 :
                validation_status = "SUCCESS: File validation passed" 
        elif counter == 1 :
                validation_status = "FAILED: {0}".format(file_name_validation_status)
        elif counter == 2 :
                validation_status = "FAILED: {0}".format(file_ext_validation_status)
        elif counter == 3 :
                validation_status = "FAILED: {0};{1}".format(file_name_validation_status,file_ext_validation_status)
        elif counter == 4 :
                validation_status = "FAILED: {0}".format(file_header_validation_status)
        elif counter == 5:
            validation_status = "FAILED: {0},{1}".format(file_name_validation_status,file_header_validation_status)
        elif counter == 6:
                validation_status = "FAILED: {0},{1}".format(file_ext_validation_status,file_header_validation_status)
        else :
                validation_status = "FAILED: {0};{1};{2}".format(file_name_validation_status,file_ext_validation_status,file_header_validation_status)
        
        return validation_status

    except Exception as e:
            
            error_message = f"FAILED: {str(e)}"
            return error_message


def rg_travel_validation(CURRENT_FILE):
    
    
    if "CNSC" in CURRENT_FILE:
            fileA = CURRENT_FILE.replace(" ", "_")
            file = fileA.replace("_", "_",1)
            print("FileName : ", file)
    elif "Dufry" in CURRENT_FILE:
            fileA = CURRENT_FILE.replace(" ", "_")
            file = fileA.replace("_", " ",1)
            print("FileName : ", file)
    elif "Vendor" in CURRENT_FILE:
            fileA = CURRENT_FILE.replace(" ", "_")
            file = fileA.replace("_", "_",1)
            print("FileName : ", file)
    elif "LSTR" in CURRENT_FILE:
            file = CURRENT_FILE.replace(" ", "_")
            print("FileName : ", file)
    else:
            file = CURRENT_FILE
            print("FileName : ", file)

    return file

def thailand_processing(CURRENT_FILE):

    if "COP_1" in CURRENT_FILE:
        file= CURRENT_FILE.replace("_"," ",3)
        print("FileName : ", file)
    elif "Shelf" in CURRENT_FILE:
        file=CURRENT_FILE.replace("_"," ",5)
        print("FileName : ", file)
    elif "OSA" in CURRENT_FILE:
        file=CURRENT_FILE.replace("_"," ",4)
        print("FileName : ", file)
    elif "TH_Action" in CURRENT_FILE:
        split_name=CURRENT_FILE.split("_")
        file= ("_").join(split_name[0:4])+"."+CURRENT_FILE.split(".")[-1]
    elif "LAO" in CURRENT_FILE or "Schedule" in CURRENT_FILE or "Visit" in CURRENT_FILE:
        file=CURRENT_FILE.rsplit("_",1)[0]
        print("FileName : ", file)
    else:
        file = CURRENT_FILE.replace(" ","_")
        print("FileName : ", file)

    return file




def file_validation(counter,extracted_filename,val_file_name):

        if val_file_name.upper() == extracted_filename.upper():
            file_name_validation_status=""
            print("file_name_validation_status is successful")
        elif regex.match(val_file_name.upper(), extracted_filename.upper()):
            file_name_validation_status=""
            print("file_name_validation_status is successful")       
        else:
            file_name_validation_status="Invalid File Name, received  " + extracted_filename+" while expecting " +val_file_name
            print("file_name_validation_status",file_name_validation_status)
            counter = 1
        return file_name_validation_status,counter
    



def file_extn_validation(counter,CURRENT_FILE,val_file_extn):
    
        current_file_extn = CURRENT_FILE.split(".")[-1]
        if current_file_extn.upper() == val_file_extn.upper():
            file_ext_validation_status=""
            print("file_ext_validation_status is successful")
        else:
            file_ext_validation_status="Invalid File Extension"
            print("file_ext_validation_status",file_ext_validation_status)
            counter = counter+2
        return file_ext_validation_status,counter

def file_header_validation(counter,final_val_header,file_header, hreg):

        
        file_header_rejected_list=[]
        val_rejected_list=[]
        index=[]
        extra_columns=[]

        file_header=[x.lower() for x in file_header]
        val_header_count=len(final_val_header)
        file_header_count=len(file_header)
    
        rindex = 0
        for i in range(max(file_header_count, val_header_count)):
            if i < file_header_count and i < val_header_count:
                if "{r}" in final_val_header[i]:
                    final_val_header[i] = final_val_header[i].replace("{r}", hreg[rindex])
                    if rindex < len(hreg)-1:
                        rindex += 1
                    if not regex.match(final_val_header[i],file_header[i]):
                        index.append(i+1)
                        file_header_rejected_list.append(file_header[i])
                elif file_header[i] != final_val_header[i]:
                    index.append(i+1)
                    file_header_rejected_list.append(file_header[i])               

            elif i < file_header_count:
                extra_columns.append(file_header[i])
            elif i < val_header_count:
                val_rejected_list.append(final_val_header[i])
            
            
    
        if file_header_count==val_header_count and not file_header_rejected_list:
            file_header_validation_status="Success"
            print("file_header_validation_status is successful")

            
        elif len(file_header_rejected_list)!=0 and not extra_columns:
            file_header_validation_status="Header validation Failed"+" , unmatched columns found in index "+ str(index) +" and columns are" + str(file_header_rejected_list) + " expected "+str(final_val_header)+ " received " + str(file_header)
            print("file_header_validation_status",file_header_validation_status)
            counter = counter+4

            
        elif len(extra_columns)!=0:
            file_header_validation_status="Header validation Failed, unmatched columns found in index " + str(index) + " and columns are " + str(file_header_rejected_list) + " ; extra columns found in file header! " + str(extra_columns) 
            print("file_header_validation_status",file_header_validation_status)
            counter = counter+4

        else:
            file_header_validation_status="Header validation Failed, columns missing from file header!" + str(val_rejected_list)
            counter = counter+4
        
            
        return file_header_validation_status,counter

';