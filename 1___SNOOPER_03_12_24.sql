USE [master]
GO
/****** Object:  Database [SNOOPER]    Script Date: 03/12/2024 21:59:33 ******/
CREATE DATABASE [SNOOPER]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SNOOPER', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SNOOPER\MSSQL\DATA\SNOOPER.mdf' , SIZE = 656576KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SNOOPER_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SNOOPER\MSSQL\DATA\SNOOPER_log.ldf' , SIZE = 66560KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SNOOPER] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SNOOPER].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SNOOPER] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SNOOPER] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SNOOPER] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SNOOPER] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SNOOPER] SET ARITHABORT OFF 
GO
ALTER DATABASE [SNOOPER] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SNOOPER] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SNOOPER] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SNOOPER] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SNOOPER] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SNOOPER] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SNOOPER] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SNOOPER] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SNOOPER] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SNOOPER] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SNOOPER] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SNOOPER] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SNOOPER] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SNOOPER] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SNOOPER] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SNOOPER] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SNOOPER] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SNOOPER] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SNOOPER] SET  MULTI_USER 
GO
ALTER DATABASE [SNOOPER] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SNOOPER] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SNOOPER] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SNOOPER] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SNOOPER] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SNOOPER] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SNOOPER', N'ON'
GO
ALTER DATABASE [SNOOPER] SET QUERY_STORE = ON
GO
ALTER DATABASE [SNOOPER] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 20, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SNOOPER]
GO
/****** Object:  User [excelBI]    Script Date: 03/12/2024 21:59:34 ******/
CREATE USER [excelBI] FOR LOGIN [PowerBI] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [DESKTOP-GOEBPQ7\Ivgeni]    Script Date: 03/12/2024 21:59:34 ******/
CREATE USER [DESKTOP-GOEBPQ7\Ivgeni] FOR LOGIN [DESKTOP-GOEBPQ7\Ivgeni] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [excelBI]
GO
/****** Object:  Table [dbo].[TOP_CPU_consuming_queries_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TOP_CPU_consuming_queries_metric](
	[date] [datetime] NULL,
	[sql_handle] [varbinary](64) NULL,
	[plan_handle] [varbinary](64) NULL,
	[creation_time] [datetime] NULL,
	[last_execution_time] [datetime] NULL,
	[total_worker_time] [float] NULL,
	[AvgCPUTime] [float] NULL,
	[execution_count] [int] NULL,
	[query_text] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[live_queries_currently_running_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[live_queries_currently_running_metric](
	[date] [datetime] NULL,
	[session_id] [int] NULL,
	[start_time] [datetime] NULL,
	[status] [nvarchar](50) NULL,
	[command] [nvarchar](100) NULL,
	[database_id] [int] NULL,
	[database_name] [nvarchar](200) NULL,
	[user_id] [int] NULL,
	[blocking_session_id] [int] NULL,
	[wait_type] [nvarchar](300) NULL,
	[wait_time_ms] [int] NULL,
	[last_wait_type] [nvarchar](300) NULL,
	[cpu_time_ms] [int] NULL,
	[total_elapsed_time_ms] [int] NULL,
	[logical_reads] [int] NULL,
	[reads] [int] NULL,
	[writes] [int] NULL,
	[transaction_isolation_level] [int] NULL,
	[dop] [int] NULL,
	[login_time] [datetime] NULL,
	[host_name] [nvarchar](200) NULL,
	[login_name] [nvarchar](200) NULL,
	[program_name] [nvarchar](200) NULL,
	[host_process_id] [int] NULL,
	[last_request_start_time] [datetime] NULL,
	[last_request_end_time] [datetime] NULL,
	[currently_running_portion_of_the_batch] [nvarchar](max) NULL,
	[full_query_text] [nvarchar](max) NULL,
	[query_plan] [xml] NULL,
	[sql_handle] [varbinary](64) NULL,
	[plan_handle] [varbinary](64) NULL,
	[creation_time] [datetime] NULL,
	[last_execution_time] [datetime] NULL,
	[execution_count] [int] NULL,
	[total_worker_time_ms] [int] NULL,
	[last_worker_time_ms] [int] NULL,
	[max_worker_time_ms] [int] NULL,
	[total_logical_reads] [int] NULL,
	[max_logical_reads] [int] NULL,
	[last_logical_reads] [int] NULL,
	[last_physical_reads] [int] NULL,
	[total_physical_reads] [int] NULL,
	[max_physical_reads] [int] NULL,
	[total_logical_writes] [int] NULL,
	[last_logical_writes] [int] NULL,
	[max_logical_writes] [int] NULL,
	[last_elapsed_time_ms] [int] NULL,
	[max_elapsed_time_ms] [int] NULL,
	[total_rows] [int] NULL,
	[max_rows] [int] NULL,
	[last_rows] [int] NULL,
	[last_dop] [int] NULL,
	[max_dop] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_TOP_CPU_consuming_queries_last_24_hours]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




create view [dbo].[v_TOP_CPU_consuming_queries_last_24_hours] as

SELECT 


      sum(tccqm.[execution_count]) as [execution_count]
      ,tccqm.[query_text]
	  ,lqcrm.[transaction_isolation_level]
	   ,lqcrm.[database_id]
      ,lqcrm.[database_name]
	    ,lqcrm.[host_name]
      ,lqcrm.[login_name]
      ,lqcrm.[program_name]
 
-- ,sum(lqcrm.[total_worker_time_ms])
  ,max(lqcrm.[max_worker_time_ms]) as [max_worker_time_ms]
 ,max(lqcrm.[max_elapsed_time_ms]) as [max_elapsed_time_ms]

--,sum(lqcrm.[total_logical_reads])
,max(lqcrm.[max_logical_reads]) as [max_logical_reads]

--,sum(lqcrm.[total_physical_reads])
,max(lqcrm.[max_physical_reads]) as [max_physical_reads]

--,sum(lqcrm.[total_logical_writes])
 ,max(lqcrm.[max_logical_writes]  ) as [max_logical_writes]

--,sum(lqcrm.[total_rows])
,max(lqcrm.[max_rows])  as [max_rows]

,avg(lqcrm.[max_dop])  as  [max_dop]


  FROM [SNOOPER].[dbo].[TOP_CPU_consuming_queries_metric] AS tccqm 

  LEFT JOIN [SNOOPER].[dbo].[live_queries_currently_running_metric] lqcrm on  lqcrm.sql_handle = tccqm.sql_handle and lqcrm.plan_handle = tccqm.plan_handle

  where  
  tccqm.[date] >= DATEADD(HOUR, -24, GETDATE())  -- last 24 hours
  and lqcrm.[database_id] is not null
  and [transaction_isolation_level] is not null
  group by
   tccqm.[query_text]
	  ,lqcrm.[transaction_isolation_level]
	   ,lqcrm.[database_id]
      ,lqcrm.[database_name]
	    ,lqcrm.[host_name]
      ,lqcrm.[login_name]
      ,lqcrm.[program_name]
	 
GO
/****** Object:  View [dbo].[v_Currently_running]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[v_Currently_running] as

with cte as(
SELECT st.text,
qp.query_plan,
qs.*
FROM (
SELECT *
FROM sys.dm_exec_query_stats
) AS qs
CROSS APPLY sys.dm_exec_query_plan(qs.plan_handle) AS qp
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) AS st
) 
SELECT 
    r.session_id,  
	r.start_time,
    r.status,
	r.command,
	r.database_id,
	DB_NAME(r.database_id) AS database_name,
	r.user_id,
	r.blocking_session_id,
	r.wait_type,
    r.wait_time,
	r.last_wait_type,
    r.cpu_time as cpu_time_ms,
    r.total_elapsed_time as total_elapsed_time_ms ,
    r.logical_reads,  
    r.reads,
	r.writes,
	r.transaction_isolation_level,
	r.dop,

    s.login_time,
    s.host_name,
    s.login_name,
    s.program_name,
	s.host_process_id,
	s.last_request_start_time,
	s.last_request_end_time,

    SUBSTRING(st.text, (r.statement_start_offset / 2) + 1,
              ((CASE r.statement_end_offset
                  WHEN -1 THEN DATALENGTH(st.text)
                  ELSE r.statement_end_offset
               END - r.statement_start_offset) / 2) + 1) AS query_text_live,
    st.text AS full_query_text,

	tmp1.query_plan,
	tmp1.sql_handle,
	tmp1.plan_handle,
	tmp1.creation_time,
	tmp1.last_execution_time,
	tmp1.execution_count,
	tmp1.total_worker_time,
	tmp1.last_worker_time,
	tmp1.max_worker_time,
	tmp1.total_logical_reads,
	tmp1.max_logical_reads,
	tmp1.last_logical_reads,
	tmp1.last_physical_reads,
	tmp1.total_physical_reads,
	tmp1.max_physical_reads,
	tmp1.total_logical_writes,
	tmp1.last_logical_writes,
	tmp1.max_logical_writes,
	tmp1.last_elapsed_time / 1000 AS last_elapsed_time_ms,
	tmp1.max_elapsed_time / 1000 AS max_elapsed_time_ms,
	tmp1.total_rows,
	tmp1.max_rows,
	tmp1.last_rows,
	tmp1.last_dop,
	tmp1.max_dop

FROM sys.dm_exec_requests AS r
CROSS APPLY sys.dm_exec_sql_text(r.sql_handle) AS st
JOIN sys.dm_exec_sessions AS s ON r.session_id = s.session_id
left join cte as tmp1 on tmp1.sql_handle = r.sql_handle


UNION ALL

select  
	sysproc.spid
	,NULL AS start_time
	,sysproc.status
	,sysproc.cmd
	,sysproc.dbid
	,DB_NAME(sysproc.dbid) AS database_name
	,sysproc.uid
	,sysproc.blocked
	,sysproc.waittype
	,sysproc.waittime
	,sysproc.lastwaittype
	,sysproc.cpu
	,NULL as total_elapsed_time_ms
	,NULL as logical_reads
	,NULL as reads
	,NULL as writes
	,NULL as transaction_isolation_level
	,NULL as dop
	,sysproc.login_time
	,sysproc.hostname
	,sysproc.loginame
	,sysproc.[program_name]
	,sysproc.hostprocess
	,NULL as last_request_start_time
	,sysproc.last_batch
	,NULL as query_text
    ,st.text AS full_query_text

	,tmp1.query_plan,
	tmp1.sql_handle,
	tmp1.plan_handle,
	tmp1.creation_time,
	tmp1.last_execution_time,
	tmp1.execution_count,
	tmp1.total_worker_time,
	tmp1.last_worker_time,
	tmp1.max_worker_time,
	tmp1.total_logical_reads,
	tmp1.max_logical_reads,
	tmp1.last_logical_reads,
	tmp1.last_physical_reads,
	tmp1.total_physical_reads,
	tmp1.max_physical_reads,
	tmp1.total_logical_writes,
	tmp1.last_logical_writes,
	tmp1.max_logical_writes,
	tmp1.last_elapsed_time / 1000 AS last_elapsed_time_ms,
	tmp1.max_elapsed_time / 1000 AS max_elapsed_time_ms,
	tmp1.total_rows,
	tmp1.max_rows,
	tmp1.last_rows,
	tmp1.last_dop,
	tmp1.max_dop

from sys.sysprocesses as sysproc
CROSS APPLY sys.dm_exec_sql_text(sysproc.sql_handle) AS st
left join cte as tmp1 on tmp1.sql_handle = sysproc.sql_handle
where spid  > 50




GO
/****** Object:  View [dbo].[v_Currently_Blocking]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[v_Currently_Blocking] as

SELECT 
	lqcrm.[session_id] as [im_blocked] 
,lqcrm.[blocking_session_id] as [im_blocking]
	,sysp.open_tran
	,lqcrm2.[start_time]
	,lqcrm2.[status]
	,lqcrm2.[command]
	,lqcrm2.[database_id]
	,lqcrm2.[database_name]
	,lqcrm2.[wait_type]
	,lqcrm2.[last_wait_type]
	,lqcrm2.[cpu_time_ms]
	,lqcrm2.[total_elapsed_time_ms]
	,lqcrm2.[transaction_isolation_level]
	,lqcrm2.[dop]
	,lqcrm2.[login_time]
	,lqcrm2.[host_name]
	,lqcrm2.[login_name]
	,lqcrm2.[program_name]
	,lqcrm2.[host_process_id]
	,lqcrm2.[last_request_start_time]
	,lqcrm2.[last_request_end_time]

	,lqcrm2.[full_query_text]

	

  FROM [SNOOPER].[dbo].[v_Currently_running] lqcrm
  LEFT JOIN [SNOOPER].[dbo].[v_Currently_running] lqcrm2 on lqcrm2.[session_id] = lqcrm.[blocking_session_id] and lqcrm2.[start_time] is not null 
   left join sys.sysprocesses sysp on sysp.spid =   lqcrm.[blocking_session_id]

  WHERE lqcrm.[blocking_session_id] >0


  group by
	lqcrm.[blocking_session_id] 
	,lqcrm.[session_id]
	,sysp.open_tran
	,lqcrm2.[start_time]
	,lqcrm2.[status]
	,lqcrm2.[command]
	,lqcrm2.[database_id]
	,lqcrm2.[database_name]
	,lqcrm2.[wait_type]
	,lqcrm2.[last_wait_type]
	,lqcrm2.[cpu_time_ms]
	,lqcrm2.[total_elapsed_time_ms]
	,lqcrm2.[transaction_isolation_level]
	,lqcrm2.[dop]
	,lqcrm2.[login_time]
	,lqcrm2.[host_name]
	,lqcrm2.[login_name]
	,lqcrm2.[program_name]
	,lqcrm2.[host_process_id]
	,lqcrm2.[last_request_start_time]
	,lqcrm2.[last_request_end_time]
	,lqcrm2.[full_query_text]




GO
/****** Object:  View [dbo].[v_Currently_open_tranactions]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_Currently_open_tranactions] as

SELECT 
sysp.open_tran
,vcr.[session_id]
      ,vcr.[start_time]
      ,vcr.[status]
      ,vcr.[command]
      ,vcr.[database_id]
      ,vcr.[database_name]
      ,vcr.[user_id]
      ,vcr.[blocking_session_id]
      ,vcr.[wait_type]
      ,vcr.[wait_time]
      ,vcr.[last_wait_type]
      ,vcr.[cpu_time_ms]
      ,vcr.[total_elapsed_time_ms]
      ,vcr.[logical_reads]
      ,vcr.[reads]
      ,vcr.[writes]
      ,vcr.[transaction_isolation_level]
      ,vcr.[dop]
      ,vcr.[login_time]
      ,vcr.[host_name]
      ,vcr.[login_name]
      ,vcr.[program_name]
      ,vcr.[host_process_id]
      ,vcr.[last_request_start_time]
      ,vcr.[last_request_end_time]
      ,vcr.[query_text_live]
      ,vcr.[full_query_text]
      ,vcr.[query_plan]
      ,vcr.[sql_handle]
      ,vcr.[plan_handle]
      ,vcr.[creation_time]
      ,vcr.[last_execution_time]
      ,vcr.[execution_count]
      ,vcr.[total_worker_time]
      ,vcr.[last_worker_time]
      ,vcr.[max_worker_time]
      ,vcr.[total_logical_reads]
      ,vcr.[max_logical_reads]
      ,vcr.[last_logical_reads]
      ,vcr.[last_physical_reads]
      ,vcr.[total_physical_reads]
      ,vcr.[max_physical_reads]
      ,vcr.[total_logical_writes]
      ,vcr.[last_logical_writes]
      ,vcr.[max_logical_writes]
      ,vcr.[last_elapsed_time_ms]
      ,vcr.[max_elapsed_time_ms]
      ,vcr.[total_rows]
      ,vcr.[max_rows]
      ,vcr.[last_rows]
      ,vcr.[last_dop]
      ,vcr.[max_dop]
  FROM [SNOOPER].[dbo].[v_Currently_running] vcr
  left JOIN sys.sysprocesses sysp on sysp.spid = vcr.session_id
  where sysp.open_tran > 0

GO
/****** Object:  Table [dbo].[TOP_IO_intensive_queries_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TOP_IO_intensive_queries_metric](
	[date] [datetime] NULL,
	[sql_handle] [varbinary](64) NULL,
	[plan_handle] [varbinary](64) NULL,
	[creation_time] [datetime] NULL,
	[last_execution_time] [datetime] NULL,
	[LogicalReads] [int] NULL,
	[LogicalWrites] [int] NULL,
	[execution_count] [int] NULL,
	[TotalIO] [int] NULL,
	[AvgIO] [float] NULL,
	[query_text] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_TOP_IO_intensive_queries_last_2_hours]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create view [dbo].[v_TOP_IO_intensive_queries_last_2_hours] as

SELECT 


      sum(tccqm.[execution_count]) as [execution_count]
      ,tccqm.[query_text]

	  ,lqcrm.[transaction_isolation_level]
	   ,lqcrm.[database_id]
      ,lqcrm.[database_name]
	    ,lqcrm.[host_name]
      ,lqcrm.[login_name]
      ,lqcrm.[program_name]
 
-- ,sum(lqcrm.[total_worker_time_ms])
  ,max(lqcrm.[max_worker_time_ms]) as [max_worker_time_ms]
 ,max(lqcrm.[max_elapsed_time_ms]) as [max_elapsed_time_ms]

--,sum(lqcrm.[total_logical_reads])
,max(lqcrm.[max_logical_reads]) as [max_logical_reads]

--,sum(lqcrm.[total_physical_reads])
,max(lqcrm.[max_physical_reads]) as [max_physical_reads]

--,sum(lqcrm.[total_logical_writes])
 ,max(lqcrm.[max_logical_writes]  ) as [max_logical_writes]

--,sum(lqcrm.[total_rows])
,max(lqcrm.[max_rows])  as [max_rows]

,avg(lqcrm.[max_dop])  as  [max_dop]


  FROM [SNOOPER].[dbo].[TOP_IO_intensive_queries_metric] AS tccqm 

  LEFT JOIN [SNOOPER].[dbo].[live_queries_currently_running_metric] lqcrm on  lqcrm.sql_handle = tccqm.sql_handle and lqcrm.plan_handle = tccqm.plan_handle and lqcrm.[date] >= DATEADD(HOUR, -2, GETDATE())

  where  
  tccqm.[date] >= DATEADD(HOUR, -2, GETDATE())  -- last 24 hours
 and  lqcrm.[database_id] is not null
  and [transaction_isolation_level] is not null
  group by
   tccqm.[query_text]
	  ,lqcrm.[transaction_isolation_level]
	   ,lqcrm.[database_id]
      ,lqcrm.[database_name]
	    ,lqcrm.[host_name]
      ,lqcrm.[login_name]
      ,lqcrm.[program_name]
	 
GO
/****** Object:  Table [dbo].[DB_unused_space_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DB_unused_space_metric](
	[date] [datetime] NULL,
	[database_id] [int] NULL,
	[name] [nvarchar](200) NULL,
	[File_Name] [nvarchar](1000) NULL,
	[FreeSpaceMB] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_DB_file_size]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[v_DB_file_size] as
with cte as(
SELECT 
    ms.database_id,
	db.name,
	ms.name as [file_name],
	CASE
		WHEN ms.type = 1 then 'LOG'
		ELSE 'DATA'
	END AS [File_type],
     FORMAT(ROUND((SUM(size * 8.0 / 1024.0)), 2,0),'N2') AS SizeMB,   
     FORMAT(ROUND((SUM(size * 8.0 / 1024.0 / 1024.0)), 2,0),'N2') AS SizeGB    
	
FROM sys.master_files as ms
LEFT JOIN sys.databases as db on db.database_id = ms.database_id
group by 
ms.database_id
,ms.type
,db.name
,ms.name
)
select distinct cte.*
,( select top 1 Dusm.[FreeSpaceMB] 
	from [SNOOPER].[dbo].[DB_unused_space_metric] as Dusm
	where Dusm.database_id = cte.database_id and Dusm.[File_Name] = cte.[file_name]  and  Dusm.[name] = cte.name and Dusm.date = (select max(date) from [SNOOPER].[dbo].[DB_unused_space_metric] a where a.database_id = Dusm.database_id) ) as [FreeSpaceMB] --DATEADD(MINUTE, -10, GETDATE())  ) as [FreeSpaceMB]
from cte as cte





GO
/****** Object:  Table [dbo].[cpu_usage_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cpu_usage_metric](
	[date] [datetime] NULL,
	[metric] [nvarchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_BI_LAST_DAY_AVG_CPU_USAGE_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




create view [dbo].[v_BI_LAST_DAY_AVG_CPU_USAGE_metric] as 


-- LAST DAY AVG CPU %
  SELECT TOP (1000)  
    CAST(
        DATEADD(
            SECOND,
            ROUND(
                DATEDIFF(SECOND, '2024-01-01 00:00:00', [date]) / 60.0,
                0
            ) * 60,
            '2024-01-01 00:00:00'
        ) AS TIME
    ) AS [RoundedTime],
  
    AVG(CONVERT(INT,[metric])) AS avg_cpu
FROM [SNOOPER].[dbo].[cpu_usage_metric]
WHERE CAST([date] AS DATE) >=  CAST(GETDATE() AS DATE) 
GROUP BY  
         DATEADD(
            SECOND,
            ROUND(
                DATEDIFF(SECOND, '2024-01-01 00:00:00', [date]) / 60.0,
                0
            ) * 60,
            '2024-01-01 00:00:00'
         )
ORDER BY [RoundedTime] DESC;


GO
/****** Object:  Table [dbo].[Physical_Disk_usage_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Physical_Disk_usage_metric](
	[date] [datetime] NULL,
	[metric] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_BI_LAST_DAY_AVG_PHYSICAL_DISK_USAGE_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





create view [dbo].[v_BI_LAST_DAY_AVG_PHYSICAL_DISK_USAGE_metric] as 


-- LAST DAY AVG Physical_Disk_usage %
  SELECT TOP (1000)  
    CAST(
        DATEADD(
            SECOND,
            ROUND(
                DATEDIFF(SECOND, '2024-01-01 00:00:00', [date]) / 60.0,
                0
            ) * 60,
            '2024-01-01 00:00:00'
        ) AS TIME
    ) AS [RoundedTime],
  
    AVG(CONVERT(INT,[metric])) AS avg_Physical_Disk_usage
FROM [SNOOPER].[dbo].[Physical_Disk_usage_metric]
WHERE CAST([date] AS DATE) >=  CAST(GETDATE() AS DATE) 
GROUP BY  
         DATEADD(
            SECOND,
            ROUND(
                DATEDIFF(SECOND, '2024-01-01 00:00:00', [date]) / 60.0,
                0
            ) * 60,
            '2024-01-01 00:00:00'
         )
ORDER BY [RoundedTime] DESC;


GO
/****** Object:  Table [dbo].[Batch_Requests_sec_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Batch_Requests_sec_metric](
	[date] [datetime] NULL,
	[metric] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_BI_LAST_DAY_AVG_BATCH_REQUESTS_SEC_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





create view [dbo].[v_BI_LAST_DAY_AVG_BATCH_REQUESTS_SEC_metric] as 



-- LAST DAY AVG Batch_Requests_sec
  SELECT TOP (1000)  
    CAST(
        DATEADD(
            SECOND,
            ROUND(
                DATEDIFF(SECOND, '2024-01-01 00:00:00', [date]) / 60.0,
                0
            ) * 60,
            '2024-01-01 00:00:00'
        ) AS TIME
    ) AS [RoundedTime],
  
    AVG(CONVERT(INT,[metric])) AS avg_Batch_Requests_sec
FROM [SNOOPER].[dbo].[Batch_Requests_sec_metric]
WHERE CAST([date] AS DATE) >=  CAST(GETDATE() AS DATE) 
GROUP BY  
         DATEADD(
            SECOND,
            ROUND(
                DATEDIFF(SECOND, '2024-01-01 00:00:00', [date]) / 60.0,
                0
            ) * 60,
            '2024-01-01 00:00:00'
         )
ORDER BY [RoundedTime] DESC;



GO
/****** Object:  Table [dbo].[Buffer_cache_hit_ratio_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buffer_cache_hit_ratio_metric](
	[date] [datetime] NULL,
	[metric] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_BI_LAST_DAY_AVG_BUFFER_CACHE_HIT_RATIO_METRIC]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






create view [dbo].[v_BI_LAST_DAY_AVG_BUFFER_CACHE_HIT_RATIO_METRIC] as 



-- LAST DAY AVG Batch_Requests_sec
  SELECT TOP (1000)  
    CAST(
        DATEADD(
            SECOND,
            ROUND(
                DATEDIFF(SECOND, '2024-01-01 00:00:00', [date]) / 60.0,
                0
            ) * 60,
            '2024-01-01 00:00:00'
        ) AS TIME
    ) AS [RoundedTime],
  
    AVG(CONVERT(INT,[metric])) AS avg_Buffer_cache_hit_ratio
FROM [SNOOPER].[dbo].[Buffer_cache_hit_ratio_metric]
WHERE CAST([date] AS DATE) >=  CAST(GETDATE() AS DATE) 
GROUP BY  
         DATEADD(
            SECOND,
            ROUND(
                DATEDIFF(SECOND, '2024-01-01 00:00:00', [date]) / 60.0,
                0
            ) * 60,
            '2024-01-01 00:00:00'
         )
ORDER BY [RoundedTime] DESC;



GO
/****** Object:  Table [dbo].[Checkpoint_pages_sec_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Checkpoint_pages_sec_metric](
	[date] [datetime] NULL,
	[metric] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_BI_LAST_DAY_AVG_CHECKPOINT_PAGES_SEC_METRIC]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






create view [dbo].[v_BI_LAST_DAY_AVG_CHECKPOINT_PAGES_SEC_METRIC] as 



-- LAST DAY AVG Batch_Requests_sec
  SELECT TOP (1000)  
    CAST(
        DATEADD(
            SECOND,
            ROUND(
                DATEDIFF(SECOND, '2024-01-01 00:00:00', [date]) / 60.0,
                0
            ) * 60,
            '2024-01-01 00:00:00'
        ) AS TIME
    ) AS [RoundedTime],
  
    AVG(CONVERT(INT,[metric])) AS avg_Checkpoint_pages_sec
FROM  [SNOOPER].[dbo].[Checkpoint_pages_sec_metric]
WHERE CAST([date] AS DATE) >=  CAST(GETDATE() AS DATE) 
GROUP BY  
         DATEADD(
            SECOND,
            ROUND(
                DATEDIFF(SECOND, '2024-01-01 00:00:00', [date]) / 60.0,
                0
            ) * 60,
            '2024-01-01 00:00:00'
         )
ORDER BY [RoundedTime] DESC;



GO
/****** Object:  Table [dbo].[Current_User_Connections_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Current_User_Connections_metric](
	[date] [datetime] NULL,
	[metric] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_BI_LAST_DAY_AVG_USER_CONNECTIONS_METRIC]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






create view [dbo].[v_BI_LAST_DAY_AVG_USER_CONNECTIONS_METRIC] as 



-- LAST DAY AVG Batch_Requests_sec
  SELECT TOP (1000)  
    CAST(
        DATEADD(
            SECOND,
            ROUND(
                DATEDIFF(SECOND, '2024-01-01 00:00:00', [date]) / 60.0,
                0
            ) * 60,
            '2024-01-01 00:00:00'
        ) AS TIME
    ) AS [RoundedTime],
  
    AVG(CONVERT(INT,[metric])) AS avg_User_Connections
FROM  [SNOOPER].[dbo].[Current_User_Connections_metric]
WHERE CAST([date] AS DATE) >=  CAST(GETDATE() AS DATE) 
GROUP BY  
         DATEADD(
            SECOND,
            ROUND(
                DATEDIFF(SECOND, '2024-01-01 00:00:00', [date]) / 60.0,
                0
            ) * 60,
            '2024-01-01 00:00:00'
         )
ORDER BY [RoundedTime] DESC;



GO
/****** Object:  Table [dbo].[DB_buffer_mb_used_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DB_buffer_mb_used_metric](
	[date] [datetime] NULL,
	[database_id] [int] NULL,
	[name] [nvarchar](200) NULL,
	[buffer_mb_used] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_LAST_DAY_AVG_DB_BUFFER_MB_USED]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[v_LAST_DAY_AVG_DB_BUFFER_MB_USED] as 


SELECT top(1000)CAST(
        DATEADD(
            SECOND,
            ROUND(
                DATEDIFF(SECOND, '2024-01-01 00:00:00', [date]) / 60.0,
                0
            ) * 60,
            '2024-01-01 00:00:00'
        ) AS TIME
    ) AS [RoundedTime]
--	[date]
      ,[database_id]
      ,[name]
      ,avg([buffer_mb_used]) as avg_buffer_mb_used
  FROM [SNOOPER].[dbo].[DB_buffer_mb_used_metric]
  WHERE CAST([date] AS DATE) >=  CAST(GETDATE() AS DATE) 
  GROUP BY  
         DATEADD(
            SECOND,
            ROUND(
                DATEDIFF(SECOND, '2024-01-01 00:00:00', [date]) / 60.0,
                0
            ) * 60,
            '2024-01-01 00:00:00'
         )
		  ,[database_id]
      ,[name]
ORDER BY [RoundedTime] DESC;


GO
/****** Object:  Table [dbo].[cpu_info_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cpu_info_metric](
	[date] [datetime] NULL,
	[name] [nvarchar](200) NULL,
	[socket_count] [int] NULL,
	[cores_per_socket] [int] NULL,
	[num_cores] [nvarchar](200) NULL,
	[num_logical_processors] [nvarchar](200) NULL,
	[processors_online] [int] NULL,
	[processors_in_use_by_sql] [int] NULL,
	[Schedulers_Available] [int] NULL,
	[max_workers_count] [int] NULL,
	[max_worker_threads_setting] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_cpu_info]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_cpu_info] as 
SELECT TOP (1) [date]
      ,[name]
      ,[socket_count]
      ,[cores_per_socket]
      ,[num_cores]
      ,[num_logical_processors]
      ,[processors_online]
      ,[processors_in_use_by_sql]
      ,[Schedulers_Available]
      ,[max_workers_count]
      ,[max_worker_threads_setting]
  FROM [SNOOPER].[dbo].[cpu_info_metric]
  order by date desc;
GO
/****** Object:  Table [dbo].[DB_Last_Successful_DBCC_CHECKDB_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DB_Last_Successful_DBCC_CHECKDB_metric](
	[date] [datetime] NULL,
	[database_id] [int] NULL,
	[name] [nvarchar](200) NULL,
	[Last_Successful_DBCC_CHECKDB] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_Last_Successful_DBCC_CHECKDB]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_Last_Successful_DBCC_CHECKDB] as
select distinct TOP (1000) 
      [database_id]
      ,[name]
      ,[Last_Successful_DBCC_CHECKDB]
	FROM [SNOOPER].[dbo].[DB_Last_Successful_DBCC_CHECKDB_metric] as a
	WHERE CAST([date] AS DATE) >=  CAST(GETDATE() AS DATE)
GO
/****** Object:  Table [dbo].[DB_Reads_Writes_sec_KBRead_KBWritten_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DB_Reads_Writes_sec_KBRead_KBWritten_metric](
	[date] [datetime] NULL,
	[database_id] [int] NULL,
	[name] [nvarchar](200) NULL,
	[File_Name] [nvarchar](1000) NULL,
	[ReadsPerSec] [int] NULL,
	[WritesPerSec] [int] NULL,
	[KBRead] [int] NULL,
	[KBWritten] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_LAST_DAY_AVG_DB_READS_WRITES_SEC_KBREAD_KBWRITTEN]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create view  [dbo].[v_LAST_DAY_AVG_DB_READS_WRITES_SEC_KBREAD_KBWRITTEN]  as
SELECT top(1000)CAST(
        DATEADD(
            SECOND,
            ROUND(
                DATEDIFF(SECOND, '2024-01-01 00:00:00', [date]) / 60.0,
                0
            ) * 60,
            '2024-01-01 00:00:00'
        ) AS TIME
    ) AS [RoundedTime]
--	[date]
      ,[database_id]
      ,[name]
,[File_Name]

      ,avg([ReadsPerSec]) as avg_ReadsPerSec
      ,avg([WritesPerSec]) as avg_WritesPerSec
      ,avg([KBRead]) as  avg_KBRead
      ,avg([KBWritten]) as avg_KBWritten
  FROM  [SNOOPER].[dbo].[DB_Reads_Writes_sec_KBRead_KBWritten_metric]
  WHERE CAST([date] AS DATE) >=  CAST(GETDATE() AS DATE) 
  GROUP BY  
         DATEADD(
            SECOND,
            ROUND(
                DATEDIFF(SECOND, '2024-01-01 00:00:00', [date]) / 60.0,
                0
            ) * 60,
            '2024-01-01 00:00:00'
         )
		  ,[database_id]
      ,[name]
,[File_Name]
ORDER BY [RoundedTime] DESC;
GO
/****** Object:  Table [dbo].[Disk_Read_Bytes_sec_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Disk_Read_Bytes_sec_metric](
	[date] [datetime] NULL,
	[metric] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_BI_LAST_DAY_AVG_DISK_READ_BYTES_SEC_METRIC]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[v_BI_LAST_DAY_AVG_DISK_READ_BYTES_SEC_METRIC] as

  SELECT TOP (1000)  
    CAST(
        DATEADD(
            SECOND,
            ROUND(
                DATEDIFF(SECOND, '2024-01-01 00:00:00', [date]) / 60.0,
                0
            ) * 60,
            '2024-01-01 00:00:00'
        ) AS TIME
    ) AS [RoundedTime],
  
    AVG(CONVERT(INT,[metric])) AS avg_Disk_Read_Bytes_sec
FROM [SNOOPER].[dbo].[Disk_Read_Bytes_sec_metric]
WHERE CAST([date] AS DATE) >=  CAST(GETDATE() AS DATE) 
GROUP BY  
         DATEADD(
            SECOND,
            ROUND(
                DATEDIFF(SECOND, '2024-01-01 00:00:00', [date]) / 60.0,
                0
            ) * 60,
            '2024-01-01 00:00:00'
         )
ORDER BY [RoundedTime] DESC;


GO
/****** Object:  Table [dbo].[Disk_Write_Bytes_sec_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Disk_Write_Bytes_sec_metric](
	[date] [datetime] NULL,
	[metric] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_BI_LAST_DAY_AVG_DISK_WRITE_BYTES_SEC_METRIC]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[v_BI_LAST_DAY_AVG_DISK_WRITE_BYTES_SEC_METRIC] as

  SELECT TOP (1000)  
    CAST(
        DATEADD(
            SECOND,
            ROUND(
                DATEDIFF(SECOND, '2024-01-01 00:00:00', [date]) / 60.0,
                0
            ) * 60,
            '2024-01-01 00:00:00'
        ) AS TIME
    ) AS [RoundedTime],
  
    AVG(CONVERT(INT,[metric])) AS avg_Disk_Write_Bytes_sec
FROM [SNOOPER].[dbo].[Disk_Write_Bytes_sec_metric]
WHERE CAST([date] AS DATE) >=  CAST(GETDATE() AS DATE) 
GROUP BY  
         DATEADD(
            SECOND,
            ROUND(
                DATEDIFF(SECOND, '2024-01-01 00:00:00', [date]) / 60.0,
                0
            ) * 60,
            '2024-01-01 00:00:00'
         )
ORDER BY [RoundedTime] DESC;


GO
/****** Object:  Table [dbo].[Disk_Reads_sec_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Disk_Reads_sec_metric](
	[date] [datetime] NULL,
	[metric] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_BI_LAST_DAY_AVG_DISK_READS_SEC_METRIC]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[v_BI_LAST_DAY_AVG_DISK_READS_SEC_METRIC] as

  SELECT TOP (1000)  
    CAST(
        DATEADD(
            SECOND,
            ROUND(
                DATEDIFF(SECOND, '2024-01-01 00:00:00', [date]) / 60.0,
                0
            ) * 60,
            '2024-01-01 00:00:00'
        ) AS TIME
    ) AS [RoundedTime],
  
    AVG(CONVERT(INT,[metric])) AS avg_Disk_Reads_sec
FROM [SNOOPER].[dbo].[Disk_Reads_sec_metric]
WHERE CAST([date] AS DATE) >=  CAST(GETDATE() AS DATE) 
GROUP BY  
         DATEADD(
            SECOND,
            ROUND(
                DATEDIFF(SECOND, '2024-01-01 00:00:00', [date]) / 60.0,
                0
            ) * 60,
            '2024-01-01 00:00:00'
         )
ORDER BY [RoundedTime] DESC;


GO
/****** Object:  Table [dbo].[Disk_Writes_sec_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Disk_Writes_sec_metric](
	[date] [datetime] NULL,
	[metric] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_BI_LAST_DAY_AVG_DISK_WRITES_SEC_METRIC]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[v_BI_LAST_DAY_AVG_DISK_WRITES_SEC_METRIC] as

  SELECT TOP (1000)  
    CAST(
        DATEADD(
            SECOND,
            ROUND(
                DATEDIFF(SECOND, '2024-01-01 00:00:00', [date]) / 60.0,
                0
            ) * 60,
            '2024-01-01 00:00:00'
        ) AS TIME
    ) AS [RoundedTime],
  
    AVG(CONVERT(INT,[metric])) AS avg_Disk_Writes_sec
FROM [SNOOPER].[dbo].[Disk_Writes_sec_metric]
WHERE CAST([date] AS DATE) >=  CAST(GETDATE() AS DATE) 
GROUP BY  
         DATEADD(
            SECOND,
            ROUND(
                DATEDIFF(SECOND, '2024-01-01 00:00:00', [date]) / 60.0,
                0
            ) * 60,
            '2024-01-01 00:00:00'
         )
ORDER BY [RoundedTime] DESC;


GO
/****** Object:  Table [dbo].[Free_list_memory_stalls_sec_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Free_list_memory_stalls_sec_metric](
	[date] [datetime] NULL,
	[metric] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_BI_LAST_DAY_AVG_FREE_LIST_MEMORY_STALLS_SEC_METRIC]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[v_BI_LAST_DAY_AVG_FREE_LIST_MEMORY_STALLS_SEC_METRIC] as

  SELECT TOP (1000)  
    CAST(
        DATEADD(
            SECOND,
            ROUND(
                DATEDIFF(SECOND, '2024-01-01 00:00:00', [date]) / 60.0,
                0
            ) * 60,
            '2024-01-01 00:00:00'
        ) AS TIME
    ) AS [RoundedTime],
  
    AVG(CONVERT(INT,[metric])) AS avg_Free_list_memory_stalls_sec
FROM [SNOOPER].[dbo].[Free_list_memory_stalls_sec_metric]
WHERE CAST([date] AS DATE) >=  CAST(GETDATE() AS DATE) 
GROUP BY  
         DATEADD(
            SECOND,
            ROUND(
                DATEDIFF(SECOND, '2024-01-01 00:00:00', [date]) / 60.0,
                0
            ) * 60,
            '2024-01-01 00:00:00'
         )
ORDER BY [RoundedTime] DESC;


GO
/****** Object:  Table [dbo].[Last_Restart_Time_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Last_Restart_Time_metric](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NULL,
	[metric] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_SQLServer_Last_restart]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_SQLServer_Last_restart] as
select
(SELECT 
MAX([metric]) AS Last_Restart_Time
FROM [SNOOPER].[dbo].[Last_Restart_Time_metric]) as Last_Restart_Time
,(SELECT 
count(distinct [metric]) as total_restarts_last_day
FROM [SNOOPER].[dbo].[Last_Restart_Time_metric]
WHERE CAST([date] AS DATE) >=  CAST(GETDATE() AS DATE) 
group by   cast([date] as date)  ) as total_restarts_last_day
GO
/****** Object:  Table [dbo].[OS_RAM_free_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OS_RAM_free_metric](
	[date] [datetime] NULL,
	[metric] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_BI_LAST_DAY_AVG_OS_RAM_FREE_METRIC]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[v_BI_LAST_DAY_AVG_OS_RAM_FREE_METRIC] as

  SELECT TOP (1000)  
    CAST(
        DATEADD(
            SECOND,
            ROUND(
                DATEDIFF(SECOND, '2024-01-01 00:00:00', [date]) / 60.0,
                0
            ) * 60,
            '2024-01-01 00:00:00'
        ) AS TIME
    ) AS [RoundedTime],
  
    AVG(CONVERT(INT,[metric])) AS avg_OS_RAM_free
FROM [SNOOPER].[dbo].[OS_RAM_free_metric]
WHERE CAST([date] AS DATE) >=  CAST(GETDATE() AS DATE) 
GROUP BY  
         DATEADD(
            SECOND,
            ROUND(
                DATEDIFF(SECOND, '2024-01-01 00:00:00', [date]) / 60.0,
                0
            ) * 60,
            '2024-01-01 00:00:00'
         )
ORDER BY [RoundedTime] DESC;


GO
/****** Object:  Table [dbo].[OS_RAM_total_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OS_RAM_total_metric](
	[date] [datetime] NULL,
	[metric] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_BI_LAST_DAY_AVG_OS_RAM_TOTAL_METRIC]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[v_BI_LAST_DAY_AVG_OS_RAM_TOTAL_METRIC] as

  SELECT TOP (1000)  
    CAST(
        DATEADD(
            SECOND,
            ROUND(
                DATEDIFF(SECOND, '2024-01-01 00:00:00', [date]) / 60.0,
                0
            ) * 60,
            '2024-01-01 00:00:00'
        ) AS TIME
    ) AS [RoundedTime],
  
    AVG(CONVERT(INT,[metric])) AS avg_OS_RAM_total
FROM [SNOOPER].[dbo].[OS_RAM_total_metric]
WHERE CAST([date] AS DATE) >=  CAST(GETDATE() AS DATE) 
GROUP BY  
         DATEADD(
            SECOND,
            ROUND(
                DATEDIFF(SECOND, '2024-01-01 00:00:00', [date]) / 60.0,
                0
            ) * 60,
            '2024-01-01 00:00:00'
         )
ORDER BY [RoundedTime] DESC;


GO
/****** Object:  Table [dbo].[Page_life_expectancy_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Page_life_expectancy_metric](
	[date] [datetime] NULL,
	[metric] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_BI_LAST_DAY_AVG_PAGE_LIFE_EXPECTANCY_METRIC]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[v_BI_LAST_DAY_AVG_PAGE_LIFE_EXPECTANCY_METRIC] as

  SELECT TOP (1000)  
    CAST(
        DATEADD(
            SECOND,
            ROUND(
                DATEDIFF(SECOND, '2024-01-01 00:00:00', [date]) / 60.0,
                0
            ) * 60,
            '2024-01-01 00:00:00'
        ) AS TIME
    ) AS [RoundedTime],
  
    AVG(CONVERT(INT,[metric])) AS avg_Page_life_expectancy
FROM [SNOOPER].[dbo].[Page_life_expectancy_metric]
WHERE CAST([date] AS DATE) >=  CAST(GETDATE() AS DATE) 
GROUP BY  
         DATEADD(
            SECOND,
            ROUND(
                DATEDIFF(SECOND, '2024-01-01 00:00:00', [date]) / 60.0,
                0
            ) * 60,
            '2024-01-01 00:00:00'
         )
ORDER BY [RoundedTime] DESC;


GO
/****** Object:  Table [dbo].[pagefile_usage_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pagefile_usage_metric](
	[date] [datetime] NULL,
	[AllocatedBaseSize_MB] [nvarchar](200) NULL,
	[CurrentUsage_MB] [nvarchar](200) NULL,
	[Name] [nvarchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_pagefileSYS_info]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_pagefileSYS_info] as
  SELECT TOP (1)
      [AllocatedBaseSize_MB]
      ,[Name]
  FROM [SNOOPER].[dbo].[pagefile_usage_metric]
  order by date desc
GO
/****** Object:  Table [dbo].[server_info_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[server_info_metric](
	[date] [datetime] NULL,
	[SQL_SERVERNAME] [nvarchar](1000) NULL,
	[SQL_VERSION] [nvarchar](1000) NULL,
	[OS_hostname] [nvarchar](1000) NULL,
	[host_platform] [nvarchar](1000) NULL,
	[host_distribution] [nvarchar](200) NULL,
	[host_release] [nvarchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_server_info]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_server_info] as
SELECT TOP (1) 
      [SQL_SERVERNAME]
      ,[SQL_VERSION]
      ,[OS_hostname]
      ,[host_platform]
      ,[host_distribution]
      ,[host_release]
  FROM [SNOOPER].[dbo].[server_info_metric]
  order by date desc
GO
/****** Object:  Table [dbo].[SQL_RAM_info_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SQL_RAM_info_metric](
	[date] [datetime] NULL,
	[MIN_server_memory_MB_setting] [int] NULL,
	[MAX_server_memory_MB_setting] [int] NULL,
	[actively_using_RAM_MB] [int] NULL,
	[Memory_State] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_BI_LAST_DAY_AVG_SQL_RAM_USAGE_METRIC]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[v_BI_LAST_DAY_AVG_SQL_RAM_USAGE_METRIC] as

  SELECT TOP (1000)  
    CAST(
        DATEADD(
            SECOND,
            ROUND(
                DATEDIFF(SECOND, '2024-01-01 00:00:00', [date]) / 60.0,
                0
            ) * 60,
            '2024-01-01 00:00:00'
        ) AS TIME
    ) AS [RoundedTime],
  
    AVG(CONVERT(INT,[actively_using_RAM_MB])) AS avg_SQL_RAM_usage
FROM  [SNOOPER].[dbo].[SQL_RAM_info_metric]
WHERE CAST([date] AS DATE) >=  CAST(GETDATE() AS DATE) 
GROUP BY  
         DATEADD(
            SECOND,
            ROUND(
                DATEDIFF(SECOND, '2024-01-01 00:00:00', [date]) / 60.0,
                0
            ) * 60,
            '2024-01-01 00:00:00'
         )
ORDER BY [RoundedTime] DESC;


GO
/****** Object:  View [dbo].[v_missing_index]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view  [dbo].[v_missing_index] as

WITH XMLNAMESPACES('http://schemas.microsoft.com/sqlserver/2004/07/showplan' AS p)
SELECT TOP (1000) [date]
      ,[session_id]
      ,[start_time]
      ,[status]
      ,[command]
      ,[database_id]
      ,[database_name]
      ,[user_id]
      ,[blocking_session_id]
      ,[wait_type]
      ,[wait_time_ms]
      ,[last_wait_type]
      ,[cpu_time_ms]
      ,[total_elapsed_time_ms]
      ,[logical_reads]
      ,[reads]
      ,[writes]
      ,[transaction_isolation_level]
      ,[dop]
      ,[login_time]
      ,[host_name]
      ,[login_name]
      ,[program_name]
      ,[host_process_id]
      ,[last_request_start_time]
      ,[last_request_end_time]
      ,[currently_running_portion_of_the_batch]
      ,[full_query_text]
      ,[query_plan]
      ,[sql_handle]
      ,[plan_handle]
      ,[creation_time]
      ,[last_execution_time]
      ,[execution_count]
      ,[total_worker_time_ms]
      ,[last_worker_time_ms]
      ,[max_worker_time_ms]
      ,[total_logical_reads]
      ,[max_logical_reads]
      ,[last_logical_reads]
      ,[last_physical_reads]
      ,[total_physical_reads]
      ,[max_physical_reads]
      ,[total_logical_writes]
      ,[last_logical_writes]
      ,[max_logical_writes]
      ,[last_elapsed_time_ms]
      ,[max_elapsed_time_ms]
      ,[total_rows]
      ,[max_rows]
      ,[last_rows]
      ,[last_dop]
      ,[max_dop]
  FROM [SNOOPER].[dbo].[live_queries_currently_running_metric] as m
  WHERE  m.query_plan.value('count(//p:MissingIndexGroup)', 'int') > 0
GO
/****** Object:  View [dbo].[v_backup_and_restore_info]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW  [dbo].[v_backup_and_restore_info] AS


with cte as(
select name, database_id
from sys.databases
where database_id <> 2
)
SELECT 
cte.database_id,
cte.name,
    max(bs.backup_start_date) AS BackupStartTime,
    max(bs.backup_finish_date) AS BackupFinishTime,
	CASE WHEN bs.type = 'D' THEN 'FULL'
	WHEN bs.type = 'I' THEN 'Differential'
	WHEN bs.type = 'L' THEN 'Log'
	ELSE ''
	END AS [BackupType],
    isnull(max(bs.backup_size / 1024 / 1024),0) AS BackupSizeMB,
    isnull(bm.physical_device_name,'') AS BackupLocation,
    max(rh.restore_date)AS LastRestoreDate,
    isnull(rh.destination_database_name,'') AS RestoredDatabase,
    isnull(bms.software_name,'') AS BackupSoftware,
    isnull(bms.is_compressed,0) AS IsCompressed,
	isnull(bs.[has_backup_checksums],0) as [has_backup_checksums]


FROM 
    msdb.dbo.backupset AS bs
JOIN 
    msdb.dbo.backupmediafamily AS bm ON bs.media_set_id = bm.media_set_id
LEFT JOIN 
    msdb.dbo.restorehistory AS rh ON bs.backup_set_id = rh.backup_set_id
JOIN 
    msdb.dbo.backupmediaset AS bms ON bs.media_set_id = bms.media_set_id

right join cte cte on cte.name = bs.database_name

--where  

group by 
 bs.type
 ,bm.physical_device_name
 --,rh.destination_database_name
 ,bms.software_name
 ,bms.is_compressed
 ,bs.[has_backup_checksums]
 ,cte.name,
cte.database_id
,rh.destination_database_name

GO
/****** Object:  View [dbo].[v_compatibility_level]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_compatibility_level] AS
SELECT 
	db.database_id,
    db.name ,
    db.compatibility_level,
    CASE 
        WHEN db.compatibility_level = 80 THEN 'SQL Server 2000'
        WHEN db.compatibility_level = 90 THEN 'SQL Server 2005'
        WHEN db.compatibility_level = 100 THEN 'SQL Server 2008/2008 R2'
        WHEN db.compatibility_level = 110 THEN 'SQL Server 2012'
        WHEN db.compatibility_level = 120 THEN 'SQL Server 2014'
        WHEN db.compatibility_level = 130 THEN 'SQL Server 2016'
        WHEN db.compatibility_level = 140 THEN 'SQL Server 2017'
        WHEN db.compatibility_level = 150 THEN 'SQL Server 2019'
        WHEN db.compatibility_level = 160 THEN 'SQL Server 2022'
        ELSE 'Unknown Version'
    END AS SQLServerVersion
FROM 
sys.databases db;
GO
/****** Object:  View [dbo].[v_DATABASE_CHANGE_sqlaudit]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_DATABASE_CHANGE_sqlaudit] as 
select event_time AT TIME ZONE 'UTC' AT TIME ZONE 'Israel Standard Time' AS LoginTimeLocal,  * 
from sys.fn_get_audit_file('C:\Users\user\Desktop\PROJECTS\sql_server\project\poor_mans_monitor\SERVER AUDITS\DATABASE_CHANGE\*.sqlaudit', default, default)
GO
/****** Object:  View [dbo].[v_DB_create_date]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_DB_create_date] AS
SELECT  database_id, name, create_date
FROM 
    sys.databases;
GO
/****** Object:  View [dbo].[v_DB_HA_and_DR]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_DB_HA_and_DR] as

select 
db.database_id
,db.name

,CASE 
	WHEN lgshp.primary_id IS NULL  THEN 'No log shipping set'
	ELSE 'Primary database'
END AS [Log_shipping_status]

,CASE 
	WHEN mrr.mirroring_guid IS NULL  THEN 'No mirror set'
	ELSE 'Database mirrored'
END AS [Mirror_status]

,CASE WHEN db.is_published = 1 THEN 'Published' ELSE 'Not Published' END AS Replication_Publication_Status

,CASE WHEN db.is_merge_published = 1 THEN 'Merge Published' ELSE 'Not Merge Published' END AS Replication_Merge_Publication_Status

,CASE WHEN db.is_distributor = 1 THEN 'Distributor' ELSE 'Not a Distributor' END AS Replication_Distributor_Status

,CASE WHEN db.is_subscribed = 1 THEN 'Subscribed' ELSE 'Not subscribed' END AS Replication_Subscribtion_Status

,(SELECT SERVERPROPERTY('IsHadrEnabled') )AS IsAlwaysOnEnabled


from sys.databases as db
left join msdb.dbo.log_shipping_primary_databases as lgshp on convert(nvarchar(200),lgshp.primary_database) = db.name
LEFT JOIN sys.database_mirroring as mrr on mrr.database_id = db.database_id


GO
/****** Object:  View [dbo].[v_DB_is_auto]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_DB_is_auto] as
select 
database_id
,name
,is_auto_close_on
,is_auto_shrink_on
,is_auto_create_stats_on
,is_auto_create_stats_incremental_on
,is_auto_update_stats_on
,is_auto_update_stats_async_on
,is_ansi_null_default_on


from sys.databases
GO
/****** Object:  View [dbo].[v_DB_recovery_model]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_DB_recovery_model] AS

SELECT  
database_id,
name,
recovery_model_desc

FROM 
    sys.databases 
GO
/****** Object:  View [dbo].[v_DB_state_and_status]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[v_DB_state_and_status] AS
SELECT database_id, name, user_access_desc, state_desc
,db.is_in_standby, db.is_encrypted, db.is_read_only
from sys.databases AS db
GO
/****** Object:  View [dbo].[v_Drive_info]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_Drive_info] as
SELECT  DISTINCT 
SUBSTRING(physical_name,1,1) AS DriveLetter
  ,vs.volume_mount_point Drive
, vs.logical_volume_name
, vs.total_bytes/1024/1024/1024 CapacityGB
, vs.available_bytes/1024/1024/1024 FreeGB

FROM 
  sys.master_files mf
    CROSS APPLY 
  sys.dm_os_volume_stats(mf.database_id, mf.file_id) AS vs
GO
/****** Object:  View [dbo].[v_Failed_Jobs_TOP20_LAST_24H]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_Failed_Jobs_TOP20_LAST_24H] as
SELECT distinct TOP (20) 
    j.job_id,
    j.name AS JobName,
   CAST( msdb.dbo.agent_datetime(h.run_date, h.run_time) AS smalldatetime) AS LastRun, -- rounding to nearest minute
	h.message as [Job_Outcome_message]
FROM 
    msdb.dbo.sysjobs j
INNER JOIN 
    msdb.dbo.sysjobhistory h
    ON j.job_id = h.job_id
WHERE 
    h.run_status = 0  -- 0 indicates failure
   AND msdb.dbo.agent_datetime(h.run_date, h.run_time) >= DATEADD(hour, -24, GETDATE())  -- Failed in the last 24 hours
   AND h.message  not like 'The job failed%'
ORDER BY 
    LastRun DESC;
GO
/****** Object:  View [dbo].[v_job_mapping]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_job_mapping] AS

SELECT DISTINCT
jobs.name
,CASE
	WHEN jobs.enabled = 0 THEN 'DISABLED'
	WHEN jobs.enabled = 1 THEN 'ENABLED'
END AS [enabled]
,jobs.description
,cat.name AS [Job_category]
,sp.name AS Job_Owner
,jobs.date_created
,jobs.date_modified
,chedules.name AS [Schedule_Name]
,CASE 
        chedules.freq_type 
        WHEN 1 THEN 'One Time' 
        WHEN 4 THEN 'Daily' 
        WHEN 8 THEN 'Weekly' 
        WHEN 16 THEN 'Monthly' 
        WHEN 32 THEN 'Monthly Relative' 
        WHEN 64 THEN 'SQL Server Agent Start' 
        WHEN 128 THEN 'SQL Server Start' 
        WHEN 256 THEN 'Recurring' 
        ELSE '' 
    END AS FrequencyType
,CASE h.run_status
        WHEN 0 THEN 'Failed'
        WHEN 1 THEN 'Succeeded'
        WHEN 2 THEN 'Retry'
        WHEN 3 THEN 'Canceled'
        ELSE ''
    END AS LastRunStatus

	
,CONCAT(
        SUBSTRING(CONVERT(VARCHAR(8), h.run_date), 1, 4), '-', 
        SUBSTRING(CONVERT(VARCHAR(8), h.run_date), 5, 2), '-', 
        SUBSTRING(CONVERT(VARCHAR(8), h.run_date), 7, 2) ) AS LastRunDate
, RIGHT('0' + CAST(h.run_time / 10000 AS VARCHAR(2)), 2) + ':' +
    RIGHT('0' + CAST((h.run_time / 100) % 100 AS VARCHAR(2)), 2) + ':' +
    RIGHT('0' + CAST(h.run_time % 100 AS VARCHAR(2)), 2) AS LastRunTime

    ,h.run_duration AS RunDurationInSeconds


 ,CASE 
            WHEN jobschedules.next_run_date = 0 THEN cast('n/a' as char(10))
            ELSE convert(char(10), convert(datetime, convert(char(8),jobschedules.next_run_date)),120)  + ' ' + left(stuff((stuff((replicate('0', 6 - len(next_run_time)))+ convert(varchar(6),next_run_time),3,0,':')),6,0,':'),8)
        END AS Next_Run
,jobs.job_id

FROM msdb.dbo.sysjobs jobs
LEFT JOIN msdb.dbo.sysjobschedules jobschedules on jobs.job_id = jobschedules.job_id  
LEFT JOIN msdb.dbo.sysschedules chedules on chedules.schedule_id = jobschedules.schedule_id
LEFT JOIN msdb.dbo.syscategories cat on cat.category_id = jobs.category_id
LEFT JOIN sys.server_principals AS sp ON jobs.owner_sid = sp.sid

LEFT JOIN msdb.dbo.sysjobhistory AS h ON jobs.job_id = h.job_id  and h.instance_id = (SELECT MAX(h2.instance_id) FROM msdb.dbo.sysjobhistory AS h2 WHERE h2.job_id = jobs.job_id)
GO
/****** Object:  View [dbo].[v_log_reuse_wait]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_log_reuse_wait] AS

SELECT  
dat.database_id
, dat.name
, dat.log_reuse_wait
, dat.log_reuse_wait_desc
,(mf.size * 8 / 1024) as file_size_mb

FROM 
    sys.databases as dat
LEFT JOIN SYS.MASTER_FILES as mf on mf.database_id = dat.database_id
WHERE mf.type = 1 
GO
/****** Object:  View [dbo].[v_LOGIN_AUDIT_sqlaudit]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_LOGIN_AUDIT_sqlaudit] as 
select   event_time AT TIME ZONE 'UTC' AT TIME ZONE 'Israel Standard Time' AS LoginTimeLocal, * 
from sys.fn_get_audit_file('C:\Users\user\Desktop\PROJECTS\sql_server\project\poor_mans_monitor\SERVER AUDITS\Login_audit\*.sqlaudit', default, default)
GO
/****** Object:  View [dbo].[v_login_mapping]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_login_mapping] AS
SELECT 
	CASE
		WHEN p.is_disabled = 0 THEN 'ACTIVE'
		ELSE 'DISABLED'
	END AS [Login_state]
     ,p.name AS LoginName
    ,p.type_desc AS LoginType
	,p.create_date
	,p.modify_date
	,LOGINPROPERTY(p.name, 'PasswordLastSetTime') as [LAST_PASSWORD_CHANGE]
	,CASE 
		WHEN r.name IS NULL THEN 'public'
		ELSE  r.name
	END AS RoleName 
	,sp.permission_name
	,sp.state_desc
	,r.sid

FROM 
    sys.server_principals AS p
LEFT JOIN 
    sys.server_role_members AS rm ON p.principal_id = rm.member_principal_id
LEFT JOIN 
    sys.server_principals AS r ON rm.role_principal_id = r.principal_id
LEFT JOIN 
	sys.server_permissions AS sp ON sp.grantee_principal_id = p.principal_id

WHERE 
    p.type IN ('S', 'U', 'G') -- 'S' for SQL user, 'U' for Windows user, 'G' for Windows group



GO
/****** Object:  Table [dbo].[DB_recovery_model_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DB_recovery_model_metric](
	[date] [datetime] NULL,
	[name] [nvarchar](200) NULL,
	[database_id] [int] NULL,
	[recovery_model] [int] NULL,
	[recovery_model_desc] [nvarchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DB_size_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DB_size_metric](
	[date] [datetime] NULL,
	[name] [nvarchar](200) NULL,
	[database_id] [int] NULL,
	[Data_files_in_MB] [int] NULL,
	[Log_file_in_MB] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DB_state_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DB_state_metric](
	[date] [datetime] NULL,
	[name] [nvarchar](200) NULL,
	[database_id] [int] NULL,
	[state] [int] NULL,
	[state_desc] [nvarchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DB_user_access_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DB_user_access_metric](
	[date] [datetime] NULL,
	[database_id] [int] NULL,
	[name] [nvarchar](200) NULL,
	[user_accessl] [int] NULL,
	[user_access_desc] [nvarchar](40) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[drives_info_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[drives_info_metric](
	[date] [datetime] NULL,
	[DriveLetter] [char](1) NULL,
	[Drive] [nvarchar](5) NULL,
	[logical_volume_name] [nvarchar](50) NULL,
	[TotalCapacityGB] [int] NULL,
	[FreeGB] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Failed_jobs]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Failed_jobs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NULL,
	[job_id] [uniqueidentifier] NULL,
	[JobName] [nvarchar](200) NULL,
	[LastRun] [smalldatetime] NULL,
	[Job_Outcome_message] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SNOOPER_Event_Log]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SNOOPER_Event_Log](
	[date] [datetime] NULL,
	[Event_Log] [nvarchar](2000) NULL,
	[Event_Log_desc] [nvarchar](2000) NULL,
	[Event_Log_date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wait_stats_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wait_stats_metric](
	[date] [datetime] NULL,
	[wait_type] [nvarchar](400) NULL,
	[total_time_SQL_Server_waited_ms] [int] NULL,
	[total_waiting_tasks_count] [int] NULL,
	[avg_wait_time_ms] [int] NULL,
	[wait_on_CPU_after_resource_became_available_time_ms] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [IX_DB_unused_space_database_id_date]    Script Date: 03/12/2024 21:59:34 ******/
