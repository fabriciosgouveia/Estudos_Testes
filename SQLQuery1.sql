USE [KRONOS]
GO
/****** Object:  UserDefinedFunction [dbo].[SOMENTE_NUMEROS]    Script Date: 15/07/2019 10:50:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





ALTER Function [dbo].[SOMENTE_NUMEROS]
(@STRING varchar(100)) 
Returns BIGINT As
Begin
	Declare @MAX int, @CARAC char, @NUM varchar(100)
	
	Set @MAX = (Select Len(@STRING))
	Set @NUM = ''
	
	While @MAX > 0
	Begin
		Set @CARAC = (Select Right(Left(@STRING, Len(@STRING) - @MAX + 1), 1))
		
		If @CARAC IN ('0','1','2','3','4','5','6','7','8','9')
		Begin
		  Set @NUM = @NUM + @CARAC
		End

		Set @MAX = @MAX - 1
	End
	IF @NUM = '' SET @NUM = '0'
	
	Return CAST(@NUM AS BIGINT)
End;




