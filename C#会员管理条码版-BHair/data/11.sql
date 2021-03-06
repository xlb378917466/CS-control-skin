USE [master]
GO
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 05/08/2013 17:36:57 ******/
/* To avoid disclosure of passwords, the password is generated in script. */
declare @idx as int
declare @randomPwd as nvarchar(64)
declare @rnd as float
select @idx = 0
select @randomPwd = N''
select @rnd = rand((@@CPU_BUSY % 100) + ((@@IDLE % 100) * 100) + 
       (DATEPART(ss, GETDATE()) * 10000) + ((cast(DATEPART(ms, GETDATE()) as int) % 100) * 1000000))
while @idx < 64
begin
   select @randomPwd = @randomPwd + char((cast((@rnd * 83) as int) + 43))
   select @idx = @idx + 1
select @rnd = rand()
end
IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE name = N'##MS_PolicyEventProcessingLogin##')
BEGIN
EXEC master.dbo.sp_addlogin @loginame = N'##MS_PolicyEventProcessingLogin##', @passwd = @randomPwd, @defdb = N'master', @deflanguage = N'us_english'
END
GO
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 05/08/2013 17:36:57 ******/
/* To avoid disclosure of passwords, the password is generated in script. */
declare @idx as int
declare @randomPwd as nvarchar(64)
declare @rnd as float
select @idx = 0
select @randomPwd = N''
select @rnd = rand((@@CPU_BUSY % 100) + ((@@IDLE % 100) * 100) + 
       (DATEPART(ss, GETDATE()) * 10000) + ((cast(DATEPART(ms, GETDATE()) as int) % 100) * 1000000))
while @idx < 64
begin
   select @randomPwd = @randomPwd + char((cast((@rnd * 83) as int) + 43))
   select @idx = @idx + 1