CREATE NONCLUSTERED INDEX [IX_DB_unused_space_database_id_date] ON [dbo].[DB_unused_space_metric]
(
	[database_id] ASC
)
INCLUDE([date]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20241029-185018]    Script Date: 03/12/2024 21:59:34 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20241029-185018] ON [dbo].[Last_Restart_Time_metric]
(
	[date] ASC,
	[metric] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ix_date_database_id_transaction_isolation_level]    Script Date: 03/12/2024 21:59:34 ******/
CREATE NONCLUSTERED INDEX [ix_date_database_id_transaction_isolation_level] ON [dbo].[live_queries_currently_running_metric]
(
	[date] ASC,
	[database_id] ASC,
	[transaction_isolation_level] ASC
)
INCLUDE([database_name],[host_name],[login_name],[program_name],[sql_handle],[plan_handle],[max_worker_time_ms],[max_logical_reads],[max_physical_reads],[max_logical_writes],[max_elapsed_time_ms],[max_rows],[max_dop]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_sql_handle_plan_handle]    Script Date: 03/12/2024 21:59:34 ******/
CREATE NONCLUSTERED INDEX [IX_sql_handle_plan_handle] ON [dbo].[live_queries_currently_running_metric]
(
	[database_id] ASC,
	[sql_handle] ASC,
	[plan_handle] ASC
)
INCLUDE([database_name],[transaction_isolation_level],[host_name],[login_name],[program_name],[max_worker_time_ms],[max_logical_reads],[max_physical_reads],[max_logical_writes],[max_elapsed_time_ms],[max_rows],[max_dop]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TOP_CPU_queries_date_sql_handleplan_handleexecution_countquery_text]    Script Date: 03/12/2024 21:59:34 ******/
CREATE NONCLUSTERED INDEX [IX_TOP_CPU_queries_date_sql_handleplan_handleexecution_countquery_text] ON [dbo].[TOP_CPU_consuming_queries_metric]
(
	[date] ASC
)
INCLUDE([sql_handle],[plan_handle],[execution_count],[query_text]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_sql_handle_plan_handle]    Script Date: 03/12/2024 21:59:34 ******/
CREATE NONCLUSTERED INDEX [IX_sql_handle_plan_handle] ON [dbo].[TOP_IO_intensive_queries_metric]
(
	[date] ASC,
	[sql_handle] ASC,
	[plan_handle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20241129-162438]    Script Date: 03/12/2024 21:59:34 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20241129-162438] ON [dbo].[TOP_IO_intensive_queries_metric]
