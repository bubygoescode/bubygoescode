/****** Object:  Table [dbo].[BATCH_METADATA]    Script Date: 12/5/2023 10:16:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BATCH_METADATA](
	[BATCH_ID] [int] NULL,
	[BATCH_NAME] [varchar](200) NULL,
	[BATCH_DESC] [varchar](200) NULL,
	[BATCH_FREQUENCY] [varchar](100) NULL,
	[CREATED_DTTM] [datetime] NULL,
	[UPDATED_DTTM] [datetime] NULL,
	[CREATED_BY] [varchar](100) NULL,
	[UPDATED_BY] [varchar](100) NULL,
 CONSTRAINT [PK_CONNECTIONS_METADATA] PRIMARY KEY CLUSTERED 
(
	[BATCH_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[BATCH_RUN_STATS]    Script Date: 12/5/2023 10:16:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BATCH_RUN_STATS](
	[BATCH_RUN_ID] [bigint] NULL,
	[BATCH_ID] [bigint] NULL,
	[SRC_NAME] [varchar](200) NOT NULL,
	[BATCH_RUN_STARTDTTM] [datetime] NULL,
	[BATCH_RUN_END_DTTM] [datetime] NULL,
	[BATCH_STATUS] [varchar](200) NULL,
	[BATCH_ERR_DESC] [varchar](200) NULL,
 CONSTRAINT [PK_CONNECTIONS_METADATA] PRIMARY KEY CLUSTERED 
(
	[BATCH_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CONNECTIONS_METADATA]    Script Date: 12/5/2023 10:16:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONNECTIONS_METADATA](
	[SRC_ID] DECIMAL(4,0) NOT NULL,
	[SRC_SCHEMA_ID] [int] NOT NULL,
	[SCHEMA_NAME] [varchar](255) NOT NULL,
	[SRC_DB_TYPE] [varchar](255) NULL,
	[SRC_DB_NAME] [varchar](255) NOT NULL,
	[DB_SRVR_NAME] [varchar](255) NOT NULL,
	[PORT] [int] NULL,
	[CONN_STRING] [varchar](1024) NULL,
	[USER_ID] [varchar](255) NULL,
	[PWD] [varchar](1000) NULL,
	[NUM_CONN] [int] NULL,
	[SRC_NAME] [varchar](255) NULL,
	[CREATED_DTTM] [datetime] NULL,
	[EXEC_WINDOW] [varchar](100) NULL,
	[DESCRIPTION] [varchar](1024) NULL,
	[ADLS_PROPERTY] [varchar](1024) NULL,
	[CONTAINER] [varchar](200) NULL,
 CONSTRAINT [PK_CONNECTIONS_METADATA] PRIMARY KEY CLUSTERED 
(
	[SRC_SCHEMA_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JOB_RUN_STATS]    Script Date: 12/5/2023 10:16:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JOB_RUN_STATS](
	[SRC_SCHEMA_ID] [int] NOT NULL,
	[SRC_NAME] [varchar](100) NULL,
	[BATCH_RUN_ID] [decimal](18, 0) NOT NULL,
	[JOB_RUN_ID] [decimal](24, 0) NOT NULL,
	[JOB_STATUS] [varchar](200) NULL,
	[JOB_START_DTTM] [datetime] NULL,
	[JOB_END_DTTM] [datetime] NULL,
	[PIPELINE_RUN_ID] [varchar](255) NULL,
	[ERROR_DESC] [varchar](8000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OBJ_METADATA]    Script Date: 12/5/2023 10:16:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OBJ_METADATA](
	[SRC_SCHEMA_ID] [int] NOT NULL,
	[OBJ_ID] DECIMAL(5,0) NOT NULL,
	[OBJ_NAME] [varchar](200) NOT NULL,
	[ERROR_THRESHOLD] [int] NULL,
	[LOAD_GRP] [int] NULL,
	[LOAD_TYPE] [varchar](255) NOT NULL,
	[OBJ_JOB_PARAMETERS] [varchar](4096) NULL,
	[SELECT_STMT] [varchar](max) NULL,
	[FILTER_CONDITIONS] [varchar](4096) NULL,
	[ACTIVE_FLG] [varchar](1) NOT NULL,
	[INCR_COL_FILT1] [varchar](255) NULL,
	[INCR_DAYS] [int] NULL,
	[SPLIT_BY_COL] [varchar](200) NULL,
	[MAPPERS] [varchar](200) NULL,
	[HARDDELETE] [varchar](1) NOT NULL,
	[CREATED_DTTM] [datetime] NULL,
	[UPDATED_DTTM] [datetime] NULL,
	[CREATED_BY] [varchar](255) NULL,
	[UPDATED_BY] [varchar](255) NULL,
	[PARTITION_COL] [varchar](200) NULL,
	[CONTAINER] [varchar](200) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OBJ_RUN_STATS]    Script Date: 12/5/2023 10:16:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OBJ_RUN_STATS](
	[BATCH_ID] [bigint] NULL,
	[SRC_SCHEMA_ID] [int] NULL,
	[OBJ_ID] [int] NULL,
	[OBJ_RUN_ID] [DECIMAL](25,0) NULL,
	[JOB_RUN_ID] [decimal](24, 0) NULL,
	[SOURCE_COUNT] [bigint] NULL,
	[TARGET_COUNT] [bigint] NULL,
	[SRC_SIZE] [int] NULL,
	[TGT_SIZE] [int] NULL,
	[SRC_PATH] [varchar](1024) NULL,
	[TGT_PATH] [varchar](1024) NULL,
	[ERROR_DESC] [varchar](8000) NULL,
	[OBJ_STATUS] [varchar](100) NULL,
	[JOB_OBJ_START_DTTM] [datetime] NULL,
	[JOB_OBJ_END_DTTM] [datetime] NULL,
	[PIPELINE_RUN_ID] [varchar](255) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[BATCH_METADATA] ([BATCH_ID], [BATCH_NAME], [BATCH_DESC], [BATCH_FREQUENCY], [CREATED_DTTM], [UPDATED_DTTM], [CREATED_BY], [UPDATED_BY]) VALUES (1, N'src_bronzeraw', N'ingestion', N'daily', CAST(N'2023-11-26T06:48:50.150' AS DateTime), CAST(N'2023-11-26T06:48:50.150' AS DateTime), N'NAME@company.com', N'NAME@company.com')
INSERT [dbo].[BATCH_METADATA] ([BATCH_ID], [BATCH_NAME], [BATCH_DESC], [BATCH_FREQUENCY], [CREATED_DTTM], [UPDATED_DTTM], [CREATED_BY], [UPDATED_BY]) VALUES (2, N'bronzeraw_bronze', N'ingestion', N'daily', CAST(N'2023-11-26T06:48:50.167' AS DateTime), CAST(N'2023-11-26T06:48:50.167' AS DateTime), N'NAME@company.com', N'NAME@company.com')
INSERT [dbo].[BATCH_METADATA] ([BATCH_ID], [BATCH_NAME], [BATCH_DESC], [BATCH_FREQUENCY], [CREATED_DTTM], [UPDATED_DTTM], [CREATED_BY], [UPDATED_BY]) VALUES (3, N'bronze_silver', N'integration', N'daily', CAST(N'2023-11-26T06:48:50.170' AS DateTime), CAST(N'2023-11-26T06:48:50.170' AS DateTime), N'NAME@company.com', N'NAME@company.com')
INSERT [dbo].[BATCH_METADATA] ([BATCH_ID], [BATCH_NAME], [BATCH_DESC], [BATCH_FREQUENCY], [CREATED_DTTM], [UPDATED_DTTM], [CREATED_BY], [UPDATED_BY]) VALUES (4, N'silver_gold', N'integration', N'daily', CAST(N'2023-11-26T06:48:50.173' AS DateTime), CAST(N'2023-11-26T06:48:50.173' AS DateTime), N'NAME@company.com', N'NAME@company.com')
INSERT [dbo].[BATCH_METADATA] ([BATCH_ID], [BATCH_NAME], [BATCH_DESC], [BATCH_FREQUENCY], [CREATED_DTTM], [UPDATED_DTTM], [CREATED_BY], [UPDATED_BY]) VALUES (5, N'microbatch', N'microbatch_run', N'daily', CAST(N'2023-11-26T06:48:50.177' AS DateTime), CAST(N'2023-11-26T06:48:50.177' AS DateTime), N'NAME@company.com', N'NAME@company.com')
GO
INSERT [dbo].[BATCH_RUN_STATS] ([BATCH_RUN_ID], [BATCH_ID], [SRC_NAME], [BATCH_RUN_STARTDTTM], [BATCH_RUN_END_DTTM], [BATCH_STATUS], [BATCH_ERR_DESC]) VALUES (202311301603270001, 1, N'sqlserver_dummysrc1', CAST(N'2023-11-30T16:03:27.470' AS DateTime), CAST(N'2023-12-04T05:47:37.490' AS DateTime), N'SUCCESS', NULL)
INSERT [dbo].[BATCH_RUN_STATS] ([BATCH_RUN_ID], [BATCH_ID], [SRC_NAME], [BATCH_RUN_STARTDTTM], [BATCH_RUN_END_DTTM], [BATCH_STATUS], [BATCH_ERR_DESC]) VALUES (202312040554160001, 1, N'sqlserver_dummysrc1', CAST(N'2023-12-04T05:54:16.307' AS DateTime), NULL, N'IN PROGRESS', NULL)
GO
INSERT [dbo].[CONNECTIONS_METADATA] ([SRC_ID], [SRC_SCHEMA_ID], [SCHEMA_NAME], [SRC_DB_TYPE], [SRC_DB_NAME], [DB_SRVR_NAME], [PORT], [CONN_STRING], [USER_ID], [PWD], [NUM_CONN], [SRC_NAME], [CREATED_DTTM], [EXEC_WINDOW], [DESCRIPTION], [ADLS_PROPERTY], [CONTAINER]) VALUES (1, 1001, N'dbo', N'sqlserver', N'SQLSERVER_DUMMY_DB_SRC_1', N'asm-sqlserver-source.database.windows.net', NULL, N'keyvault_SQLSERVER_DUMMMY_SRC1', N'bubyadmin', N'Qwerty2411!', 10, N'sqlserver_dummysrc1', CAST(N'2023-11-25T14:49:34.310' AS DateTime), N'', N'', N'RESERVED_COLUMN', NULL)
INSERT [dbo].[CONNECTIONS_METADATA] ([SRC_ID], [SRC_SCHEMA_ID], [SCHEMA_NAME], [SRC_DB_TYPE], [SRC_DB_NAME], [DB_SRVR_NAME], [PORT], [CONN_STRING], [USER_ID], [PWD], [NUM_CONN], [SRC_NAME], [CREATED_DTTM], [EXEC_WINDOW], [DESCRIPTION], [ADLS_PROPERTY], [CONTAINER]) VALUES (1, 1002, N'xyz', N'sqlserver', N'SQLSERVER_DUMMY_DB_SRC_1', N'asm-sqlserver-source.database.windows.net', NULL, N'keyvault_SQLSERVER_DUMMMY_SRC2', N'bubyadmin', N'Qwerty2411!', 10, N'sqlserver_dummysrc1', CAST(N'2023-11-26T13:20:40.277' AS DateTime), N'', N'', N'RESERVED_COLUMN', NULL)
INSERT [dbo].[CONNECTIONS_METADATA] ([SRC_ID], [SRC_SCHEMA_ID], [SCHEMA_NAME], [SRC_DB_TYPE], [SRC_DB_NAME], [DB_SRVR_NAME], [PORT], [CONN_STRING], [USER_ID], [PWD], [NUM_CONN], [SRC_NAME], [CREATED_DTTM], [EXEC_WINDOW], [DESCRIPTION], [ADLS_PROPERTY], [CONTAINER]) VALUES (1, 1003, N'abc', N'sqlserver', N'SQLSERVER_DUMMY_DB_SRC_1', N'asm-sqlserver-source.database.windows.net', NULL, N'keyvault_SQLSERVER_DUMMMY_SRC3', N'bubyadmin', N'Qwerty2411!', 10, N'sqlserver_dummysrc1', CAST(N'2023-12-03T07:21:02.180' AS DateTime), N'', N'', N'RESERVED_COLUMN', NULL)
GO
INSERT [dbo].[JOB_RUN_STATS] ([SRC_SCHEMA_ID], [SRC_NAME], [BATCH_RUN_ID], [JOB_RUN_ID], [JOB_STATUS], [JOB_START_DTTM], [JOB_END_DTTM], [PIPELINE_RUN_ID], [ERROR_DESC]) VALUES (1001, N'sqlserver_dummysrc1', CAST(202312040554160001 AS Decimal(18, 0)), CAST(202312040932391001 AS Decimal(24, 0)), N'FAILED', CAST(N'2023-12-04T09:32:39.937' AS DateTime), CAST(N'2023-12-04T09:34:21.320' AS DateTime), NULL, N'Closed by pipeline due to the previous run not being completed successfully.')
INSERT [dbo].[JOB_RUN_STATS] ([SRC_SCHEMA_ID], [SRC_NAME], [BATCH_RUN_ID], [JOB_RUN_ID], [JOB_STATUS], [JOB_START_DTTM], [JOB_END_DTTM], [PIPELINE_RUN_ID], [ERROR_DESC]) VALUES (1002, N'sqlserver_dummysrc1', CAST(202312040554160001 AS Decimal(18, 0)), CAST(202312040932501002 AS Decimal(24, 0)), N'FAILED', CAST(N'2023-12-04T09:32:50.873' AS DateTime), CAST(N'2023-12-04T09:34:21.320' AS DateTime), NULL, N'Closed by pipeline due to the previous run not being completed successfully.')
INSERT [dbo].[JOB_RUN_STATS] ([SRC_SCHEMA_ID], [SRC_NAME], [BATCH_RUN_ID], [JOB_RUN_ID], [JOB_STATUS], [JOB_START_DTTM], [JOB_END_DTTM], [PIPELINE_RUN_ID], [ERROR_DESC]) VALUES (1003, N'sqlserver_dummysrc1', CAST(202312040554160001 AS Decimal(18, 0)), CAST(202312040933081003 AS Decimal(24, 0)), N'FAILED', CAST(N'2023-12-04T09:33:08.857' AS DateTime), CAST(N'2023-12-04T09:34:21.320' AS DateTime), NULL, N'Closed by pipeline due to the previous run not being completed successfully.')
INSERT [dbo].[JOB_RUN_STATS] ([SRC_SCHEMA_ID], [SRC_NAME], [BATCH_RUN_ID], [JOB_RUN_ID], [JOB_STATUS], [JOB_START_DTTM], [JOB_END_DTTM], [PIPELINE_RUN_ID], [ERROR_DESC]) VALUES (1001, N'sqlserver_dummysrc1', CAST(202312040554160001 AS Decimal(18, 0)), CAST(202312040934311001 AS Decimal(24, 0)), N'FAILED', CAST(N'2023-12-04T09:34:31.253' AS DateTime), CAST(N'2023-12-04T09:38:55.927' AS DateTime), NULL, N'Closed by pipeline due to the previous run not being completed successfully.')
INSERT [dbo].[JOB_RUN_STATS] ([SRC_SCHEMA_ID], [SRC_NAME], [BATCH_RUN_ID], [JOB_RUN_ID], [JOB_STATUS], [JOB_START_DTTM], [JOB_END_DTTM], [PIPELINE_RUN_ID], [ERROR_DESC]) VALUES (1002, N'sqlserver_dummysrc1', CAST(202312040554160001 AS Decimal(18, 0)), CAST(202312040934491002 AS Decimal(24, 0)), N'FAILED', CAST(N'2023-12-04T09:34:49.410' AS DateTime), CAST(N'2023-12-04T09:38:55.927' AS DateTime), NULL, N'Closed by pipeline due to the previous run not being completed successfully.')
INSERT [dbo].[JOB_RUN_STATS] ([SRC_SCHEMA_ID], [SRC_NAME], [BATCH_RUN_ID], [JOB_RUN_ID], [JOB_STATUS], [JOB_START_DTTM], [JOB_END_DTTM], [PIPELINE_RUN_ID], [ERROR_DESC]) VALUES (1003, N'sqlserver_dummysrc1', CAST(202312040554160001 AS Decimal(18, 0)), CAST(202312040934591003 AS Decimal(24, 0)), N'SUCCESS', CAST(N'2023-12-04T09:34:59.910' AS DateTime), CAST(N'2023-12-04T09:38:27.553' AS DateTime), NULL, NULL)
INSERT [dbo].[JOB_RUN_STATS] ([SRC_SCHEMA_ID], [SRC_NAME], [BATCH_RUN_ID], [JOB_RUN_ID], [JOB_STATUS], [JOB_START_DTTM], [JOB_END_DTTM], [PIPELINE_RUN_ID], [ERROR_DESC]) VALUES (1001, N'sqlserver_dummysrc1', CAST(202312040554160001 AS Decimal(18, 0)), CAST(202312040939071001 AS Decimal(24, 0)), N'IN PROGRESS', CAST(N'2023-12-04T09:39:07.323' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[JOB_RUN_STATS] ([SRC_SCHEMA_ID], [SRC_NAME], [BATCH_RUN_ID], [JOB_RUN_ID], [JOB_STATUS], [JOB_START_DTTM], [JOB_END_DTTM], [PIPELINE_RUN_ID], [ERROR_DESC]) VALUES (1002, N'sqlserver_dummysrc1', CAST(202312040554160001 AS Decimal(18, 0)), CAST(202312040939201002 AS Decimal(24, 0)), N'IN PROGRESS', CAST(N'2023-12-04T09:39:20.957' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[OBJ_METADATA] ([SRC_SCHEMA_ID], [OBJ_ID], [OBJ_NAME], [ERROR_THRESHOLD], [LOAD_GRP], [LOAD_TYPE], [OBJ_JOB_PARAMETERS], [SELECT_STMT], [FILTER_CONDITIONS], [ACTIVE_FLG], [INCR_COL_FILT1], [INCR_DAYS], [SPLIT_BY_COL], [MAPPERS], [HARDDELETE], [CREATED_DTTM], [UPDATED_DTTM], [CREATED_BY], [UPDATED_BY], [PARTITION_COL], [CONTAINER]) VALUES (1001, 1, N'Customer', 5, 1, N'F', N'||', N'SELECT * FROM x', N'0', N'1', N'0', 0, N'', N'', N'', CAST(N'2023-11-25T14:58:38.543' AS DateTime), CAST(N'2023-11-25T14:58:38.543' AS DateTime), N'BUBY_UGUY@YAHOO.COM', N'BUBY_UGUY@YAHOO.COM', N'', N'')
INSERT [dbo].[OBJ_METADATA] ([SRC_SCHEMA_ID], [OBJ_ID], [OBJ_NAME], [ERROR_THRESHOLD], [LOAD_GRP], [LOAD_TYPE], [OBJ_JOB_PARAMETERS], [SELECT_STMT], [FILTER_CONDITIONS], [ACTIVE_FLG], [INCR_COL_FILT1], [INCR_DAYS], [SPLIT_BY_COL], [MAPPERS], [HARDDELETE], [CREATED_DTTM], [UPDATED_DTTM], [CREATED_BY], [UPDATED_BY], [PARTITION_COL], [CONTAINER]) VALUES (1001, 2, N'customer_apps_2', 5, 1, N'F', N'||', N'SELECT * FROM x', N'0', N'1', N'0', 0, N'', N'', N'', CAST(N'2023-11-25T14:58:38.543' AS DateTime), CAST(N'2023-11-25T14:58:38.543' AS DateTime), N'BUBY_UGUY@YAHOO.COM', N'BUBY_UGUY@YAHOO.COM', N'', N'')
GO
/****** Object:  StoredProcedure [dbo].[ETL_BATCHRUNSTATS_IU]    Script Date: 12/5/2023 10:16:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE  [dbo].[ETL_BATCHRUNSTATS_IU] (@src_name varchar(250), @batch_id int, @commandtype varchar(1), @output_batch_run_id bigint OUTPUT)
AS 
/* ---------------------------------

RUNNING SAMPLE :
DECLARE @src_name varchar(250), @batch_id int, @commandtype varchar(1), @output_batch_run_id bigint 
SET @src_name = 'sqlserver_dummysrc1'
SET @batch_id = 1
SET @commandtype = 'I'

*/ ---------------------------------

