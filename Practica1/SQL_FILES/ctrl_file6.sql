USE PRACTICA1;

LOAD DATA  INFILE '/var/lib/mysql-files/transactions.csv'
INTO TABLE transactions_temp
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;