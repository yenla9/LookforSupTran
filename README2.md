# Unit 7 Homework Assignment: Looking for Suspicious Transactions

### By: Yen


## Detecting Fraudulent Transactions
### Contain views from SQL database that analyze card transactions to determine if there is of potential fraudulent activity. The tool has capabilities to analyze transaction frequency, unusual spike in activities and timeframe of the activities.   

### Review Transaction [Frequency View](https://github.com/yenla9/LookforSupTran/blob/main/View_Count%20Transactions%20less%20than%20%242%20per%20cardholder.csv)
![cardholder_transaction](https://github.com/yenla9/LookforSupTran/blob/main/cardholder_transaction.GIF)


### Unusual Spike in activities ([Top 100 transaction View](https://github.com/yenla9/LookforSupTran/blob/main/TOP%20100%20highest%20Transaction%20between%207am%20to%209am.csv))
![overall_trend](https://github.com/yenla9/LookforSupTran/blob/main/Top%20100%20Highest%20Transaction.GIF)

### Timeframe of the transaction [View](https://github.com/yenla9/LookforSupTran/blob/main/Timeframe%20with%20higher%20number%20of%20transactions.csv)
![Timeframe](https://github.com/yenla9/LookforSupTran/blob/main/Timeframe.GIF)


### Top 5 Merchants who are prone to being hacked [View](https://github.com/yenla9/LookforSupTran/blob/main/Top%205%20Merchants%20prone%20to%20being%20hacked%20using%20small%20transaction.csv)

![dashboard](https://github.com/yenla9/LookforSupTran/blob/main/top%205%20merchants.GIF)

### ERD Diagram
![ERD](https://github.com/yenla9/LookforSupTran/blob/main/ERD%20diagram.png)
Note: Please fill in your password for Postgres

PartOne.sql is the Query

Schema.qul is the schema of the database. 

## Part 2: 
### Contain a tool (visual_data_analysis.ipynb) that examines cardholder 2, cardholder 18 and cardholder 25 transaction activities.
The graph shows a few spikes for cardholder 18 when compared to cardholder 2. 
![Comparison chart](https://github.com/yenla9/LookforSupTran/blob/main/2_18.GIF)

### There was a detailed analysis done for cardholder 25. Shown by the graph there are 9 anomalies.
![Transactions](https://github.com/yenla9/LookforSupTran/blob/main/outliers%2025.GIF)