DECLARE @batch_run_id varchar(20), @src_id varchar

---------------------------------------------------------------------
-- CASE of Inserting NEW batch_run_id
IF @commandtype = 'I'
BEGIN
	SELECT DISTINCT @src_id = src_id FROM dbo.connections_metadata WITH (NOLOCK) WHERE src_name = @src_name
	SELECT @batch_run_id = REPLACE(CONVERT(varchar, GETDATE(), 112) + CONVERT(varchar, GETDATE(), 108), ':', '') + CAST(RIGHT('0000'+@src_id,4) as varchar)
	
	-- INSERT NEW batch_run_id for a particular source in a day
	INSERT [dbo].[BATCH_RUN_STATS] ([BATCH_RUN_ID], [BATCH_ID], [SRC_NAME], [BATCH_RUN_STARTDTTM], [BATCH_RUN_END_DTTM], [BATCH_STATUS], [BATCH_ERR_DESC]) 
	VALUES (
		@batch_run_id
		, --YYYYMMDDhhmmss + 4 Digits from src_id
		@batch_id, @src_name, GETDATE(), NULL, 
		'IN PROGRESS', NULL
	)

	-- RETURN newly inserted batch_run_id 
	SET @output_batch_run_id = @batch_run_id
END
---------------------------------------------------------------------
-- CASE of Updating NEW batch_run_id (CLOSE EXISTING BATCH)
ELSE IF @commandtype = 'U'
BEGIN
	UPDATE [dbo].[BATCH_RUN_STATS]
	SET [BATCH_STATUS] = 'SUCCESS', [BATCH_RUN_END_DTTM] = GETDATE()
	WHERE src_name = @src_name AND [BATCH_STATUS] = 'IN PROGRESS'
	AND [BATCH_ID] = @batch_id

	-- RETURN nothing.. ADF Expecting return on SP 
	SET @output_batch_run_id = @batch_run_id
