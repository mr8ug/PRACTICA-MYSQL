USE Practica1;


LOAD DATA  INFILE '/var/lib/mysql-files/projects.csv'
INTO TABLE projects_temp
CHARACTER SET 'latin1'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;