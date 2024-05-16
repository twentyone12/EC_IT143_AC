SELECT tblPositionDim.p_name, dbo.tblPlayerDim.pl_name
FROM dbo.tblPositionDim
LEFT JOIN dbo.tblPlayerDim ON dbo.tblPositionDim.p_id = dbo.tblPlayerDim.p_id
ORDER BY dbo.tblPlayerDim.pl_name


