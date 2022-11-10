# Unit 7 Homework Assignment: Looking for Suspicious Transactions

### By: Yen


## Detecting Fraudulent Transactions: Part One
### Contain SQL views that allow users to determine if there is of potential fraudulent activity. Some of the views are transaction frequency, unusual spike, and timeframe of the activities.   

### Review Transaction [Frequency View](https://github.com/yenla9/LookforSupTran/blob/main/View_Count%20Transactions%20less%20than%20%242%20per%20cardholder.csv)
![cardholder_transaction](https://github.com/yenla9/LookforSupTran/blob/main/cardholder_transaction.GIF)


### Unusual Spike ([Top 100 transaction View](https://github.com/yenla9/LookforSupTran/blob/main/TOP%20100%20highest%20Transaction%20between%207am%20to%209am.csv))
![overall_trend](https://github.com/yenla9/LookforSupTran/blob/main/Top%20100%20Highest%20Transaction.GIF)

### Timeframe [View](https://github.com/yenla9/LookforSupTran/blob/main/Timeframe%20with%20higher%20number%20of%20transactions.csv)
![Timeframe](https://github.com/yenla9/LookforSupTran/blob/main/Timeframe.GIF)


### Top 5 Merchants who are prone to being hacked [View](https://github.com/yenla9/LookforSupTran/blob/main/Top%205%20Merchants%20prone%20to%20being%20hacked%20using%20small%20transaction.csv)

![Tope 5](https://github.com/yenla9/LookforSupTran/blob/main/top%205%20merchants.GIF)

### ERD Diagram
![ERD](https://github.com/yenla9/LookforSupTran/blob/main/ERD%20diagram.png)
Note: Please fill in your password for Postgres

PartOne.sql contains the query

schema.sql contains the schema of the database. 

## Part 2: 
### Contain a tool (visual_data_analysis.ipynb) that examines cardholder 2, cardholder 18 and cardholder 25 transaction activities.

This graph shows a few spikes for cardholder 18 compared to cardholder 2. It requires validation with cardholder 18.
![Comparison chart](https://github.com/yenla9/LookforSupTran/blob/main/2_18.GIF)

This graph shows 9 anomalies for cardholder 25. It requires validation with the cardholder.
![Transactions](https://github.com/yenla9/LookforSupTran/blob/main/outliers%2025.GIF)


## Challenge: 
### Contain a tool (challenge.ipynb) to identify anomalies using standard deviation for any cardholder. It displays a line graph of the anomalies
![STD](https://github.com/yenla9/LookforSupTran/blob/main/STD.GIF)

### Identify anomalies using interquartile range any cardholder. It displays a line graph of the anomalies
![IQR](https://github.com/yenla9/LookforSupTran/blob/main/IQR.GIF)
