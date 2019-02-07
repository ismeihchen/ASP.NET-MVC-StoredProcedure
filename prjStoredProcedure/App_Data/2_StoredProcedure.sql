USE [Employee]
GO

/****** Object:  StoredProcedure [dbo].[usp_GetAllDepartment]    Script Date: 2019/1/26 下午 11:45:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


--讀取所有部門資料
CREATE PROCEDURE [dbo].[usp_GetAllDepartment]
AS
BEGIN
 
	SELECT [fDepId]
		  ,[fDepName]
	  FROM [dbo].[tDepartment]
 
END

GO

/****** Object:  StoredProcedure [dbo].[usp_GetAllEmployee]    Script Date: 2019/1/26 下午 11:45:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_GetAllEmployee]
AS
BEGIN
 
	SELECT [tEmployee].[fDepId]
	      ,[tDepartment].[fDepName]
	      ,[tEmployee].[fEmpId]
		  ,[tEmployee].[fName]	
		  ,[tEmployee].[fPhone]			  
	  FROM [dbo].[tEmployee] LEFT JOIN 
	       [dbo].[tDepartment] ON [tEmployee].[fDepId] = [tDepartment].[fDepId]
    order by [fEmpId] ASC
 
END


GO

/****** Object:  StoredProcedure [dbo].[usp_GetEmployeeByDepId]    Script Date: 2019/1/26 下午 11:45:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- 依部門編號查詢員工資料
CREATE PROCEDURE [dbo].[usp_GetEmployeeByDepId]
(
    @fDepId int 
)
AS
BEGIN
 
	SELECT [tEmployee].[fDepId]
	      ,[tDepartment].[fDepName]
	      ,[tEmployee].[fEmpId]
		  ,[tEmployee].[fName]	
		  ,[tEmployee].[fPhone]				  
	  FROM [dbo].[tEmployee] LEFT JOIN 
	       [dbo].[tDepartment] ON [tEmployee].[fDepId] = [tDepartment].[fDepId]
    WHERE [tEmployee].[fDepId] = @fDepId

END



GO

/****** Object:  StoredProcedure [dbo].[usp_GetEmployeeByEmpID]    Script Date: 2019/1/26 下午 11:45:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_GetEmployeeByEmpID]
(
    @EmployeeId int 
)
AS
BEGIN
 
	SELECT [tEmployee].[fDepId]
	      ,[tDepartment].[fDepName]
	      ,[tEmployee].[fEmpId]
		  ,[tEmployee].[fName]	
		  ,[tEmployee].[fPhone]				  
	  FROM [dbo].[tEmployee] LEFT JOIN 
	       [dbo].[tDepartment] ON [tEmployee].[fDepId] = [tDepartment].[fDepId]
    WHERE [tEmployee].[fEmpId] = @EmployeeId

END

GO

/****** Object:  StoredProcedure [dbo].[usp_PR_Employee_DeleteByPK]    Script Date: 2019/1/26 下午 11:45:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- 刪除員工資料
CREATE PROCEDURE [dbo].[usp_PR_Employee_DeleteByPK]
 
        @fEmpId         nchar (5)
        
AS
 
SET NOCOUNT ON;
 
BEGIN TRY
BEGIN TRAN
 
DELETE FROM [dbo].[tEmployee]
WHERE [dbo].[tEmployee].[fEmpId] = @fEmpId
 
COMMIT TRAN
END TRY
 
BEGIN CATCH
ROLLBACK TRAN
 
DECLARE @ErrorNumber_INT INT;
DECLARE @ErrorSeverity_INT INT;
DECLARE @ErrorProcedure_VC VARCHAR(200);
DECLARE @ErrorLine_INT INT;
DECLARE @ErrorMessage_NVC NVARCHAR(4000);
 
SELECT
        @ErrorMessage_NVC = ERROR_MESSAGE(),
        @ErrorSeverity_INT = ERROR_SEVERITY(),
        @ErrorNumber_INT = ERROR_NUMBER(),
        @ErrorProcedure_VC = ERROR_PROCEDURE(),
        @ErrorLine_INT = ERROR_LINE()
 
RAISERROR(@ErrorMessage_NVC,@ErrorSeverity_INT,1);
 
END CATCH




GO

/****** Object:  StoredProcedure [dbo].[usp_PR_Employee_Insert]    Script Date: 2019/1/26 下午 11:45:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- 新增員工資料
CREATE PROCEDURE [dbo].[usp_PR_Employee_Insert]
 
        @fEmpId         int OUTPUT,
        @fName          nvarchar(15),
		@fPhone         nvarchar(10),
        @fDepId         int 
AS
 
SET NOCOUNT ON;
 
 
BEGIN TRY
BEGIN TRAN
 
		INSERT [dbo].[tEmployee]
		(
				[fName],
				[fPhone],
				[fDepId]
		)
		VALUES
		(
				@fName,
				@fPhone,
				@fDepId
		)

SET @fEmpId = @@IDENTITY
 
COMMIT TRAN
END TRY
 
BEGIN CATCH
ROLLBACK TRAN
 
DECLARE @ErrorNumber_INT INT;
DECLARE @ErrorSeverity_INT INT;
DECLARE @ErrorProcedure_VC VARCHAR(200);
DECLARE @ErrorLine_INT INT;
DECLARE @ErrorMessage_NVC NVARCHAR(4000);
 
SELECT
        @ErrorMessage_NVC = ERROR_MESSAGE(),
        @ErrorSeverity_INT = ERROR_SEVERITY(),
        @ErrorNumber_INT = ERROR_NUMBER(),
        @ErrorProcedure_VC = ERROR_PROCEDURE(),
        @ErrorLine_INT = ERROR_LINE()
 
RAISERROR(@ErrorMessage_NVC,@ErrorSeverity_INT,1);
 
END CATCH



GO

/****** Object:  StoredProcedure [dbo].[usp_PR_Employee_UpdateByPK]    Script Date: 2019/1/26 下午 11:45:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- 編輯員工資料
CREATE PROCEDURE [dbo].[usp_PR_Employee_UpdateByPK] 
        @fEmpId         int,
        @fName          nvarchar (15),
		@fPhone         nvarchar(10),
        @fDepId         int  
AS
 
SET NOCOUNT ON;
 
BEGIN TRY
BEGIN TRAN
 
UPDATE [dbo].[tEmployee]
SET
        [fName] = @fName,     
        [fPhone] = @fPhone, 
        [fDepId] = @fDepId
WHERE   [dbo].[tEmployee].[fEmpId] = @fEmpId
 
COMMIT TRAN
END TRY
 
BEGIN CATCH
ROLLBACK TRAN
 
DECLARE @ErrorNumber_INT INT;
DECLARE @ErrorSeverity_INT INT;
DECLARE @ErrorProcedure_VC VARCHAR(200);
DECLARE @ErrorLine_INT INT;
DECLARE @ErrorMessage_NVC NVARCHAR(4000);
 
SELECT
        @ErrorMessage_NVC = ERROR_MESSAGE(),
        @ErrorSeverity_INT = ERROR_SEVERITY(),
        @ErrorNumber_INT = ERROR_NUMBER(),
        @ErrorProcedure_VC = ERROR_PROCEDURE(),
        @ErrorLine_INT = ERROR_LINE()
 
RAISERROR(@ErrorMessage_NVC,@ErrorSeverity_INT,1);
 
END CATCH



GO


