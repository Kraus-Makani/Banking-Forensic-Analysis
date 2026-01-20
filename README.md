# Forensic Detection of Multi-Vector Financial Fraud

## Problem Statement
The organization is experiencing sophisticated fraudulent activity characterized by velocity attacks (transactions seconds apart), structuring (staying just below reporting thresholds), and account takeovers of dormant profiles. This analysis aims to isolate these high-risk clusters, quantify the impact of specific authenticator failures, and identify the primary locations and channels enabling these breaches to strengthen defensive controls.

## Tools and Methodology
### Tools
- Analysis and Data storage- Microsoft SQL Server
- Visualization- Microsoft Power BI
### Methodology
#### SQL Server Data Manipulation
- Data was imported into SQL server using the import/export wizard.
- Data manipulation was done using the attached SQL scripts. 
#### Microsoft Power BI Import Steps
- Imported directly from SQL server using Import data connectivity mode. This was picked because the data is not significantly large and does not require refreshes as it is not live.
-	Transformation was done to change names of tables in Power query to identify them as dimension/fact.
-	Created a date Dimension table using DAX in Power BI.
  
## Findings
### Transaction Overview
<img width="740" height="293" alt="Transaction Overview" src="https://github.com/user-attachments/assets/635fa7d7-0fab-4da3-8edb-d32520d5d2ee" />

### Authentication Methods
<img width="578" height="325" alt="Authentication methods analysis" src="https://github.com/user-attachments/assets/749dbe35-fd83-4210-ad7e-6a266a99c608" />

The data suggests a specific vulnerability with the most unrelaibale authentication method that resulted in  8,655 fraudulent transaction was the PIN method with most vulnerable card type being Mastercard. 

### Geographical analysis
Furthermore, the data suggests 313 accounts had geographically impossible travel (proximity anomalies) which indicate organized exploitation and duplicate transaction patterns indicate organized exploitation.
### Transaction and Spend Analysis
<img width="578" height="324" alt="Transaction and Spend Analysis" src="https://github.com/user-attachments/assets/0e86671e-8a70-4ba5-a10d-6f9f8ca92e95" />

- The months of March, April and August and December noted a high number of fraudulent cases above the average of number of 2,828. 
- A signifcant number of fraudlent transactions were made through ATM withdrawal and online banking transctions with majority of the spending on travel, clothing, restaurants, and groceries.

### Benford's Law and Z-Score 
<img width="578" height="325" alt="Benford&#39;s Law and Z- Score" src="https://github.com/user-attachments/assets/351f1206-5172-46af-9342-98183345fd2c" />

### SQL Analysis Findings (Refer to SQL Outputs file)

#### Unusual transacting time and method
515 transaction were conducted at very unusual time using methods such as POS and ATM withdrawal which is deemed unusual.
#### Time interval check
3 transactions have been deemed susicious due to the short interval period of less than 5 minutes apart
#### Day Interval check
6 transactions were flagged as suspicious due to the short day interval period of 2 days with amounts just below the reporting threshold of ZMW 5000. 
#### Dormant account activity
We noted one account that had rapid account activity (5 transactions) after being dormant for a long period of time.

## Recommendations

Preliminary  in Discover card ATM withdrawals and Password-authenticated transactions, particularly at the $500 amount. Furthermore, geographically impossible travel (proximity anomalies) and duplicate transaction patterns indicate organized exploitation.





