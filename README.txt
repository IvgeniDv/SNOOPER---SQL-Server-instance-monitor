
-- =============================================
-- Create date: 30/11/2024
-- Description:	README
-- =============================================




SQL Server Instance Monitor

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

Monitoring Stored Procedures
Instance-Wide Analysis
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

BI Views
Predefined views provide valuable insights, aiding in BI reporting.


-- =============================================





