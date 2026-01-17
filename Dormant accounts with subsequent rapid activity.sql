    WITH TransactionHistory  AS (
		SELECT
			[Transaction_ID],
			[User_ID],
			[Timestamp],
			LAG([Timestamp]) OVER (PARTITION BY USER_id ORDER BY [Timestamp]) AS PreviousTransactionDate
		FROM 
			[dbo].[Transaction listing]
	),
	ThreeMonthReturns  AS (
		SELECT
			[Transaction_ID],
			[User_ID],
			[Timestamp] AS ReturnDate,
			DATEDIFF(DAY, PreviousTransactionDate, [Timestamp]) AS DaysSinceLast
		FROM 
			TransactionHistory
		WHERE 
			PreviousTransactionDate IS NOT NULL
			AND DATEDIFF(DAY, PreviousTransactionDate, [Timestamp]) >= 90
	),
	
	PostReturnCounts AS (
    SELECT
        r.[Transaction_ID],
        r.[User_ID],
        r.ReturnDate,
		MAX(t.[Timestamp]) AS LastTransactionDate,
        COUNT(t.[Transaction_ID]) AS SubsequentTransactionCount 
		
    FROM 
        ThreeMonthReturns AS r
    JOIN 
        [dbo].[Transaction listing] AS  t
        ON r.[User_ID] = t.[User_ID]
        AND t.[Timestamp] > r.ReturnDate
		AND t.[Timestamp] <= DATEADD(DAY, 30, r.ReturnDate)
    GROUP BY 
        r.[Transaction_ID], r.USER_id, r.ReturnDate
	)
	SELECT *
	FROM PostReturnCounts
	WHERE SubsequentTransactionCount BETWEEN 5 AND 50