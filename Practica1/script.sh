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
mysql -u root -pcampos31 -e "source /home/mr8ug/Desktop/MIADIC21/Practica1/SQL_FILES/fill_database.sql;" 2>/dev/null

echo ">>>>>MODELO RELACIONAL CARGADO... ELIMINANDO TABLAS TEMPORALES...<<<<<"
mysql -u root -pcampos31 -e "source /home/mr8ug/Desktop/MIADIC21/Practica1/SQL_FILES/drop_temps.sql; show tables;" 2>/dev/null

echo ">>>>> MOSTRANDO CANTIDAD EN TABLAS <<<<<"
mysql -u employee_practica -pemployee -e "use Practica1; select count(*) as project from project;" 2>/dev/null
mysql -u employee_practica -pemployee -e "use Practica1; select count(*)  as transaction from transaction;" 2>/dev/null
mysql -u employee_practica -pemployee -e "use Practica1; select count(*)  as currency from currency;" 2>/dev/null
mysql -u employee_practica -pemployee -e "use Practica1; select count(*)  as status from status;" 2>/dev/null
mysql -u employee_practica -pemployee -e "use Practica1; select count(*)  as locations from locations;" 2>/dev/null
mysql -u employee_practica -pemployee -e "use Practica1; select count(*)  as geoname from geoname;" 2>/dev/null
mysql -u employee_practica -pemployee -e "use Practica1; select count(*)  as level_1a from level_1a;" 2>/dev/null
mysql -u employee_practica -pemployee -e "use Practica1; select count(*)  as countrycodes from countrycodes;" 2>/dev/null

echo "Mostrando Consulta 1: Cuantos proyectos iniciaron en 2011?"
mysql -u employee_practica -pemployee -e "use Practica1;
SELECT COUNT(YEAR(STR_TO_DATE(start_actual_isodate, '%d/%m/%Y')) )as Proyectos_desde_2011 
from project
where YEAR(STR_TO_DATE(start_actual_isodate, '%d/%m/%Y')) =2011;" 2>/dev/null

echo "Mostrando Consulta 2: Cual fue el proyecto de mayor duracion?"
mysql -u employee_practica -pemployee -e "use Practica1;
SELECT project_title as Proyecto , DATEDIFF( IF(end_actual_isodate='',NOW(),STR_TO_DATE(end_actual_isodate ,'%d/%m/%Y')), STR_TO_DATE(start_actual_isodate,'%d/%m/%Y')) as Proyecto_con_mas_duracion_dias
from project
order by Proyecto_con_mas_duracion_dias desc
LIMIT 1;" 2>/dev/null

echo "Mostrando Consulta 3: Cual fue el proyecto con menor duracion?"
mysql -u employee_practica -pemployee -e "use Practica1;
SELECT project_title as Proyecto , DATEDIFF( IF(end_actual_isodate='',NOW(),STR_TO_DATE(end_actual_isodate ,'%d/%m/%Y')), STR_TO_DATE(start_actual_isodate,'%d/%m/%Y')) as Proyecto_con_menor_duracion_dias
from project
order by Proyecto_con_menor_duracion_dias asc
LIMIT 1;" 2>/dev/null

echo "Mostrando Consulta 4: Top 5 paises con mas proyectos asignados"
mysql -u employee_practica -pemployee -e "USE Practica1;
SELECT c.name as Pais, count(p.project_title) as Proyectos
FROM project as p, countrycodes as c
where p.recipients = c.id 
GROUP BY Pais
ORDER BY Proyectos DESC 
LIMIT 5;" 2>/dev/null

echo "Mostrando Consulta 5: Top 5 paises con menos proyectos asignados"
mysql -u employee_practica -pemployee -e "USE Practica1;
SELECT c.name as Pais, count(p.project_title) as Proyectos
FROM project as p, countrycodes as c
where p.recipients = c.id 
GROUP BY Pais
ORDER BY Proyectos ASC 
LIMIT 5;" 2>/dev/null

echo "Mostrando Consulta 6: Cual fue el proyecto con mas costo?"
mysql -u employee_practica -pemployee -e "USE Practica1;
Select project_title as Proyecto , total_commitments as Costo
from project
order by Costo desc
Limit 1;" 2>/dev/null

echo "Mostrando Consulta 7: Cual fue el proyecto con menos costo?"
mysql -u employee_practica -pemployee -e "USE Practica1;
Select project_title as Proyecto , total_commitments as Costo 
from project
order by Costo asc
Limit 1;" 2>/dev/null

echo "Mostrando Consulta 8: Top 5 proyectos mas costosos"
mysql -u employee_practica -pemployee -e "USE Practica1;
Select project_title as Proyecto , total_commitments as Costo 
from project
order by Costo desc
Limit 5;" 2>/dev/null

echo "Mostrando Consulta 9: Costo total de todos los proyectos"
mysql -u employee_practica -pemployee -e "USE Practica1;
Select SUM(total_commitments) as Costo_Proyectos
from project;" 2>/dev/null

echo "Mostrando Consulta 10: Top 3 transacciones mas costosas RI-EAST Africa Public Health Laboratory Networking Project"
mysql -u employee_practica -pemployee -e "USE Practica1;
Select p.id_project as ID_Proyecto ,t.id_transaction as Transaccion, t.transaction_value as Valor
FROM project as p, transaction as t
WHERE p.project_title ='AFCC2/RI-East Africa Public Health Laboratory Networking Project' and t.id_project = p.id_project 
ORDER BY Valor DESC 
LIMIT 3;" 2>/dev/null

