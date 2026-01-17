--card type that experiences the most fraud
SELECT TOP 1
	[Card_Type], 
	 COUNT(*) as [Fraud_Count]
FROM [dbo].[Transaction listing]
WHERE [Fraud_Label] = 1
GROUP BY [Card_Type]
ORDER BY [Fraud_Count] DESC

--Authentication method that experiences the most fraud
SELECT TOP 1
	 [Authentication_Method], 
	 COUNT(*) as [Fraud_Count]
FROM [dbo].[Transaction listing]
WHERE [Fraud_Label] = 1
GROUP BY [Authentication_Method]
ORDER BY [Fraud_Count] DESC
