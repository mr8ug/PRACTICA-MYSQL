USE Practica1;


LOAD DATA  INFILE '/var/lib/mysql-files/level_1a.csv'
INTO TABLE level_1a_temp
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;