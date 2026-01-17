-- Transactions that were made through channels but unusually

SELECT * 
FROM [dbo].[Transaction listing]
WHERE [Transaction_Type] IN ('POS','ATM Withdrawal') 
	AND DATEPART(HOUR, [Timestamp]) BETWEEN 00 AND 04 AND [Previous_Fraudulent_Activity] = 1


