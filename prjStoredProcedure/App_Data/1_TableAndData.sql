USE [Employee]
GO
/****** Object:  Table [dbo].[tDepartment]    Script Date: 2019/1/26 下午 11:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tDepartment](
	[fDepId] [int] IDENTITY(1,1) NOT NULL,
	[fDepName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[fDepId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tEmployee]    Script Date: 2019/1/26 下午 11:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tEmployee](
	[fEmpId] [int] IDENTITY(1,1) NOT NULL,
	[fName] [nvarchar](30) NULL,
	[fPhone] [nvarchar](10) NULL,
	[fDepId] [int] NULL,
 CONSTRAINT [PK_tEmployee] PRIMARY KEY CLUSTERED 
(
	[fEmpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tDepartment] ON 

GO
INSERT [dbo].[tDepartment] ([fDepId], [fDepName]) VALUES (1, N'資訊')
GO
INSERT [dbo].[tDepartment] ([fDepId], [fDepName]) VALUES (2, N'設計')
GO
INSERT [dbo].[tDepartment] ([fDepId], [fDepName]) VALUES (3, N'業務')
GO
INSERT [dbo].[tDepartment] ([fDepId], [fDepName]) VALUES (4, N'圖書')
GO
SET IDENTITY_INSERT [dbo].[tDepartment] OFF
GO
SET IDENTITY_INSERT [dbo].[tEmployee] ON 

GO
INSERT [dbo].[tEmployee] ([fEmpId], [fName], [fPhone], [fDepId]) VALUES (1, N'蔡小龍', N'0926777888', 4)
GO
INSERT [dbo].[tEmployee] ([fEmpId], [fName], [fPhone], [fDepId]) VALUES (2, N'周小旬', N'0976321456', 4)
GO
INSERT [dbo].[tEmployee] ([fEmpId], [fName], [fPhone], [fDepId]) VALUES (3, N'曾小琳', N'0965123321', 2)
GO
INSERT [dbo].[tEmployee] ([fEmpId], [fName], [fPhone], [fDepId]) VALUES (4, N'陳小心', N'0966555111', 2)
GO
INSERT [dbo].[tEmployee] ([fEmpId], [fName], [fPhone], [fDepId]) VALUES (5, N'蔡小雲', N'0937655776', 3)
GO
INSERT [dbo].[tEmployee] ([fEmpId], [fName], [fPhone], [fDepId]) VALUES (6, N'歐小信', N'0929111222', 1)
GO
INSERT [dbo].[tEmployee] ([fEmpId], [fName], [fPhone], [fDepId]) VALUES (7, N'萬小曜', N'0987123456', 1)
GO
INSERT [dbo].[tEmployee] ([fEmpId], [fName], [fPhone], [fDepId]) VALUES (9, N'王小明', N'0987112233', NULL)
GO
INSERT [dbo].[tEmployee] ([fEmpId], [fName], [fPhone], [fDepId]) VALUES (10, N'王小明', N'0987112233', NULL)
GO
INSERT [dbo].[tEmployee] ([fEmpId], [fName], [fPhone], [fDepId]) VALUES (11, N'王小明2', N'0987112233', NULL)
GO
INSERT [dbo].[tEmployee] ([fEmpId], [fName], [fPhone], [fDepId]) VALUES (12, N'王小明2', N'0987123123', NULL)
GO
SET IDENTITY_INSERT [dbo].[tEmployee] OFF
GO
