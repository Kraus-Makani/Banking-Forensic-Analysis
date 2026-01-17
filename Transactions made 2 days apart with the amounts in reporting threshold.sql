SELECT 
		t1.[Transaction_ID]  AS Transaction1_ID,
        t2.[Transaction_ID]  AS Transaction2_ID,
        t1.[User_ID],
        t1.[Timestamp]		 AS TransactionDate1,
        t2.[Timestamp]		 AS TransactionDate2,
		t2.[Transaction_Amount],
        DATEDIFF(DAY, t1.[Timestamp], t2.[Timestamp]) AS DaysApart
FROM  
		[dbo].[Transaction listing] AS t1
INNER JOIN 
		[dbo].[Transaction listing] AS t2
        ON t1.[User_ID] = t2.[User_ID]
        AND ABS (DATEDIFF(DAY, t1.[Timestamp], t2.[Timestamp])) = 2
WHERE 	 t2.[Transaction_Amount] BETWEEN 500 AND 5000