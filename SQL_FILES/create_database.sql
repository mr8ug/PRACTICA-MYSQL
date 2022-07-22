DROP DATABASE IF EXISTS Practica1;
CREATE DATABASE Practica1;

CREATE USER 'admin_practica'@'localhost' IDENTIFIED BY 'admin';

GRANT ALL PRIVILEGES ON Practica1.* TO 'admin_practica'@'localhost';

CREATE USER 'employee_practica'@'localhost' IDENTIFIED BY 'employee';

GRANT SELECT ON Practica1.* TO 'employee_practica'@'localhost';