END
GO
/****** Object:  StoredProcedure [dbo].[ETL_GET_JOBRUNSTATS]    Script Date: 12/5/2023 10:16:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[ETL_GET_JOBRUNSTATS] (@src_name varchar(250), @src_schema_id_list varchar(500), @batch_run_id varchar(20))
AS 
/* ---------------------------------

RUNNING SAMPLE :
DECLARE @src_name varchar(250), @batch_run_id varchar(20), @src_schema_id_list varchar(500), @commandtype varchar(1)
SET @src_name = 'sqlserver_dummysrc1'
SET @batch_run_id = '202311300958340001'
SET @src_schema_id_list = '1001, 1002' or SET @src_schema_id_list = ' '

*/ ---------------------------------

DECLARE @schema_cnt int, @sqlcmd varchar(8000)
SELECT @schema_cnt = COUNT(*) FROM dbo.connections_metadata a WITH (NOLOCK)
WHERE SRC_NAME = @src_name

---------------------------------------------------------------------
-- PRE-VALIDATION | CHECK IF src_name is exist in connections_metadata
IF NOT EXISTS (SELECT TOP 1 1 FROM dbo.connections_metadata WITH (NOLOCK) where src_name=@src_name)
BEGIN
   THROW 900001, 'Given SRC_NAME parameter is not found in dbo.CONNECTIONS_METADATA table.. Make sure it is registered..', 1;