(
	[date] ASC
)
INCLUDE([sql_handle],[plan_handle],[execution_count],[query_text]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Batch_Requests_sec_metric] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[Buffer_cache_hit_ratio_metric] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[Checkpoint_pages_sec_metric] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[cpu_info_metric] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[cpu_usage_metric] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[Current_User_Connections_metric] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[DB_buffer_mb_used_metric] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[DB_Last_Successful_DBCC_CHECKDB_metric] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[DB_Reads_Writes_sec_KBRead_KBWritten_metric] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[DB_recovery_model_metric] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[DB_size_metric] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[DB_state_metric] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[DB_unused_space_metric] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[DB_user_access_metric] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[Disk_Read_Bytes_sec_metric] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[Disk_Reads_sec_metric] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[Disk_Write_Bytes_sec_metric] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[Disk_Writes_sec_metric] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[drives_info_metric] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[Failed_jobs] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[Free_list_memory_stalls_sec_metric] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[Last_Restart_Time_metric] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[live_queries_currently_running_metric] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[OS_RAM_free_metric] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[OS_RAM_total_metric] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[Page_life_expectancy_metric] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[pagefile_usage_metric] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[Physical_Disk_usage_metric] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[server_info_metric] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[SNOOPER_Event_Log] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[SQL_RAM_info_metric] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[TOP_CPU_consuming_queries_metric] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[TOP_IO_intensive_queries_metric] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[wait_stats_metric] ADD  DEFAULT (getdate()) FOR [date]
GO
/****** Object:  StoredProcedure [dbo].[sp_Get_JOB_NAME_by_JOB_ID]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ivgeni Dvorkin
-- Create date: 29/11/2024
-- Description:	get job name from job id
-- =============================================
CREATE PROCEDURE [dbo].[sp_Get_JOB_NAME_by_JOB_ID]
	
	@Param1 uniqueidentifier = null

AS
BEGIN


	SET NOCOUNT ON;

 SELECT 

    j.name AS JobName,
    --h.run_date AS RunDate,
    --h.run_time AS RunTime,
  max( CAST( msdb.dbo.agent_datetime(h.run_date, h.run_time) AS smalldatetime) ) AS LastRunDateTime -- rounding to nearest minute

FROM 
    msdb.dbo.sysjobs j
INNER JOIN 
    msdb.dbo.sysjobhistory h
    ON j.job_id = h.job_id
where j.job_id = @Param1
group by 
    j.name

ORDER BY 
    LastRunDateTime DESC;


END
GO
/****** Object:  StoredProcedure [dbo].[sp_log_Batch_Requests_sec_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Ivgeni
-- Create date: 19/10/2024
-- Description:	log Batch Requests sec
-- =============================================
CREATE PROCEDURE [dbo].[sp_log_Batch_Requests_sec_metric]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	

DECLARE @Batch_Requests INT = (SELECT TOP 1
										cntr_value
									FROM 
										sys.dm_os_performance_counters
									WHERE 
										counter_name = 'Batch Requests/sec');



INSERT INTO [SNOOPER].[dbo].[Batch_Requests_sec_metric]([metric])
SELECT @Batch_Requests
	








END
GO
/****** Object:  StoredProcedure [dbo].[sp_log_Buffer_cache_hit_ratio_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Ivgeni
-- Create date: 19/10/2024
-- Description:	log Buffer cache hit ratio
--measures the percentage of time SQL Server finds the data it needs in the memory (buffer cache) rather than having to fetch it from disk.
--A higher ratio indicates efficient memory use, as accessing data in memory is much faster than retrieving it from disk.
-- Buffer Cache Hit Ratio = (Data Pages Found in Cache) / (Total Data Page Requests)
--
-- =============================================
CREATE PROCEDURE [dbo].[sp_log_Buffer_cache_hit_ratio_metric]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	

DECLARE @Buffer_cache_hit_ratio INT = (SELECT top 1
    100 * (cntr_value / 
             (SELECT cntr_value 
              FROM sys.dm_os_performance_counters 
              WHERE counter_name = 'Buffer cache hit ratio')) AS Buffer_Cache_Hit_Ratio_Percentage
FROM sys.dm_os_performance_counters
WHERE counter_name = 'Buffer cache hit ratio'
);



INSERT INTO [SNOOPER].[dbo].[Buffer_cache_hit_ratio_metric]([metric])
SELECT @Buffer_cache_hit_ratio
	








END
GO
/****** Object:  StoredProcedure [dbo].[sp_log_Checkpoint_pages_sec_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Ivgeni
-- Create date: 19/10/2024
-- Description:	log Checkpoint pages/sec
-- =============================================
CREATE PROCEDURE [dbo].[sp_log_Checkpoint_pages_sec_metric]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	

DECLARE @Checkpoint_pages_sec INT = (SELECT TOP 1
										cntr_value
									FROM 
										sys.dm_os_performance_counters
									WHERE 
										counter_name = 'Checkpoint pages/sec'
										and object_name like '%Buffer Manager%'    );



INSERT INTO [SNOOPER].[dbo].[Checkpoint_pages_sec_metric]([metric])
SELECT @Checkpoint_pages_sec
	








END
GO
/****** Object:  StoredProcedure [dbo].[sp_log_cpu_info_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ivgeni
-- Create date: 05/10/2024
-- Description:	get cpu info - name, num of cores and num [num_logical_processors]
-- =============================================
CREATE PROCEDURE [dbo].[sp_log_cpu_info_metric]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   

DECLARE @name NVARCHAR(200);
DECLARE @cmd_output1 TABLE (
    output NVARCHAR(4000)
);

INSERT INTO @cmd_output1(output)
EXEC xp_cmdshell 'wmic cpu get name';


WITH RankedData1 AS (
   SELECT *, ROW_NUMBER() OVER (ORDER BY output) AS rn
	FROM @cmd_output1
)
SELECT TOP 1 @name = output 
FROM RankedData1
WHERE rn = 3;

DECLARE @num_cores NVARCHAR(200);
DECLARE @cmd_output2 TABLE (
    output NVARCHAR(4000)
);

INSERT INTO @cmd_output2(output)
EXEC xp_cmdshell 'wmic cpu get numberofcores';


WITH RankedData2 AS (
   SELECT *, ROW_NUMBER() OVER (ORDER BY output) AS rn
	FROM @cmd_output2
)
SELECT TOP 1 @num_cores = output
FROM RankedData2
WHERE rn = 3;

DECLARE @numb_logical_processors NVARCHAR(200);
DECLARE @cmd_output3 TABLE (
    output NVARCHAR(4000)
);

INSERT INTO @cmd_output3(output)
EXEC xp_cmdshell 'wmic cpu get numberoflogicalprocessors';


WITH RankedData3 AS (
   SELECT *, ROW_NUMBER() OVER (ORDER BY output) AS rn
	FROM @cmd_output3
)
SELECT TOP 1 @numb_logical_processors = output
FROM RankedData3
WHERE rn = 3;



DECLARE @processors_online int = (SELECT count(is_online) AS  processors_online
FROM 
    sys.dm_os_schedulers
WHERE 
    status = 'VISIBLE ONLINE'
);


DECLARE @max_worker_threads_setting INT;

DECLARE @output1 TABLE (
    [output1] NVARCHAR(4000)
	,[output2] NVARCHAR(4000)
	,[output3] NVARCHAR(4000)
	,[output4] NVARCHAR(4000)
	,[output5] NVARCHAR(4000)
);

INSERT INTO @output1
EXEC sp_configure 'max worker threads'

SELECT @max_worker_threads_setting = [output4] 
FROM @output1


INSERT INTO [SNOOPER].[dbo].[cpu_info_metric]([name]
      ,[socket_count]
      ,[cores_per_socket]
      ,[num_cores]
      ,[num_logical_processors]
      ,[processors_online]
      ,[processors_in_use_by_sql]
      ,[Schedulers_Available]
      ,[max_workers_count]
      ,[max_worker_threads_setting])
SELECT 
	@name
	,socket_count
	,cores_per_socket
	,@num_cores 
	,@numb_logical_processors
	,@processors_online
	,[cpu_count]
	,[scheduler_count]
	,[max_workers_count]
	,@max_worker_threads_setting
FROM 
    sys.dm_os_sys_info;


END

GO
/****** Object:  StoredProcedure [dbo].[sp_log_cpu_usage_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Ivgeni
-- Create date: 12/10/2024
-- Description:	get cpu uasge in %
-- =============================================
CREATE PROCEDURE [dbo].[sp_log_cpu_usage_metric]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   
DECLARE @cpu_load NVARCHAR(4);
DECLARE @cmd_output2 TABLE (
    [output] NVARCHAR(4000)
);


INSERT INTO @cmd_output2([output])
EXEC xp_cmdshell 'wmic cpu get loadpercentage';


WITH RankedData AS (
   SELECT *, ROW_NUMBER() OVER (ORDER BY [output]) AS rn
	FROM @cmd_output2
)
SELECT TOP 1 @cpu_load = [output]
FROM RankedData
WHERE rn = 3;



INSERT INTO [dbo].[cpu_usage_metric]([metric])
VALUES(@cpu_load)



END
GO
/****** Object:  StoredProcedure [dbo].[sp_log_Current_User_Connections_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Ivgeni
-- Create date: 19/10/2024
-- Description:	log Current User Connections
-- =============================================
CREATE PROCEDURE [dbo].[sp_log_Current_User_Connections_metric]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	

DECLARE @User_Connections INT = (SELECT TOP 1
										cntr_value
									FROM 
										sys.dm_os_performance_counters
									WHERE 
										counter_name = 'User Connections');



INSERT INTO [SNOOPER].[dbo].[Current_User_Connections_metric]([metric])
SELECT @User_Connections
	








END
GO
/****** Object:  StoredProcedure [dbo].[sp_log_DB_buffer_mb_used_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		Ivgeni
-- Create date: 19/10/2024
-- Description:	log DB buffer memory mb used 
-- =============================================
CREATE PROCEDURE [dbo].[sp_log_DB_buffer_mb_used_metric]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;



INSERT INTO [SNOOPER].[dbo].[DB_buffer_mb_used_metric]([database_id]
      ,[name]
      ,[buffer_mb_used])
SELECT  databases.database_id,
		databases.name AS database_name,
		COUNT(*) * 8 / 1024 AS buffer_mb_used
FROM sys.dm_os_buffer_descriptors
INNER JOIN sys.databases ON databases.database_id = dm_os_buffer_descriptors.database_id
GROUP BY databases.name,databases.database_id
ORDER BY COUNT(*) DESC;
 






END

GO
/****** Object:  StoredProcedure [dbo].[sp_log_DB_Last_Successful_DBCC_CHECKDB_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







-- =============================================
-- Author:		Ivgeni
-- Create date: 19/10/2024
-- Description:	log Last_Successful_DBCC_CHECKDB for each db
-- =============================================
CREATE PROCEDURE [dbo].[sp_log_DB_Last_Successful_DBCC_CHECKDB_metric]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;



DECLARE @DB_ID NVARCHAR(MAX);
DECLARE @SQL NVARCHAR(1000); 
DECLARE @DB_NAME NVARCHAR(1000); 

DECLARE CURSOR_TABLE CURSOR
	FOR 
		(SELECT 
			[database_id]
		FROM
  			SYS. DATABASES 
			where state = 0); 

OPEN CURSOR_TABLE


FETCH NEXT FROM CURSOR_TABLE INTO 
	@DB_ID;

WHILE @@FETCH_STATUS = 0
    BEGIN
		SET @DB_NAME = (SELECT TOP 1
							[name]
						FROM
  							SYS. DATABASES 
						WHERE database_id = @DB_ID);
		SET @SQL = '
		USE ['+@DB_NAME+']
		
		INSERT INTO [SNOOPER].[dbo].[DB_Last_Successful_DBCC_CHECKDB_metric]([database_id]
      ,[name]
      ,[Last_Successful_DBCC_CHECKDB])

		SELECT '+@DB_ID+','''+@DB_NAME+''',  CONVERT(DATETIME,DATABASEPROPERTYEX('''+@DB_NAME+''', ''LastGoodCheckDbTime''))

		';
	
		EXECUTE  SP_EXECUTESQL @SQL;
	
        FETCH NEXT FROM CURSOR_TABLE INTO 
			@DB_ID;
    END;

CLOSE CURSOR_TABLE;
DEALLOCATE CURSOR_TABLE;






END

GO
/****** Object:  StoredProcedure [dbo].[sp_log_DB_Reads_Writes_sec_KBRead_KBWritten_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		Ivgeni
-- Create date: 19/10/2024
-- Description:	log DB Reads, Writes/sec and KBRead, KBWritten from the last restart of SQL SERVER
-- =============================================
CREATE PROCEDURE [dbo].[sp_log_DB_Reads_Writes_sec_KBRead_KBWritten_metric]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;



INSERT INTO [SNOOPER].[dbo].[DB_Reads_Writes_sec_KBRead_KBWritten_metric]([database_id]
      ,[name]
      ,[File_Name]
      ,[ReadsPerSec]
      ,[WritesPerSec]
      ,[KBRead]
      ,[KBWritten])
SELECT 
	mf.database_id,
    DB_NAME(vfs.database_id) AS DatabaseName,
    mf.physical_name AS FileName,
    vfs.num_of_reads AS ReadsPerSec,
    vfs.num_of_writes AS WritesPerSec,
    vfs.num_of_bytes_read / 1024 AS KBRead,   -- KBs read
    vfs.num_of_bytes_written / 1024 AS KBWritten  -- KBs written
FROM 
    sys.dm_io_virtual_file_stats(NULL, NULL) AS vfs
JOIN 
    sys.master_files AS mf ON vfs.database_id = mf.database_id 
                            AND vfs.file_id = mf.file_id;






END

GO
/****** Object:  StoredProcedure [dbo].[sp_log_DB_recovery_model_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Ivgeni
-- Create date: 19/10/2024
-- Description:	get DB recovery model
-- =============================================
CREATE PROCEDURE [dbo].[sp_log_DB_recovery_model_metric]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;



INSERT INTO [SNOOPER].[dbo].[DB_recovery_model_metric]([name]
      ,[database_id]
      ,[recovery_model]
      ,[recovery_model_desc])
select 
	[name]
	,[database_id]
	,[recovery_model]
	,[recovery_model_desc]	
from sys.databases



END

GO
/****** Object:  StoredProcedure [dbo].[sp_log_DB_size_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Ivgeni
-- Create date: 19/10/2024
-- Description:	log db file size
-- =============================================
CREATE PROCEDURE [dbo].[sp_log_DB_size_metric]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


DROP TABLE IF EXISTS tempdb..#temp1
SELECT DATABASE_ID, TYPE, (SIZE * 8.0 / 1024.0) AS [dbFileSize]--FORMAT(ROUND((SIZE * 8.0 / 1024.0), 2,0),'N2') AS [dbFileSize]
INTO #temp1
FROM SYS.MASTER_FILES

INSERT INTO [SNOOPER].[dbo].[DB_size_metric]([name]
      ,[database_id]
      ,[Data_files_in_MB]
      ,[Log_file_in_MB])
SELECT 
    name
	,database_id
    ,(SELECT SUM(dbFileSize) FROM #temp1 WHERE type = 0 and #temp1.database_id = db.database_id) AS [Data in MB]
    ,(select SUM(dbFileSize) FROM #temp1 WHERE type = 1 and #temp1.database_id = db.database_id) AS [Log in MB]
from sys.databases AS db




END

GO
/****** Object:  StoredProcedure [dbo].[sp_log_DB_state_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Ivgeni
-- Create date: 19/10/2024
-- Description:	get DB state
-- =============================================
CREATE PROCEDURE [dbo].[sp_log_DB_state_metric]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;



INSERT INTO [SNOOPER].[dbo].[DB_state_metric]([name]
      ,[database_id]
      ,[state]
      ,[state_desc])
select 
	[name]
	,[database_id]
	,[state]
	,[state_desc]	
from sys.databases



END

GO
/****** Object:  StoredProcedure [dbo].[sp_log_DB_unused_space_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		Ivgeni
-- Create date: 19/10/2024
-- Description:	log DB_unused_space
-- =============================================
CREATE PROCEDURE [dbo].[sp_log_DB_unused_space_metric]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;





DECLARE @DB_ID NVARCHAR(MAX);
DECLARE @SQL NVARCHAR(1000); 
DECLARE @DB_NAME NVARCHAR(1000); 

DECLARE CURSOR_TABLE CURSOR
	FOR 
		(SELECT 
			[database_id]
		FROM
  			SYS. DATABASES 
			where state = 0); 

OPEN CURSOR_TABLE


FETCH NEXT FROM CURSOR_TABLE INTO 
	@DB_ID;

WHILE @@FETCH_STATUS = 0
    BEGIN
		SET @DB_NAME = (SELECT TOP 1
							[name]
						FROM
  							SYS. DATABASES 
						WHERE database_id = @DB_ID);
		SET @SQL = '
		USE ['+@DB_NAME+']
		
		INSERT INTO [SNOOPER].[dbo].[DB_unused_space_metric]([database_id]
      ,[name]
      ,[File_Name]
      ,[FreeSpaceMB])
		SELECT '+@DB_ID+','''+@DB_NAME+''', 
		[name], 
		size/128.0 - CAST(FILEPROPERTY(name, ''SpaceUsed'') AS INT)/128.0 AS FreeSpaceMB 
		FROM sys.database_files; 

		';
	
		EXECUTE  SP_EXECUTESQL @SQL;
	
        FETCH NEXT FROM CURSOR_TABLE INTO 
			@DB_ID;
    END;

CLOSE CURSOR_TABLE;
DEALLOCATE CURSOR_TABLE;






END

GO
/****** Object:  StoredProcedure [dbo].[sp_log_DB_user_access_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		Ivgeni
-- Create date: 19/10/2024
-- Description:	get DB user_access
-- =============================================
CREATE PROCEDURE [dbo].[sp_log_DB_user_access_metric]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;



INSERT INTO [SNOOPER].[dbo].[DB_user_access_metric]([database_id]
      ,[name]
      ,[user_accessl]
      ,[user_access_desc])
SELECT 
	database_id,
	name,
	user_access,
	user_access_desc
FROM sys.databases


END

GO
/****** Object:  StoredProcedure [dbo].[sp_log_Disk_Read_Bytes_sec_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Ivgeni
-- Create date: 18/10/2024
-- Description:	get PhysicalDisk(_Total)\Disk Read Bytes/sec
-- =============================================
CREATE PROCEDURE [dbo].[sp_log_Disk_Read_Bytes_sec_metric]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
SET NOCOUNT ON;


DECLARE @InputString NVARCHAR(MAX);  
DECLARE @cmd_output2 TABLE (
    [output] NVARCHAR(4000)
);

INSERT INTO @cmd_output2([output])
EXEC xp_cmdshell 'typeperf "\PhysicalDisk(_Total)\Disk Read Bytes/sec" -sc 1';


WITH RankedData AS (
   SELECT *, ROW_NUMBER() OVER (ORDER BY [output]) AS rn
	FROM @cmd_output2
)
SELECT TOP 1 @InputString = [output]
FROM RankedData
where [output] is not null
and [output] not like '%PhysicalDisk%'
and [output] not like '%Exiting, please wait...                         %'
and [output] not like '%The command completed successfully.%'

DECLARE @MiddleValue NVARCHAR(MAX) = SUBSTRING(@InputString, (CHARINDEX(',', @InputString)) + 2, LEN(@InputString) - (CHARINDEX(',', @InputString)) - 2);
	

INSERT INTO [SNOOPER].[dbo].[Disk_Read_Bytes_sec_metric]([metric])
SELECT @MiddleValue




END
GO
/****** Object:  StoredProcedure [dbo].[sp_log_Disk_Reads_sec_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Ivgeni
-- Create date: 18/10/2024
-- Description:	get PhysicalDisk(_Total)\Disk Reads/sec
-- =============================================
CREATE PROCEDURE [dbo].[sp_log_Disk_Reads_sec_metric]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
SET NOCOUNT ON;


DECLARE @InputString NVARCHAR(MAX);  
DECLARE @cmd_output2 TABLE (
    [output] NVARCHAR(4000)
);

INSERT INTO @cmd_output2([output])
EXEC xp_cmdshell 'typeperf "\PhysicalDisk(_Total)\Disk Reads/sec" -sc 1';


WITH RankedData AS (
   SELECT *, ROW_NUMBER() OVER (ORDER BY [output]) AS rn
	FROM @cmd_output2
)
SELECT TOP 1 @InputString = [output]
FROM RankedData
where [output] is not null
and [output] not like '%PhysicalDisk%'
and [output] not like '%Exiting, please wait...                         %'
and [output] not like '%The command completed successfully.%'

DECLARE @MiddleValue NVARCHAR(MAX) = SUBSTRING(@InputString, (CHARINDEX(',', @InputString)) + 2, LEN(@InputString) - (CHARINDEX(',', @InputString)) - 2);
	

INSERT INTO [SNOOPER].[dbo].[Disk_Reads_sec_metric]([metric])
SELECT @MiddleValue




END
GO
/****** Object:  StoredProcedure [dbo].[sp_log_Disk_Write_Bytes_sec_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Ivgeni
-- Create date: 18/10/2024
-- Description:	get PhysicalDisk(_Total)\Disk Write Bytes/sec
-- =============================================
CREATE PROCEDURE [dbo].[sp_log_Disk_Write_Bytes_sec_metric]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
SET NOCOUNT ON;


DECLARE @InputString NVARCHAR(MAX);  
DECLARE @cmd_output2 TABLE (
    [output] NVARCHAR(4000)
);

INSERT INTO @cmd_output2([output])
EXEC xp_cmdshell 'typeperf "\PhysicalDisk(_Total)\Disk Write Bytes/sec" -sc 1';


WITH RankedData AS (
   SELECT *, ROW_NUMBER() OVER (ORDER BY [output]) AS rn
	FROM @cmd_output2
)
SELECT TOP 1 @InputString = [output]
FROM RankedData
where [output] is not null
and [output] not like '%PhysicalDisk%'
and [output] not like '%Exiting, please wait...                         %'
and [output] not like '%The command completed successfully.%'

DECLARE @MiddleValue NVARCHAR(MAX) = SUBSTRING(@InputString, (CHARINDEX(',', @InputString)) + 2, LEN(@InputString) - (CHARINDEX(',', @InputString)) - 2);
	

INSERT INTO [SNOOPER].[dbo].[Disk_Write_Bytes_sec_metric]([metric])
SELECT @MiddleValue




END
GO
/****** Object:  StoredProcedure [dbo].[sp_log_Disk_Writes_sec_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Ivgeni
-- Create date: 18/10/2024
-- Description:	get PhysicalDisk(_Total)\Disk Writes/sec
-- =============================================
CREATE PROCEDURE [dbo].[sp_log_Disk_Writes_sec_metric]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
SET NOCOUNT ON;


DECLARE @InputString NVARCHAR(MAX);  
DECLARE @cmd_output2 TABLE (
    [output] NVARCHAR(4000)
);

INSERT INTO @cmd_output2([output])
EXEC xp_cmdshell 'typeperf "\PhysicalDisk(_Total)\Disk Writes/sec" -sc 1';


WITH RankedData AS (
   SELECT *, ROW_NUMBER() OVER (ORDER BY [output]) AS rn
	FROM @cmd_output2
)
SELECT TOP 1 @InputString = [output]
FROM RankedData
where [output] is not null
and [output] not like '%PhysicalDisk%'
and [output] not like '%Exiting, please wait...                         %'
and [output] not like '%The command completed successfully.%'

DECLARE @MiddleValue NVARCHAR(MAX) = SUBSTRING(@InputString, (CHARINDEX(',', @InputString)) + 2, LEN(@InputString) - (CHARINDEX(',', @InputString)) - 2);
	

INSERT INTO [SNOOPER].[dbo].[Disk_Writes_sec_metric]([metric])
SELECT @MiddleValue




END
GO
/****** Object:  StoredProcedure [dbo].[sp_log_drive_info_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Ivgeni
-- Create date: 18/10/2024
-- Description:	get drives info  - drive, total space, free space
-- =============================================
CREATE PROCEDURE [dbo].[sp_log_drive_info_metric]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  

INSERT INTO [SNOOPER].[dbo].[drives_info_metric]([DriveLetter]
      ,[Drive]
      ,[logical_volume_name]
      ,[TotalCapacityGB]
      ,[FreeGB])
SELECT  DISTINCT 
SUBSTRING(physical_name,1,1) AS DriveLetter
  ,vs.volume_mount_point Drive
, vs.logical_volume_name
, vs.total_bytes/1024/1024/1024 CapacityGB
, vs.available_bytes/1024/1024/1024 FreeGB

FROM 
  sys.master_files mf
    CROSS APPLY 
  sys.dm_os_volume_stats(mf.database_id, mf.file_id) AS vs
	


END

GO
/****** Object:  StoredProcedure [dbo].[sp_log_Failed_jobs]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Ivgeni
-- Create date: 19/10/2024
-- Description:	log Failed jobs - 
--				change interval here:   AND msdb.dbo.agent_datetime(h.run_date, h.run_time) >= DATEADD(MINUTE, -1, GETDATE())  -- Failed in the last 1 minute
--				and run the job schedule accordingly. 
-- =============================================
CREATE PROCEDURE [dbo].[sp_log_Failed_jobs]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

INSERT INTO [SNOOPER].[dbo].[Failed_jobs]([job_id]
      ,[JobName]
      ,[LastRun]
      ,[Job_Outcome_message])
SELECT 
    j.job_id,
    j.name AS JobName,
    --h.run_date AS RunDate,
    --h.run_time AS RunTime,
   CAST( msdb.dbo.agent_datetime(h.run_date, h.run_time) AS smalldatetime) AS LastRunDateTime, -- rounding to nearest minute
	h.message
FROM 
    msdb.dbo.sysjobs j
INNER JOIN 
    msdb.dbo.sysjobhistory h
    ON j.job_id = h.job_id
WHERE 
    h.run_status = 0  -- 0 indicates failure
   AND msdb.dbo.agent_datetime(h.run_date, h.run_time) >= DATEADD(MINUTE, -1, GETDATE())  -- Failed in the last 1 minute
ORDER BY 
    LastRunDateTime DESC;




END

GO
/****** Object:  StoredProcedure [dbo].[sp_log_Free_list_memory_stalls_sec_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Ivgeni
-- Create date: 19/10/2024
-- Description:	log Free list stalls/sec - How often SQL Server cannot allocate memory pages from the free list, indicating memory pressure.
-- =============================================
CREATE PROCEDURE [dbo].[sp_log_Free_list_memory_stalls_sec_metric]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	

DECLARE @Free_list_memory_stalls_sec INT = (SELECT TOP 1
										cntr_value
									FROM 
										sys.dm_os_performance_counters
									WHERE 
										counter_name = 'Free list stalls/sec'
										and object_name like '%Buffer Manager%'    );



INSERT INTO [SNOOPER].[dbo].[Free_list_memory_stalls_sec_metric]([metric])
SELECT @Free_list_memory_stalls_sec
	








END
GO
/****** Object:  StoredProcedure [dbo].[sp_log_Last_Restart_Time_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Ivgeni
-- Create date: 19/10/2024
-- Description:	get Last SQL Restart Time
-- =============================================
CREATE PROCEDURE [dbo].[sp_log_Last_Restart_Time_metric]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

DECLARE @Last_Restart_Time DATETIME = (SELECT TOP 1 sqlserver_start_time FROM sys.dm_os_sys_info);

DECLARE @max_id INT = (SELECT TOP 1 MAX(ID) FROM [SNOOPER].[dbo].[Last_Restart_Time_metric]);


IF @max_id IS NULL
BEGIN

INSERT INTO [SNOOPER].[dbo].[Last_Restart_Time_metric]([metric])
SELECT @Last_Restart_Time

END

ELSE
BEGIN

IF @Last_Restart_Time > (SELECT TOP 1 [metric] FROM [SNOOPER].[dbo].[Last_Restart_Time_metric] WHERE ID = @max_id)
BEGIN

INSERT INTO [SNOOPER].[dbo].[Last_Restart_Time_metric]([metric])
SELECT @Last_Restart_Time
	
END

END



END

GO
/****** Object:  StoredProcedure [dbo].[sp_log_live_queries_currently_running_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		Ivgeni
-- Create date: 24/10/2024
-- Description:	log live queries
-- =============================================
CREATE PROCEDURE [dbo].[sp_log_live_queries_currently_running_metric]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

/*
--29/11/24 original
drop table if exists tempdb..#temp1
SELECT st.text,
qp.query_plan,
qs.*
into #temp1
FROM (
SELECT TOP 50  *  
FROM sys.dm_exec_query_stats
--ORDER BY total_worker_time DESC
) AS qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) AS st
CROSS APPLY sys.dm_exec_query_plan(qs.plan_handle) AS qp

*/



