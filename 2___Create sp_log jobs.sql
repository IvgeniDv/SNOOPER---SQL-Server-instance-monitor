use SNOOPER

drop table if exists tempdb..#scripting_table
create table #scripting_table
(
[copy and run] nvarchar(max) null
);


DECLARE @sp_name NVARCHAR(MAX);
DECLARE @SQL NVARCHAR(max); 


DECLARE cats CURSOR
	FOR 
		(SELECT 
    p.name AS ProcedureName

FROM sys.procedures p
where name like '%sp_log%'

and name not in ('sp_runner_sp_log', 'sp_log_cpu_info_metric' , 'sp_log_DB_buffer_mb_used_metric', 'sp_log_DB_Last_Successful_DBCC_CHECKDB_metric' ,'sp_log_DB_unused_space_metric' ,
'sp_log_drive_info_metric' ,'sp_log_Failed_jobs' ,'sp_log_Last_Restart_Time_metric','sp_log_pagefile_usage_metric','sp_log_server_info_metric','sp_log_TOP_CPU_consuming_queries_metric', 'sp_log_TOP_IO_intensive_queries_metric')
); 

OPEN cats


FETCH NEXT FROM cats INTO 
	@sp_name;

WHILE @@FETCH_STATUS = 0
    BEGIN

		SET @SQL = 'EXEC '+@sp_name+'';


		insert into #scripting_table([copy and run])
		values(@SQL)
	
		--EXECUTE  SP_EXECUTESQL @SQL;

	
        FETCH NEXT FROM cats INTO 
			@sp_name;
    END;

CLOSE cats;
DEALLOCATE cats;

--select *
--from #scripting_table


--============================================



drop table if exists tempdb..#scripting_table2
create table #scripting_table2
(
[copy and run] nvarchar(max) null
);


DECLARE @sp_name2 NVARCHAR(MAX);
DECLARE @SQL2 NVARCHAR(max); 


DECLARE cats2 CURSOR
	FOR 
		(SELECT [copy and run]

FROM #scripting_table

); 

OPEN cats2


FETCH NEXT FROM cats2 INTO 
	@sp_name2;

WHILE @@FETCH_STATUS = 0
    BEGIN

		SET @SQL2 = N'
USE [msdb]



BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 15/11/2024 19:47:24 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N''[Uncategorized (Local)]'' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N''JOB'', @type=N''LOCAL'', @name=N''[Uncategorized (Local)]''
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N''SNOOPER_'+@sp_name2+''', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N''No description available.'', 
		@category_name=N''[Uncategorized (Local)]'', 
		@owner_login_name=N''sa'', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [sp_log]    Script Date: 15/11/2024 19:47:24 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'''+@sp_name2+''', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N''TSQL'', 
		@command=N''
while 1=1
begin
'+@sp_name2+'
waitfor delay''''00:00:10''''
end'', 
		@database_name=N''SNOOPER'', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N''(local)''
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:


';


		insert into #scripting_table2([copy and run])
		values(@SQL2)
	
		--EXECUTE  SP_EXECUTESQL @SQL2;

	
        FETCH NEXT FROM cats2 INTO 
			@sp_name2;
    END;

CLOSE cats2;
DEALLOCATE cats2;

--select *
--from #scripting_table2


--===================



DECLARE @name3 NVARCHAR(MAX);
DECLARE @SQL3 NVARCHAR(max); 


DECLARE cats3 CURSOR
	FOR 
		(SELECT [copy and run]

FROM #scripting_table2

); 

OPEN cats3


FETCH NEXT FROM cats3 INTO 
	@name3;

WHILE @@FETCH_STATUS = 0
    BEGIN

		SET @SQL3 = '
		'+@name3+'
';


		EXECUTE  SP_EXECUTESQL @SQL3;

	
        FETCH NEXT FROM cats3 INTO 
			@name3;
    END;

CLOSE cats3;
DEALLOCATE cats3;