END;
---------------------------------------------------------------------
-- PRE-VALIDATION | CHECK if all src_schema_id already succeeded 
IF 
(
	SELECT COUNT(DISTINCT a.SRC_SCHEMA_ID) FROM dbo.job_run_stats a WITH (NOLOCK)
	WHERE a.SRC_NAME = @src_name AND a.batch_run_id = @batch_run_id 
	AND a.JOB_STATUS = 'SUCCESS'
) != @schema_cnt
BEGIN
	
	SET @sqlcmd = '
	SELECT 
		DISTINCT a.SRC_SCHEMA_ID
	FROM dbo.CONNECTIONS_METADATA a WITH (NOLOCK)
	WHERE a.SRC_NAME = '''+@src_name +''' AND a.SRC_SCHEMA_ID NOT IN
	(
		SELECT src_schema_id FROM dbo.job_run_stats WITH (NOLOCK)
		WHERE JOB_STATUS IN (''SUCCESS'') 
		AND batch_run_id = '''+@batch_run_id+'''
	)' 
	IF @src_schema_id_list IS NOT NULL AND trim(@src_schema_id_list) != ''
	BEGIN 
		SET @sqlcmd +=  ' AND a.src_schema_id IN (' + TRIM(@src_schema_id_list) +')'
	END
	
	EXEC (@sqlcmd)
	
