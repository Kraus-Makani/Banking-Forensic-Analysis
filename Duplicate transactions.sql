-- Duplicate transactions 
SELECT [User_ID], [Transaction_ID], COUNT(*) as Trans_Count
FROM [dbo].[Transaction listing]
GROUP BY [User_ID], [Transaction_ID]
HAVING COUNT(*) > 1