select @rnd = rand()
end
IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE name = N'##MS_PolicyTsqlExecutionLogin##')
BEGIN
EXEC master.dbo.sp_addlogin @loginame = N'##MS_PolicyTsqlExecutionLogin##', @passwd = @randomPwd, @defdb = N'master', @deflanguage = N'us_english'
END
GO
/****** Object:  Login [DSNE0ICL5CP7SB3\Administrator]    Script Date: 05/08/2013 17:36:57 ******/
IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE name = N'DSNE0ICL5CP7SB3\Administrator')
BEGIN
EXEC master.dbo.sp_grantlogin @loginame = N'DSNE0ICL5CP7SB3\Administrator'
EXEC master.dbo.sp_defaultdb @loginame = N'DSNE0ICL5CP7SB3\Administrator', @defdb = N'master'
EXEC master.dbo.sp_defaultlanguage @loginame = N'DSNE0ICL5CP7SB3\Administrator', @language = N'简体中文'
END
GO
/****** Object:  Login [NT AUTHORITY\NETWORK SERVICE]    Script Date: 05/08/2013 17:36:57 ******/
IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE name = N'NT AUTHORITY\NETWORK SERVICE')
BEGIN
EXEC master.dbo.sp_grantlogin @loginame = N'NT AUTHORITY\NETWORK SERVICE'
EXEC master.dbo.sp_defaultdb @loginame = N'NT AUTHORITY\NETWORK SERVICE', @defdb = N'master'
EXEC master.dbo.sp_defaultlanguage @loginame = N'NT AUTHORITY\NETWORK SERVICE', @language = N'简体中文'
END
GO
/****** Object:  Login [NT AUTHORITY\SYSTEM]    Script Date: 05/08/2013 17:36:57 ******/
IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE name = N'NT AUTHORITY\SYSTEM')
BEGIN
EXEC master.dbo.sp_grantlogin @loginame = N'NT AUTHORITY\SYSTEM'
EXEC master.dbo.sp_defaultdb @loginame = N'NT AUTHORITY\SYSTEM', @defdb = N'master'
EXEC master.dbo.sp_defaultlanguage @loginame = N'NT AUTHORITY\SYSTEM', @language = N'简体中文'
END
GO
/****** Object:  Login [NT SERVICE\MSSQLSERVER]    Script Date: 05/08/2013 17:36:57 ******/
IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE name = N'NT SERVICE\MSSQLSERVER')
BEGIN
EXEC master.dbo.sp_grantlogin @loginame = N'NT SERVICE\MSSQLSERVER'
EXEC master.dbo.sp_defaultdb @loginame = N'NT SERVICE\MSSQLSERVER', @defdb = N'master'
EXEC master.dbo.sp_defaultlanguage @loginame = N'NT SERVICE\MSSQLSERVER', @language = N'简体中文'
END
GO
/****** Object:  Login [NT SERVICE\SQLSERVERAGENT]    Script Date: 05/08/2013 17:36:57 ******/
IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE name = N'NT SERVICE\SQLSERVERAGENT')
BEGIN
EXEC master.dbo.sp_grantlogin @loginame = N'NT SERVICE\SQLSERVERAGENT'
EXEC master.dbo.sp_defaultdb @loginame = N'NT SERVICE\SQLSERVERAGENT', @defdb = N'master'
EXEC master.dbo.sp_defaultlanguage @loginame = N'NT SERVICE\SQLSERVERAGENT', @language = N'简体中文'
END
GO
USE [BHairDB]
GO
/****** Object:  Table [dbo].[wastebook]    Script Date: 05/08/2013 17:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[wastebook]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[wastebook](
	[wbid] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[wbsid] [int] NULL,
	[wbincome] [money] NULL,
	[wbexpend] [money] NULL,
	[wbdate] [datetime] NULL,
	[wbremark] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NULL,
	[wbtype] [char](1) COLLATE Chinese_PRC_CI_AS NULL,
 CONSTRAINT [PK_wastebook] PRIMARY KEY CLUSTERED 
(
	[wbid] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[wastebook] ON
INSERT [dbo].[wastebook] ([wbid], [wbsid], [wbincome], [wbexpend], [wbdate], [wbremark], [wbtype]) VALUES (CAST(1 AS Decimal(18, 0)), 100, 0.0000, 0.0000, CAST(0x0000A14701747470 AS DateTime), N'', CONVERT(TEXT, N'e' COLLATE Chinese_PRC_CI_AS))
SET IDENTITY_INSERT [dbo].[wastebook] OFF
/****** Object:  Table [dbo].[sysconfig]    Script Date: 05/08/2013 17:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[sysconfig]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[sysconfig](
	[varindex] [int] NOT NULL,
	[varname] [nvarchar](20) COLLATE Chinese_PRC_CI_AS NULL,
	[vartype] [nvarchar](10) COLLATE Chinese_PRC_CI_AS NULL,
	[varvalue] [nvarchar](20) COLLATE Chinese_PRC_CI_AS NULL,
	[varinfo] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NULL,
 CONSTRAINT [PK_sysconfig] PRIMARY KEY CLUSTERED 
(
	[varindex] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[sysconfig] ([varindex], [varname], [vartype], [varvalue], [varinfo]) VALUES (0, N'cfg_deposit_money', N'money', N'100', N'充值基数金额，最小100元')
INSERT [dbo].[sysconfig] ([varindex], [varname], [vartype], [varvalue], [varinfo]) VALUES (1, N'cfg_deposit_send', N'money', N'5', N'充值增送金额，权限大于有效时间')
INSERT [dbo].[sysconfig] ([varindex], [varname], [vartype], [varvalue], [varinfo]) VALUES (2, N'cfg_deposit_start', N'datetime', N'2012-02-18 00:00:00', N'充值增送开始时间')
INSERT [dbo].[sysconfig] ([varindex], [varname], [vartype], [varvalue], [varinfo]) VALUES (3, N'cfg_deposit_finish', N'datetime', N'2012-02-18 23:59:59', N'充值增送结束时间')
/****** Object:  Table [dbo].[subject]    Script Date: 05/08/2013 17:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[subject]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[subject](
	[sid] [int] IDENTITY(100,1) NOT NULL,
	[sname] [nvarchar](30) COLLATE Chinese_PRC_CI_AS NULL,
	[stype] [tinyint] NULL,
	[sreadme] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NULL,
	[senabled] [tinyint] NULL,
 CONSTRAINT [PK_subject] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[subject] ON
INSERT [dbo].[subject] ([sid], [sname], [stype], [sreadme], [senabled]) VALUES (100, N'买菜', 0, N'买菜', 0)
INSERT [dbo].[subject] ([sid], [sname], [stype], [sreadme], [senabled]) VALUES (101, N'其它', 1, N'', 0)
SET IDENTITY_INSERT [dbo].[subject] OFF
/****** Object:  StoredProcedure [dbo].[SP_Pagination]    Script Date: 05/08/2013 17:36:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SP_Pagination]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_Pagination]
	@Tables [varchar](2000),
	@PrimaryKey [varchar](500),
	@Sort [varchar](500) = NULL,
	@CurrentPage [int] = 1,
	@PageSize [int] = 10,
	@Fields [varchar](2000) = ''*'',
	@Filter [varchar](1000) = NULL,
	@Group [varchar](1000) = NULL
AS
/**//*默认排序*/
IF @Sort IS NULL OR @Sort = ''''
SET @Sort = @PrimaryKey
DECLARE @SortTable varchar(1000)
DECLARE @SortName varchar(1000)
DECLARE @strSortColumn varchar(1000)
DECLARE @operator char(2)
DECLARE @type varchar(1000)
DECLARE @prec int
/**//*设定排序语句.*/
IF CHARINDEX(''DESC'',@Sort)>0
BEGIN
SET @strSortColumn = REPLACE(@Sort, ''DESC'', '''')
SET @operator = ''<=''
END
ELSE
BEGIN
IF CHARINDEX(''ASC'', @Sort) = 0
SET @strSortColumn = REPLACE(@Sort, ''ASC'', '''')
SET @operator = ''>=''
END
IF CHARINDEX(''.'', @strSortColumn) > 0
BEGIN
SET @SortTable = SUBSTRING(@strSortColumn, 0, CHARINDEX(''.'',@strSortColumn))
SET @SortName = SUBSTRING(@strSortColumn, CHARINDEX(''.'',@strSortColumn) + 1, LEN(@strSortColumn))
END
ELSE
BEGIN
SET @SortTable = @Tables
SET @SortName = @strSortColumn
END
SELECT @type=t.name, @prec=c.prec
FROM sysobjects o 
JOIN syscolumns c on o.id=c.id
JOIN systypes t on c.xusertype=t.xusertype
WHERE o.name = @SortTable AND c.name = @SortName
IF CHARINDEX(''char'', @type) > 0
SET @type = @type + ''('' + CAST(@prec AS varchar) + '')''
DECLARE @strPageSize varchar(500)
DECLARE @strStartRow varchar(500)
DECLARE @strFilter varchar(1000)
DECLARE @strSimpleFilter varchar(1000)
DECLARE @strGroup varchar(1000)
/**//*默认当前页*/
IF @CurrentPage < 1
SET @CurrentPage = 1
/**//*设置分页参数.*/
SET @strPageSize = CAST(@PageSize AS varchar(500))
SET @strStartRow = CAST(((@CurrentPage - 1)*@PageSize + 1) AS varchar(500))
/**//*筛选以及分组语句.*/
IF @Filter IS NOT NULL AND @Filter != ''''
BEGIN
SET @strFilter = '' WHERE '' + @Filter + '' ''
SET @strSimpleFilter = '' AND '' + @Filter + '' ''
END
ELSE
BEGIN
SET @strSimpleFilter = ''''
SET @strFilter = ''''
END
IF @Group IS NOT NULL AND @Group != ''''
SET @strGroup = '' GROUP BY '' + @Group + '' ''
ELSE
SET @strGroup = ''''
/**//*执行查询语句*/
EXEC(
''
DECLARE @SortColumn '' + @type + ''
SET ROWCOUNT '' + @strStartRow + ''
SELECT @SortColumn='' + @strSortColumn + '' FROM '' + @Tables + @strFilter + '' '' + @strGroup + '' ORDER BY '' + @Sort + ''
SET ROWCOUNT '' + @strPageSize + ''
SELECT '' + @Fields + '' FROM '' + @Tables + '' WHERE '' + @strSortColumn + @operator + '' @SortColumn '' + @strSimpleFilter + '' '' + @strGroup + '' ORDER BY '' + @Sort + ''
''
)


' 
END
GO
/****** Object:  Table [dbo].[post]    Script Date: 05/08/2013 17:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[post]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[post](
	[pid] [int] IDENTITY(1,1) NOT NULL,
	[pname] [nvarchar](30) COLLATE Chinese_PRC_CI_AS NULL,
	[preadme] [nvarchar](300) COLLATE Chinese_PRC_CI_AS NULL,
	[pmode] [tinyint] NULL,
	[psort] [tinyint] NULL,
	[psalary] [smallmoney] NULL,
	[pbonus] [float] NULL,
 CONSTRAINT [PK_post] PRIMARY KEY CLUSTERED 
(
	[pid] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[post] ON
INSERT [dbo].[post] ([pid], [pname], [preadme], [pmode], [psort], [psalary], [pbonus]) VALUES (1, N'经理', N'', 2, 0, 9999.0000, 0.2)
INSERT [dbo].[post] ([pid], [pname], [preadme], [pmode], [psort], [psalary], [pbonus]) VALUES (2, N'理发师', N'', 2, 1, 2000.0000, 0.1)
INSERT [dbo].[post] ([pid], [pname], [preadme], [pmode], [psort], [psalary], [pbonus]) VALUES (3, N'洗头师', N'', 2, 2, 1500.0000, 0.1)
INSERT [dbo].[post] ([pid], [pname], [preadme], [pmode], [psort], [psalary], [pbonus]) VALUES (4, N'服务员', N'', 0, 3, 1500.0000, 0)
SET IDENTITY_INSERT [dbo].[post] OFF
/****** Object:  Table [dbo].[pays]    Script Date: 05/08/2013 17:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[pays]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[pays](
	[pid] [varchar](50) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[pmid] [nvarchar](20) COLLATE Chinese_PRC_CI_AS NULL,
	[peid1] [int] NULL,
	[peid2] [int] NULL,
	[peid3] [int] NULL,
	[pmoney] [money] NULL,
	[pcash] [money] NULL,
	[pzero] [money] NULL,
	[ptype] [tinyint] NULL,
	[pdate] [datetime] NULL,
	[premark] [nvarchar](500) COLLATE Chinese_PRC_CI_AS NULL,
	[pstatus] [tinyint] NULL,
	[pcall] [tinyint] NULL,
 CONSTRAINT [PK_pays] PRIMARY KEY CLUSTERED 
(
	[pid] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[pays] ([pid], [pmid], [peid1], [peid2], [peid3], [pmoney], [pcash], [pzero], [ptype], [pdate], [premark], [pstatus], [pcall]) VALUES (CONVERT(TEXT, N'XF20130115234640' COLLATE Chinese_PRC_CI_AS), N'0', 4, 4, 4, 100.0000, 0.0000, 0.0000, 0, CAST(0x0000A1470187F824 AS DateTime), N'', 0, 0)
INSERT [dbo].[pays] ([pid], [pmid], [peid1], [peid2], [peid3], [pmoney], [pcash], [pzero], [ptype], [pdate], [premark], [pstatus], [pcall]) VALUES (CONVERT(TEXT, N'XF20130115235406' COLLATE Chinese_PRC_CI_AS), N'0', 4, 4, 4, 100.0000, 100.0000, 0.0000, 0, CAST(0x0000A1470189F4BC AS DateTime), N'', 1, 0)
INSERT [dbo].[pays] ([pid], [pmid], [peid1], [peid2], [peid3], [pmoney], [pcash], [pzero], [ptype], [pdate], [premark], [pstatus], [pcall]) VALUES (CONVERT(TEXT, N'XF20130116045114' COLLATE Chinese_PRC_CI_AS), N'111', 5, 0, 0, 100.0000, 100.0000, 0.0000, 1, CAST(0x0000A148005006B8 AS DateTime), N'
[现金+余额]现金：100.00；刷卡：0.00；', 1, 0)
INSERT [dbo].[pays] ([pid], [pmid], [peid1], [peid2], [peid3], [pmoney], [pcash], [pzero], [ptype], [pdate], [premark], [pstatus], [pcall]) VALUES (CONVERT(TEXT, N'XF20130117084118' COLLATE Chinese_PRC_CI_AS), N'71', 0, 0, 0, 720.0000, 0.0000, 0.0000, 0, CAST(0x0000A149008F2E32 AS DateTime), N'金额消费', 0, 0)
INSERT [dbo].[pays] ([pid], [pmid], [peid1], [peid2], [peid3], [pmoney], [pcash], [pzero], [ptype], [pdate], [premark], [pstatus], [pcall]) VALUES (CONVERT(TEXT, N'XF20130117215935' COLLATE Chinese_PRC_CI_AS), N'10', 0, 0, 0, 9.0000, 0.0000, 0.0000, 0, CAST(0x0000A149016A7039 AS DateTime), N'金额消费', 0, 0)
INSERT [dbo].[pays] ([pid], [pmid], [peid1], [peid2], [peid3], [pmoney], [pcash], [pzero], [ptype], [pdate], [premark], [pstatus], [pcall]) VALUES (CONVERT(TEXT, N'XF20130117224430' COLLATE Chinese_PRC_CI_AS), N'10', 0, 0, 0, 675.0000, 0.0000, 0.0000, 0, CAST(0x0000A1490176C5BC AS DateTime), N'金额消费', 0, 0)
INSERT [dbo].[pays] ([pid], [pmid], [peid1], [peid2], [peid3], [pmoney], [pcash], [pzero], [ptype], [pdate], [premark], [pstatus], [pcall]) VALUES (CONVERT(TEXT, N'XF20130117230235' COLLATE Chinese_PRC_CI_AS), N'8', 0, 0, 0, 11.4000, 0.0000, 0.0000, 0, CAST(0x0000A149017BBDC5 AS DateTime), N'金额消费', 0, 0)
INSERT [dbo].[pays] ([pid], [pmid], [peid1], [peid2], [peid3], [pmoney], [pcash], [pzero], [ptype], [pdate], [premark], [pstatus], [pcall]) VALUES (CONVERT(TEXT, N'XF20130117230615' COLLATE Chinese_PRC_CI_AS), N'143', 0, 0, 0, 11.4000, 0.0000, 0.0000, 0, CAST(0x0000A149017CBFB5 AS DateTime), N'金额消费', 0, 0)
INSERT [dbo].[pays] ([pid], [pmid], [peid1], [peid2], [peid3], [pmoney], [pcash], [pzero], [ptype], [pdate], [premark], [pstatus], [pcall]) VALUES (CONVERT(TEXT, N'XF20130117233251' COLLATE Chinese_PRC_CI_AS), N'71', 0, 0, 0, 10.8000, 0.0000, 0.0000, 0, CAST(0x0000A14901840D3D AS DateTime), N'金额消费', 1, 0)
INSERT [dbo].[pays] ([pid], [pmid], [peid1], [peid2], [peid3], [pmoney], [pcash], [pzero], [ptype], [pdate], [premark], [pstatus], [pcall]) VALUES (CONVERT(TEXT, N'XF20130119000609' COLLATE Chinese_PRC_CI_AS), N'96', 0, 0, 0, 85.5000, 0.0000, 0.0000, 0, CAST(0x0000A14B0001B0C8 AS DateTime), N'金额消费', 1, 0)
INSERT [dbo].[pays] ([pid], [pmid], [peid1], [peid2], [peid3], [pmoney], [pcash], [pzero], [ptype], [pdate], [premark], [pstatus], [pcall]) VALUES (CONVERT(TEXT, N'XF20130119001530' COLLATE Chinese_PRC_CI_AS), N'93', 0, 0, 0, 95.0000, 0.0000, 0.0000, 0, CAST(0x0000A14B00044287 AS DateTime), N'金额消费', 1, 0)
INSERT [dbo].[pays] ([pid], [pmid], [peid1], [peid2], [peid3], [pmoney], [pcash], [pzero], [ptype], [pdate], [premark], [pstatus], [pcall]) VALUES (CONVERT(TEXT, N'XF20130119001616' COLLATE Chinese_PRC_CI_AS), N'93', 0, 0, 0, 95.0000, 0.0000, 0.0000, 0, CAST(0x0000A14B00047855 AS DateTime), N'金额消费', 1, 0)
INSERT [dbo].[pays] ([pid], [pmid], [peid1], [peid2], [peid3], [pmoney], [pcash], [pzero], [ptype], [pdate], [premark], [pstatus], [pcall]) VALUES (CONVERT(TEXT, N'XF20130119003639' COLLATE Chinese_PRC_CI_AS), N'91', 0, 0, 0, 95.0000, 0.0000, 0.0000, 0, CAST(0x0000A14B000A1123 AS DateTime), N'实收金额95刷卡0.0000', 1, 0)
INSERT [dbo].[pays] ([pid], [pmid], [peid1], [peid2], [peid3], [pmoney], [pcash], [pzero], [ptype], [pdate], [premark], [pstatus], [pcall]) VALUES (CONVERT(TEXT, N'XF20130119004018' COLLATE Chinese_PRC_CI_AS), N'97', 0, 0, 0, 855.0000, 0.0000, 0.0000, 0, CAST(0x0000A14B000B1238 AS DateTime), N'实收金额765刷卡90.0000', 1, 0)
INSERT [dbo].[pays] ([pid], [pmid], [peid1], [peid2], [peid3], [pmoney], [pcash], [pzero], [ptype], [pdate], [premark], [pstatus], [pcall]) VALUES (CONVERT(TEXT, N'XF20130119004120' COLLATE Chinese_PRC_CI_AS), N'804', 0, 0, 0, 85.5000, 0.0000, 0.0000, 0, CAST(0x0000A14B000B5A44 AS DateTime), N'实收金额85.5刷卡0.0000', 1, 0)
INSERT [dbo].[pays] ([pid], [pmid], [peid1], [peid2], [peid3], [pmoney], [pcash], [pzero], [ptype], [pdate], [premark], [pstatus], [pcall]) VALUES (CONVERT(TEXT, N'XF20130119005627' COLLATE Chinese_PRC_CI_AS), N'96', 0, 0, 0, 85.5000, 0.0000, 0.0000, 0, CAST(0x0000A14B000F8221 AS DateTime), N'实收金额0刷卡85.5', 1, 0)
INSERT [dbo].[pays] ([pid], [pmid], [peid1], [peid2], [peid3], [pmoney], [pcash], [pzero], [ptype], [pdate], [premark], [pstatus], [pcall]) VALUES (CONVERT(TEXT, N'XF20130119010042' COLLATE Chinese_PRC_CI_AS), N'96', 0, 0, 0, 85.5000, 0.0000, 0.0000, 0, CAST(0x0000A14B0010AC4B AS DateTime), N'实收金额0刷卡85.5', 1, 0)
INSERT [dbo].[pays] ([pid], [pmid], [peid1], [peid2], [peid3], [pmoney], [pcash], [pzero], [ptype], [pdate], [premark], [pstatus], [pcall]) VALUES (CONVERT(TEXT, N'XF20130119010751' COLLATE Chinese_PRC_CI_AS), N'0', 5, 4, 5, 100.0000, 100.0000, 0.0000, 0, CAST(0x0000A14B0012AC14 AS DateTime), N'', 1, 0)
INSERT [dbo].[pays] ([pid], [pmid], [peid1], [peid2], [peid3], [pmoney], [pcash], [pzero], [ptype], [pdate], [premark], [pstatus], [pcall]) VALUES (CONVERT(TEXT, N'XF20133215113211' COLLATE Chinese_PRC_CI_AS), N'0', 4, 4, 4, 100.0000, 0.0000, 0.0000, 0, CAST(0x0000A14701841664 AS DateTime), N'', 0, 0)
INSERT [dbo].[pays] ([pid], [pmid], [peid1], [peid2], [peid3], [pmoney], [pcash], [pzero], [ptype], [pdate], [premark], [pstatus], [pcall]) VALUES (CONVERT(TEXT, N'XF20133515113552' COLLATE Chinese_PRC_CI_AS), N'0', 4, 4, 4, 100.0000, 0.0000, 0.0000, 0, CAST(0x0000A1470185031C AS DateTime), N'', 0, 0)
INSERT [dbo].[pays] ([pid], [pmid], [peid1], [peid2], [peid3], [pmoney], [pcash], [pzero], [ptype], [pdate], [premark], [pstatus], [pcall]) VALUES (CONVERT(TEXT, N'XF20133615113647' COLLATE Chinese_PRC_CI_AS), N'0', 4, 4, 4, 100.0000, 0.0000, 0.0000, 0, CAST(0x0000A14701853328 AS DateTime), N'', 0, 0)
INSERT [dbo].[pays] ([pid], [pmid], [peid1], [peid2], [peid3], [pmoney], [pcash], [pzero], [ptype], [pdate], [premark], [pstatus], [pcall]) VALUES (CONVERT(TEXT, N'XF20133815113853' COLLATE Chinese_PRC_CI_AS), N'0', 4, 4, 5, 100.0000, 0.0000, 0.0000, 0, CAST(0x0000A1470185C5A4 AS DateTime), N'', 0, 0)
/****** Object:  Table [dbo].[paydetails]    Script Date: 05/08/2013 17:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[paydetails]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[paydetails](
	[pdid] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[pdpid] [nvarchar](64) COLLATE Chinese_PRC_CI_AS NULL,
	[pdiid] [int] NULL,
	[pdnum] [tinyint] NULL,
	[pbonus] [float] NULL,
	[pmoney] [money] NULL,
 CONSTRAINT [PK_paydetails] PRIMARY KEY CLUSTERED 
(
	[pdid] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[paydetails] ON
INSERT [dbo].[paydetails] ([pdid], [pdpid], [pdiid], [pdnum], [pbonus], [pmoney]) VALUES (CAST(7 AS Numeric(18, 0)), N'XF20130', 1002, 1, 1, 100.0000)
INSERT [dbo].[paydetails] ([pdid], [pdpid], [pdiid], [pdnum], [pbonus], [pmoney]) VALUES (CAST(8 AS Numeric(18, 0)), N'XF20130115234640', 1002, 1, 1, 100.0000)
INSERT [dbo].[paydetails] ([pdid], [pdpid], [pdiid], [pdnum], [pbonus], [pmoney]) VALUES (CAST(9 AS Numeric(18, 0)), N'XF20130115234640', 1002, 1, 1, 100.0000)
INSERT [dbo].[paydetails] ([pdid], [pdpid], [pdiid], [pdnum], [pbonus], [pmoney]) VALUES (CAST(10 AS Numeric(18, 0)), N'XF20130115235406', 1002, 1, 1, 100.0000)
INSERT [dbo].[paydetails] ([pdid], [pdpid], [pdiid], [pdnum], [pbonus], [pmoney]) VALUES (CAST(11 AS Numeric(18, 0)), N'XF20130116045114', 1002, 1, 1, 100.0000)
INSERT [dbo].[paydetails] ([pdid], [pdpid], [pdiid], [pdnum], [pbonus], [pmoney]) VALUES (CAST(12 AS Numeric(18, 0)), N'XF20130119010751', 1002, 1, 1, 100.0000)
SET IDENTITY_INSERT [dbo].[paydetails] OFF
/****** Object:  Table [dbo].[member]    Script Date: 05/08/2013 17:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[member]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[member](
	[mid] [nvarchar](12) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[mname] [nvarchar](30) COLLATE Chinese_PRC_CI_AS NULL,
	[mstatus] [tinyint] NULL,
	[mcid] [int] NULL,
	[mpass] [nvarchar](32) COLLATE Chinese_PRC_CI_AS NULL,
	[mremark] [nvarchar](400) COLLATE Chinese_PRC_CI_AS NULL,
	[msex] [tinyint] NULL,
	[mmonth] [tinyint] NULL,
	[mday] [tinyint] NULL,
	[mphone] [nvarchar](13) COLLATE Chinese_PRC_CI_AS NULL,
	[maddress] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NULL,
	[mother] [nvarchar](400) COLLATE Chinese_PRC_CI_AS NULL,
	[mjoin] [datetime] NULL,
	[midcard] [nvarchar](18) COLLATE Chinese_PRC_CI_AS NULL,
	[mbalance] [money] NULL,
	[mpoint] [int] NULL,
	[mlastime] [datetime] NULL,
	[mCount] [int] NULL,
 CONSTRAINT [PK_member] PRIMARY KEY CLUSTERED 
(
	[mid] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'00001', N'李碧', 1, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 9, 27, N'13000000000', N'', N'', CAST(0x00009FA000000000 AS DateTime), N'', 14.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'01', N'散客会员', 1, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 0, 0, N'13000000000', N'', N'换了卡', CAST(0x00009F6800000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'10', N'张志', 1, 5, N'CFCD208495D565EF66E7DFF9F98764DA', N'余额折现7块，暂时停用', 1, 4, 21, N'13000000000', N'', N'充费改等级', CAST(0x00009F3200000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'100', N'熊亮', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 7, 8, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 11.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'101', N'唐泽燕', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 2, 6, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'102', N'张梅', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 9, 14, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'104', N'李刚', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 5, 13, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'105', N'陈永松', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 8, 16, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'106', N'龚文波', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 6, 12, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'107', N'郑雄帆', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 3, 12, N'13000000000', N'', N'', CAST(0x00009F8500000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'108', N'唐玉权', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 6, 1, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'109', N'梅枚', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 9, 15, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'11', N'杨秀刚', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 4, 22, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'111', N'罗文菊', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 8, 20, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, CAST(0x0000A148005006B8 AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'112', N'张晓梅', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 7, 18, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'113', N'周彬', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 11, 21, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'114', N'李仕贵', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 8, 8, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'115', N'欧红', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 9, 10, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 88.0000, 0, CAST(0x00009FFC01193574 AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'116', N'王晓丽', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 12, 25, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'117', N'余乐', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 12, 24, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'118', N'黄英', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 10, 10, N'13000000000', N'', N'卡掉了', CAST(0x00009F3100000000 AS DateTime), N'', 44.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'119', N'张雪超', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 2, 11, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'120', N'周颖', 0, 3, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 10, 8, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), N'', 96.0000, 0, CAST(0x00009FFB01188480 AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'121', N'唐飞飞', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 8, 13, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'122', N'邹敏', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 2, 10, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'124', N'高艳', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 12, 31, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'125', N'敖文怡', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 1, 23, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), N'', 30.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'126', N'谢丽花', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 10, 22, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'127', N'陈翠容', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 8, 18, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'128', N'马璐', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 4, 18, N'13000000000', N'', N'12月4号退卡（罗琼）', CAST(0x00009F3100000000 AS DateTime), N'', 165.0000, 0, CAST(0x00009FFB01314BDC AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'129', N'马贵', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 11, 23, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'130', N'胡艳琴', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 2, 12, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'131', N'张肆江', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 9, 26, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'132', N'万小容', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 9, 15, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'133', N'贾新平', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 6, 1, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'134', N'张莉', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 9, 9, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'135', N'王颖', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 7, 7, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'136', N'卢萍', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 5, 16, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'137', N'陈燕', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 10, 17, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'138', N'王玉红', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 8, 3, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'14', N'颜媛', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 5, 4, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'140', N'贺英', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 8, 26, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 5.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'141', N'韦瑞', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 9, 11, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'142', N'周子琦', 0, 2, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 4, 13, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), N'', 145.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'143', N'司利娜', 1, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'暂时停用', 0, 3, 8, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'144', N'沈勇', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 7, 7, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'145', N'耿红岗', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 7, 27, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 16.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'146', N'王昌茂', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 1, 16, N'13000000000', N'', N'', CAST(0x00009FA800000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'147', N'关尔华', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 6, 14, N'13000000000', N'', N'', CAST(0x00009F8700000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'148', N'何玉萍', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 3, 2, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 15.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'149', N'何雪梅', 0, 3, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 4, 6, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 45.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'15', N'张孝静', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 11, 28, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), N'', 120.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'150', N'周娇', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 5, 6, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'154', N'黄媛涛', 1, 3, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 10, 22, N'13000000000', N'', N'合卡到181', CAST(0x00009F3100000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'155', N'卢伟', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 3, 21, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'156', N'张健康', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 6, 11, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'157', N'邓琴', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 6, 14, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'158', N'王雷', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 4, 28, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), N'', 22.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'159', N'余广明', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 8, 18, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'16', N'韦军', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 4, 20, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'160', N'罗锋', 1, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 3, 4, N'13000000000', N'', N'', CAST(0x00009F3400000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'161', N'黄艳', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 11, 2, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'162', N'张渝', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 2, 8, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'163', N'谢豪', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 6, 8, N'13000000000', N'', N'名字看不清', CAST(0x00009F3100000000 AS DateTime), N'', 42.0000, 0, CAST(0x00009FFC01582A40 AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'164', N'王昌茂', 1, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 1, 16, N'13000000000', N'', N'号错了，146', CAST(0x00009F9300000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'165', N'关小梅', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 6, 24, N'13000000000', N'', N'', CAST(0x00009F9000000000 AS DateTime), N'', 42.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'166', N'杨帆', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 3, 5, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'167', N'向燕', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 3, 25, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 10.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'168', N'罗小容', 0, 2, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 11, 9, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 25.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'169', N'刘虹', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 6, 21, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), N'', 60.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'17', N'陈思雨', 0, 5, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 6, 4, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 10.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'170', N'刘谊', 0, 2, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 6, 8, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), N'', 27.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'171', N'胡香', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 1, 28, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 29.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'172', N'何江霞', 0, 3, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 10, 27, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 96.0000, 0, CAST(0x00009FFE014CE3EC AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'173', N'李颜', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 7, 5, N'13000000000', N'', N'', CAST(0x00009F9500000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'174', N'乔宗渝', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 11, 5, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'175', N'张莉', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 11, 7, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 7.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'176', N'张晓', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 5, 3, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'177', N'谌晓燕', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 10, 20, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'178', N'舒欣', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 11, 9, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'179', N'唐小琴', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 6, 18, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'180', N'葛春丽', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 0, 0, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), N'', 23.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'181', N'熊瑜', 0, 3, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 5, 9, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 57.0000, 0, CAST(0x00009FFE00BC5548 AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'182', N'尹明亮', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 5, 21, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 5.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'183', N'杨鹏', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 7, 1, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'184', N'梁群', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 6, 1, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'185', N'秦', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 11, 5, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'186', N'张朝美', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 2, 23, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 94.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'187', N'罗霞', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 12, 8, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 9.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'188', N'曾友梅', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 8, 27, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'189', N'冉春', 0, 3, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 3, 17, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'19', N'韩霞', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 6, 18, N'13000000000', N'', N'有个重号', CAST(0x00009F3200000000 AS DateTime), N'', 69.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'191', N'黎元波', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 7, 4, N'13000000000', N'', N'', CAST(0x00009F3300000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'192', N'李琴', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 11, 7, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'193', N'陈蜀川', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 11, 7, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), N'', 12.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'194', N'胡胜', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 11, 29, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'195', N'黎旭', 0, 3, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 7, 1, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), N'', 48.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'196', N'丁晓林', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 12, 1, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'197', N'曾晓容', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 8, 19, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'198', N'王虹理', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 8, 21, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'199', N'谭智美', 0, 2, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 6, 29, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), N'', 16.0000, 0, NULL, NULL)
GO
print 'Processed 100 total records'
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'201', N'付红英', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 12, 25, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'202', N'杨啟伟', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 5, 13, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'203', N'李逸风', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 6, 30, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'204', N'艾小雪', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 7, 27, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'205', N'贾生文', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 11, 15, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'206', N'曾虹铭', 1, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 7, 10, N'13000000000', N'', N'退卡，待续', CAST(0x00009F3200000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'207', N'王艳红', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 5, 17, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 22.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'208', N'杨敏', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 11, 7, N'13000000000', N'', N'', CAST(0x00009FA700000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'209', N'杨在平', 0, 3, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 3, 9, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 74.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'21', N'保桃红', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 9, 12, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'210', N'谢天丽', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 1, 31, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'211', N'周惠', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 8, 8, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'212', N'袁凤莎', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 8, 18, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'213', N'敖余', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 5, 10, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'214', N'杨昌俊', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 1, 10, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'215', N'白洁', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 2, 1, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 23.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'216', N'陈兴翠', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 2, 14, N'13000000000', N'', N'充卡改等级（次数折合）', CAST(0x00009F3100000000 AS DateTime), N'', 20.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'217', N'梁霞', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 2, 15, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'218', N'张淑娟', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 10, 9, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'219', N'涂书瑞', 1, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 8, 1, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'220', N'徐之力', 0, 2, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 3, 9, N'13000000000', N'', N'', CAST(0x00009F3A00000000 AS DateTime), N'', 34.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'221', N'毛静红', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 4, 27, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 5.0000, 0, CAST(0x00009FFE00E267C4 AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'222', N'谢相宜', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 1, 9, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'223', N'李松蔚', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 4, 11, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'224', N'洪代琼', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 1, 19, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'225', N'朱晓碧', 0, 2, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 11, 2, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 38.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'226', N'钟钦', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 8, 29, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'229', N'杨晓敏', 0, 2, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 7, 19, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 115.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'230', N'曾静', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 4, 3, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'231', N'袁泌心', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 11, 17, N'13000000000', N'', N'', CAST(0x00009F4900000000 AS DateTime), N'', 79.0000, 0, CAST(0x00009FFC00CA8BF4 AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'232', N'詹有材', 0, 2, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 7, 19, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 8.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'233', N'牟奇发', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 9, 26, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'234', N'陈莉群', 0, 2, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 4, 15, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'235', N'朱颖', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 9, 9, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'236', N'秦怀', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 5, 2, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'237', N'张强', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 2, 23, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 50.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'238', N'徐晓娟', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 2, 20, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'239', N'秦森', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 11, 24, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 52.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'24', N'吕磊', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 2, 10, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'240', N'林格', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 12, 11, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 10.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'241', N'龚丽娟', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 6, 24, N'13000000000', N'', N'充卡改等级', CAST(0x00009F3100000000 AS DateTime), N'', 8.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'242', N'蒋就', 1, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 11, 7, N'13000000000', N'', N'退卡', CAST(0x00009F3100000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'243', N'周玉平', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 9, 6, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'244', N'史海林', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 12, 15, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 50.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'245', N'彭丽娟', 0, 2, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 9, 28, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 7.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'246', N'黄建瑜', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 12, 31, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'247', N'赵子翔', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 3, 2, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), N'', 1.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'248', N'贾江', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 5, 5, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'249', N'张英', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 2, 28, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 10.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'25', N'吴启萍', 0, 2, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 5, 3, N'13000000000', N'', N'充费要改等级（次数折合）', CAST(0x00009F3200000000 AS DateTime), N'', 12.0000, 0, CAST(0x00009FFC0157D004 AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'251', N'蒋明浩', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 8, 21, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'252', N'侯华强', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 9, 28, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'253', N'张俊', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 6, 21, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 14.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'254', N'唐秀', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 10, 4, N'13000000000', N'', N'农历', CAST(0x00009F3200000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'255', N'王雷', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 12, 14, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 26.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'256', N'罗方', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 2, 23, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 48.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'257', N'袁成', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 10, 3, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'258', N'柯小平', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 4, 19, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'259', N'谢春英', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 6, 21, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 5.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'26', N'余', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 10, 20, N'13000000000', N'', N'没找到', CAST(0x00009F3200000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'260', N'周平', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 6, 24, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'261', N'蹇代永', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 4, 24, N'13000000000', N'', N'', CAST(0x00009F8400000000 AS DateTime), N'', 20.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'262', N'张红莉', 0, 3, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 2, 18, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), N'', 123.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'263', N'董林', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 7, 1, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'264', N'周霞', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 4, 3, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'266', N'何贞容', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 7, 23, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'267', N'余樑', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 10, 20, N'13000000000', N'', N'', CAST(0x00009F3300000000 AS DateTime), N'', 87.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'268', N'杨晓红', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 12, 13, N'13000000000', N'', N'', CAST(0x00009F5000000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'27', N'游浩', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 4, 15, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'271', N'万婷婷', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 12, 14, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'272', N'吴喻', 1, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 5, 3, N'13000000000', N'', N'退卡', CAST(0x00009F3200000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'274', N'杨建', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 12, 6, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'275', N'王平', 0, 3, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 9, 5, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 74.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'276', N'饶俊梅', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 12, 14, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'277', N'不认识', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 12, 21, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'278', N'李艳琴', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 9, 9, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'279', N'温芝芝', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 4, 8, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'281', N'陈盼', 1, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 11, 1, N'13000000000', N'', N'退卡', CAST(0x00009F3200000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'282', N'杨成萍', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 10, 24, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'283', N'刘涛涛', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 10, 10, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'284', N'李林', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 1, 18, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'285', N'张勇', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 6, 11, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'286', N'廖云飞', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 8, 25, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'288', N'方贵素', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 3, 23, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 5.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'289', N'陈锋', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 2, 5, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'29', N'何', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 9, 4, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'290', N'张尹', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 9, 3, N'13000000000', N'', N'', CAST(0x00009FAB00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'291', N'吴梅', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 4, 24, N'13000000000', N'', N'', CAST(0x00009F4200000000 AS DateTime), N'', 3.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'292', N'全晓娟', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 4, 6, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'293', N'罗鑫', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 7, 18, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'294', N'程忠', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 4, 6, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'295', N'杜海渝', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 7, 13, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'296', N'黎力', 1, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'没留电话', 1, 10, 1, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), N'', 10.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'297', N'陈丹丹', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 3, 10, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'298', N'鞠文惠', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 12, 24, N'13000000000', N'', N'', CAST(0x00009FA600000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'299', N'罗攀', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 12, 23, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'3', N'王兴', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 10, 24, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 14.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'30', N'李雪瑞', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 8, 20, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 4.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'300', N'邹晋梅', 0, 3, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 5, 13, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), N'', 76.0000, 0, CAST(0x00009FFE00C7CE00 AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'31', N'魏敏', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 10, 2, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'32', N'蔡欧', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 12, 31, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 38.0000, 0, NULL, NULL)
GO
print 'Processed 200 total records'
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'33', N'李江松', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 5, 7, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'35', N'李凡', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 7, 25, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'36', N'冉林艳', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 10, 1, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'37', N'何早江', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 12, 20, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 21.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'38', N'胡悦', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 1, 27, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'39', N'杨娟', 0, 2, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 10, 1, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 39.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'40', N'朱领勋', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 11, 3, N'13000000000', N'', N'可能有50元', CAST(0x00009F3200000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'41', N'张玉婷', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 9, 26, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'42', N'毛小丽', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 1, 21, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'43', N'散客会员', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 9, 5, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'44', N'张金燕', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 9, 13, N'13000000000', N'', N'有重号', CAST(0x00009F3200000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'45', N'刘秀', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 2, 20, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'46', N'张斌', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 1, 12, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'48', N'刘波', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 7, 21, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 36.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'49', N'徐胜兰', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 2, 20, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'5', N'秦员园', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'余额70', 0, 9, 20, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 7.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'50', N'兰雪梅', 0, 2, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 10, 29, N'13000000000', N'', N'9月前充卡', CAST(0x00009F3200000000 AS DateTime), N'', 106.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'501', N'秦伟', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 7, 18, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'503', N'王献', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 10, 16, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), N'', 10.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'504', N'王婉月', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 2, 12, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'505', N'黄靖', 1, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 5, 16, N'13000000000', N'', N'没电话', CAST(0x00009F3100000000 AS DateTime), N'', 19.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'506', N'程迪昆', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 4, 14, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'507', N'兰秀均', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 1, 13, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'508', N'吴华淑', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 6, 26, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 74.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'509', N'万洋', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 7, 27, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 37.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'51', N'赵天秀', 1, 5, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 10, 27, N'13000000000', N'', N'充费改等级', CAST(0x00009F3100000000 AS DateTime), N'', 44.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'510', N'张洁', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 4, 2, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'511', N'彭雨涵', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 10, 7, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'512', N'黄强', 1, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 10, 4, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'513', N'霍斌橱', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 8, 3, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'514', N'王剑', 1, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 6, 7, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'515', N'谢文洋', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 9, 3, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 70.0000, 0, CAST(0x00009FFC00E9E170 AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'516', N'林科华', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 11, 6, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'517', N'郝童', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 4, 2, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'518', N'犹共宣', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 3, 24, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 37.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'519', N'黎春剑', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 5, 8, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'52', N'刘珂君', 0, 2, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 8, 30, N'13000000000', N'', N'', CAST(0x00009F3000000000 AS DateTime), N'', 93.0000, 0, CAST(0x00009FFB01590B40 AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'522', N'谌', 1, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 1, 15, N'13000000000', N'', N'名字不认识', CAST(0x00009F3100000000 AS DateTime), N'', 28.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'523', N'黄才明', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 3, 20, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 72.0000, 0, CAST(0x00009FFC00CCD008 AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'524', N'龙飞', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 1, 16, N'13000000000', N'', N'续费名字错了，（蒋鹏消卡）现在对的', CAST(0x00009F3100000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'525', N'肖敏', 0, 3, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 2, 21, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 34.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'526', N'唐伟', 0, 3, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 11, 13, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 56.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'527', N'李虹', 0, 3, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 3, 21, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'528', N'卢有桂', 0, 3, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 6, 29, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 158.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'529', N'李媛媛', 0, 3, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 3, 9, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 9.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'53', N'张云翔', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 2, 15, N'13000000000', N'', N'', CAST(0x00009F9800000000 AS DateTime), N'', 74.0000, 0, CAST(0x00009FFB0116EB84 AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'530', N'周永强', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 4, 2, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 80.0000, 0, CAST(0x00009FFC00C0BEF8 AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'531', N'汪俊荣', 1, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'暂时停用', 1, 10, 22, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), N'', 9.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'532', N'李义', 1, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 1, 11, N'13000000000', N'', N'没电话', CAST(0x00009F3100000000 AS DateTime), N'', 44.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'533', N'刘夜玲', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 10, 21, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'534', N'何展英', 0, 3, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 2, 16, N'13000000000', N'', N'不知道是不是六折', CAST(0x00009F3100000000 AS DateTime), N'', 163.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'535', N'连文荣', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 3, 30, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 16.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'536', N'曾胜', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 10, 16, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 49.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'537', N'刘江澜', 0, 3, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 7, 8, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), N'', 145.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'538', N'言欢', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 2, 3, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'539', N'周龚瑞', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 5, 2, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'54', N'任萍', 0, 2, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 6, 4, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 78.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'540', N'钱静', 0, 3, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 4, 21, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 115.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'541', N'吴俊芳', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 6, 20, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'542', N'田微', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 7, 21, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'543', N'杨', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 7, 19, N'13000000000', N'', N'名字不认识', CAST(0x00009F3100000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'544', N'李明明', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 7, 22, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'545', N'曹宇', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 12, 10, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'546', N'杨鹏飞', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 7, 10, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'547', N'常高林', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 11, 25, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'548', N'李书巧', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 1, 1, N'13000000000', N'', N'', CAST(0x00009F4A00000000 AS DateTime), N'', 29.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'55', N'张宇', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 1, 18, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'550', N'林蔚', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 3, 2, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'559', N'谢力', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 1, 15, N'13000000000', N'', N'', CAST(0x00009FC400000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'56', N'张敏', 0, 5, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 5, 22, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), N'', 12.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'562', N'李理', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 12, 26, N'13000000000', N'', N'', CAST(0x00009F5200000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'57', N'张玲', 0, 2, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 11, 18, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), N'', 38.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'58', N'张建', 0, 2, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 6, 7, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 6.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'581', N'邓重武', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 7, 3, N'13000000000', N'', N'', CAST(0x00009F4200000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'586', N'罗玉秀', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 11, 15, N'13000000000', N'', N'', CAST(0x00009F5E00000000 AS DateTime), N'', 99.0000, 0, CAST(0x00009FFE01305F24 AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'587', N'李凤', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 10, 9, N'13000000000', N'', N'', CAST(0x00009FCA00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'588', N'林静', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 1, 11, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'589', N'武成金', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 11, 23, N'13000000000', N'', N'', CAST(0x00009F5500000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'59', N'何倩', 0, 2, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 3, 22, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'6', N'彭涛', 1, 5, N'CFCD208495D565EF66E7DFF9F98764DA', N'暂时停用', 1, 12, 5, N'13000000000', N'', N'充卡换等级', CAST(0x00009F3200000000 AS DateTime), N'', 24.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'60', N'李永辉', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 2, 4, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'605', N'汤松', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 12, 4, N'13000000000', N'', N'', CAST(0x00009F9A00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'61', N'王凤玲', 0, 2, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 6, 1, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 31.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'62', N'彭传芳', 0, 2, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 2, 3, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), N'', 12.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'623', N'薛志雄', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 8, 24, N'13000000000', N'', N'', CAST(0x00009F4900000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'624', N'周建林', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 10, 10, N'13000000000', N'', N'', CAST(0x00009F9F00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'63', N'敖小英', 0, 2, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 1, 21, N'13000000000', N'', N'', CAST(0x00009F3000000000 AS DateTime), NULL, 10.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'633', N'黄光全', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 10, 6, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'634', N'龚君成', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 3, 27, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), N'', 89.0000, 0, CAST(0x00009FFD01424B08 AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'635', N'庄伟', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 2, 6, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), N'', 5.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'636', N'罗川东', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 1, 13, N'13000000000', N'', N'', CAST(0x00009F4600000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'637', N'张庆华', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 2, 3, N'13000000000', N'', N'', CAST(0x00009F5A00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'639', N'柳玉国', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 10, 10, N'13000000000', N'', N'', CAST(0x00009F3400000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'64', N'邱萌', 0, 2, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 7, 9, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 9.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'640', N'刘永平', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 6, 27, N'13000000000', N'', N'', CAST(0x00009F3400000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'641', N'杨锡兰', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 8, 16, N'13000000000', N'', N'', CAST(0x00009F3500000000 AS DateTime), N'', 85.0000, 0, CAST(0x00009FFB0118CAD0 AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'642', N'岑俊余', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 8, 26, N'13000000000', N'', N'', CAST(0x00009F3600000000 AS DateTime), N'', 70.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'643', N'周群', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 9, 19, N'13000000000', N'', N'', CAST(0x00009F3800000000 AS DateTime), N'', 12.0000, 0, CAST(0x00009FFD00FE3940 AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'644', N'邓丹科', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 10, 8, N'13000000000', N'', N'', CAST(0x00009F3D00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'645', N'陈俊', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 10, 5, N'13000000000', N'', N'电话多一位数', CAST(0x00009F3A00000000 AS DateTime), N'', 39.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'646', N'王丹', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 10, 17, N'13000000000', N'', N'', CAST(0x00009F3E00000000 AS DateTime), N'', 5.0000, 0, NULL, NULL)
GO
print 'Processed 300 total records'
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'647', N'胡亚玲', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 11, 25, N'13000000000', N'', N'', CAST(0x00009F3F00000000 AS DateTime), N'', 12.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'648', N'陈定胜', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 8, 31, N'13000000000', N'', N'', CAST(0x00009F3F00000000 AS DateTime), N'', 49.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'649', N'吕国春', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 2, 5, N'13000000000', N'', N'', CAST(0x00009F4000000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'65', N'陈菊', 0, 2, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 2, 10, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), N'', 7.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'650', N'吴松林', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 7, 19, N'13000000000', N'', N'', CAST(0x00009F4300000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'651', N'李朝臣', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 12, 6, N'13000000000', N'', N'', CAST(0x00009F4300000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'652', N'李波', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 3, 15, N'13000000000', N'', N'', CAST(0x00009F4500000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'653', N'毛江伟', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 9, 16, N'13000000000', N'', N'', CAST(0x00009F4500000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'654', N'陈晓玲', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 11, 22, N'13000000000', N'', N'', CAST(0x00009F4800000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'655', N'吴娣萍', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 11, 10, N'13000000000', N'', N'', CAST(0x00009F4900000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'656', N'廖健', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 9, 17, N'13000000000', N'', N'', CAST(0x00009F4F00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'657', N'游燕明', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 2, 20, N'13000000000', N'', N'', CAST(0x00009F4F00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'658', N'聂晓霞', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 0, 0, N'13000000000', N'', N'', CAST(0x00009F4F00000000 AS DateTime), N'', 88.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'659', N'高静', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 8, 21, N'13000000000', N'', N'', CAST(0x00009F4F00000000 AS DateTime), N'', 84.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'66', N'陈辉波', 0, 2, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 6, 17, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), N'', 13.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'660', N'姜伟', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 10, 12, N'13000000000', N'', N'', CAST(0x00009F5000000000 AS DateTime), N'', 20.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'661', N'姜渝', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 8, 2, N'13000000000', N'', N'', CAST(0x00009F5300000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'662', N'刘高杨', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 8, 27, N'13000000000', N'', N'', CAST(0x00009F5600000000 AS DateTime), N'', 31.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'663', N'魏小红', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 10, 25, N'13000000000', N'', N'', CAST(0x00009F5700000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'664', N'赵章利', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 12, 16, N'13000000000', N'', N'', CAST(0x00009F5A00000000 AS DateTime), N'', 1224.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'665', N'李铭祥', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 4, 11, N'13000000000', N'', N'', CAST(0x00009F5B00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'667', N'张进越', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 6, 17, N'13000000000', N'', N'', CAST(0x00009F5B00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'668', N'王丽萍', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 0, 0, N'13000000000', N'', N'', CAST(0x00009F5B00000000 AS DateTime), N'', 106.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'669', N'刘德芬', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 3, 25, N'13000000000', N'', N'', CAST(0x00009F5C00000000 AS DateTime), N'', 33.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'67', N'何晓敏', 0, 2, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 9, 27, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 97.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'670', N'曹艳', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 5, 21, N'13000000000', N'', N'', CAST(0x00009F5C00000000 AS DateTime), N'', 20.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'671', N'芦金芬', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 7, 13, N'13000000000', N'', N'', CAST(0x00009F5D00000000 AS DateTime), N'', 18.0000, 0, CAST(0x00009FFC01043D18 AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'672', N'廖云丽', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 12, 23, N'13000000000', N'', N'', CAST(0x00009F5E00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'673', N'张夏千', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 7, 29, N'13000000000', N'', N'', CAST(0x00009F6000000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'674', N'张泽玉', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 8, 13, N'13000000000', N'', N'', CAST(0x00009F6000000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'675', N'罗娜', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 9, 1, N'13000000000', N'', N'', CAST(0x00009F6100000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'676', N'詹鑫琳', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 1, 21, N'13000000000', N'', N'', CAST(0x00009F6100000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'677', N'熊涛语', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 7, 9, N'13000000000', N'', N'', CAST(0x00009F6200000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'678', N'安杰', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 9, 28, N'13000000000', N'', N'', CAST(0x00009F6200000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'679', N'吴炼', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 6, 1, N'13000000000', N'', N'', CAST(0x00009F6200000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'68', N'陈春梅', 0, 2, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 10, 21, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 29.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'680', N'何幕熙', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 8, 1, N'13000000000', N'', N'', CAST(0x00009F6200000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'681', N'余秀', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 8, 1, N'13000000000', N'', N'', CAST(0x00009F6300000000 AS DateTime), N'', 100.0000, 0, CAST(0x00009FFE00D37DCC AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'682', N'邹静', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 2, 15, N'13000000000', N'', N'', CAST(0x00009F6300000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'683', N'黎秋', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 10, 14, N'13000000000', N'', N'', CAST(0x00009F6300000000 AS DateTime), N'', 6.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'684', N'陈琳', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 6, 29, N'13000000000', N'', N'', CAST(0x00009F8D00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'685', N'岳祯东', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 5, 20, N'13000000000', N'', N'', CAST(0x00009F6300000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'686', N'周佳', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 4, 22, N'13000000000', N'', N'', CAST(0x00009F6400000000 AS DateTime), N'', 5.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'687', N'姚静', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 7, 9, N'13000000000', N'', N'', CAST(0x00009F6400000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'689', N'陈秀丽', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 11, 11, N'13000000000', N'', N'', CAST(0x00009F6400000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'69', N'项杰', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 11, 11, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'690', N'王纳', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 10, 17, N'13000000000', N'', N'', CAST(0x00009F6400000000 AS DateTime), N'', 9.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'691', N'邓洪', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 7, 11, N'13000000000', N'', N'', CAST(0x00009F6500000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'692', N'李晓芬', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 10, 15, N'13000000000', N'', N'', CAST(0x00009F6500000000 AS DateTime), N'', 95.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'693', N'王莲', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 10, 2, N'13000000000', N'', N'', CAST(0x00009F6600000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'694', N'张汪秀', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 7, 15, N'13000000000', N'', N'', CAST(0x00009F6900000000 AS DateTime), N'', 0.0000, 0, CAST(0x00009FFB00D12F2C AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'695', N'徐红', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 1, 13, N'13000000000', N'', N'', CAST(0x00009F6600000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'696', N'张小赖', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 1, 16, N'13000000000', N'', N'', CAST(0x00009F6700000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'697', N'代城成', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 7, 15, N'13000000000', N'', N'', CAST(0x00009F6D00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'698', N'张婷婷', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 3, 7, N'13000000000', N'', N'', CAST(0x00009F6800000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'699', N'刘静', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 11, 19, N'13000000000', N'', N'', CAST(0x00009F6800000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'7', N'龙敏', 0, 2, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 3, 30, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), N'', 24.0000, 0, CAST(0x00009FFE013B756C AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'70', N'庞孟梅', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 0, 0, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 14.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'700', N'赖文武', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 12, 20, N'13000000000', N'', N'', CAST(0x00009F6800000000 AS DateTime), N'', 5.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'701', N'熊兴', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 3, 26, N'13000000000', N'', N'', CAST(0x00009F6800000000 AS DateTime), N'', 1.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'702', N'王维莉', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 1, 18, N'13000000000', N'', N'', CAST(0x00009F6900000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'703', N'戴鹏', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 7, 5, N'13000000000', N'', N'', CAST(0x00009F6A00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'704', N'杨元红', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 10, 2, N'13000000000', N'', N'', CAST(0x00009F6A00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'705', N'牟玲', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 8, 8, N'13000000000', N'', N'', CAST(0x00009F6A00000000 AS DateTime), N'', 2.0000, 0, CAST(0x00009FFC00C1F908 AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'706', N'高婷', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 10, 9, N'13000000000', N'', N'', CAST(0x00009F6B00000000 AS DateTime), N'', 53.0000, 0, CAST(0x00009FFC01587FCC AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'707', N'杨琴', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 9, 4, N'13000000000', N'', N'', CAST(0x00009F6C00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'708', N'刘贵英', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 1, 3, N'13000000000', N'', N'', CAST(0x00009F6D00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'709', N'刘梅芳', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 0, 0, N'13000000000', N'', N'', CAST(0x00009F6E00000000 AS DateTime), N'', 14.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'71', N'周天波', 1, 2, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 2, 23, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'710', N'散客会员', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 10, 19, N'13000000000', N'', N'', CAST(0x00009F6E00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'711', N'袁锡军', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 6, 1, N'13000000000', N'', N'', CAST(0x00009F6E00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'712', N'张翼', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 10, 8, N'13000000000', N'', N'', CAST(0x00009F6F00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'713', N'房娟', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 3, 10, N'13000000000', N'', N'', CAST(0x00009F6F00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'714', N'宋菊红', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 11, 17, N'13000000000', N'', N'', CAST(0x00009F6F00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'715', N'聂泽利', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 9, 29, N'13000000000', N'', N'', CAST(0x00009F6F00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'716', N'汪俊', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 2, 25, N'13000000000', N'', N'', CAST(0x00009F7000000000 AS DateTime), N'', 20.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'717', N'梁艳梅', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 11, 18, N'13000000000', N'', N'', CAST(0x00009F7000000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'718', N'杨万中', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 7, 17, N'13000000000', N'', N'', CAST(0x00009F7000000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'719', N'犹元艳', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 10, 4, N'13000000000', N'', N'', CAST(0x00009F7000000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'72', N'叶元荣', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 3, 26, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 16.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'720', N'余鹏', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 11, 20, N'13000000000', N'', N'', CAST(0x00009F7000000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'721', N'冯晓利', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 1, 9, N'13000000000', N'', N'', CAST(0x00009F7100000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'722', N'李丽蓉', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 7, 13, N'13000000000', N'', N'', CAST(0x00009F7200000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'723', N'廖运旭', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 11, 24, N'13000000000', N'', N'', CAST(0x00009F7200000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'724', N'李胜', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 4, 17, N'13000000000', N'', N'', CAST(0x00009F7300000000 AS DateTime), N'', 20.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'725', N'韩明洁', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 12, 7, N'13000000000', N'', N'', CAST(0x00009F7200000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'726', N'刘小红', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 9, 25, N'13000000000', N'', N'', CAST(0x00009F7300000000 AS DateTime), N'', 50.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'727', N'张乐', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 10, 20, N'13000000000', N'', N'', CAST(0x00009F8200000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'728', N'蒋珊', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 6, 22, N'13000000000', N'', N'', CAST(0x00009F8D00000000 AS DateTime), N'', 7.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'729', N'陈海欧', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 9, 25, N'13000000000', N'', N'', CAST(0x00009F8F00000000 AS DateTime), N'', 6.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'73', N'肖君', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 7, 6, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), N'', 54.0000, 0, CAST(0x00009FFD00C552D8 AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'730', N'李岩', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 11, 12, N'13000000000', N'', N'', CAST(0x00009F8C00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'731', N'汪金梅', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 6, 6, N'13000000000', N'', N'', CAST(0x00009F8C00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'732', N'刘星', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 11, 29, N'13000000000', N'', N'', CAST(0x00009F9500000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'733', N'简晓飞', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 12, 31, N'13000000000', N'', N'', CAST(0x00009F8500000000 AS DateTime), N'', 141.0000, 0, CAST(0x00009FFC00FF3084 AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'734', N'吴文莉', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 9, 25, N'13000000000', N'', N'', CAST(0x00009F9300000000 AS DateTime), N'', 23.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'735', N'彭涛', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 12, 2, N'13000000000', N'', N'', CAST(0x00009FA100000000 AS DateTime), N'', 0.0000, 0, CAST(0x00009FFB0112BA14 AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'736', N'张勇', 0, 2, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 1, 7, N'13000000000', N'', N'', CAST(0x00009F9700000000 AS DateTime), N'', 164.0000, 0, CAST(0x00009FDB00C79494 AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'737', N'陈宗娜', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 12, 14, N'13000000000', N'', N'', CAST(0x00009F8300000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'738', N'张华', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 10, 23, N'13000000000', N'', N'', CAST(0x00009F8200000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'739', N'牟晶', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 12, 15, N'13000000000', N'', N'', CAST(0x00009F8200000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
GO
print 'Processed 400 total records'
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'74', N'何黎', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 1, 9, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 62.0000, 0, CAST(0x00009FFD00B91B1C AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'741', N'钟珍', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 10, 21, N'13000000000', N'', N'', CAST(0x00009F8100000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'743', N'杜敏', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 8, 5, N'13000000000', N'', N'', CAST(0x00009F7D00000000 AS DateTime), N'', 5.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'744', N'杨勇', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 9, 17, N'13000000000', N'', N'', CAST(0x00009F7400000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'745', N'陈玉', 0, 2, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 8, 20, N'13000000000', N'', N'', CAST(0x00009F7400000000 AS DateTime), N'', 131.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'746', N'左蕾', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 11, 8, N'13000000000', N'', N'', CAST(0x00009F7D00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'747', N'郑义连', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 11, 15, N'13000000000', N'', N'', CAST(0x00009F7B00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'748', N'何来杰', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 6, 6, N'13000000000', N'', N'', CAST(0x00009F7800000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'75', N'熊君', 0, 3, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 12, 26, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), N'', 2.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'750', N'散客会员', 1, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 5, 4, N'13000000000', N'', N'', CAST(0x00009F7800000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'751', N'赵娟', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 0, 0, N'13000000000', N'', N'', CAST(0x00009FC100000000 AS DateTime), N'', 113.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'752', N'李元微', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 7, 14, N'13000000000', N'', N'', CAST(0x00009FBC00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'753', N'吴小梅', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 8, 27, N'13000000000', N'', N'', CAST(0x00009FAD00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'754', N'余明利', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 10, 12, N'13000000000', N'', N'', CAST(0x00009FAF00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'755', N'刘韦', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 4, 4, N'13000000000', N'', N'', CAST(0x00009FB100000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'756', N'艾萍', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 11, 1, N'13000000000', N'', N'', CAST(0x00009FB100000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'757', N'施朝庆', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'100', 1, 6, 25, N'13000000000', N'', N'', CAST(0x00009FB600000000 AS DateTime), N'', 5.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'758', N'杨玲', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 5, 1, N'13000000000', N'', N'', CAST(0x00009FB900000000 AS DateTime), N'', 48.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'759', N'潘悦', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 1, 25, N'13000000000', N'', N'', CAST(0x00009FBA00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'760', N'詹欢', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 3, 30, N'13000000000', N'', N'', CAST(0x00009FBB00000000 AS DateTime), N'', 33.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'761', N'黄海涛', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 10, 2, N'13000000000', N'', N'', CAST(0x00009FBC00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'762', N'袁绕平', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 7, 29, N'13000000000', N'', N'', CAST(0x00009FBD00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'763', N'田彦', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 7, 28, N'13000000000', N'', N'', CAST(0x00009FBE00000000 AS DateTime), N'', 68.0000, 0, CAST(0x00009FFC01585EFC AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'764', N'刘建华', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 8, 24, N'13000000000', N'', N'', CAST(0x00009FBD00000000 AS DateTime), N'', 40.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'765', N'李博', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 11, 1, N'13000000000', N'', N'', CAST(0x00009FBE00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'766', N'王静', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 8, 4, N'13000000000', N'', N'', CAST(0x00009FBE00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'767', N'钟器强', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 8, 12, N'13000000000', N'', N'', CAST(0x00009FBC00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'768', N'杨辛', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 3, 23, N'13000000000', N'', N'', CAST(0x00009FBC00000000 AS DateTime), N'', 0.0000, 0, CAST(0x00009FFE0162D134 AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'769', N'徐光瀛', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 1, 4, N'13000000000', N'', N'', CAST(0x00009FC200000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'77', N'刘艺', 0, 2, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 12, 6, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), N'', 0.0000, 0, CAST(0x00009FFB01321FF8 AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'770', N'龙阳', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 4, 26, N'13000000000', N'', N'', CAST(0x00009FC300000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'771', N'王俊', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 10, 23, N'13000000000', N'', N'', CAST(0x00009FC500000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'772', N'李静', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 11, 29, N'13000000000', N'', N'', CAST(0x00009FC700000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'773', N'张梅', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 4, 12, N'13000000000', N'', N'', CAST(0x00009FC800000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'774', N'陈桂兰', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 11, 8, N'13000000000', N'', N'', CAST(0x00009FC800000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'775', N'黄美玉', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 11, 17, N'13000000000', N'', N'', CAST(0x00009FCA00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'776', N'唐晓凤', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 12, 28, N'13000000000', N'', N'', CAST(0x00009FD200000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'777', N'曹玉婷', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 8, 10, N'13000000000', N'', N'', CAST(0x00009FEE00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'778', N'文之荣', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 9, 10, N'13000000000', N'', N'', CAST(0x00009FEC00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'779', N'程琴', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 6, 8, N'13000000000', N'', N'', CAST(0x00009FEA00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'78', N'刘平', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 12, 13, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'780', N'韦江', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 5, 8, N'13000000000', N'', N'', CAST(0x00009FE900000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'781', N'梁？琼', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 11, 27, N'13000000000', N'', N'', CAST(0x00009FE900000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'782', N'彭祥勃', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 7, 19, N'13000000000', N'', N'', CAST(0x00009FE900000000 AS DateTime), N'500113198707019138', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'783', N'陈艳萍', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 7, 12, N'13000000000', N'', N'', CAST(0x00009FE700000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'784', N'王健', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 2, 17, N'13000000000', N'', N'', CAST(0x00009FE700000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'785', N'曾庆银', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 10, 5, N'13000000000', N'', N'', CAST(0x00009FE700000000 AS DateTime), N'', 0.0000, 0, CAST(0x00009FFB016A9BBC AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'786', N'胡均琳', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 10, 21, N'13000000000', N'', N'', CAST(0x00009FE600000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'787', N'邢晓燕', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 5, 14, N'13000000000', N'', N'', CAST(0x00009FE600000000 AS DateTime), N'', 0.0000, 0, CAST(0x00009FFD015A7304 AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'788', N'杨栋英', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 4, 15, N'13000000000', N'', N'', CAST(0x00009FE600000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'789', N'张？群', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 10, 19, N'13000000000', N'', N'', CAST(0x00009FE400000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'79', N'刘永惠', 0, 2, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 11, 3, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'790', N'刘洪', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 12, 15, N'13000000000', N'', N'', CAST(0x00009FDE00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'791', N'税何林', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 9, 10, N'13000000000', N'', N'', CAST(0x00009FDE00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'792', N'屠丽', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 7, 5, N'13000000000', N'', N'', CAST(0x00009FDE00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'793', N'余文寅', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 11, 19, N'13000000000', N'', N'', CAST(0x00009FDE00000000 AS DateTime), N'', 122.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'794', N'欧明晋', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 8, 18, N'13000000000', N'', N'', CAST(0x00009FDD00000000 AS DateTime), N'', 122.0000, 0, CAST(0x00009FFE015CD20C AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'795', N'谢大维', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 8, 16, N'13000000000', N'', N'', CAST(0x00009FDD00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'796', N'王燕', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 2, 25, N'13000000000', N'', N'', CAST(0x00009FDB00000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'797', N'李如芳', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 8, 26, N'13000000000', N'', N'', CAST(0x00009FD900000000 AS DateTime), N'', 0.0000, 0, CAST(0x00009FFE0145878C AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'798', N'游坐君', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 6, 30, N'13000000000', N'', N'', CAST(0x00009FD900000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'799', N'蔡战彬', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 0, 0, N'13000000000', N'', N'', CAST(0x00009FD600000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'8', N'胡光权', 1, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 9, 5, N'13000000000', N'', N'9月3号退卡', CAST(0x00009F3100000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'80', N'周方杉', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 6, 23, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'800', N'问国华', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 7, 9, N'13000000000', N'', N'', CAST(0x00009FA000000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'801', N'吴旭', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 5, 5, N'13000000000', N'', N'', CAST(0x00009FF000000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'802', N'牟元群', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 10, 21, N'13000000000', N'', N'', CAST(0x00009FF400000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'803', N'黄立容', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 8, 9, N'13000000000', N'', N'', CAST(0x00009FF500000000 AS DateTime), N'', 0.0000, 0, CAST(0x00009FFD00ECF16C AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'804', N'李涛', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 10, 21, N'13000000000', N'', N'', CAST(0x00009FF800000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'805', N'陈俊宏', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 3, 2, N'13000000000', N'', N'', CAST(0x00009FF900000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'806', N'白川', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 1, 8, N'13000000000', N'', N'', CAST(0x00009FFB00000000 AS DateTime), N'', 0.0000, 0, CAST(0x00009FFB010E819C AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'807', N'张雨民', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 8, 18, N'13000000000', N'', N'', CAST(0x00009FFC00000000 AS DateTime), N'', 0.0000, 0, CAST(0x00009FFC00E068D4 AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'808', N'杨霞', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 10, 28, N'13000000000', N'', N'', CAST(0x00009FFE00000000 AS DateTime), N'', 0.0000, 0, CAST(0x00009FFE0099CCA8 AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'81', N'王燕', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 4, 15, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, CAST(0x00009FFE00C46F80 AS DateTime), NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'82', N'罗季', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 3, 10, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'83', N'叶玲', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 6, 28, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'84', N'潘君', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 1, 5, N'13000000000', N'', N'', CAST(0x00009F9200000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'85', N'周毅', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 4, 29, N'13000000000', N'', N'', CAST(0x00009F3200000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'86', N'张蔚', 1, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 5, 5, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'87', N'罗卫', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 2, 11, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'88', N'严莉', 0, 2, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 2, 8, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'89', N'朱红', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 1, 30, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'91', N'谢容', 1, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 7, 14, N'13000000000', N'', N'充卡改等级（次数折合）', CAST(0x00009F3100000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'92', N'高敏', 0, 2, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 11, 2, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), N'', 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'93', N'丁玲', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 4, 3, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 0.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'95', N'周志倩', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 0, 11, 7, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 100.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'96', N'汤学荣', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 11, 28, N'13000000000', N'', N'', CAST(0x00009F3100000000 AS DateTime), NULL, 990.0000, 0, NULL, NULL)
INSERT [dbo].[member] ([mid], [mname], [mstatus], [mcid], [mpass], [mremark], [msex], [mmonth], [mday], [mphone], [maddress], [mother], [mjoin], [midcard], [mbalance], [mpoint], [mlastime], [mCount]) VALUES (N'97', N'高强', 0, 1, N'CFCD208495D565EF66E7DFF9F98764DA', N'', 1, 4, 9, N'123456', N'', N'', CAST(0x00009F3100000000 AS DateTime), N'', 90.0000, 0, NULL, NULL)
/****** Object:  Table [dbo].[items]    Script Date: 05/08/2013 17:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[items]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[items](
	[iid] [int] IDENTITY(1000,1) NOT NULL,
	[iname] [nvarchar](30) COLLATE Chinese_PRC_CI_AS NULL,
	[ifprice] [smallmoney] NULL,
	[iuprice] [smallmoney] NULL,
	[inprice] [smallmoney] NULL,
	[iamount] [smallint] NULL,
	[imoney] [smallmoney] NULL,
	[icmoney] [smallmoney] NULL,
	[itype] [tinyint] NULL,
	[iconvert] [int] NULL,
	[ireadme] [nvarchar](300) COLLATE Chinese_PRC_CI_AS NULL,
	[istatus] [tinyint] NULL,
	[isbonus] [tinyint] NULL,
	[isticheng] [tinyint] NULL,
 CONSTRAINT [PK_items] PRIMARY KEY CLUSTERED 
(
	[iid] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[items] ON
INSERT [dbo].[items] ([iid], [iname], [ifprice], [iuprice], [inprice], [iamount], [imoney], [icmoney], [itype], [iconvert], [ireadme], [istatus], [isbonus], [isticheng]) VALUES (1000, N'飘柔洗发水', 4.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 0, 0, N'', 0, 0, 0)
INSERT [dbo].[items] ([iid], [iname], [ifprice], [iuprice], [inprice], [iamount], [imoney], [icmoney], [itype], [iconvert], [ireadme], [istatus], [isbonus], [isticheng]) VALUES (1002, N'洗头', 100.0000, 100.0000, 0.0000, 20000, 30.0000, 0.0000, 0, 0, N'', 0, 1, 0)
SET IDENTITY_INSERT [dbo].[items] OFF
/****** Object:  Table [dbo].[employee]    Script Date: 05/08/2013 17:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[employee]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[employee](
	[eid] [int] IDENTITY(1,1) NOT NULL,
	[ecode] [tinyint] NULL,
	[ename] [nvarchar](30) COLLATE Chinese_PRC_CI_AS NULL,
	[esex] [tinyint] NULL,
	[ephone] [nvarchar](15) COLLATE Chinese_PRC_CI_AS NULL,
	[epid] [int] NULL,
	[esalary] [money] NULL,
	[ebonus] [float] NULL,
	[einput] [nvarchar](10) COLLATE Chinese_PRC_CI_AS NULL,
	[eoutput] [nvarchar](10) COLLATE Chinese_PRC_CI_AS NULL,
	[estatus] [tinyint] NULL,
	[epassword] [nvarchar](32) COLLATE Chinese_PRC_CI_AS NULL,
	[eremark] [nvarchar](300) COLLATE Chinese_PRC_CI_AS NULL,
	[eaddress] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NULL,
	[ecard] [nvarchar](18) COLLATE Chinese_PRC_CI_AS NULL,
	[emobile] [nvarchar](11) COLLATE Chinese_PRC_CI_AS NULL,
 CONSTRAINT [PK_employee] PRIMARY KEY CLUSTERED 
(
	[eid] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[employee] ON
INSERT [dbo].[employee] ([eid], [ecode], [ename], [esex], [ephone], [epid], [esalary], [ebonus], [einput], [eoutput], [estatus], [epassword], [eremark], [eaddress], [ecard], [emobile]) VALUES (1, 1, N'王经理', 1, N'', 1, 9999.0000, 0.2, N'2012/3/4', NULL, 2, NULL, N'', N'', N'', N'13000000000')
INSERT [dbo].[employee] ([eid], [ecode], [ename], [esex], [ephone], [epid], [esalary], [ebonus], [einput], [eoutput], [estatus], [epassword], [eremark], [eaddress], [ecard], [emobile]) VALUES (2, 2, N'张三', 0, N'', 2, 2000.0000, 0.1, N'2012/3/13', NULL, 2, NULL, N'', N'', N'', N'13000000000')
INSERT [dbo].[employee] ([eid], [ecode], [ename], [esex], [ephone], [epid], [esalary], [ebonus], [einput], [eoutput], [estatus], [epassword], [eremark], [eaddress], [ecard], [emobile]) VALUES (3, 3, N'李四', 1, N'', 3, 1500.0000, 0.1, N'2012/3/13', NULL, 2, NULL, N'', N'', N'', N'13000000000')
INSERT [dbo].[employee] ([eid], [ecode], [ename], [esex], [ephone], [epid], [esalary], [ebonus], [einput], [eoutput], [estatus], [epassword], [eremark], [eaddress], [ecard], [emobile]) VALUES (4, 4, N'吴某', 1, N'', 4, 1500.0000, 0, N'2012/3/13', NULL, 2, NULL, N'', N'', N'', N'13000000000')
INSERT [dbo].[employee] ([eid], [ecode], [ename], [esex], [ephone], [epid], [esalary], [ebonus], [einput], [eoutput], [estatus], [epassword], [eremark], [eaddress], [ecard], [emobile]) VALUES (5, 5, N'叶姐', 1, N'', 4, 1500.0000, 0, N'2012/3/13', NULL, 0, NULL, N'', N'', N'', N'13000000000')
SET IDENTITY_INSERT [dbo].[employee] OFF
/****** Object:  Table [dbo].[emp_money]    Script Date: 05/08/2013 17:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[emp_money]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[emp_money](
	[emid] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[emmoney] [money] NULL,
	[emtype] [tinyint] NULL,
	[emremark] [nvarchar](500) COLLATE Chinese_PRC_CI_AS NULL,
	[emtime] [datetime] NULL,
	[empid] [int] NULL,
 CONSTRAINT [PK_emp_money] PRIMARY KEY CLUSTERED 
(
	[emid] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[deposit]    Script Date: 05/08/2013 17:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[deposit]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[deposit](
	[did] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[dmid] [nvarchar](12) COLLATE Chinese_PRC_CI_AS NULL,
	[dmoney] [money] NOT NULL,
	[ddate] [datetime] NULL,
	[dremark] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NULL,
	[dmode] [tinyint] NULL,
	[dparentid] [decimal](18, 0) NULL,
 CONSTRAINT [PK_deposit] PRIMARY KEY CLUSTERED 
(
	[did] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[deposit] ON
INSERT [dbo].[deposit] ([did], [dmid], [dmoney], [ddate], [dremark], [dmode], [dparentid]) VALUES (CAST(1 AS Decimal(18, 0)), N'664', 1212.0000, CAST(0x0000A148004F4484 AS DateTime), N'', 0, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[deposit] ([did], [dmid], [dmoney], [ddate], [dremark], [dmode], [dparentid]) VALUES (CAST(2 AS Decimal(18, 0)), N'664', 11.0000, CAST(0x0000A148004F5FD7 AS DateTime), N'', 0, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[deposit] ([did], [dmid], [dmoney], [ddate], [dremark], [dmode], [dparentid]) VALUES (CAST(3 AS Decimal(18, 0)), N'664', 1.0000, CAST(0x0000A148004F90F3 AS DateTime), N'', 0, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[deposit] ([did], [dmid], [dmoney], [ddate], [dremark], [dmode], [dparentid]) VALUES (CAST(4 AS Decimal(18, 0)), N'751', 1.0000, CAST(0x0000A148004F95FB AS DateTime), N'', 0, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[deposit] ([did], [dmid], [dmoney], [ddate], [dremark], [dmode], [dparentid]) VALUES (CAST(5 AS Decimal(18, 0)), N'751', 1.0000, CAST(0x0000A148004FB3F9 AS DateTime), N'', 0, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[deposit] ([did], [dmid], [dmoney], [ddate], [dremark], [dmode], [dparentid]) VALUES (CAST(6 AS Decimal(18, 0)), N'751', 111.0000, CAST(0x0000A148004FB953 AS DateTime), N'', 0, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[deposit] ([did], [dmid], [dmoney], [ddate], [dremark], [dmode], [dparentid]) VALUES (CAST(7 AS Decimal(18, 0)), N'247', 1.0000, CAST(0x0000A148004FBE0A AS DateTime), N'', 0, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[deposit] ([did], [dmid], [dmoney], [ddate], [dremark], [dmode], [dparentid]) VALUES (CAST(8 AS Decimal(18, 0)), N'111', 100.0000, CAST(0x0000A148005006B8 AS DateTime), N'[现金+余额]现金：100.00；刷卡：0.00；消费单号：XF20130116045114', 0, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[deposit] ([did], [dmid], [dmoney], [ddate], [dremark], [dmode], [dparentid]) VALUES (CAST(9 AS Decimal(18, 0)), N'96', 900.0000, CAST(0x0000A14800937618 AS DateTime), N'', 0, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[deposit] ([did], [dmid], [dmoney], [ddate], [dremark], [dmode], [dparentid]) VALUES (CAST(10 AS Decimal(18, 0)), N'96', 90.0000, CAST(0x0000A148009541E6 AS DateTime), N'', 0, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[deposit] ([did], [dmid], [dmoney], [ddate], [dremark], [dmode], [dparentid]) VALUES (CAST(11 AS Decimal(18, 0)), N'97', 90.0000, CAST(0x0000A148009556E9 AS DateTime), N'', 0, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[deposit] ([did], [dmid], [dmoney], [ddate], [dremark], [dmode], [dparentid]) VALUES (CAST(12 AS Decimal(18, 0)), N'95', 100.0000, CAST(0x0000A1490028A91B AS DateTime), N'', 0, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[deposit] ([did], [dmid], [dmoney], [ddate], [dremark], [dmode], [dparentid]) VALUES (CAST(13 AS Decimal(18, 0)), N'793', 122.0000, CAST(0x0000A14900296651 AS DateTime), N'', 0, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[deposit] ([did], [dmid], [dmoney], [ddate], [dremark], [dmode], [dparentid]) VALUES (CAST(14 AS Decimal(18, 0)), N'794', 122.0000, CAST(0x0000A14900296B12 AS DateTime), N'', 0, CAST(0 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[deposit] OFF
/****** Object:  Table [dbo].[card]    Script Date: 05/08/2013 17:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[card]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[card](
	[cid] [smallint] IDENTITY(1,1) NOT NULL,
	[cname] [nvarchar](20) COLLATE Chinese_PRC_CI_AS NULL,
	[cdiscount] [float] NULL,
	[cmoney] [smallmoney] NULL,
 CONSTRAINT [PK_card] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[card] ON
INSERT [dbo].[card] ([cid], [cname], [cdiscount], [cmoney]) VALUES (1, N'普通会员', 0.95, 100.0000)
INSERT [dbo].[card] ([cid], [cname], [cdiscount], [cmoney]) VALUES (2, N'高级会员', 0.9, 100.0000)
INSERT [dbo].[card] ([cid], [cname], [cdiscount], [cmoney]) VALUES (3, N'贴牌VIP会员', 0.9, 100.0000)
INSERT [dbo].[card] ([cid], [cname], [cdiscount], [cmoney]) VALUES (4, N'铜牌VIP会员', 0.8, 100.0000)
INSERT [dbo].[card] ([cid], [cname], [cdiscount], [cmoney]) VALUES (5, N'银牌VIP会员', 0.75, 100.0000)
INSERT [dbo].[card] ([cid], [cname], [cdiscount], [cmoney]) VALUES (6, N'金牌VIP会员', 0.7, 100.0000)
SET IDENTITY_INSERT [dbo].[card] OFF
/****** Object:  Default [DF_deposit_dmoney]    Script Date: 05/08/2013 17:36:54 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_deposit_dmoney]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_deposit_dmoney]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[deposit] ADD  CONSTRAINT [DF_deposit_dmoney]  DEFAULT ((0)) FOR [dmoney]
END


END
GO
/****** Object:  Default [DF_deposit_dparentid]    Script Date: 05/08/2013 17:36:54 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_deposit_dparentid]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_deposit_dparentid]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[deposit] ADD  CONSTRAINT [DF_deposit_dparentid]  DEFAULT ((0)) FOR [dparentid]
END


END
GO
/****** Object:  Default [DF_items_isbonus]    Script Date: 05/08/2013 17:36:54 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_items_isbonus]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_items_isbonus]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[items] ADD  CONSTRAINT [DF_items_isbonus]  DEFAULT ((0)) FOR [isbonus]
END


END
GO
/****** Object:  Default [DF_items_isticheng]    Script Date: 05/08/2013 17:36:54 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_items_isticheng]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_items_isticheng]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[items] ADD  CONSTRAINT [DF_items_isticheng]  DEFAULT ((0)) FOR [isticheng]
END


END
GO
/****** Object:  Default [DF_member_mbalance]    Script Date: 05/08/2013 17:36:54 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_member_mbalance]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_member_mbalance]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[member] ADD  CONSTRAINT [DF_member_mbalance]  DEFAULT ((0)) FOR [mbalance]
END


END
GO
/****** Object:  Default [DF_member_mpoint]    Script Date: 05/08/2013 17:36:54 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_member_mpoint]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_member_mpoint]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[member] ADD  CONSTRAINT [DF_member_mpoint]  DEFAULT ((0)) FOR [mpoint]
END


END
GO
/****** Object:  Default [DF_pays_pmoney]    Script Date: 05/08/2013 17:36:55 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_pays_pmoney]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_pays_pmoney]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[pays] ADD  CONSTRAINT [DF_pays_pmoney]  DEFAULT ((0)) FOR [pmoney]
END


END
GO
/****** Object:  Default [DF_pays_pcash]    Script Date: 05/08/2013 17:36:55 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_pays_pcash]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_pays_pcash]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[pays] ADD  CONSTRAINT [DF_pays_pcash]  DEFAULT ((0)) FOR [pcash]
END


END
GO
/****** Object:  Default [DF_pays_pzero]    Script Date: 05/08/2013 17:36:55 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_pays_pzero]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_pays_pzero]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[pays] ADD  CONSTRAINT [DF_pays_pzero]  DEFAULT ((0)) FOR [pzero]
END


END
GO
/****** Object:  Default [DF_pays_pcall]    Script Date: 05/08/2013 17:36:55 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_pays_pcall]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_pays_pcall]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[pays] ADD  CONSTRAINT [DF_pays_pcall]  DEFAULT ((0)) FOR [pcall]
END


END
GO
/****** Object:  Default [DF_post_psalary]    Script Date: 05/08/2013 17:36:55 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_post_psalary]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_post_psalary]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[post] ADD  CONSTRAINT [DF_post_psalary]  DEFAULT ((0)) FOR [psalary]
END


END
GO
/****** Object:  Default [DF_subject_senabled]    Script Date: 05/08/2013 17:36:55 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_subject_senabled]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_subject_senabled]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[subject] ADD  CONSTRAINT [DF_subject_senabled]  DEFAULT ((0)) FOR [senabled]
END


END
GO
