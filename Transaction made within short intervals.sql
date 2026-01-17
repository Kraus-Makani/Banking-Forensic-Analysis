--Transaction made within short intervals
	WITH RapidCrossLocation AS (
    SELECT
        t1.[Transaction_ID]       AS Transaction1_ID,
        t2.[Transaction_ID]       AS Transaction2_ID,
        t1.[User_ID],
        t1.[Location]            AS Location1,
        t2.[Location]            AS Location2,
        t1.[Timestamp]     AS TransactionDate1,
        t2.[Timestamp]     AS TransactionDate2,
        DATEDIFF(MINUTE, t1.[Timestamp], t2.[Timestamp]) AS MinutesApart
    FROM 
        [dbo].[Transaction listing] AS t1
    INNER JOIN 
        [dbo].[Transaction listing] AS t2
        ON t1.[User_ID] = t2.[User_ID]
        AND CAST(t1.[Timestamp] AS DATE) = CAST(t2.[Timestamp] AS DATE)
        -- ensure chronological ordering and time window
        AND t2.[Timestamp] > t1.[Timestamp]
        AND DATEDIFF(MINUTE, t1.[Timestamp], t2.[Timestamp]) <= 5
        -- different locations
        AND t1.[Location] <> t2.[Location]
)
SELECT *
FROM RapidCrossLocation;