--29/11/24 change start

drop table if exists tempdb..#temp1
SELECT st.text,
qp.query_plan,
	qs.sql_handle,
	qs.plan_handle,
	qs.creation_time,
	qs.last_execution_time,
	qs.execution_count,
	qs.total_worker_time,
	qs.last_worker_time,
	qs.max_worker_time,
	qs.total_logical_reads,
	qs.max_logical_reads,
	qs.last_logical_reads,
	qs.last_physical_reads,
	qs.total_physical_reads,
	qs.max_physical_reads,
	qs.total_logical_writes,
	qs.last_logical_writes,
	qs.max_logical_writes,
	qs.last_elapsed_time,
	qs.max_elapsed_time,
	qs.total_rows,
	qs.max_rows,
	qs.last_rows,
	qs.last_dop,
	qs.max_dop
into #temp1
FROM (
SELECT TOP 10  *  
FROM sys.dm_exec_query_stats
--ORDER BY total_worker_time DESC
) AS qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) AS st
CROSS APPLY sys.dm_exec_query_plan(qs.plan_handle) AS qp

-- 29/11/24 start
CREATE CLUSTERED INDEX IX_temp1_sqlHandle
ON #temp1([sql_handle]);
-- 29/11/24 end

INSERT INTO [SNOOPER].[dbo].[live_queries_currently_running_metric]([session_id]
      ,[start_time]
      ,[status]
      ,[command]
      ,[database_id]
      ,[database_name]
      ,[user_id]
      ,[blocking_session_id]
      ,[wait_type]
      ,[wait_time_ms]
      ,[last_wait_type]
      ,[cpu_time_ms]
      ,[total_elapsed_time_ms]
      ,[logical_reads]
      ,[reads]
      ,[writes]
      ,[transaction_isolation_level]
      ,[dop]
      ,[login_time]
      ,[host_name]
      ,[login_name]
      ,[program_name]
      ,[host_process_id]
      ,[last_request_start_time]
      ,[last_request_end_time]
      ,[currently_running_portion_of_the_batch]
      ,[full_query_text]
      ,[query_plan]
      ,[sql_handle]
      ,[plan_handle]
      ,[creation_time]
      ,[last_execution_time]
      ,[execution_count]
      ,[total_worker_time_ms]
      ,[last_worker_time_ms]
      ,[max_worker_time_ms]
      ,[total_logical_reads]
      ,[max_logical_reads]
      ,[last_logical_reads]
      ,[last_physical_reads]
      ,[total_physical_reads]
      ,[max_physical_reads]
      ,[total_logical_writes]
      ,[last_logical_writes]
      ,[max_logical_writes]
      ,[last_elapsed_time_ms]
      ,[max_elapsed_time_ms]
      ,[total_rows]
      ,[max_rows]
      ,[last_rows]
      ,[last_dop]
      ,[max_dop])