END	
ELSE
BEGIN 
	SELECT 'ALL_SCHEMA_ALREADY_COMPLETED' as SRC_SCHEMA_ID
END ;
GO
/****** Object:  StoredProcedure [dbo].[ETL_INITIATE_BATCHRUNSTATS]    Script Date: 12/5/2023 10:16:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ETL_INITIATE_BATCHRUNSTATS]  (@src_name varchar(250), @batch_id int)
AS 
/* ---------------------------------

RUNNING SAMPLE :
DECLARE  @src_name varchar(250), @batch_id int
SET @src_name = 'sqlserver_dummysrc1'
SET @batch_id = 1

*/ ---------------------------------

DECLARE @batch_run_id varchar(20)
---------------------------------------------------------------------
-- PRE-VALIDATION | CHECK IF src_name is exist in connections_metadata
IF NOT EXISTS (SELECT TOP 1 1 FROM dbo.connections_metadata WITH (NOLOCK) where src_name=@src_name)
BEGIN
   THROW 900001, 'Given SRC_NAME parameter is not found in dbo.CONNECTIONS_METADATA table.. Make sure it is registered..', 1;
END;
---------------------------------------------------------------------
-- PRE-VALIDATION | CHECK IF batch_id is exist in connections_metadata
IF NOT EXISTS (SELECT TOP 1 1 FROM dbo.batch_metadata WITH (NOLOCK) where batch_id=@batch_id)
BEGIN
   THROW 900002, 'Given BATCH_ID parameter is not found in dbo.BATCH_METADATA table.. Make sure it is registered..', 1;
