use TourOperator
go


----------------------------------------
CREATE FUNCTION Calculator (
	@Opd1 bigint,
	@Opd2 bigint,
	@Oprt char(1) = '*'
) RETURNS bigint
AS BEGIN
DECLARE @Result bigint 
SET @Result = CASE @Oprt
	WHEN '+' THEN @Opd1 + @Opd2 
	WHEN '-' THEN @Opd1 - @Opd2
	WHEN '*' THEN @Opd1 * @Opd2 
	WHEN '/' THEN @Opd1 / @Opd2 
	ELSE 0
END
Return @Result 
END

go

SELECT dbo.Calculator(4, 5, '+'),
dbo.Calculator(3, 7, '*') - dbo.Calculator(64, 4, '/') * 2.9 - 11

go


----------------------------------------
CREATE FUNCTION DYNTAB (@name varchar(100))
RETURNS Table AS
RETURN SELECT * FROM client WHERE name = @name

go

SELECT * FROM DYNTAB ('Ivan')

go


----------------------------------------
CREATE FUNCTION ParseStr (@String varchar (500))
RETURNS @tab1 TABLE
(
	Number int IDENTITY (1,1) NOT NULL,
	Substr nvarchar (30)
) AS
BEGIN
	DECLARE @Str1 varchar (500), @Pos int 
	SET @Str1 = @String
	WHILE 1 > 0 
	BEGIN
		SET @Pos = CHARINDEX(' ', @Str1) 
		IF @POS > 0
		BEGIN
			INSERT INTO @tab1
			VALUES (SUBSTRING (@Str1, 1, @Pos)) 

			set @Str1 = (SUBSTRING (@Str1, @Pos + 1, 500))
		END
		ELSE 
		BEGIN
			INSERT INTO @tab1 VALUES (@Str1)
			BREAK
		END 
	END 
	RETURN 
END

go

DECLARE @TestString varchar(500)
Set @TestString = 'SQL Server 2019' 
SELECT * FROM ParseStr (@TestString)

go




-------------------------------------------------------------------------------

----------------------------------------
CREATE procedure CalculatorProc 
	@Opd1 bigint,
	@Opd2 bigint,
	@Oprt char(1) = '*',
	@Result bigint output
 
AS 
BEGIN
	SET @Result = CASE @Oprt
		WHEN '+' THEN @Opd1 + @Opd2 
		WHEN '-' THEN @Opd1 - @Opd2
		WHEN '*' THEN @Opd1 * @Opd2 
		WHEN '/' THEN @Opd1 / @Opd2 
		ELSE 0
	END
	return  
END

go

declare @res bigint
execute CalculatorProc 3, 7, '*', @res output
select 'res' = @res

go


----------------------------------------
CREATE procedure DYNTAB_proc (@name varchar(100))
AS
SELECT * FROM client WHERE name = @name

go

exec DYNTAB_proc 'Ivan'

go


----------------------------------------
CREATE procedure ParseStr_proc (@String varchar (500))
AS
BEGIN
	declare @tab1 TABLE
	(
		Number int IDENTITY (1,1) NOT NULL,
		Substr nvarchar (30)
	)

	DECLARE @Str1 varchar (500), @Pos int 
	SET @Str1 = @String
	WHILE 1 > 0 
	BEGIN
		SET @Pos = CHARINDEX(' ', @Str1) 
		IF @POS > 0
		BEGIN
			INSERT INTO @tab1
			VALUES (SUBSTRING (@Str1, 1, @Pos)) 

			set @Str1 = (SUBSTRING (@Str1, @Pos + 1, 500))
		END
		ELSE 
		BEGIN
			INSERT INTO @tab1 VALUES (@Str1)
			BREAK
		END 
	END 
	select * from @tab1
END

go

DECLARE @TestString varchar(500)
Set @TestString = 'SQL Server 2019' 
execute ParseStr_proc @TestString 

go


----------------------------------------
execute sp_help ParseStr_proc
go