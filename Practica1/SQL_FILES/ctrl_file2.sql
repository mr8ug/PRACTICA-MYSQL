USE PRACTICA1;

LOAD DATA  INFILE '/var/lib/mysql-files/country_codes.tsv'
INTO TABLE country_codes_temp
FIELDS TERMINATED BY '\t'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;