END;
---------------------------------------------------------------------
-- PRE-VALIDATION | CHECK IF batch_id already SUCCESS today
IF NOT EXISTS 
	(
	SELECT 1  FROM [dbo].[BATCH_RUN_STATS] a WITH (NOLOCK) 
	WHERE src_name=@src_name 
	and CAST(a.BATCH_RUN_STARTDTTM as DATE) = CAST(GETDATE() as DATE)
	AND BATCH_STATUS = 'SUCCESS'
	AND BATCH_ID = @batch_id
	)
BEGIN
	SELECT @batch_run_id = batch_run_id   FROM [dbo].[BATCH_RUN_STATS] a WITH (NOLOCK)
	INNER JOIN [dbo].[BATCH_METADATA] b WITH (NOLOCK)
		ON a.BATCH_ID = b.BATCH_ID 
	INNER JOIN dbo.connections_metadata c WITH (NOLOCK)
		ON a.src_name = c.SRC_NAME 
	WHERE a.BATCH_STATUS <> 'SUCCESS' 
		-- AND CAST(a.BATCH_RUN_STARTDTTM as DATE) = CAST(GETDATE() as DATE) -- COMMENTED Because potential issue for multi days process
		AND b.BATCH_ID = @batch_id AND c.SRC_NAME = @src_name

	-- IF batch_run_stats not exist, insert new one by running SP: ETL_BATCHRUNSTATS_IU.. 
	-- ELSE using from sql above.
	IF @batch_run_id IS NULL 
	BEGIN
		EXECUTE dbo.ETL_BATCHRUNSTATS_IU  @src_name, @batch_id, 'I', @batch_run_id OUTPUT
		print @batch_run_id
		IF @batch_run_id IS NULL OR CAST(@batch_run_id as BIGINT) = 0 OR CAST(@batch_run_id as varchar(20)) = ''
		BEGIN
			THROW 900003, 'Unable to create new batch_run_id.. Please rerun or see more details on the error log..', 1;
		END
	END;
	
	-- RETURN batch_run_id either new or the existing one
	SELECT @batch_run_id as batch_run_id
