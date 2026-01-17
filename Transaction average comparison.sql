-- Average transaction per account vs individual transactions
WITH Avg_Trans_Per_Customer AS 
	(
		SELECT [User_ID], AVG([Transaction_Amount]) AS [Avg_Trans_Amount]
		FROM [dbo].[Transaction listing]
		GROUP BY [User_ID]			 
	)

-- Accounts that had transactions amounts higher than average 
SELECT *
FROM [dbo].[Transaction listing] AS tl
JOIN Avg_Trans_Per_Customer AS avgc
	ON tl.[User_ID] = avgc.[User_ID]
WHERE [Transaction_Amount] > avgc.[Avg_Trans_Amount] AND [Previous_Fraudulent_Activity] = 1;



 
