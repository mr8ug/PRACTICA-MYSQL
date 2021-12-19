USE Practica1;


LOAD DATA  INFILE '/var/lib/mysql-files/locations.csv'
INTO TABLE locations_temp
FIELDS TERMINATED BY '\t'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;