END
ELSE
BEGIN 
	SELECT 'BATCH_ALREADY_COMPLETED' as batch_run_id
END ;
GO
/****** Object:  StoredProcedure [dbo].[ETL_JOBRUNSTATS_IU]    Script Date: 12/5/2023 10:16:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ETL_JOBRUNSTATS_IU] 
(
	@src_name varchar(250), @commandtype varchar(20), @src_schema_id varchar(50), @batch_run_id varchar(20), 
	@job_run_id varchar(24) = NULL, 
	@msg varchar(8000) = NULL
)
AS 
/* ---------------------------------

RUNNING SAMPLE :
DECLARE @src_name varchar(250), @batch_run_id varchar(20), @src_schema_id varchar(50), @commandtype varchar(20), @msg varchar(8000), @job_run_id varchar(24)
SET @src_name = 'sqlserver_dummysrc1'
SET @batch_run_id = '202311300958340001'
SET @commandtype = 'I'
SET @src_schema_id = '1001'
SET @job_run_id = '202312040712191002'
SET @msg = 'ERROR MESSAGE GOES HERE'
*/ ---------------------------------

DECLARE @job_status_result varchar(50)
SELECT 
	@job_status_result = JOB_STATUS, @job_run_id = JOB_RUN_ID 
FROM dbo.job_run_stats a WITH (NOLOCK)
WHERE a.SRC_NAME = @src_name AND a.batch_run_id = @batch_run_id 
	AND a.src_schema_id = @src_schema_id