(SELECT 
    r.session_id,  
	r.start_time,
    r.status,
	r.command,
	r.database_id,
	DB_NAME(r.database_id) AS database_name,
	r.user_id,
	r.blocking_session_id,
	r.wait_type,
    r.wait_time,
	r.last_wait_type,
    r.cpu_time as cpu_time_ms,
    r.total_elapsed_time as total_elapsed_time_ms ,
    r.logical_reads,  
    r.reads,
	r.writes,
	r.transaction_isolation_level,
	r.dop,

    s.login_time,
    s.host_name,
    s.login_name,
    s.program_name,
	s.host_process_id,
	s.last_request_start_time,
	s.last_request_end_time,

    SUBSTRING(st.text, (r.statement_start_offset / 2) + 1,
              ((CASE r.statement_end_offset
                  WHEN -1 THEN DATALENGTH(st.text)
                  ELSE r.statement_end_offset
               END - r.statement_start_offset) / 2) + 1) AS query_text_live,
    st.text AS full_query_text,

	tmp1.query_plan,
	tmp1.sql_handle,
	tmp1.plan_handle,
	tmp1.creation_time,
	tmp1.last_execution_time,
	tmp1.execution_count,
	tmp1.total_worker_time,
	tmp1.last_worker_time,
	tmp1.max_worker_time,
	tmp1.total_logical_reads,
	tmp1.max_logical_reads,
	tmp1.last_logical_reads,
	tmp1.last_physical_reads,
	tmp1.total_physical_reads,
	tmp1.max_physical_reads,
	tmp1.total_logical_writes,
	tmp1.last_logical_writes,
	tmp1.max_logical_writes,
	tmp1.last_elapsed_time / 1000 AS last_elapsed_time_ms,
	tmp1.max_elapsed_time / 1000 AS max_elapsed_time_ms,
	tmp1.total_rows,
	tmp1.max_rows,
	tmp1.last_rows,
	tmp1.last_dop,
	tmp1.max_dop


FROM sys.dm_exec_requests AS r
CROSS APPLY sys.dm_exec_sql_text(r.sql_handle) AS st
JOIN sys.dm_exec_sessions AS s ON r.session_id = s.session_id
inner join #temp1 as tmp1 on tmp1.sql_handle = r.sql_handle


UNION ALL

select  
	sysproc.spid
	,NULL AS start_time
	,sysproc.status
	,sysproc.cmd
	,sysproc.dbid
	,DB_NAME(sysproc.dbid) AS database_name
	,sysproc.uid
	,sysproc.blocked
	,sysproc.waittype
	,sysproc.waittime
	,sysproc.lastwaittype
	,sysproc.cpu
	,NULL as total_elapsed_time_ms
	,NULL as logical_reads
	,NULL as reads
	,NULL as writes
	,NULL as transaction_isolation_level
	,NULL as dop
	,sysproc.login_time
	,sysproc.hostname
	,sysproc.loginame
	,sysproc.[program_name]
	,sysproc.hostprocess
	,NULL as last_request_start_time
	,sysproc.last_batch
	,NULL as query_text
    ,st.text AS full_query_text

	,tmp1.query_plan,
	tmp1.sql_handle,
	tmp1.plan_handle,
	tmp1.creation_time,
	tmp1.last_execution_time,
	tmp1.execution_count,
	tmp1.total_worker_time,
	tmp1.last_worker_time,
	tmp1.max_worker_time,
	tmp1.total_logical_reads,
	tmp1.max_logical_reads,
	tmp1.last_logical_reads,
	tmp1.last_physical_reads,
	tmp1.total_physical_reads,
	tmp1.max_physical_reads,
	tmp1.total_logical_writes,
	tmp1.last_logical_writes,
	tmp1.max_logical_writes,
	tmp1.last_elapsed_time / 1000 AS last_elapsed_time_ms,
	tmp1.max_elapsed_time / 1000 AS max_elapsed_time_ms,
	tmp1.total_rows,
	tmp1.max_rows,
	tmp1.last_rows,
	tmp1.last_dop,
	tmp1.max_dop

from sys.sysprocesses as sysproc
CROSS APPLY sys.dm_exec_sql_text(sysproc.sql_handle) AS st
left join #temp1 as tmp1 on tmp1.sql_handle = sysproc.sql_handle
where spid  > 50)


END

GO
/****** Object:  StoredProcedure [dbo].[sp_log_Page_life_expectancy_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Ivgeni
-- Create date: 19/10/2024
-- Description:	log Page life expectancy in seconds
-- =============================================
CREATE PROCEDURE [dbo].[sp_log_Page_life_expectancy_metric]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	

DECLARE @Page_life_expectancy INT = (SELECT TOP 1
										cntr_value
									FROM 
										sys.dm_os_performance_counters
									WHERE 
										counter_name = 'Page life expectancy'
										and object_name like '%Buffer Manager%'    );



INSERT INTO [SNOOPER].[dbo].[Page_life_expectancy_metric]([metric])
SELECT @Page_life_expectancy
	








END
GO
/****** Object:  StoredProcedure [dbo].[sp_log_pagefile_usage_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ivgeni
-- Create date: 18/10/2024
-- Description:	log page file.sys usage
-- =============================================
CREATE PROCEDURE [dbo].[sp_log_pagefile_usage_metric]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  

  

DECLARE @SQL NVARCHAR(1000); 


SET @SQL = '
USE [SNOOPER]

DECLARE @cmd_output TABLE (
    output NVARCHAR(4000)
);

INSERT INTO @cmd_output(output)
EXEC xp_cmdshell ''wmic pagefile list /format:list'';


DECLARE @description NVARCHAR(100) = (SELECT TOP 1 [output] FROM @cmd_output WHERE [output] LIKE ''Description=%'' );
DECLARE @CurrentUsage_MB NVARCHAR(100) = (SELECT TOP 1 [output] FROM @cmd_output WHERE [output] LIKE ''CurrentUsage=%'' );
DECLARE @pagefile_usage NVARCHAR(100) = (SELECT TOP 1 [output] FROM @cmd_output WHERE [output] LIKE ''AllocatedBaseSize=%'' );


INSERT INTO [SNOOPER].[dbo].[pagefile_usage_metric]([AllocatedBaseSize_MB],[CurrentUsage_MB],[Name])
SELECT 
( SUBSTRING(@pagefile_usage,CHARINDEX(''='', @pagefile_usage)+1,LEN(@pagefile_usage)  ) )

,(SUBSTRING(@CurrentUsage_MB ,CHARINDEX(''='', @CurrentUsage_MB)+1 ,LEN(@CurrentUsage_MB)))
,(SUBSTRING(@description,CHARINDEX(''='',@description)+1,LEN(@description)))

';

EXECUTE  SP_EXECUTESQL @SQL;




END
GO
/****** Object:  StoredProcedure [dbo].[sp_log_Physical_Disk_usage_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Ivgeni
-- Create date: 18/10/2024
-- Description:	get total Physical Disk uasge in %
-- =============================================
CREATE PROCEDURE [dbo].[sp_log_Physical_Disk_usage_metric]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
SET NOCOUNT ON;


DECLARE @InputString NVARCHAR(MAX);  
DECLARE @cmd_output2 TABLE (
    [output] NVARCHAR(4000)
);

INSERT INTO @cmd_output2([output])
EXEC xp_cmdshell 'typeperf "\PhysicalDisk(*)\% Disk Time" -sc 1';


WITH RankedData AS (
   SELECT *, ROW_NUMBER() OVER (ORDER BY [output]) AS rn
	FROM @cmd_output2
)
SELECT TOP 1 @InputString = [output]
FROM RankedData
where [output] is not null
and [output] not like '%PhysicalDisk%'
and [output] not like '%Exiting, please wait...                         %'
and [output] not like '%The command completed successfully.%'

DECLARE @MiddleValue NVARCHAR(MAX) = SUBSTRING(@InputString, (CHARINDEX(',', @InputString)) + 2, (CHARINDEX(',', @InputString, (CHARINDEX(',', @InputString) + 1))) - (CHARINDEX(',', @InputString)) - 3);
	

INSERT INTO [SNOOPER].[dbo].[Physical_Disk_usage_metric]([metric])
SELECT TOP 1
CASE
	when CONVERT(FLOAT,@MiddleValue) > 100 then '100'
	else CONVERT(FLOAT,@MiddleValue)
END as [Physical_Disk_uasge]




END
GO
/****** Object:  StoredProcedure [dbo].[sp_log_RAM_free_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Ivgeni
-- Create date: 18/10/2024
-- Description:	get free  RAM
-- =============================================
CREATE PROCEDURE [dbo].[sp_log_RAM_free_metric]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   


INSERT INTO [dbo].[OS_RAM_free_metric]([metric])
    SELECT TOP 1
	FORMAT(ROUND((available_physical_memory_kb / 1024.0 / 1024.0), 2,0),'N2') 
FROM 
    sys.dm_os_sys_memory




END
GO
/****** Object:  StoredProcedure [dbo].[sp_log_RAM_info_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Ivgeni
-- Create date: 05/10/2024
-- Description:	get RAM memory setting info 
-- =============================================
CREATE PROCEDURE [dbo].[sp_log_RAM_info_metric]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   

DECLARE @min INT = (SELECT TOP 1
	--	name,
		CONVERT(INT,value)
     FROM sys.configurations 
	 where configuration_id = 1543);

DECLARE @max INT = (SELECT TOP 1
	--	name,
		CONVERT(INT,value)
     FROM sys.configurations 
	 where configuration_id = 1544);




INSERT INTO [SNOOPER].[dbo].[SQL_RAM_info_metric]([MIN_server_memory_MB_setting]
      ,[MAX_server_memory_MB_setting]
      ,[actively_using_RAM_MB]
      ,[Memory_State])
SELECT  TOP 1 
	@min,
	@max,
   
	(SELECT
  (SELECT cntr_value FROM sys.dm_os_performance_counters
    WHERE counter_name = 'Total Server Memory (KB)'
      AND object_name LIKE '%Memory Manager%') / 1024 )AS [actively_using_RAM_MB)],
	   system_memory_state_desc
FROM 
    sys.dm_os_sys_memory;


END

GO
/****** Object:  StoredProcedure [dbo].[sp_log_RAM_total_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Ivgeni
-- Create date: 18/10/2024
-- Description:	get total RAM
-- =============================================
CREATE PROCEDURE [dbo].[sp_log_RAM_total_metric]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   


INSERT INTO [dbo].[OS_RAM_total_metric]([metric])
    SELECT TOP 1
	FORMAT(ROUND((physical_memory_kb / 1048576.00), 2,0),'N2') 
     FROM sys.dm_os_sys_info




END
GO
/****** Object:  StoredProcedure [dbo].[sp_log_server_info_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ivgeni
-- Create date: 04/10/2024
-- Description:	log server names
-- =============================================
CREATE PROCEDURE [dbo].[sp_log_server_info_metric]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	

DECLARE @server_name NVARCHAR(200) = (SELECT @@SERVERNAME);
DECLARE @sql_version NVARCHAR(300) = (SELECT @@VERSION);
DECLARE @host_name NVARCHAR(200) = (SELECT HOST_NAME());


INSERT INTO server_info_metric([SQL_SERVERNAME]
      ,[SQL_VERSION]
      ,[OS_hostname]
      ,[host_platform]
      ,[host_distribution]
      ,[host_release])
SELECT 
	@server_name
	,@sql_version
	,@host_name
	,[host_platform] 
	,[host_distribution]
	,[host_release] 
FROM [master].[sys].[dm_os_host_info]







END
GO
/****** Object:  StoredProcedure [dbo].[sp_log_TOP_CPU_consuming_queries_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









-- =============================================
-- Author:		Ivgeni
-- Create date: 24/10/2024
-- Description:	log TOP_10 CPU_consuming_queries
-- =============================================
CREATE PROCEDURE [dbo].[sp_log_TOP_CPU_consuming_queries_metric]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


INSERT INTO [SNOOPER].[dbo].[TOP_CPU_consuming_queries_metric]([sql_handle],
	[plan_handle] 
	,[creation_time]
      ,[last_execution_time]
      ,[total_worker_time]
      ,[AvgCPUTime]
      ,[execution_count]
      ,[query_text])
select top 10 
[sql_handle],
	[plan_handle] ,
  creation_time
,       last_execution_time 
,       (total_worker_time+0.0)/1000 as total_worker_time
,       (total_worker_time+0.0)/(execution_count*1000) as [AvgCPUTime]
,       execution_count
,       case when sql_handle IS NULL
                then ' '
                else ( substring(st.text,(qs.statement_start_offset+2)/2,       (case when qs.statement_end_offset = -1         then len(convert(nvarchar(MAX),st.text))*2      else qs.statement_end_offset    end - qs.statement_start_offset) /2  ) )
        end as query_text 

from sys.dm_exec_query_stats  qs
cross apply sys.dm_exec_sql_text(sql_handle) st
where total_worker_time  > 0 
order by [AvgCPUTime] desc

               
    




END

GO
/****** Object:  StoredProcedure [dbo].[sp_log_TOP_IO_intensive_queries_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









-- =============================================
-- Author:		Ivgeni
-- Create date: 24/10/2024
-- Description:	log TOP_10 IO_intensive_queries
-- =============================================
CREATE PROCEDURE [dbo].[sp_log_TOP_IO_intensive_queries_metric]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


INSERT INTO [SNOOPER].[dbo].[TOP_IO_intensive_queries_metric]([sql_handle],
	[plan_handle] ,[creation_time]
      ,[last_execution_time]
      ,[LogicalReads]
      ,[LogicalWrites]
      ,[execution_count]
      ,[TotalIO]
      ,[AvgIO]
      ,[query_text])
select top 10 [sql_handle],
	[plan_handle] ,
      creation_time
,       last_execution_time
,       total_logical_reads as [LogicalReads]
,       total_logical_writes as [LogicalWrites]
,       execution_count
,       total_logical_reads+total_logical_writes as [TotalIO]
,       (total_logical_reads+total_logical_writes+0.0)/execution_count as [AvgIO]
,       case when sql_handle IS NULL
                then ' '
                else ( substring(st.text,(qs.statement_start_offset+2)/2,(case when qs.statement_end_offset = -1        then len(convert(nvarchar(MAX),st.text))*2      else qs.statement_end_offset    end - qs.statement_start_offset) /2  ))
        end as query_text 

from sys.dm_exec_query_stats  qs
cross apply sys.dm_exec_sql_text(sql_handle) st
where (total_logical_reads+total_logical_writes ) > 0
order by [AvgIO] desc


               
    




END

GO
/****** Object:  StoredProcedure [dbo].[sp_log_wait_stats_metric]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		Ivgeni
-- Create date: 24/10/2024
-- Description:	log TOP 10 os_wait_stats
-- =============================================
CREATE PROCEDURE [dbo].[sp_log_wait_stats_metric]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


INSERT INTO [SNOOPER].[dbo].[wait_stats_metric]([wait_type]
      ,[total_time_SQL_Server_waited_ms]
      ,[total_waiting_tasks_count]
      ,[avg_wait_time_ms]
      ,[wait_on_CPU_after_resource_became_available_time_ms])
SELECT TOP 10
    wait_type, 
    wait_time_ms, -- Total amount of time, in milliseconds, that SQL Server has waited for this particular wait type.
    waiting_tasks_count, -- The total number of waiting tasks for this wait type.
	wait_time_ms / waiting_tasks_count AS avg_wait_time_ms, --Average wait time per task (calculated as total wait time divided by the number of tasks).
    signal_wait_time_ms  -- The portion of the wait time spent waiting on the CPU after the resource became available.
FROM sys.dm_os_wait_stats
WHERE waiting_tasks_count > 0
and wait_time_ms > 0
ORDER BY wait_time_ms DESC, waiting_tasks_count DESC ;



END

GO
/****** Object:  StoredProcedure [dbo].[sp_runner_jobs]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		Ivgeni
-- Create date: 19/10/2024
-- Description:	run jobs based on table [jobs_to_run]
-- =============================================
CREATE PROCEDURE [dbo].[sp_runner_jobs]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	
--DROP TABLE IF EXISTS tempdb..#temp1
--SELECT 
--    j.name AS JobName,
--    ja.run_requested_date,
--    ja.start_execution_date,
--    ja.stop_execution_date
--INTO #temp1
--FROM 
--    msdb.dbo.sysjobactivity ja
--INNER JOIN 
--    msdb.dbo.sysjobs j ON ja.job_id = j.job_id
--WHERE 
--    ja.stop_execution_date IS NULL -- Job is currently running
--	and ja.run_requested_date is not null

DECLARE @job_name NVARCHAR(MAX);
DECLARE @SQL NVARCHAR(1000); 

DECLARE CURSOR_TABLE CURSOR
	FOR 
		(SELECT [JobName]
			FROM [SNOOPER].[dbo].[jobs_to_run]
		--	WHERE [JobName] not in (select JobName from #temp1)
			); 

OPEN CURSOR_TABLE


FETCH NEXT FROM CURSOR_TABLE INTO 
	@job_name;

WHILE @@FETCH_STATUS = 0
    BEGIN
	
		


		SET @SQL = '
		BEGIN TRY
		EXEC msdb.dbo.sp_start_job @job_name = '''+@job_name+'''
		END TRY
		BEGIN CATCH
			-- oops
		END CATCH
		;
		';
	
		EXECUTE  SP_EXECUTESQL @SQL;

		
		
	
        FETCH NEXT FROM CURSOR_TABLE INTO 
			@job_name;
    END;

CLOSE CURSOR_TABLE;
DEALLOCATE CURSOR_TABLE;




END

GO
/****** Object:  StoredProcedure [dbo].[sp_runner_sp_log]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ivgeni Dvorkin
-- Create date: 24/10/2024
-- Description:	run all sp_log stored procedures
-- =============================================
CREATE PROCEDURE [dbo].[sp_runner_sp_log]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


DECLARE @sp_name NVARCHAR(MAX);
DECLARE @SQL NVARCHAR(1000); 


DECLARE cats CURSOR
	FOR 
		(SELECT 
    p.name AS ProcedureName

FROM sys.procedures p
where name like '%sp_log%'
and name not like 'sp_runner_sp_log'
); 

OPEN cats


FETCH NEXT FROM cats INTO 
	@sp_name;

WHILE @@FETCH_STATUS = 0
    BEGIN

		SET @SQL = '

	EXEC '+@sp_name+'
		';
	
		EXECUTE  SP_EXECUTESQL @SQL;

	
        FETCH NEXT FROM cats INTO 
			@sp_name;
    END;

CLOSE cats;
DEALLOCATE cats;












END
GO
/****** Object:  StoredProcedure [dbo].[sp_SNOOPER_hourly_health_check]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
=============================================
-- Author:		Ivgeni Dvorkin
-- Create date: 15/11/24
-- Description:	
	check for critical events in the last hour and log it into [SNOOPER].[dbo].[SNOOPER_Event_Log].

	-- check server name
	-- check server info change last hour
	-- avg cpu metric in the past hour: having avg cpu% higher than 70%
	-- drive free space < 10 % of total drive space
	-- avg DISC usage in the last hour having Physical_DISC_usage% higher than 70%
	-- Average OS free ram is less than 10% 
	-- SQL_RAM_info: avg ram usage + memory state + max memory change in the last hour
	-- check Average Buffer cache hit ratio is less than 40% in the last hour
	-- Average Page life expectancy less than 30 minutes
	-- number of SQLSERVER srevice restarts last hour
	-- Recovery model changed in the last hour
	-- Database status changed in the last hour
	-- DB user access changed in the last hour
	-- Failed_jobs in the last hour
=============================================
*/
CREATE PROCEDURE [dbo].[sp_SNOOPER_hourly_health_check]

