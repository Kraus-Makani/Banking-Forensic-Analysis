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

The data suggests a specific vulnerability with the most unrelaibale authentication method that resulted in  8,655 fraudulent transaction was the PIN method with most vulnerable card type being Mastercard. Mastercard was associated with the highest fraudulent transaction amounts.

### Geographical analysis
<img width="505" height="281" alt="Geographical analysis" src="https://github.com/user-attachments/assets/a2e37bd7-754e-4144-8eda-abbe352fc0a3" />

We noted as per the map visual that the largest trnsaction amounts associated with fruad came from Austrailia with the highest number of fraudulent transaction coming from India. The population India is significantly higher than the rest of the countries which could be causing this.
Furthermore, the data suggests 313 accounts had geographically impossible travel (proximity anomalies) which indicate organized exploitation and duplicate transaction patterns indicate organized exploitation.

### Transaction and Spend Analysis
<img width="578" height="324" alt="Transaction and Spend Analysis" src="https://github.com/user-attachments/assets/0e86671e-8a70-4ba5-a10d-6f9f8ca92e95" />

- The months of March, April and August and December noted a high number of fraudulent cases above the average of number of 2,828. 
- A signifcant number of fraudlent transactions were made through ATM withdrawal and online banking transctions with majority of the spending on travel, clothing, restaurants, and groceries.

### Benford's Law and Z-Score 
<img width="578" height="325" alt="Benford&#39;s Law and Z- Score" src="https://github.com/user-attachments/assets/351f1206-5172-46af-9342-98183345fd2c" />

#### Benford's Law
Benford's Law is a forensic analysis technique used to detect anomalies by using natural signatures, because numbers are not distrubuted evenlky in the real world. Benford’s Law predicts that in any naturally occurring set of numbers, the leading digit "1" should appear about 30% of the time, while the digit "5" should only appear about 7.9% of the time. The data suggest that transaction amounts that begun with the number 1 occurred about 33% of the time which is above the expected of 30% according to Benford's Law. Which indicate fraudlent activity.

#### Z-Score Analysis
A Z-Score measures how many Standard Deviations a data point is from the Average (Mean). Z-Score = 0: The transaction is exactly the average amount. Z-Score = 1: The transaction is slightly higher than average, but still very normal. Z-Score = 3 or higher: The transaction is a significant outlier. In a normal business environment, 99.7% of all transactions should have a Z-Score between -3 and +3. Anything outside of this is a statistical anomaly. According to the Z-Score analysis, a significant number of transactions with Password authentication method have a score higher than the desired threshold, this suggests a potential leak of login credentials.

### SQL Analysis Findings (Refer to SQL Outputs file)

#### Unusual transacting time and method
515 transaction were conducted at very unusual time using methods such as POS and ATM withdrawal which is deemed unusual.
#### Time interval check
3 transactions have been deemed susicious due to the short interval period of less than 5 minutes apart
#### Day Interval check
6 transactions were flagged as suspicious due to the short day interval period of 2 days with amounts just below the reporting threshold of ZMW 5000. 
#### Dormant account activity
We noted one account that had rapid account activity (5 transactions) after being dormant for a long period of time.

### Executive Summary & Recommendations
Problem Statement: Analysis confirms organized exploitation across multiple vectors, specifically targeting Mastercard PIN-based transactions and Password-authenticated account takeovers, resulting in significant volume spikes during March, April, August, and December.

#### 1. Immediate Security & Authentication Hardening
Finding: 8,655 fraudulent transactions were linked to the PIN method, with Mastercard being the most exploited card type.

Finding: Z-Score analysis confirms Password-authenticated transactions are major outliers, suggesting compromised credentials.

Recommendation: Phase out PIN-only authentication for high-value Mastercard transactions. Implement Mandatory Multi-Factor Authentication (MFA) for all accounts, specifically targeting users who have not updated passwords in the last 90 days.

#### 2. Geofencing & Velocity Controls
Finding: 313 accounts showed geographically impossible travel (proximity anomalies), and 515 transactions occurred at unusual times via POS/ATM.

Recommendation: Deploy "Impossible Travel" logic within the authorization engine. If a card is used in two distant locations (e.g., India and Australia) within a window that exceeds flight times, the second transaction should be automatically blocked and the card frozen.

#### 3. Fraud Pattern Recognition & Thresholds
Finding: Benford’s Law and Z-Score analysis show a 33% spike in transactions starting with "1" and specific structuring just below the ZMW 5,000 reporting limit.

Finding: One dormant account showed rapid reactivation (5 transactions), a classic sign of account takeover.

Recommendation: Implement "Dormancy Triggers." Any account inactive for 3+ months should require secondary identity verification before a transaction over a certain threshold is approved. Lower the "Velocity Alert" threshold for transactions occurring within 5-minute intervals.

#### 4. Regional Risk Management
Finding: India has the highest volume of fraud (likely due to population), but Australia shows the highest monetary impact (transaction amounts).

Recommendation: Apply Regional Risk Scoring. Transactions originating from India and Australia should undergo enhanced scrubbing during peak fraud months (March, April, August, and December) to protect against seasonal surges in Travel and Retail spending.

#### Risk Level- Threat Type- Primary Recommendation
CRITICAL- PIN/Password Breach- Enforce MFA and Mastercard PIN restrictions.
HIGH - Organized Exploitation - Deploy Geofencing & Impossible Travel blocks.
MEDIUM- Structuring/Dormancy - Adjust Velocity Limits & Reactivation Alerts.



