USE [SNOOPER]
GO

/****** Object:  Table [dbo].[jobs_to_run]    Script Date: 03/12/2024 21:52:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[jobs_to_run](
	[JobName] [nvarchar](200) NOT NULL
) ON [PRIMARY]
GO



  INSERT INTO [SNOOPER].[dbo].[jobs_to_run]
  VALUES
   ('SNOOPER_EXEC sp_log_Batch_Requests_sec_metric'),
 ('SNOOPER_EXEC sp_log_Buffer_cache_hit_ratio_metric'),
 ('SNOOPER_EXEC sp_log_Checkpoint_pages_sec_metric'),
 ('SNOOPER_EXEC sp_log_cpu_info_metric'),
 ('SNOOPER_EXEC sp_log_cpu_usage_metric'),
 ('SNOOPER_EXEC sp_log_Current_User_Connections_metric'),
 ('SNOOPER_EXEC sp_log_DB_buffer_mb_used_metric'),
 ('SNOOPER_EXEC sp_log_DB_Last_Successful_DBCC_CHECKDB_metric'),
 ('SNOOPER_EXEC sp_log_DB_Reads_Writes_sec_KBRead_KBWritten_metric'),
 ('SNOOPER_EXEC sp_log_DB_recovery_model_metric'),
 ('SNOOPER_EXEC sp_log_DB_size_metric'),
 ('SNOOPER_EXEC sp_log_DB_state_metric'),
 ('SNOOPER_EXEC sp_log_DB_unused_space_metric'),
 ('SNOOPER_EXEC sp_log_DB_user_access_metric'),
 ('SNOOPER_EXEC sp_log_Disk_Read_Bytes_sec_metric'),
 ('SNOOPER_EXEC sp_log_Disk_Reads_sec_metric'),
 ('SNOOPER_EXEC sp_log_Disk_Write_Bytes_sec_metric'),
 ('SNOOPER_EXEC sp_log_Disk_Writes_sec_metric'),
 ('SNOOPER_EXEC sp_log_drive_info_metric'),
 ('SNOOPER_EXEC sp_log_Failed_jobs'),
 ('SNOOPER_EXEC sp_log_Free_list_memory_stalls_sec_metric'),
 ('SNOOPER_EXEC sp_log_Last_Restart_Time_metric'),
 ('SNOOPER_EXEC sp_log_live_queries_currently_running_metric'),
 ('SNOOPER_EXEC sp_log_Page_life_expectancy_metric'),
 ('SNOOPER_EXEC sp_log_pagefile_usage_metric'),
 ('SNOOPER_EXEC sp_log_Physical_Disk_usage_metric'),
 ('SNOOPER_EXEC sp_log_RAM_free_metric'),
 ('SNOOPER_EXEC sp_log_RAM_info_metric'),
 ('SNOOPER_EXEC sp_log_RAM_total_metric'),
 ('SNOOPER_EXEC sp_log_server_info_metric'),
 ('SNOOPER_EXEC sp_log_TOP_CPU_consuming_queries_metric'),
 ('SNOOPER_EXEC sp_log_TOP_IO_intensive_queries_metric'),
 ('SNOOPER_EXEC sp_log_wait_stats_metric')