AS
BEGIN
	
	
-- check server name same as host name

IF (SELECT TOP (1) [date]
  FROM [SNOOPER].[dbo].[server_info_metric]
  where [SQL_SERVERNAME] <> [OS_hostname]
  and date >= DATEADD(MINUTE, -60, GETDATE())
  ORDER BY [date] DESC
  ) IS NOT NULL 
  insert into [SNOOPER].[dbo].[SNOOPER_Event_Log]( [Event_Log]
      ,[Event_Log_desc]
      ,[Event_Log_date])
SELECT TOP (1) 
('Host name and server name do not match') as [eventlog],
	  ('SQL_SERVERNAME:'+[SQL_SERVERNAME]+'; OS_hostname: '+[OS_hostname]+' ') as [error_msg]
	  ,[date]
  FROM [SNOOPER].[dbo].[server_info_metric]
  where [SQL_SERVERNAME] <> [OS_hostname]
  ORDER BY [date] DESC

-- ==========================================================================

 -- check server info change last hour

drop table if exists tempdb..#tempCat
;with cte as(
SELECT  TOP (1000) date,
      [SQL_SERVERNAME]
      ,[SQL_VERSION]
      ,[OS_hostname]
      ,[host_platform]
      ,[host_distribution]
      ,[host_release]
  FROM [SNOOPER].[dbo].[server_info_metric]
  where date >= DATEADD(MINUTE, -60, GETDATE())
  ORDER BY DATE DESC
  )
  select   date,[SQL_SERVERNAME]
  ,ROW_number() OVER(PARTITION BY [SQL_SERVERNAME] ORDER BY  [SQL_SERVERNAME] DESC ) AS RN1

  ,[SQL_VERSION]
    ,ROW_number() OVER(PARTITION BY [SQL_VERSION] ORDER BY  [SQL_VERSION] DESC ) AS RN2

      ,[OS_hostname]
	      ,ROW_number() OVER(PARTITION BY [OS_hostname] ORDER BY  [OS_hostname] DESC ) AS RN3

      ,[host_distribution]
	      ,ROW_number() OVER(PARTITION BY [host_distribution] ORDER BY  [host_distribution] DESC ) AS RN4

      ,[host_release]
	      ,ROW_number() OVER(PARTITION BY [host_release] ORDER BY  [host_release] DESC ) AS RN5

  into #tempCat
  from cte
  group by date,
 [SQL_SERVERNAME]
      ,[SQL_VERSION]
      ,[OS_hostname]
      ,[host_distribution]
      ,[host_release]


IF (select top 1 [SQL_SERVERNAME] 
from #tempCat
where
RN1 > 1
or RN2 > 1 or RN3 > 1 or RN4 > 1 or RN5 > 1
  ) IS NOT NULL 
  insert into [SNOOPER].[dbo].[SNOOPER_Event_Log]( [Event_Log]
      ,[Event_Log_desc]
      ,[Event_Log_date])
select top 1 
('Server info changed in the last hour') as evntlg,
('SQL_SERVERNAME: ' +[SQL_SERVERNAME] +', ' +'SQL_VERSION: '+[SQL_VERSION] + ', ' +  'OS_hostname: '+ ', ' + [OS_hostname]+ ', ' + 'host_distribution: ' +[host_distribution]+ ', '  + 'host_release: ' +[host_release]) as errmsg,
date
from #tempCat
where
RN1 > 1
or RN2 > 1 or RN3 > 1 or RN4 > 1 or RN5 > 1
order by date desc

-- ==========================================================================



-- avg cpu metric in the last hour
-- having avg cpu% higher than 70%

IF (SELECT 
      avg(convert(float,[metric])) as [%_avg_cpu_last_1hour]

  FROM [SNOOPER].[dbo].[cpu_usage_metric]

  WHERE
  [date] >= DATEADD(MINUTE, -60, GETDATE())

  having avg(convert(float,[metric])) > 70 -- having cpu% higher than 70%
  ) IS NOT NULL
insert into  [SNOOPER].[dbo].[SNOOPER_Event_Log]( [Event_Log]
      ,[Event_Log_desc]
      ,[Event_Log_date])
SELECT 
      ('Average CPU is higher than 70% in the last 1 hour') as evntlg
	  ,('Average CPU load is: ' + convert(nvarchar(10),avg(convert(float,[metric]))) +'%') as [%_avg_cpu_last_1hour]
	  ,(DATEADD(MINUTE, -60, GETDATE())) as date

  FROM [SNOOPER].[dbo].[cpu_usage_metric]

  WHERE
  [date] >= DATEADD(MINUTE, -60, GETDATE())

  having avg(convert(float,[metric])) > 70 -- having cpu% higher than 70%


-- ==========================================================================

--  drive free space < 10 % of total drive space

DECLARE @i INT = (SELECT   
COUNT(DISTINCT vs.volume_mount_point) AS Drive
FROM 
  sys.master_files mf
    CROSS APPLY 
  sys.dm_os_volume_stats(mf.database_id, mf.file_id) AS vs
	);
IF (SELECT TOP (@i) date
  FROM [SNOOPER].[dbo].[drives_info_metric]
 where  [FreeGB] < [TotalCapacityGB]*0.10  
 and
 [date] >= DATEADD(MINUTE, -60, GETDATE()) -- free space is less than 10%
 ORDER BY [date] DESC
  ) IS NOT NULL
INSERT INTO  [SNOOPER].[dbo].[SNOOPER_Event_Log]( [Event_Log]
      ,[Event_Log_desc]
      ,[Event_Log_date])
SELECT TOP (@i) 
		('Drive free space < 10 % of total drive space') as errlg
      , ('Drive: ' +[DriveLetter] + ', TotalCapacityGB: ' +convert(nvarchar(10),[TotalCapacityGB])+ ', FreeGB: '+convert(nvarchar(10),[FreeGB]) ) as errmsg
	  ,[date]
  FROM [SNOOPER].[dbo].[drives_info_metric]
 where  [FreeGB] < [TotalCapacityGB]*0.10 -- free space is less than 10%
 ORDER BY [date] DESC

  -- ==========================================================================

 -- avg DISC usage in the last hour
 -- having Physical_DISC_usage% higher than 70%

 

  IF (SELECT 
      avg(convert(float,[metric])) as [%_avg_disk_usage_last_1hour]
  FROM [SNOOPER].[dbo].[Physical_Disk_usage_metric]

  WHERE
  [date] >= DATEADD(MINUTE, -60, GETDATE())

  having  avg(convert(float,[metric])) > 70 -- having Physical_Disc_usage% higher than 70%
  ) IS NOT NULL
insert into  [SNOOPER].[dbo].[SNOOPER_Event_Log]( [Event_Log]
      ,[Event_Log_desc]
      ,[Event_Log_date])
SELECT 
      ('Average DISC usage is higher than 70% in the last 1 hour') as evntlg
	  ,('Average DISC load is: ' + convert(nvarchar(10),avg(convert(float,[metric]))) +'%') as [%_avg_disc_usage_last_1hour]
	  ,(DATEADD(MINUTE, -60, GETDATE())) as date

  FROM [SNOOPER].[dbo].[Physical_Disk_usage_metric]

  WHERE
  [date] >= DATEADD(MINUTE, -60, GETDATE())

  having avg(convert(float,[metric])) > 70 -- having Physical_Disc_usage% higher than 70%

-- ==========================================================================


-- Average OS free ram is less than 10 %


  IF (
SELECT 
      avg(convert(float,[metric])) as [avg_RAM_free_last_1hour]
  FROM [SNOOPER].[dbo].OS_RAM_free_metric
  WHERE
  [date] >= DATEADD(MINUTE, -60, GETDATE()) 
having
 avg(convert(float,[metric])) < (  SELECT TOP (1) 
      [metric]
  FROM [SNOOPER].[dbo].[OS_RAM_total_metric]
    order by date desc) * 0.1
  ) IS NOT NULL
  insert into  [SNOOPER].[dbo].[SNOOPER_Event_Log]( [Event_Log]
      ,[Event_Log_desc]
      ,[Event_Log_date])
SELECT TOP (1) 
	('Average OS free ram is less than 10%') as errlg,
	('Average OS_RAM_free: '+convert(nvarchar(10),avg(convert(float,[metric])))+' GB') as errmsg,
	date
   FROM [SNOOPER].[dbo].OS_RAM_free_metric
  WHERE
  [date] >= DATEADD(MINUTE, -60, GETDATE()) 
  group by 	date

having
 avg(convert(float,[metric])) < (  SELECT TOP (1) 
      [metric]
  FROM [SNOOPER].[dbo].[OS_RAM_total_metric]
    order by date desc) * 0.1



 
-- ==========================================================================

-- SQL_RAM_info
-- avg ram usage + memory state + max memory change

declare @j nvarchar(2000) = (SELECT 
	('Average active RAM usage last hour MB: '+ convert(nvarchar(10),avg([actively_using_RAM_MB])) )as avg_ram_usage_last_hour
  FROM [SNOOPER].[dbo].[SQL_RAM_info_metric]
  WHERE [date]  >= DATEADD(HOUR, -1, GETDATE()) 
 );

declare @k nvarchar(2000) = (SELECT TOP (1)
    ('MAX_SQLServer_memory_setting_MB:'+convert(nvarchar(10),[MAX_server_memory_MB_setting]) + '.   SQLServer Memory State: ' + convert(nvarchar(100),[Memory_State])  ) as errlg
	 FROM [SNOOPER].[dbo].[SQL_RAM_info_metric]
  WHERE [date]  >= DATEADD(HOUR, -1, GETDATE())
  order by date desc);

select ISNULL(@i , 'ERROR: cant read SQL_RAM_info from the last hour')

    insert into  [SNOOPER].[dbo].[SNOOPER_Event_Log]( [Event_Log]
      ,[Event_Log_desc]
      ,[Event_Log_date])
select
( ISNULL(@j , 'ERROR: cant read SQL_RAM_info from the last hour')) as errlg,
( ISNULL(@k , 'ERROR: cant read SQL_RAM_info from the last hour')) as errmsg,
  (DATEADD(HOUR, -1, GETDATE())) as date
  

--  max sql ram setting changed in last hour

drop table if exists tempdb..#tempCat4
;with cte as(
SELECT TOP (1000) 
      [MAX_server_memory_MB_setting]
  FROM [SNOOPER].[dbo].[SQL_RAM_info_metric]
    where date >= DATEADD(MINUTE, -60, GETDATE())
  ORDER BY DATE DESC)
    select 
	count(distinct [MAX_server_memory_MB_setting]) 
 as [total_different_memory_settings]    
 into #tempCat4
  from cte

