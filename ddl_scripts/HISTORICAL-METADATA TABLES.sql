USE SCHEMA META_RAW;
create or replace TABLE PIPELINE_TYPE (
	PIPELINE_TYPE_ID NUMBER(38,0) NOT NULL autoincrement start 1 increment 1 order,
	PIPELINE_TYPE_NAME VARCHAR(100) NOT NULL,
	PIPELINE_TYPE_DESC VARCHAR(500) NOT NULL,
	IS_ACTIVE BOOLEAN NOT NULL,
	constraint PK_1 primary key (PIPELINE_TYPE_ID)
);

create or replace TABLE SOURCE (
	SOURCE_ID NUMBER(38,0) NOT NULL autoincrement start 1 increment 1 order,
	SOURCE_NAME VARCHAR(255) NOT NULL,
	SOURCE_TYPE VARCHAR(255),
	FREQUENCY VARCHAR(50),
	constraint PK_1 primary key (SOURCE_ID)
);

create or replace TABLE USECASE (
	USECASE_ID NUMBER(38,0) NOT NULL autoincrement start 1 increment 1 order,
	USECASE_NAME VARCHAR(100) NOT NULL,
	CATEGORY VARCHAR(100) NOT NULL,
	USECASE_DESCRIPTION VARCHAR(500),
	IS_ACTIVE BOOLEAN NOT NULL,
	SEQUENCE_ID NUMBER(38,0),
	constraint PK_1 primary key (USECASE_ID)
);

create or replace TABLE PROCESS (
	PROCESS_ID NUMBER(38,0) NOT NULL autoincrement start 1 increment 1 order,
	PARAMETER_GROUP_ID NUMBER(38,0),
	PROCESS_NAME VARCHAR(200) NOT NULL,
	PIPELINE_TYPE_ID NUMBER(38,0) NOT NULL,
	GROUP_ID NUMBER(38,0) NOT NULL,
	SEQUENCE_ID NUMBER(38,0) NOT NULL,
	IS_INCREMENTAL BOOLEAN,
	IS_ACTIVE BOOLEAN NOT NULL,
	USECASE_ID NUMBER(38,0) NOT NULL,
	SOURCE_ID NUMBER(38,0),
	PHASE_ID NUMBER(38,0) NOT NULL,
	SCRIPT_GROUP_ID NUMBER(38,0),
	SOURCE_CDC_COLUMN VARCHAR(200),
	SOURCE_CDC_DATATYPE VARCHAR(500),
	SNOWFLAKE_CDC_COLUMN VARCHAR(200),
	SNOWFLAKE_STAGE VARCHAR(500),
	SNOWFLAKE_FILE_FORMAT VARCHAR(500),
	PHASE_TYPE VARCHAR(50),
	constraint PK_1 primary key (PROCESS_ID),
	constraint FK_4 foreign key (PIPELINE_TYPE_ID) references PIPELINE_TYPE(PIPELINE_TYPE_ID),
	constraint FK_5 foreign key (USECASE_ID) references USECASE(USECASE_ID),
	constraint FK_7 foreign key (SOURCE_ID) references SOURCE(SOURCE_ID)
);

create or replace TABLE ERROR_LOG (
	ERROR_LOG_ID NUMBER(38,0) NOT NULL autoincrement start 1 increment 1 order,
	PROCESS_ID NUMBER(38,0) NOT NULL,
	PHASE_ID NUMBER(38,0) NOT NULL,
	MOMENT TIMESTAMP_NTZ(9) NOT NULL,
	RUN_ID VARCHAR(100) NOT NULL,
	JOB_ID VARCHAR(100) NOT NULL,
	JOB_NAME VARCHAR(255) NOT NULL,
	ERROR_MESSAGE VARCHAR(16777216),
	ERROR_CODE VARCHAR(50),
	CATEGORY VARCHAR(100) NOT NULL,
	constraint PK_1 primary key (ERROR_LOG_ID),
	constraint FK_2 foreign key (PROCESS_ID) references PROCESS(PROCESS_ID)
);

create or replace TABLE INCREMENTAL_WATERMARK (
	WATERMARK_ID NUMBER(38,0) NOT NULL autoincrement start 1 increment 1 order,
	PROCESS_ID NUMBER(38,0) NOT NULL,
	WATERMARK_VALUE VARCHAR(500) NOT NULL,
	INSERT_TIMESTAMP TIMESTAMP_NTZ(9) DEFAULT CURRENT_TIMESTAMP(),
	LOAD_STATUS VARCHAR(100) NOT NULL,
	constraint PK_1 primary key (WATERMARK_ID),
	constraint FK_1 foreign key (PROCESS_ID) references PROCESS(PROCESS_ID)
);

create or replace TABLE PARAMETERS (
	PARAMETER_ID NUMBER(38,0) NOT NULL autoincrement start 1 increment 1 order,
	PARAMETER_GROUP_ID NUMBER(38,0) NOT NULL,
	PARAMETER_GROUP_NAME VARCHAR(200) NOT NULL,
	PARAMETER_NAME VARCHAR(200) NOT NULL,
	PARAMETER_VALUE VARCHAR(1000),
	IS_SENSITIVE BOOLEAN NOT NULL,
	IS_ACTIVE BOOLEAN NOT NULL,
	constraint PK_1 primary key (PARAMETER_ID)
);

create or replace TABLE PHASE (
	PHASE_ID NUMBER(38,0) NOT NULL autoincrement start 1 increment 1 order,
	PHASE_NAME VARCHAR(255) NOT NULL,
	PHASE_DESCRIPTION VARCHAR(2000),
	constraint PK_1 primary key (PHASE_ID)
);



create or replace TABLE PROCESS_AUDIT_LOG (
	AUDIT_LOG_ID NUMBER(38,0) NOT NULL autoincrement start 1 increment 1 order,
	PROCESS_ID NUMBER(38,0) NOT NULL,
	PHASE_ID NUMBER(38,0) NOT NULL,
	MOMENT TIMESTAMP_NTZ(9) NOT NULL,
	DURATION VARCHAR(50),
	PIPELINE_ID VARCHAR(50) NOT NULL,
	RUN_ID VARCHAR(100),
	JOB_NAME VARCHAR(255) NOT NULL,
	MESSAGE VARCHAR(16777216),
	PROCESS_STATUS VARCHAR(50) NOT NULL,
	INPUT_ROW_COUNT NUMBER(38,0),
	OUTPUT_ROW_COUNT NUMBER(38,0),
	CATEGORY VARCHAR(50),
	GROUP_ID NUMBER(38,0),
	USECASE_ID NUMBER(38,0),
	constraint PK_1 primary key (AUDIT_LOG_ID),
	constraint FK_6 foreign key (PHASE_ID) references PHASE(PHASE_ID),
	constraint FK_8 foreign key (PROCESS_ID) references PROCESS(PROCESS_ID)
);

create or replace TABLE PROCESS_SCRIPT (
	PROCESS_SCRIPT_ID NUMBER(38,0) NOT NULL autoincrement start 1 increment 1 order,
	SCRIPT_GROUP_ID NUMBER(38,0) NOT NULL,
	SEQUENCE_ID NUMBER(38,0) NOT NULL,
	SCRIPT_PATH VARCHAR(255) NOT NULL,
	SCRIPT_NAME VARCHAR(100) NOT NULL,
	SCRIPT_EXTENSION VARCHAR(10) NOT NULL,
	IS_ACTIVE BOOLEAN NOT NULL,
	constraint PK_1 primary key (PROCESS_SCRIPT_ID)
);






