CREATE PROCEDURE [dbo].[ETL_OBJRUNSTATS_IU] 
(
	@src_name varchar(250), @commandtype varchar(20), @batch_run_id varchar(20), 
	@job_run_id varchar(100), @src_schema_id varchar(50), @obj_id varchar(100),
	@msg varchar(8000) = NULL  
)
AS 
/* ---------------------------------
RUNNING SAMPLE :
*/ ---------------------------------
DECLARE @src_name varchar(250), @commandtype varchar(20),  @batch_run_id varchar(20), 
	@job_run_id varchar(100), @src_schema_id varchar(50), @obj_id varchar(100),
	@msg varchar(8000)

SET @src_name = 'sqlserver_dummysrc1'
SET @commandtype = 'I'
SET @batch_run_id = '202312040554160001'
SET @job_run_id = '202312040712191002'
SET @src_schema_id = '1001'
SET @obj_id = '1'
SET @msg = 'ERROR MESSAGE GOES HERE'



DECLARE @job_status_result varchar(50)
SELECT 
	@job_status_result = JOB_STATUS, @job_run_id = JOB_RUN_ID 
FROM dbo.job_run_stats a WITH (NOLOCK)
WHERE a.SRC_NAME = @src_name AND a.batch_run_id = @batch_run_id 
	AND a.src_schema_id = @src_schema_id


---------------------------------------------------------------------
-- PRE-VALIDATION | CHECK if src_schema_id already succeeded, or already inserted as IN PROGRESS. If no means Not yet inserted. 
IF @commandtype = 'I' 
BEGIN
	SET @obj_run_id = REPLACE(CONVERT(varchar, GETDATE(), 112) + CONVERT(varchar, GETDATE(), 108), ':', '') + CAST(RIGHT('000000'+@obj_id,6) as varchar(6))
	DECLARE @batch_id int
    SELECT DISTINCT @batch_id = BATCH_ID FROM dbo.BATCH_RUN_STATS 
    WHERE batch_run_id = @batch_run_id AND batch_status = 'IN PROGRESS'
    
	INSERT INTO [dbo].[OBJ_RUN_STATS] 
	(BATCH_ID ,SRC_SCHEMA_ID ,OBJ_ID ,OBJ_RUN_ID ,JOB_RUN_ID ,SOURCE_COUNT ,TARGET_COUNT ,SRC_SIZE ,TGT_SIZE ,
	SRC_PATH ,TGT_PATH ,ERROR_DESC ,OBJ_STATUS ,JOB_OBJ_START_DTTM ,JOB_OBJ_END_DTTM ,PIPELINE_RUN_ID)
    SELECT
        @batch_id
        @src_schema_id,
        @obj_id,
        @obj_run_id,
        @job_run_id,
        0,
        0,
        NULL, 
        NULL,
        NULL,
        NULL,
        NULL,
        'IN PROGRESS',
        GETDATE(),
        NULL,
        NULL
    

	-- RETURN the job_run_id
	SELECT @obj_run_id as OBJ_RUN_ID
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