if (select top 1 [total_different_memory_settings] from #tempCat4 ) > 1
    insert into  [SNOOPER].[dbo].[SNOOPER_Event_Log]( [Event_Log]
      ,[Event_Log_desc]
      ,[Event_Log_date])
select 
('Max sql ram setting changed in last hour' ) as [sql max ram setting changed in last hour]
,('Current SQLServer max ram setting: ')+convert(nvarchar(10),(SELECT TOP (1) 
      [MAX_server_memory_MB_setting]
  FROM [SNOOPER].[dbo].[SQL_RAM_info_metric] 
 where date >= DATEADD(MINUTE, -60, GETDATE())
  ORDER BY DATE DESC )) as [current sql max ram setting] 
  ,DATEADD(MINUTE, -60, GETDATE()) as date

-- ==========================================================================

-- check Average Buffer cache hit ratio is less than 40% in the last hour

if (SELECT 
      avg([metric]) as [%_avg_Buffer_cache_hit_ratio]
  FROM [SNOOPER].[dbo].[Buffer_cache_hit_ratio_metric]
    WHERE [date]  >= DATEADD(HOUR, -1, GETDATE()) ) < 40
    insert into  [SNOOPER].[dbo].[SNOOPER_Event_Log]( [Event_Log]
      ,[Event_Log_desc]
      ,[Event_Log_date])
SELECT 
('Average Buffer cache hit ratio is less than 40%') as [errlg],
  ('Average Buffer cache hit ratio: ')  +  convert(nvarchar(10),avg([metric])) +'%'  as [%_avg_Buffer_cache_hit_ratio],
  DATEADD(HOUR, -1, GETDATE()) as date
  FROM [SNOOPER].[dbo].[Buffer_cache_hit_ratio_metric]
    WHERE [date]  >= DATEADD(HOUR, -1, GETDATE())


-- ==========================================================================

-- Average Page life expectancy less than 30 minutes
	IF(	SELECT  
      avg([metric])/60 as avg_Page_life_expectancy_minutes
  FROM [SNOOPER].[dbo].[Page_life_expectancy_metric]
    WHERE
  [date] >= DATEADD(MINUTE, -60, GETDATE())) < 30 -- PLE less than 30 minutes
      insert into  [SNOOPER].[dbo].[SNOOPER_Event_Log]( [Event_Log]
      ,[Event_Log_desc]
      ,[Event_Log_date])
	SELECT  
	('PLE is less than 30 minutes') as errlg,
	('Average Page life expectancy minutes: ') + convert(nvarchar(10),avg([metric])/60)  as avg_Page_life_expectancy_minutes,
       DATEADD(MINUTE, -60, GETDATE()) as date
  FROM [SNOOPER].[dbo].[Page_life_expectancy_metric]
    WHERE
  [date] >= DATEADD(MINUTE, -60, GETDATE())

-- ==========================================================================

--number of SQLSERVER srevice restarts last hour

if (SELECT count([metric]) as [number_of_SQLSERVER_srevice_restarts_last_hour]
FROM [SNOOPER].[dbo].[Last_Restart_Time_metric]
where date >= DATEADD(MINUTE,-60, GETDATE())) > 0
  insert into  [SNOOPER].[dbo].[SNOOPER_Event_Log]( [Event_Log]
      ,[Event_Log_desc]
      ,[Event_Log_date])
SELECT 
('Number of SQLSERVER srevice restarts in the last hour is > 0') as errlg,
('Number of restarts: ')+ convert(nvarchar(10),count([metric])) as [number_of_SQLSERVER_srevice_restarts_last_hour],
DATEADD(MINUTE,-60, GETDATE()) as date
FROM [SNOOPER].[dbo].[Last_Restart_Time_metric]
where date >= DATEADD(MINUTE,-60, GETDATE())


-- ==========================================================================

  -- Recovery model changed in the past hour

drop table if exists tempdb..#tempCat5
;with cte as(
SELECT  TOP (1000) 
		date ,[name]
		,[database_id]
		,[recovery_model]
		,[recovery_model_desc]
  FROM [SNOOPER].[dbo].[DB_recovery_model_metric]
  where date >= DATEADD(MINUTE, -60, GETDATE())
  ORDER BY DATE DESC
  )
  select  [name]
		,[database_id]
		,[recovery_model]
		,[recovery_model_desc]
  ,ROW_number() OVER(PARTITION BY [database_id] ORDER BY [recovery_model] DESC) AS RN
  into #tempCat5
  from cte
  group by
	 [name]
	,[database_id]
	,[recovery_model]
	,[recovery_model_desc]


if(select top(1) [name]
from #tempCat5 where RN > 1) is not null
  insert into  [SNOOPER].[dbo].[SNOOPER_Event_Log]( [Event_Log]
      ,[Event_Log_desc]
      ,[Event_Log_date])
select
('Database recovery model changed in the last hour') as errlg,
('Check [SNOOPER].[dbo].[DB_recovery_model_metric] for more info') as errmsg,
 DATEADD(MINUTE, -60, GETDATE()) as date

-- ==========================================================================

  -- Database status changed in the past hour
drop table if exists tempdb..#tempCat10
;with cte as(
SELECT TOP (1000) [date]
      ,[name]
      ,[database_id]
      ,[state]
      ,[state_desc]
  FROM [SNOOPER].[dbo].[DB_state_metric]
    where date >= DATEADD(MINUTE, -60, GETDATE())
  ORDER BY DATE DESC)
    select  [name]
		  ,[database_id]
		  ,[state]
		  ,[state_desc]
		  ,ROW_number() OVER(PARTITION BY [database_id] ORDER BY [state] asc) AS RN
  into #tempCat10
  from cte
  group by
		[name]
		,[database_id]
		,[state]
		,[state_desc]



if(select top(1) [name]
from #tempCat10 where RN > 1) is not null
  insert into  [SNOOPER].[dbo].[SNOOPER_Event_Log]( [Event_Log]
      ,[Event_Log_desc]
      ,[Event_Log_date])
select
('Database status changed in the last hour') as errlg,
('Check [SNOOPER].[dbo].[DB_state_metric] for more info') as errmsg,
 DATEADD(MINUTE, -60, GETDATE()) as date

 -- ==========================================================================

 --  DB_user_access  changed in the last hour

drop table if exists tempdb..#tempCat11
;with cte as(
SELECT TOP (1000)  [date]
				  ,[database_id]
				  ,[name]
				  ,[user_accessl]
				  ,[user_access_desc]
  FROM [SNOOPER].[dbo].[DB_user_access_metric]
    where date >= DATEADD(MINUTE, -60, GETDATE())
  ORDER BY DATE DESC)
    select  [database_id]
			,[name]
			,[user_accessl]
			,[user_access_desc]
			,ROW_number() OVER(PARTITION BY [database_id] ORDER BY [user_accessl] asc) AS RN
  into #tempCat11
  from cte
  group by
		[database_id]
		,[name]
		,[user_accessl]
		,[user_access_desc]


if(select top(1) [name]
from #tempCat11 where RN > 1) is not null
  insert into  [SNOOPER].[dbo].[SNOOPER_Event_Log]( [Event_Log]
      ,[Event_Log_desc]
      ,[Event_Log_date])
select
('DB user access changed in the last hour') as errlg,
('Check [SNOOPER].[dbo].[DB_user_access_metric] for more info') as errmsg,
 DATEADD(MINUTE, -60, GETDATE()) as date

 
-- ==========================================================================

-- Failed_jobs in the last hour

 if( SELECT TOP (1) [JobName]
  FROM [SNOOPER].[dbo].[Failed_jobs]
  WHERE [date]  >=  DATEADD(MINUTE, -60, GETDATE())
  and Job_Outcome_message not like 'The job failed%') is not null
    insert into  [SNOOPER].[dbo].[SNOOPER_Event_Log]( [Event_Log]
      ,[Event_Log_desc]
      ,[Event_Log_date])
 SELECT DISTINCT TOP (10) 
	('Job failed: ') + [JobName] as errlg,
    SUBSTRING([Job_Outcome_message], 1, 2000)
      ,[LastRun]
      
  FROM [SNOOPER].[dbo].[Failed_jobs]
  WHERE [date]  >=  DATEADD(MINUTE, -60, GETDATE())
  and Job_Outcome_message not like 'The job failed%'
-- ==========================================================================







-- ==========================================================================

END
GO
/****** Object:  StoredProcedure [dbo].[sp_USER_CURRENT_SYSTEM_STATE]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/* =============================================
 Author:		Ivgeni Dvorkin
 Create date: 09/11/2024
 Description:	
	scan the monitor ([SNOOPER]) and check for abnormal
	metrics.
	Try to locate bottlenecks.

	1. Host info
		-cpu
		-drive;  avg Disk Reads sec last thour; avg Disk Read Bytes sec last hour; avg Disk Write Bytes sec last hour; avg Disk_Writes sec last hour
		-pagefile.sys
		-RAM

	2. SQL info
		
		-Batch Requests/sec

		memory
		-SQL RAM info
		-Buffer Cache Hit Ratio - %
		-Free list memory stalls/sec
		-Page_life_expectancy

		-Current_User_Connections
		-number of SQLSERVER srevice restarts last hour	
		-Recovery model changed in the last hour
		-Database status changed in the last hour
		-DB_user_access changed in the last hour

		
	3. TOP (10) wait_stats

	4. SQL agent info
		-failed jobs in the last 24 hours
 =============================================*/


CREATE PROCEDURE [dbo].[sp_USER_CURRENT_SYSTEM_STATE]

AS
BEGIN  -- START OF SP

	SET NOCOUNT ON;

-- 1. Host info

SELECT TOP (1) [date]
      ,[SQL_SERVERNAME]
      ,[SQL_VERSION]
      ,[OS_hostname]
      ,[host_platform]
      ,[host_distribution]
      ,[host_release]
  FROM [SNOOPER].[dbo].[server_info_metric]
  ORDER BY [date] DESC


-- cpu info
SELECT TOP (1) [date]
      ,[name]
      ,[socket_count]
      ,[cores_per_socket]
      ,[num_cores]
      ,[num_logical_processors]
      ,[processors_online]
      ,[processors_in_use_by_sql]
      ,[Schedulers_Available]
      ,[max_workers_count]
      ,[max_worker_threads_setting]
  FROM [SNOOPER].[dbo].[cpu_info_metric]
  ORDER BY [date] DESC

-- max, min, avg cpu metric in the past hour
SELECT 
      avg(convert(float,[metric])) as [%_avg_cpu_last_1hour]
	  ,max(convert(float,[metric])) as  [%_max_cpu_last_1hour]
	  ,min(convert(float,[metric])) as [%_min_cpu_last_1hour]

  FROM [SNOOPER].[dbo].[cpu_usage_metric]

  WHERE
  [date] >= DATEADD(MINUTE, -60, GETDATE())



-- drive info
DECLARE @i INT = (SELECT   
COUNT(DISTINCT vs.volume_mount_point) AS Drive

FROM 
  sys.master_files mf
    CROSS APPLY 
  sys.dm_os_volume_stats(mf.database_id, mf.file_id) AS vs
	);

SELECT TOP (@i) 
      [DriveLetter]
      ,[Drive]
      ,[logical_volume_name]
      ,[TotalCapacityGB]
      ,[FreeGB]
  FROM [SNOOPER].[dbo].[drives_info_metric]
  ORDER BY [date] DESC


-- max, min, avg disk usage in the last 1 hour
SELECT 
      avg(convert(float,[metric])) as [%_avg_disk_usage_last_1hour]
	  ,max(convert(float,[metric])) as  [%_max_disk_usage_last_1hour]
	  ,min(convert(float,[metric])) as [%_min_disk_usage_last_1hour]

  FROM [SNOOPER].[dbo].[Physical_Disk_usage_metric]

  WHERE
  [date] >= DATEADD(MINUTE, -60, GETDATE())



  
-- avg Disk Reads sec last thour
SELECT 
      avg([metric]) as avg_Disk_Reads_sec_last_hour
  FROM [SNOOPER].[dbo].[Disk_Reads_sec_metric]
    where [date] >= DATEADD(MINUTE, -60, GETDATE())



-- avg Disk Read Bytes sec last hour

-- Low number doesnt mean low reads. check for normal spread in [Disk_Read_Bytes_sec_metric] 
-- possible case: one read intensive query and very many easy on reads processes,
-- in that case youll get a low avg read.

SELECT 
      avg([metric]) as [avg_Disk_Read_Bytes_sec_last_hour] 
  FROM [SNOOPER].[dbo].[Disk_Read_Bytes_sec_metric]
  where [date] >= DATEADD(MINUTE, -60, GETDATE())


  --avg Disk Write Bytes sec last hour
  SELECT  
      avg([metric]) as [avg_Disk_Write_Bytes_sec_last_hour] 
  FROM [SNOOPER].[dbo].[Disk_Write_Bytes_sec_metric]
  where [date] >= DATEADD(MINUTE, -60, GETDATE())


--avg Disk_Writes sec last hour
  SELECT TOP (1000) 
      avg([metric]) as [avg_Disk_Writes_sec_last_hour] 
  FROM [SNOOPER].[dbo].[Disk_Writes_sec_metric]
  where [date] >= DATEADD(MINUTE, -60, GETDATE())




  -- pagefile.sys info

  ;with cte as (
SELECT distinct TOP (5) date
     , [AllocatedBaseSize_MB]
      ,[CurrentUsage_MB]
      ,[Name]
  FROM [SNOOPER].[dbo].[pagefile_usage_metric]
  order by date desc)
  select distinct [AllocatedBaseSize_MB]
      ,[CurrentUsage_MB]
      ,[Name]
	  from cte


-- RAM

SELECT TOP (1) 
      r.[metric] as  [OS_RAM_free_metric]
	  ,[OS_RAM_total_metric].[metric] as  [OS_RAM_total_metric]
  FROM [SNOOPER].[dbo].[OS_RAM_free_metric] as r

  cross apply (SELECT TOP (1) [date]
      ,[metric]
  FROM [SNOOPER].[dbo].[OS_RAM_total_metric]
) as [OS_RAM_total_metric] 


-- max, min, avg RAM free in the last 1 hour
SELECT 
      avg(convert(float,[metric])) as [avg_RAM_free_last_1hour]
	  ,max(convert(float,[metric])) as  [max_RAM_free_last_1hour]
	  ,min(convert(float,[metric])) as [min_RAM_free_last_1hour]

  FROM [SNOOPER].[dbo].OS_RAM_free_metric

  WHERE
  [date] >= DATEADD(MINUTE, -60, GETDATE())






--=====================================================================================================================
--=====================================================================================================================

-- 2. SQL info






--  Batch Requests/sec
SELECT TOP (1) [date]
      ,[metric] as [Batch Requests/sec]
  FROM [SNOOPER].[dbo].[Batch_Requests_sec_metric]
  ORDER BY [date] DESC;



-- SQL_RAM_info
SELECT TOP (1) 
      [MIN_server_memory_MB_setting]
      ,[MAX_server_memory_MB_setting]
      ,[actively_using_RAM_MB]
      ,[Memory_State]
  FROM [SNOOPER].[dbo].[SQL_RAM_info_metric]
  order by date desc






/*

The Buffer Cache Hit Ratio is a critical performance metric in SQL Server
that measures how often SQL Server can satisfy data requests from its buffer cache rather than having to read data from disk.
This counter is expressed as a percentage and gives you an indication of how effectively 
SQL Server is using memory to avoid expensive disk I/O operations.
*/

SELECT 
      avg([metric]) as [%_avg_Buffer_cache_hit_ratio]
  FROM [SNOOPER].[dbo].[Buffer_cache_hit_ratio_metric]
    WHERE [date]  >= DATEADD(HOUR, -1, GETDATE())



  --  High values for Free_list_memory_stalls/sec can indicate memory pressure.
SELECT
      avg([metric]) as [avg_Free_list_memory_stalls_sec_last_hour]
  FROM [SNOOPER].[dbo].[Free_list_memory_stalls_sec_metric]
    WHERE [date]  >= DATEADD(HOUR, -1, GETDATE())

-- Page_life_expectancy
SELECT  
      avg([metric])/60 as avg_Page_life_expectancy_minutes,
	  avg([metric])/60/60 as avg_Page_life_expectancy_hours,
	   avg([metric])/60/60/24 as avg_Page_life_expectancy_days

  FROM [SNOOPER].[dbo].[Page_life_expectancy_metric]
    WHERE
  [date] >= DATEADD(MINUTE, -60, GETDATE())


  -- Current_User_Connections

  SELECT TOP (1) [date]
      ,[metric] as [Current_User_Connections]
  FROM [SNOOPER].[dbo].[Current_User_Connections_metric]
  ORDER BY date desc


  
--number of SQLSERVER srevice restarts last hour
SELECT count([metric]) as [number_of_SQLSERVER_srevice_restarts_last_hour]
FROM [SNOOPER].[dbo].[Last_Restart_Time_metric]
where date >= DATEADD(MINUTE,-60, GETDATE())


  -- Recovery model changed in the past hour
drop table if exists tempdb..#tempCat
;with cte as(
SELECT  TOP (1000) 
      date ,[name]
      ,[database_id]
      ,[recovery_model]
	   ,[recovery_model_desc]
  FROM [SNOOPER].[dbo].[DB_recovery_model_metric]
  where date >= DATEADD(MINUTE, -60, GETDATE())
  ORDER BY DATE DESC
  )
  select  [name]
      ,[database_id]
      ,[recovery_model]
	   ,[recovery_model_desc]
  ,ROW_number() OVER(PARTITION BY [database_id] ORDER BY [recovery_model] DESC) AS RN
  into #tempCat
  from cte
  group by
  [name]
      ,[database_id]
      ,[recovery_model]
	   ,[recovery_model_desc]


select top(5) [name]
      ,[database_id]
      ,[recovery_model]
	   ,[recovery_model_desc] as [Recovery model changed in the past hour]
from #tempCat where RN > 1




  -- Database status changed in the past hour
drop table if exists tempdb..#tempCat2
;with cte as(
SELECT TOP (1000) [date]
      ,[name]
      ,[database_id]
      ,[state]
      ,[state_desc]
  FROM [SNOOPER].[dbo].[DB_state_metric]
    where date >= DATEADD(MINUTE, -60, GETDATE())
  ORDER BY DATE DESC)
    select  [name]
      ,[database_id]
      ,[state]
      ,[state_desc]
  ,ROW_number() OVER(PARTITION BY [database_id] ORDER BY [state] asc) AS RN
  into #tempCat2
  from cte
  group by
[name]
      ,[database_id]
      ,[state]
      ,[state_desc]

select top(5) [name]
      ,[database_id]
      ,[state]
      ,[state_desc] as [Database status changed in the past hour]
from #tempCat2 where RN > 1





--  DB_user_access  changed in the past hour
drop table if exists tempdb..#tempCat3
;with cte as(
SELECT TOP (1000)  [date]
      ,[database_id]
      ,[name]
      ,[user_accessl]
      ,[user_access_desc]
  FROM [SNOOPER].[dbo].[DB_user_access_metric]
    where date >= DATEADD(MINUTE, -60, GETDATE())
  ORDER BY DATE DESC)
    select  [database_id]
      ,[name]
      ,[user_accessl]
      ,[user_access_desc]
  ,ROW_number() OVER(PARTITION BY [database_id] ORDER BY [user_accessl] asc) AS RN
  into #tempCat3
  from cte
  group by
[database_id]
      ,[name]
      ,[user_accessl]
      ,[user_access_desc]

select top(5) [database_id]
      ,[name]
      ,[user_accessl]
      ,[user_access_desc] as [User access changed in the past hour]
from #tempCat3 where RN > 1







--=====================================================================================================================
--=====================================================================================================================

-- 3. TOP (10) wait_stats


SELECT TOP (10) 
      [wait_type]
      ,[total_time_SQL_Server_waited_ms] /1000 as [total_time_SQL_Server_waited_seconds] 
      ,[total_waiting_tasks_count]
      ,[avg_wait_time_ms] /1000 as [avg_wait_time_seconds]
      ,[wait_on_CPU_after_resource_became_available_time_ms] /1000 as [wait_on_CPU_after_resource_became_available_time_seconds]
  FROM [SNOOPER].[dbo].[wait_stats_metric]
    WHERE
  [date] >= DATEADD(MINUTE, -60, GETDATE())
  order by date desc, [total_time_SQL_Server_waited_ms] desc, [total_waiting_tasks_count] desc,[avg_wait_time_ms] desc,[wait_on_CPU_after_resource_became_available_time_ms] desc




--=====================================================================================================================
--=====================================================================================================================

-- 4. SQL agent info



-- faile djobs in the past 24 hours

SELECT DISTINCT TOP (1000) 
      [date]
      ,[job_id]
      ,[JobName]
      ,[LastRun]
      ,[Job_Outcome_message]
  FROM [SNOOPER].[dbo].[Failed_jobs]
  WHERE [date]  >= DATEADD(HOUR, -24, GETDATE())





--=====================================================================================================================
--=====================================================================================================================



END -- END OF SP
GO
/****** Object:  StoredProcedure [dbo].[sp_USER_INDEX_FRAGMENTATION_PERCENT_PER_DB]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/* =============================================
 Author:		Ivgeni Dvorkin
 Create date: 26/10/2024
 Description:	
	INDEX_FRAGMENTATION_PERCENT_PER_DB
 =============================================*/


CREATE PROCEDURE [dbo].[sp_USER_INDEX_FRAGMENTATION_PERCENT_PER_DB]

@db_id INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

declare @name_db nvarchar(300) = (select top 1 name from sys.databases where database_id = @db_id);

DECLARE @sql nvarchar(max) = '
USE '+@name_db+'


SELECT 
    OBJECT_NAME(ips.object_id) AS TableName,
    i.name AS IndexName,
    ips.index_id,
    ips.avg_fragmentation_in_percent AS FragmentationPercent,
    ips.page_count AS PageCount,
	(ips.page_count * 8) / 1024 as [INDEX_SIZE_MB]
FROM 
    sys.dm_db_index_physical_stats(DB_ID(), NULL, NULL, NULL, ''SAMPLED'') AS ips
JOIN 
    sys.indexes AS i ON ips.object_id = i.object_id AND ips.index_id = i.index_id

ORDER BY 
   [INDEX_SIZE_MB] DESC, FragmentationPercent DESC

';

EXECUTE  SP_EXECUTESQL @sql;



END -- END OF SP
GO
/****** Object:  StoredProcedure [dbo].[sp_USER_INDEX_USAGE_PER_DB]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/* =============================================
 Author:		Ivgeni Dvorkin
 Create date: 26/10/2024
 Description:	
	index usage per database
 =============================================*/


CREATE PROCEDURE [dbo].[sp_USER_INDEX_USAGE_PER_DB]

@db_id INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

declare @name_db nvarchar(300) = (select top 1 name from sys.databases where database_id = @db_id);

DECLARE @sql nvarchar(max) = '
USE '+@name_db+'

SELECT sqlserver_start_time, 
CASE WHEN DATEDIFF(MONTH, sqlserver_start_time, GETDATE()) < 1 THEN
	''SQL SERVER Rebooted recently. Index usge may not be reliable''
	ELSE ''SQL SERVER is up for '' + CONVERT(NVARCHAR(200),DATEDIFF(MONTH, sqlserver_start_time, GETDATE())) + '' months''
END AS [index_usge_reliability]
FROM sys.dm_os_sys_info

SELECT 
schma.name AS [schema_name]
,tbl.name AS [table_name]
,indx.name AS [index_name]
,CASE
	WHEN indx.is_unique = 1 THEN ''YES''
	ELSE ''NO''
END AS [is_unique]

,CASE
	WHEN indx.is_primary_key =1 THEN ''YES''
	ELSE ''NO''
END AS [is_primary_key]

,CASE
	WHEN indx.is_unique_constraint =1 THEN ''YES''
	ELSE ''NO''
END AS [is_unique_constraint]

,CASE
	WHEN indx.is_disabled =1 THEN ''YES''
	ELSE ''NO''
END AS [is_disabled]
,ius.user_seeks
,ius.last_user_seek
,ius.user_scans
,ius.last_user_scan
,ius.user_lookups
,ius.last_user_lookup
,ius.user_updates
,ius.last_user_update
,ius.system_seeks
,ius.last_system_seek
,ius.system_scans
,ius.last_system_scan
,ius.system_lookups
,ius.last_system_lookup
,ius.system_updates
,ius.last_system_update
,ius.index_id
, ''ALTER INDEX '' + QUOTENAME(indx.name )
+ '' ON '' + QUOTENAME(schma.name) + ''.'' 
+ QUOTENAME(OBJECT_NAME(ius.OBJECT_ID)) + '' DISABLE;''  AS [DISABLE_statement]

, ''DROP INDEX '' + QUOTENAME(indx.name )
+ '' ON '' + QUOTENAME(schma.name) + ''.'' 
+ QUOTENAME(OBJECT_NAME(ius.OBJECT_ID)) AS [DROP_statement]

, ''ALTER INDEX '' + QUOTENAME(indx.name )
+ '' ON '' + QUOTENAME(schma.name) + ''.'' 
+ QUOTENAME(OBJECT_NAME(ius.OBJECT_ID)) + '' REBUILD;''  AS [REBUILD_statement]


FROM sys.dm_db_index_usage_stats ius
INNER JOIN sys.objects obj ON ius.OBJECT_ID = obj.OBJECT_ID
INNER JOIN sys.schemas schma ON obj.schema_id = schma.schema_id
INNER JOIN sys.tables tbl on tbl.object_id = obj.object_id
INNER JOIN sys.indexes indx ON  indx.index_id = ius.index_id AND  ius.OBJECT_ID = indx.OBJECT_ID 


';

EXECUTE  SP_EXECUTESQL @sql;



END -- END OF SP
GO
/****** Object:  StoredProcedure [dbo].[SP_USER_LAST_STATISTICS_UPDATE_DATE_ALL_TABLES]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






/* =============================================
 Author:		Ivgeni Dvorkin
 Create date: 29/10/2024
 Description:	
	CHECK last_statistics_update_date for all tables
 =============================================*/


CREATE PROCEDURE [dbo].[SP_USER_LAST_STATISTICS_UPDATE_DATE_ALL_TABLES]

@db_id INT 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


declare @db_name nvarchar(200) = (select top 1 name from sys.databases where database_id = @db_id );



declare @sql nvarchar(max) = '
	USE ['+@db_name+'] 


	SELECT obj.name as [table_ name], stts.name as [statistics_name], STATS_DATE(stts.object_id, stats_id) as [STATS_DATE]
    FROM sys.stats as stts
	INNER JOIN sys.objects as obj on obj.object_id = stts.object_id and obj.type = ''U ''
	ORDER BY [STATS_DATE] asc



';

EXECUTE  SP_EXECUTESQL @sql;



END -- END OF SP
GO
/****** Object:  StoredProcedure [dbo].[sp_USER_LAST_SUCCESSFULL_CHECKDB]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/* =============================================
 Author:		Ivgeni Dvorkin
 Create date: 26/10/2024
 Description:	
	CHECK LAST SUCCESSFULL DBCC CHECKDB
 =============================================*/


CREATE PROCEDURE [dbo].[sp_USER_LAST_SUCCESSFULL_CHECKDB]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;





DROP TABLE IF EXISTS tempdb..#TBL_DBCC_STATUS
CREATE TABLE #TBL_DBCC_STATUS(
    [DB NAME] NVARCHAR(MAX),
    [LAST SUCCESSFULL DBCC DATE] NVARCHAR(MAX)
);

-- DROP TABLE #TBL_DBCC_STATUS


DECLARE @SQL NVARCHAR(1000);

DECLARE @DB_NAME NVARCHAR(MAX);

DECLARE CURSOR_LAST_ok_DBCC_CHECKDB CURSOR
	FOR 
		(SELECT 
			[NAME]
		FROM
  			SYS. DATABASES AS DB );

OPEN CURSOR_LAST_ok_DBCC_CHECKDB




FETCH NEXT FROM CURSOR_LAST_ok_DBCC_CHECKDB INTO 
	@DB_NAME;



WHILE @@FETCH_STATUS = 0
    BEGIN
		PRINT 'CHEKING DB:';
		PRINT @DB_NAME;

		--USE ' + @DB_NAME + ' 
		SET @SQL = N'
						INSERT INTO #TBL_DBCC_STATUS
						SELECT (SELECT '''+ @DB_NAME +''') AS DB_NAME, CONVERT(NVARCHAR(MAX) ,  CONVERT(VARCHAR, DATABASEPROPERTYEX (N''' + @DB_NAME + ''', N''LASTGOODCHECKDBTIME''), 20) );
					' ;

		EXECUTE  SP_EXECUTESQL @SQL;
	
        FETCH NEXT FROM CURSOR_LAST_ok_DBCC_CHECKDB INTO 
			@DB_NAME;
    END;

CLOSE CURSOR_LAST_ok_DBCC_CHECKDB;
DEALLOCATE CURSOR_LAST_ok_DBCC_CHECKDB;



SELECT 
	 [DB NAME]
	,CASE
		WHEN [LAST SUCCESSFULL DBCC DATE] = '1900-01-01 00:00:00'
		THEN 'NEVER'
		ELSE [LAST SUCCESSFULL DBCC DATE]			
	END AS [LAST SUCCESSFULL DBCC DATE]
FROM #TBL_DBCC_STATUS





END -- END OF SP
GO
/****** Object:  StoredProcedure [dbo].[sp_USER_LOGINS_TO_USERS_MAPPING]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/* =============================================
 Author:		Ivgeni Dvorkin
 Create date: 26/10/2024
 Description:	
	List all logins and their mapped users, including database role membership, securables, and extended properties
	 Runs for all DB's
 =============================================*/


CREATE PROCEDURE [dbo].[sp_USER_LOGINS_TO_USERS_MAPPING]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;



-- Temp table to store intermediate results
CREATE TABLE #LoginDetails (
	DatabaseName NVARCHAR(128),
    LoginName NVARCHAR(128),
    UserName NVARCHAR(128),
    UserType NVARCHAR(128),
	SERVER_RoleName NVARCHAR(128),
    DB_RoleName NVARCHAR(128),
    Securable NVARCHAR(128),
    Permission NVARCHAR(128),
    state_desc NVARCHAR(128)
);

-- Iterate through each database
DECLARE @dbName NVARCHAR(128);
DECLARE db_cursor CURSOR FOR 
SELECT name 
FROM sys.databases
WHERE state_desc = 'ONLINE' -- Only consider online databases

OPEN db_cursor;
FETCH NEXT FROM db_cursor INTO @dbName;

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Construct dynamic SQL to execute in each database
    DECLARE @sql NVARCHAR(MAX);

    SET @sql = '
        USE ' + QUOTENAME(@dbName) + ';

        INSERT INTO #LoginDetails (DatabaseName, LoginName, UserName, UserType, SERVER_RoleName,DB_RoleName, Securable, Permission, state_desc)

		SELECT
			''' + @dbName + ''' AS DatabaseName,
			sp.name AS LoginName,
			dp.name AS UserName,
			dp.type_desc AS UserType

		,CASE 
		WHEN r.name IS NULL THEN ''public''
		ELSE  r.name
		END AS SERVER_RoleName 


			,CASE	
				WHEN dr.name IS NULL THEN ''''
				ELSE dr.name
			END AS DB_RoleName,

			CASE 
				WHEN obj.name IS NULL THEN ''''
				ELSE obj.name
			END AS Securable,


			dp2.permission_name AS Permission,
			dp2.state_desc

		FROM 
			sys.server_principals sp
			JOIN 
			sys.database_principals dp ON sp.sid = dp.sid
		LEFT JOIN 
			sys.database_role_members drm ON dp.principal_id = drm.member_principal_id
		LEFT JOIN 
			sys.database_principals dr ON drm.role_principal_id = dr.principal_id
		LEFT JOIN 
			sys.database_permissions dp2 ON dp.principal_id = dp2.grantee_principal_id
		LEFT JOIN 
			sys.objects obj ON dp2.major_id = obj.object_id
	LEFT JOIN 
    sys.server_role_members AS rm ON sp.principal_id = rm.member_principal_id
LEFT JOIN 
    sys.server_principals AS r ON rm.role_principal_id = r.principal_id

		WHERE 
			sp.type IN (''S'', ''U'', ''G'') -- Filter for SQL Server logins, Windows logins, and Windows groups
		ORDER BY 
			sp.name, dp.name, dr.name, obj.name, dp2.permission_name;
    ';

    -- Execute dynamic SQL
    EXEC sp_executesql @sql;

    FETCH NEXT FROM db_cursor INTO @dbName;
END;

CLOSE db_cursor;
DEALLOCATE db_cursor;

-- Select results
SELECT * FROM #LoginDetails;

-- Clean up
DROP TABLE #LoginDetails;




END -- END OF SP
GO
/****** Object:  StoredProcedure [dbo].[sp_USER_MAP_INDEXES_FOR_COMPRESSION_PER_DB]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






/* =============================================
 Author:		Ivgeni Dvorkin
 Create date: 26/10/2024
 Description:	
	map indexes for compression per db
 =============================================*/


CREATE PROCEDURE [dbo].[sp_USER_MAP_INDEXES_FOR_COMPRESSION_PER_DB]

@db_id INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

declare @name_db nvarchar(300) = (select top 1 name from sys.databases where database_id = @db_id);

DECLARE @sql nvarchar(max) = '
USE '+@name_db+'



DROP TABLE IF EXISTS tempdb..#temp_cpmress
CREATE TABLE #temp_cpmress (
[object_name]  sysname null,
[schema_name] sysname null,
[index_id] int null,
[partition_number] int null,
[size_with_current_compression_setting(KB)] bigint null,
[size_with_requested_compression_setting(KB)]  bigint null,
[sample_size_with_current_compression_setting(KB)]  bigint null,
[sample_size_with_requested_compression_setting(KB)] bigint null,
);


DECLARE @schema_name1 nvarchar(128);
DECLARE @object_name1 nvarchar(128);
DECLARE @index_1 INT ;
declare @rowcount int =  1;

drop table if exists tempdb..#hellocat
select 
schm.name as [schema_name]
,obj.name AS [object_name]
,indx.index_id as [index_id]
INTO #hellocat
from sys.objects AS obj
INNER JOIN sys.schemas as schm on schm.schema_id = obj.schema_id 

INNER JOIN  sys.indexes AS indx ON obj.object_id = indx.object_id 

 WHERE 
        indx.type_desc IN (''NONCLUSTERED'', ''CLUSTERED'')  -- Focus on nonclustered and clustered indexes
		 AND obj.type = ''U ''                       -- Exclude system tables


while @rowcount > 0 
begin

select TOP 1
	@schema_name1 = [schema_name],
	@object_name1 = [object_name],
	@index_1 = [index_id]
FROM #hellocat


INSERT INTO #temp_cpmress([object_name] ,
						[schema_name],
						[index_id] ,
						[partition_number],
						[size_with_current_compression_setting(KB)] ,
						[size_with_requested_compression_setting(KB)]  ,
						[sample_size_with_current_compression_setting(KB)]  ,
						[sample_size_with_requested_compression_setting(KB)])
						EXEC sp_estimate_data_compression_savings
						@schema_name = @schema_name1,
						@object_name = @object_name1,
						@index_id = @index_1,
						@partition_number = NULL,
						@data_compression = ''PAGE''