---------------------------------------------------------------------
-- PRE-VALIDATION | CHECK if src_schema_id already succeeded, or already inserted as IN PROGRESS. If no means Not yet inserted. 
IF @commandtype = 'I' AND (@job_status_result IS NULL OR @job_status_result NOT IN ('SUCCESS', 'IN PROGRESS') )
BEGIN
	SET @job_run_id = REPLACE(CONVERT(varchar, GETDATE(), 112) + CONVERT(varchar, GETDATE(), 108), ':', '') + CAST(@src_schema_id as varchar(50))
		
	INSERT INTO [dbo].[JOB_RUN_STATS] 
	(SRC_SCHEMA_ID, SRC_NAME, BATCH_RUN_ID, JOB_RUN_ID, JOB_STATUS, JOB_START_DTTM, JOB_END_DTTM, PIPELINE_RUN_ID)
	SELECT 
		@src_schema_id,
		@src_name, 
		@batch_run_id,
		@job_run_id,
		'IN PROGRESS',
		GETDATE(),
		NULL,
		NULL
	
	-- RETURN the job_run_id
	SELECT @job_run_id as JOB_RUN_ID
END	
ELSE IF @commandtype = 'U' AND @job_status_result IN ('IN PROGRESS')
BEGIN
	UPDATE [dbo].[JOB_RUN_STATS] 
	SET [JOB_STATUS] = 'SUCCESS', JOB_END_DTTM = GETDATE()
		WHERE src_name = @src_name AND JOB_STATUS = 'IN PROGRESS'
		AND JOB_RUN_ID = @job_run_id

	-- RETURN the job_run_id
	SELECT @job_run_id as JOB_RUN_ID
END
ELSE IF @commandtype = 'U_CloseExisting'
BEGIN
	UPDATE [dbo].[JOB_RUN_STATS] 
	SET [JOB_STATUS] = 'FAILED', JOB_END_DTTM = GETDATE(), ERROR_DESC = @msg
		WHERE src_name = @src_name AND JOB_STATUS = 'IN PROGRESS'
		AND BATCH_RUN_ID = @batch_run_id

	-- RETURN the job_run_id
	SELECT @job_run_id as JOB_RUN_ID
END
ELSE
BEGIN 
	-- RETURN the job_run_id
	SELECT @job_run_id as JOB_RUN_ID
END ;
GO
