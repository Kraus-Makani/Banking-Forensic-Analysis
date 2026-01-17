--User with Transaction on the same day in different locations
		SELECT 
			[User_ID],
			CAST([Timestamp] AS DATE) AS [Transaction_date],
			COUNT (DISTINCT [Location]) AS Location_count
		FROM 
			[dbo].[Transaction listing]
		GROUP BY 
			[User_ID],
			CAST([Timestamp] AS DATE)
		HAVING 
			COUNT(DISTINCT [Location])> 1


