CREATE PROCEDURE dbo.usp_hello_world_load
AS
	BEGIN
		-- 1) reload data
		 TRUNCATE TABLE dbo.t_hello_world;

		 INSERT INTO dbo.t_hello_world
				SELECT v.my_message
					, v.current_date_time
					FROM dbo.v_hello_world_load AS v;

		-- 2) review results

		SELECT t.*
			FROM dbo.t_hello_world AS t;

	END:
GO