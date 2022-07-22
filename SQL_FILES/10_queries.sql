--Consulta 1
use Practica1;
SELECT COUNT(YEAR(STR_TO_DATE(start_actual_isodate, '%d/%m/%Y')) )as Proyectos_desde_2011 
from project
where YEAR(STR_TO_DATE(start_actual_isodate, '%d/%m/%Y')) =2011;


--Consulta 2
use Practica1;
SELECT project_title as Proyecto , DATEDIFF( IF(end_actual_isodate='',NOW(),STR_TO_DATE(end_actual_isodate ,'%d/%m/%Y')), STR_TO_DATE(start_actual_isodate,'%d/%m/%Y')) as Proyecto_con_mas_duracion_dias
from project
order by Proyecto_con_mas_duracion_dias desc
LIMIT 1;

--Consulta 3
use Practica1;
SELECT project_title as Proyecto , DATEDIFF( IF(end_actual_isodate='',NOW(),STR_TO_DATE(end_actual_isodate ,'%d/%m/%Y')), STR_TO_DATE(start_actual_isodate,'%d/%m/%Y')) as Proyecto_con_menor_duracion_dias
from project
order by Proyecto_con_menor_duracion_dias asc
LIMIT 1;

--Consulta 4
USE Practica1;
SELECT c.name as Pais, count(p.project_title) as Proyectos
FROM project as p, countrycodes as c
where p.recipients = c.id 
GROUP BY Pais
ORDER BY Proyectos DESC 
LIMIT 5;

--Consulta 5
USE Practica1;
SELECT c.name as Pais, count(p.project_title) as Proyectos
FROM project as p, countrycodes as c
where p.recipients = c.id 
GROUP BY Pais
ORDER BY Proyectos ASC 
LIMIT 5;

--Consulta 6
USE Practica1;
Select project_title as Proyecto , total_commitments as Costo
from project
order by Costo desc
Limit 1;

--Consulta 7
USE Practica1;
Select project_title as Proyecto , total_commitments as Costo 
from project
order by Costo asc
Limit 1;

--Consulta 8
USE Practica1;
Select project_title as Proyecto , total_commitments as Costo 
from project
order by Costo desc
Limit 5;

--Consulta 9
USE Practica1;
Select SUM(total_commitments) as Costo_Proyectos
from project;

--Constulta 10
USE Practica1;
Select p.id_project as ID_Proyecto ,t.id_transaction as Transaccion, t.transaction_value as Valor
FROM project as p, transaction as t
WHERE p.project_title ='AFCC2/RI-East Africa Public Health Laboratory Networking Project' and t.id_project = p.id_project 
ORDER BY Valor DESC 
LIMIT 3;