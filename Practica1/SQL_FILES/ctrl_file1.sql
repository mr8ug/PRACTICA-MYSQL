USE PRACTICA1;

LOAD DATA  INFILE '/var/lib/mysql-files/geonames.csv'
INTO TABLE geonames_temp
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
