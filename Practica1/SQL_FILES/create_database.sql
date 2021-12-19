USE PRACTICA1;

CREATE DATABASE Practica1;

CREATE USER 'admin_practica'@'localhost' IDENTIFIED BY 'admin';

GRANT Alter ON Practica1.* TO 'admin_practica'@'localhost';
GRANT Create ON Practica1.* TO 'admin_practica'@'localhost';
GRANT Create view ON Practica1.* TO 'admin_practica'@'localhost';
GRANT Delete ON Practica1.* TO 'admin_practica'@'localhost';
GRANT Drop ON Practica1.* TO 'admin_practica'@'localhost';
GRANT Grant option ON Practica1.* TO 'admin_practica'@'localhost';
GRANT Index ON Practica1.* TO 'admin_practica'@'localhost';
GRANT Insert ON Practica1.* TO 'admin_practica'@'localhost';
GRANT References ON Practica1.* TO 'admin_practica'@'localhost';
GRANT Select ON Practica1.* TO 'admin_practica'@'localhost';
GRANT Show view ON Practica1.* TO 'admin_practica'@'localhost';
GRANT Trigger ON Practica1.* TO 'admin_practica'@'localhost';
GRANT Update ON Practica1.* TO 'admin_practica'@'localhost';
GRANT Alter routine ON Practica1.* TO 'admin_practica'@'localhost';
GRANT Create routine ON Practica1.* TO 'admin_practica'@'localhost';
GRANT Create temporary tables ON Practica1.* TO 'admin_practica'@'localhost';
GRANT Execute ON Practica1.* TO 'admin_practica'@'localhost';
GRANT Lock tables ON Practica1.* TO 'admin_practica'@'localhost';

CREATE USER 'employee_practica'@'localhost' IDENTIFIED BY 'employee';

GRANT SELECT ON Practica1.* TO 'employee_practica'@'localhost';
