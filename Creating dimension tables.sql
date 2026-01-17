-- Creating a User ID table
SELECT DISTINCT [User_ID]
INTO User_IDs
FROM  [dbo].[Transaction listing]

-- Creating a Device Type table
SELECT DISTINCT [Device_Type] 
INTO Device_Types
FROM  [dbo].[Transaction listing]

-- Creating a Card Type table
SELECT DISTINCT [Card_Type]
INTO Card_Types
FROM  [dbo].[Transaction listing]

-- Creating a Authentication Methods table
SELECT DISTINCT [Authentication_Method]
INTO Authentication_Methods
FROM  [dbo].[Transaction listing]

-- Creating a Transaction Types table
SELECT DISTINCT [Transaction_Type]
INTO Transaction_Types
FROM  [dbo].[Transaction listing]