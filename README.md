# Forensic Detection of Multi-Vector Financial Fraud

## Problem Statement
The organization is experiencing sophisticated fraudulent activity characterized by velocity attacks (transactions seconds apart), structuring (staying just below reporting thresholds), and account takeovers of dormant profiles. Preliminary data suggests a specific vulnerability in Discover card ATM withdrawals and Password-authenticated transactions, particularly at the $500 amount. Furthermore, geographically impossible travel (proximity anomalies) and duplicate transaction patterns indicate organized exploitation. This analysis aims to isolate these high-risk clusters, quantify the impact of specific authenticator failures, and identify the primary locations and channels enabling these breaches to strengthen defensive controls.

## Tools and Methodology
### Tools
- Analysis and Data storage- Microsoft SQL Server
- Visualization- Microsoft Power BI
### Methodology
#### SQL Server Data Manioulation
- Data was imported into SQL server using the import/export wizard.
- Data manipulation was done using the attached SQL scripts. 
#### Microsoft Power BI Import Steps
- Imported directly from SQL server using Import data connectivity mode. This was picked because the data is not significantly large and does not require refreshes as it is not live.
-	Transformation was done to change name
s of tables in Power query to identify them as dimension/fact.
-	Created a date Dimension table using DAX in Power BI.
  
## Findings
### Transaction Overview
<img width="853" height="335" alt="Transaction Overview" src="https://github.com/user-attachments/assets/9a53a7bf-5300-44b0-b22d-65642445ca3e" />

### Authentication Methods
<img width="578" height="325" alt="Authentication methods analysis" src="https://github.com/user-attachments/assets/749dbe35-fd83-4210-ad7e-6a266a99c608" />

We noted that the most unrelaibale authentication method that resulted in fraduelnt transaction was the PIN method with most unreliable card type being Mastercard. 

### Transaction and Spend Analysis
<img width="577" height="323" alt="Transaction and Spend Analysis" src="https://github.com/user-attachments/assets/6f219fab-26ab-45bb-9132-09a26a27e43f" />

### Benford's Law and Z-Score 
<img width="578" height="325" alt="Benford&#39;s Law and Z- Score" src="https://github.com/user-attachments/assets/351f1206-5172-46af-9342-98183345fd2c" />

## Recommendations







