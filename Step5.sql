CREATE FUNCTION [dbo].[udf_parse_first_name]
(@v_combined_name AS VARCHAR(500)
)
RETURNS VARCHAR(100)

/***********************************
Name: dbo.udf_parse_first_name
PURPOSE: Pars first name form combined name

MODIFICATION LOG

RUNTIME
1s

NOTES
Adaptted from the following

*****************/

BEGIN

	DECLARE @v_first_name AS VARCHAR(100);

	SET @v_first_name = LEFT(@v_combined_name, CHARINDEX(' ', @v_combined_name + ' ') - 1);

	RETURN @v_first_name;

END;

GO