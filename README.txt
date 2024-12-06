
-- =============================================
-- Create date: 30/11/2024
-- Description:	README
-- =============================================




SQL Server Instance Monitor - SNOOPER

-- =============================================

INSTALLATION GUID:

Execute the following scripts in sequence:

1___SNOOPER_03_12_24
2___Create sp_log jobs
3___Create special schedule jobs

Start monitoring the SQL Server instance by running the job:
SNOOPER_restart_log_jobs
This initiates all "SNOOPER EXEC sp_log..." jobs, enabling automated logging of instance data.

For additional details, refer to the accompanying documentation.html file.


-- =============================================


KEY FEATURES

Instance-Wide Analysis
All "sp_log..." stored procedures log live data to the corresponding table.
For additional details, refer to the accompanying documentation.html file.


Leverage the sp_USER... series of stored procedures for in-depth insights into the instance and its databases:
sp_USER_TABLES_SUITABLE_FOR_PARTITIONING_ALL_DB
sp_USER_SETTINGS_CATSCAN
sp_USER_MAP_INDEXES_FOR_COMPRESSION_PER_DB
sp_USER_LOGINS_TO_USERS_MAPPING
sp_USER_LAST_SUCCESSFULL_CHECKDB
SP_USER_LAST_STATISTICS_UPDATE_DATE_ALL_TABLES
sp_USER_INDEX_USAGE_PER_DB
sp_USER_INDEX_FRAGMENTATION_PERCENT_PER_DB
sp_USER_CURRENT_SYSTEM_STATE
Health Monitoring

sp_SNOOPER_hourly_health_check: Scans for critical events within the last hour and logs findings to:
[SNOOPER].[dbo].[SNOOPER_Event_Log]


-- =============================================


UTILITY TOOLS
sp_Get_JOB_NAME_by_JOB_ID: Quickly retrieve job details using their Job ID.


-- =============================================


ADDITIONAL FEATURES:

Email Notifications
DBMAIL configuration is supported, but it is not included in the provided scripts.


Active server Audits:
	- Database schema changes
	- Login activity

Deadlock Detection:
Implements traceflag1222 to log deadlock information in the SQL Server error logs.

BI Views:
"v_BI_LAST_DAY_AVG..."
Predefined views provide valuable insights, aiding in BI reporting.


Other useful view:
v_backup_and_restore_info
v_job_mapping
v_cpu_info
v_Failed_Jobs_TOP20_LAST_24H
v_Currently_Blocking
v_Currently_open_tranactions
v_Currently_running
v_DATABASE_CHANGE_sqlaudit
v_DB_create_date
v_LOGIN_AUDIT_sqlaudit
v_login_mapping
v_missing_index
v_pagefileSYS_info
v_TOP_CPU_consuming_queries_last_24_hours
v_TOP_IO_intensive_queries_last_2_hours


Modified system vies:
v_server_info
v_log_reuse_wait
v_DB_create_date
v_compatibility_level
v_DB_file_size
v_SQLServer_Last_restart
v_DB_recovery_model
v_Drive_info 
v_DB_is_auto: Checks and lists all <auto> options in database properties
v_Last_Successful_DBCC_CHECKDB
-------------------------------
v_DB_HA_and_DR :
       [database_id]
      ,[name]
      ,[Log_shipping_status]
      ,[Mirror_status]
      ,[Replication_Publication_Status]
      ,[Replication_Merge_Publication_Status]
      ,[Replication_Distributor_Status]
      ,[Replication_Subscribtion_Status]
      ,[IsAlwaysOnEnabled]
-------------------------------
v_DB_state_and_status:
       [database_id]
      ,[name]
      ,[user_access_desc]
      ,[state_desc]
      ,[is_in_standby]
      ,[is_encrypted]
      ,[is_read_only]
-------------------------------


-- =============================================