delete from #hellocat
where  [schema_name] = @schema_name1 aND [object_name] = @object_name1 and [index_id] = @index_1

set @rowcount = @@ROWCOUNT;

end -- end of while


select [schema_name],
		[object_name],						
		[index_id] ,
		[size_with_current_compression_setting(KB)] / 1024.0 As [size_with_current_compression_setting(MB)] ,
		[size_with_requested_compression_setting(KB)] / 1024.0 as [size_with_page_compression_setting(MB)]				
FROM #temp_cpmress 


drop table if exists tempdb..#hellocat
DROP TABLE IF EXISTS tempdb..#temp_cpmress

';

EXECUTE  SP_EXECUTESQL @sql;



END -- END OF SP
GO
/****** Object:  StoredProcedure [dbo].[sp_USER_SETTINGS_CATSCAN]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* =============================================
 Author:		Ivgeni Dvorkin
 Create date: 24/10/2024
 Description:	
	First level - instance settings check

	1. Memory setting
	2. Processors setting
	3. Authentication Mode
	4. Connections
	5. Backup defaults
	6. Advanced instance settings

	 CHECK MAX_DOP_SETTING_STATUS
	 CHECK COST_THRESHOLD_PARALLELISM_SETTING_STATUS
	 CHECK PAGE_VERIFY USING CHECKSUM
	 CHECK FILE GROWTH AND SIZE SETTINGS
	 CHECK QUERY STORE SETTING STATUS

	7. DB is_auto setting
	8. DB_state_and_status

 =============================================*/


CREATE PROCEDURE [dbo].[sp_USER_SETTINGS_CATSCAN]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;





-- 1. memory setting

SELECT TOP (1) 
      [MIN_server_memory_MB_setting] / 1024.0 as [MIN_SQLserver_memory_setting_GB]
      ,[MAX_server_memory_MB_setting] / 1024.4 as [MAX_SQLserver_memory_setting_GB]
	  ,Total_SQLServer_Memory_in_use_MB.Total_SQLServer_Memory_in_use_MB
      ,[Memory_State]
	  ,RAM_free_OS.[metric]  AS RAM_free_OS_GB
	  ,RAM_Total_OS.[metric] as RAM_Total_OS_GB
	  

  FROM [SNOOPER].[dbo].[SQL_RAM_info_metric]

  OUTER APPLY (SELECT TOP (1) 
      [metric]
  FROM [SNOOPER].[dbo].[OS_RAM_free_metric]
   order by date desc) AS RAM_free_OS

  OUTER APPLY (SELECT TOP (1) 
      [metric]
  FROM [SNOOPER].[dbo].[OS_RAM_total_metric]
  order by date desc) AS RAM_Total_OS

  OUTER APPLY (SELECT top (1)
(committed_kb/1024) AS Total_SQLServer_Memory_in_use_MB
FROM sys.dm_os_sys_info) as Total_SQLServer_Memory_in_use_MB

  order by date desc

SELECT TOP (1) 
      [metric] as [Page_life_expectancy_seconds]
	  , [metric]/60.0  as [Page_life_expectancy_Minutes]
	  , [metric] /60.0/60.0 as [Page_life_expectancy_hours]
	  , [metric] /60.0/60.0/24.0 as [Page_life_expectancy_days]
  FROM [SNOOPER].[dbo].[Page_life_expectancy_metric]  
  ORDER BY DATE DESC

--=====================================================================================================================
--=====================================================================================================================

   -- 2. processors setting

   SELECT 
    name AS Setting_Name,
    value_in_use AS Current_Value,
	case when value_in_use = 0 then 'GOOD'
	else 'CHECK VALUE - NOT set to defaults!'
	end as [Value_status]
FROM sys.configurations
WHERE name IN ('max worker threads', 'affinity I/O mask', 'affinity mask');



--=====================================================================================================================
--=====================================================================================================================

-- 3. Check Authentication Mode

SELECT 
    CASE SERVERPROPERTY('IsIntegratedSecurityOnly')
        WHEN 1 THEN 'Windows Authentication Mode'
        WHEN 0 THEN 'SQL Server and Windows Authentication Mode (Mixed Mode)'
        ELSE 'Unknown'
    END AS Authentication_Mode;



--=====================================================================================================================
--=====================================================================================================================

--  4. Connections

SELECT 
   
    value_in_use AS Current_Value,
	case when value_in_use = 0 then 'UNLIMITED'else 'LIMITED!'
	end as Value_desc,
    description AS Setting_Description

FROM sys.configurations
WHERE name = 'user connections';


SELECT 
    value_in_use AS Current_Value,
	CASE WHEN value_in_use = 1 then 'OK'
	ELSE 'Remote access denied!'
	end as Value_desc,
    description AS Setting_Description
FROM sys.configurations
WHERE name IN ('remote access');

-- Check the query governor configuration setting
SELECT 
    name AS Setting_Name,
    value_in_use AS Current_Value,
	CASE when value_in_use  = 0  then 'OFF - OK'
	else  'ON - Check value!'
	END as [Value_desc] ,
    description AS Setting_Description
FROM sys.configurations
WHERE name = 'query governor cost limit';


--=====================================================================================================================
--=====================================================================================================================

-- 5. Backup defaults



-- Check Backup Checksum Setting
SELECT 

    value_in_use AS Current_Value,
	CASE
	 WHEN value_in_use = 0 THEN 'OFF - NO CHECKSUM!'
	 ELSE 'OK'
	END AS VALUE_DESC,
    description AS Setting_Description
FROM sys.configurations
WHERE name = 'backup checksum default';

-- Check Backup Compression Setting
SELECT 
   
    value_in_use AS Current_Value,
	CASE
	 WHEN value_in_use = 0 THEN 'OFF - NO backup compression by default'
	 ELSE 'OK'
	END AS VALUE_DESC,
    description AS Setting_Description
FROM sys.configurations
WHERE name = 'backup compression default';



--=====================================================================================================================
--=====================================================================================================================


-- 6. Advanced instance settings

-- Check the FILESTREAM Access Level
SELECT 
    name AS Setting_Name,
    value_in_use AS Current_Value,
	case when value_in_use = 0 then 'Disabled'
	else 'Enabled'
	end as value_desc
FROM sys.configurations
WHERE name = 'filestream access level';


SELECT 
    name AS Setting_Name,
    value_in_use AS Current_Value,
	CASE
		when value_in_use = 0 then 'Disabled'
		else 'Enabled'
	END AS VALUE_DESC

FROM sys.configurations
where name like '%BOOST%';

SELECT 
    name AS Setting_Name,
    value_in_use AS Current_Value
FROM sys.configurations
where name like '%network packet size (B)%';



/*
The Remote Login Timeout setting in SQL Server 
controls how long SQL Server waits for a connection to be established with a remote server before timing out. 
It applies when SQL Server is trying to connect to another server for operations like linked server queries,
remote queries,
or when setting up replication.
*/

SELECT 
    name AS Setting_Name,
    value_in_use AS Current_Value
FROM sys.configurations
where name like '%remote login timeout (s)%'


-- CHECK MAX_DOP_SETTING_STATUS

DECLARE @processors_in_use_by_sql  INT = (SELECT TOP 1
						[processors_in_use_by_sql]
					FROM 
						[SNOOPER].[dbo].[cpu_info_metric]
					WHERE 
						[date] = (SELECT MAX([date]) FROM [SNOOPER].[dbo].[cpu_info_metric]) );
SELECT 
    name AS 'Parameter Name',
    value AS 'Value',
	CASE WHEN [value] >= @processors_in_use_by_sql THEN 'Max Degree of Parallelism SET TO HIGH'
		WHEN [value]  = 0 THEN  'Max Degree of Parallelism SET TO HIGH'
		WHEN [value]> 8 THEN 'Max Degree of Parallelism SET TO HIGH'
		WHEN [value] = 1 THEN  'Max Degree of Parallelism SET TO LOW - NO PARALLELISM'
		WHEN [value] <= CONVERT(INT,(@processors_in_use_by_sql / 5)) THEN 'CHECK PARALLELISM SETTING - LESS THAN 20% CORES'
		ELSE 'OK'
		END AS [MAX_DOP_SETTING_STATUS]
FROM 
    sys.configurations
WHERE 
    name = 'max degree of parallelism';


--=====================================================================================================================
--=====================================================================================================================

--  CHECK COST_THRESHOLD_PARALLELISM_SETTING_STATUS

DECLARE @HALF_TOTAL_EXECUTIONS INT = (SELECT count(dop) FROM [SNOOPER].[dbo].[live_queries_currently_running_metric] ) /2;


declare @minimal_cost_for_parallelism int = 1;
declare @rowcount int = 1;
declare @total_execs int = 0;


DROP TABLE IF EXISTS tempdb..#temp1
SELECT dop,
COUNT([dop]) as total_executions
INTO #temp1
FROM [SNOOPER].[dbo].[live_queries_currently_running_metric]
WHERE [dop] IS NOT NULL
GROUP BY dop
ORDER BY dop desc



while @rowcount > 0
begin

if (SELECT top 1 total_executions from #temp1) <= @HALF_TOTAL_EXECUTIONS and (@total_execs) <= @HALF_TOTAL_EXECUTIONS
begin
	set @minimal_cost_for_parallelism = (SELECT top 1 dop from #temp1 ORDER BY dop desc);
	set @total_execs = @total_execs + (SELECT top 1 total_executions from #temp1 ORDER BY dop desc);
	delete top (1) from #temp1 where dop = @minimal_cost_for_parallelism;
	set @rowcount = @@ROWCOUNT;
end
else
begin
 set @rowcount = 0
end

end


declare @max_dop_of_executed_queries INT  = (SELECT      
max(dop) as max_dop_of_executed_queries
  FROM [SNOOPER].[dbo].[live_queries_currently_running_metric]
  WHERE [dop] IS NOT NULL);



SELECT 
    name AS 'Parameter Name',
    value AS 'Value',
	CASE	WHEN [value] < @minimal_cost_for_parallelism THEN 'Cost threshold for parallelism SET TO LOW'
	WHEN [value] = 1  THEN  'Cost threshold for parallelism SET TO LOW'
	WHEN [value] > @minimal_cost_for_parallelism and [value] < @max_dop_of_executed_queries THEN 'CHECK COST THRESHOLD FOR PARALLELISM SETTING - MIGHT BE TO HIGH'
	WHEN [value] >= @max_dop_of_executed_queries THEN 'Cost threshold for parallelism SET TO HIGH'
	ELSE 'OK'
	END AS [COST_THRESHOLD_PARALLELISM_SETTING_STATUS]
FROM 
    sys.configurations
WHERE 
    name = 'cost threshold for parallelism';




--=====================================================================================================================
--=====================================================================================================================

--  CHECK PAGE_VERIFY USING CHECKSUM



SELECT 
	[name] as [Database_name]
	,[page_verify_option_desc] AS [page_verify_option]
	,CASE
		WHEN [page_verify_option_desc] LIKE 'NONE' THEN 'Detect page corruption is OFF'
		WHEN [page_verify_option_desc] LIKE 'TORN_PAGE_DETECTION' THEN 'Detect partial page writes only'
		WHEN [page_verify_option_desc] LIKE 'CHECKSUM' THEN 'OK'
		ELSE 'CHECK page verification option SETTING'
	END AS [page_verify_option_SETTING_STATUS]

FROM sys.databases
ORDER BY [page_verify_option_SETTING_STATUS] ASC




--=====================================================================================================================
--=====================================================================================================================

-- CHECK FILE GROWTH AND SIZE SETTINGS


SELECT
    db.name AS DatabaseName,
    mf.name AS FileName,


    mf.type_desc AS FileType,
    mf.size * 8 / 1024 AS CurrentSizeMB,
	 mf.max_size / 128 AS MaxSizeMB,
	 	CASE WHEN (mf.max_size / 128) = 0  THEN 'OK (UNLIMITED)'
		ELSE'FILE SIZE IS LIMITED'
	END [FILE_SIZE_SETTING_STATUS],

    CASE
        WHEN mf.is_percent_growth = 1 THEN CAST(mf.growth AS NVARCHAR(10)) + ' %'
        ELSE CAST(mf.growth * 8 / 1024 AS NVARCHAR(10)) + ' MB'
    END AS GrowthSetting,
   
	CASE WHEN  mf.is_percent_growth = 1  THEN 'CHECK GROWTH SETTING - GROWTH SET TO HIGH'
		WHEN (mf.growth * 8 / 1024) < 64 THEN 'CHECK GROWTH SETTING - GROWTH SET TO LOW'
		WHEN (mf.size * 8 / 1024) > 64 and (mf.growth * 8 / 1024) > ((mf.size * 8 / 1024)*2) THEN 'CHECK GROWTH SETTING - GROWTH MIGHT BE SET TO HIGH'
		WHEN (mf.growth * 8 / 1024) < ((mf.size * 8 / 1024)/200) THEN 'CHECK GROWTH SETTING - GROWTH MIGHT BE SET TO LOW' 
		ELSE 'OK'
	END AS [FILE_GROWTH_SETTING_STATUS],
	mf.physical_name AS [physical_path],
	LEFT(mf.physical_name, 1) AS File_Drive_Letter,
	(SELECT TOP (1) [FreeGB] FROM [SNOOPER].[dbo].[drives_info_metric] AS dr WHERE dr.[DriveLetter] =  (LEFT(mf.physical_name, 1))  ORDER BY [date] DESC) AS [Drive_free_space]

FROM
    sys.master_files AS mf
JOIN
    sys.databases AS db ON db.database_id = mf.database_id
ORDER BY
    db.name, mf.type_desc;



--=====================================================================================================================
--=====================================================================================================================


--  CHECK QUERY STORE SETTING STATUS

SELECT 
    name AS DatabaseName,
    is_query_store_on AS QueryStoreStatus,
	CASE WHEN is_query_store_on = 1 THEN 'Query Store is active'
	ELSE 'Query Store is inactive'
	END AS [Query_Store_Status]

FROM 
    sys.databases
ORDER BY is_query_store_on ASC;



--=====================================================================================================================
--=====================================================================================================================


 -- 7. DB is_auto setting

 SELECT TOP (1000) [database_id]
      ,[name]
      ,[is_auto_close_on]
      ,[is_auto_shrink_on]
      ,[is_auto_create_stats_on]
      ,[is_auto_create_stats_incremental_on]
      ,[is_auto_update_stats_on]
      ,[is_auto_update_stats_async_on]
      ,[is_ansi_null_default_on]
  FROM [SNOOPER].[dbo].[v_DB_is_auto]

  --=====================================================================================================================
--=====================================================================================================================



 -- 8. DB_state_and_status

 SELECT *
  FROM [SNOOPER].[dbo].[v_DB_state_and_status]




 --=====================================================================================================================
--=====================================================================================================================



END -- END OF SP
GO
/****** Object:  StoredProcedure [dbo].[sp_USER_TABLES_SUITABLE_FOR_PARTITIONING_ALL_DB]    Script Date: 03/12/2024 21:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






/* =============================================
 Author:		Ivgeni Dvorkin
 Create date: 26/10/2024
 Description:	
	find tables suitable for partitioning for all databases
	meaning: tables larger than 50GB.
	if there are no tables to match the criteria an empty table will be returned.
 =============================================*/


CREATE PROCEDURE [dbo].[sp_USER_TABLES_SUITABLE_FOR_PARTITIONING_ALL_DB]



AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;






declare @sql nvarchar(max) = '
use [?]

;WITH TableSizes AS (
    SELECT 
		''?'' as db_name,
        t.object_id,
        s.name AS SchemaName,
        t.name AS TableName,
        p.rows AS RowCounts,
        SUM(a.total_pages) * 8 / 1024 AS TotalSizeMB,
        SUM(a.used_pages) * 8 / 1024 AS UsedSizeMB,
        SUM(a.data_pages) * 8 / 1024 AS DataSizeMB
    FROM 
        sys.tables AS t
    INNER JOIN 
        sys.schemas AS s ON t.schema_id = s.schema_id
    INNER JOIN 
        sys.indexes AS i ON t.object_id = i.object_id
    INNER JOIN 
        sys.partitions AS p ON i.object_id = p.object_id AND i.index_id = p.index_id
    INNER JOIN 
        sys.allocation_units AS a ON p.partition_id = a.container_id
 
    GROUP BY 
        t.object_id, s.name, t.name, p.rows
)
SELECT 
db_name,
    SchemaName,
    TableName,
    RowCounts,
    TotalSizeMB,
    UsedSizeMB,
    DataSizeMB
FROM 
    TableSizes
	where TotalSizeMB > 50000 -- 50 GB
ORDER BY 
    TotalSizeMB DESC;';


execute sp_MSforeachdb @sql;







END -- END OF SP
GO
USE [master]
GO
ALTER DATABASE [SNOOPER] SET  READ_WRITE 
GO







--__CREATE TABLE jobs_to_run


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

