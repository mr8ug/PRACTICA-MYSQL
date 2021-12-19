echo "***** CREANDO BASE DE DATOS Y USUARIOS *****"
mysql -u root -pcampos31 -e "DROP DATABASE IF EXISTS Practica1; DROP USER 'admin_practica'@'localhost'; DROP USER 'employee_practica'@'localhost';" 2>/dev/null
mysql -u root -pcampos31 -e "source /home/mr8ug/Desktop/MIADIC21/Practica1/SQL_FILES/create_database.sql" 2>/dev/null  
mysql -u root -pcampos31 -e "show databases" 2>/dev/null
mysql -u root -pcampos31 -e "use mysql; select user from user;" 2>/dev/null
 

echo "***** CREANDO TABLAS TEMPORALES *****"
echo ">> Ejecutando como Administrador"
mysql -u root -pcampos31 -e "source /home/mr8ug/Desktop/MIADIC21/Practica1/SQL_FILES/temp_tables.sql; show tables;" 2>/dev/null

echo "***** EJECTUANDO ARCHIVO DE CONTROL 1 - CARGA EN GEONAMES *****"
mysql -u root -pcampos31 -e "source /home/mr8ug/Desktop/MIADIC21/Practica1/SQL_FILES/ctrl_file1.sql;" 2>/dev/null
mysql -u root -pcampos31 -e "USE Practica1; SELECT COUNT(*) FROM geonames_temp;" 2>/dev/null

echo "***** EJECTUANDO ARCHIVO DE CONTROL 2 - CARGA EN COUNTRY_CODES *****"
mysql -u root -pcampos31 -e "source /home/mr8ug/Desktop/MIADIC21/Practica1/SQL_FILES/ctrl_file2.sql; " 2>/dev/null
mysql -u root -pcampos31 -e "USE Practica1; select count(*) from country_codes_temp;" 2>/dev/null

echo "***** EJECTUANDO ARCHIVO DE CONTROL 3 - CARGA EN LEVEL_1A *****"
mysql -u root -pcampos31 -e "source /home/mr8ug/Desktop/MIADIC21/Practica1/SQL_FILES/ctrl_file3.sql; " 2>/dev/null
mysql -u root -pcampos31 -e "USE Practica1; select count(*) from level_1a_temp;" 2>/dev/null

echo "***** EJECTUANDO ARCHIVO DE CONTROL 4 - CARGA EN LOCATIONS *****"
mysql -u root -pcampos31 -e "source /home/mr8ug/Desktop/MIADIC21/Practica1/SQL_FILES/ctrl_file4.sql; " 2>/dev/null
mysql -u root -pcampos31 -e "USE Practica1; select count(*) from locations_temp;" 2>/dev/null

echo "***** EJECTUANDO ARCHIVO DE CONTROL 5 - CARGA EN PROJECTS *****"
mysql -u root -pcampos31 -e "source /home/mr8ug/Desktop/MIADIC21/Practica1/SQL_FILES/ctrl_file5.sql; " 2>/dev/null
mysql -u root -pcampos31 -e "USE Practica1; select count(*) from projects_temp;" 2>/dev/null

echo "***** EJECTUANDO ARCHIVO DE CONTROL 6 - CARGA EN TRANSACTIONS *****"
mysql -u root -pcampos31 -e "source /home/mr8ug/Desktop/MIADIC21/Practica1/SQL_FILES/ctrl_file6.sql; " 2>/dev/null
mysql -u root -pcampos31 -e "USE Practica1; select count(*) from transactions_temp;" 2>/dev/null

echo "***** CARGANDO MODELO ENTIDAD-RELACION EN BASE DE DATOS *****"
mysql -u root -pcampos31 -e "source /home/mr8ug/Desktop/MIADIC21/Practica1/SQL_FILES/load_er.sql; show tables;" 2>/dev/null

echo "***** MIGRANDO TABLAS TEMPORALES A MODELO ENTIDAD RELACION *****"
#mysql -u root -pcampos31 -e "source /home/mr8ug/Desktop/MIADIC21/Practica1/SQL_FILES/fill_database.sql;" 2>/dev/null
