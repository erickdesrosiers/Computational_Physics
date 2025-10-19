CREATE TABLE tabla1 (
    id SERIAL,
    atributo1 VARCHAR(32),
    atributo2 TEXT,
    atributo3 DATE,
    atributo4 TIME,
    atributo5 numeric (5,2)
);

CREATE TABLE tabla2 (
    id SERIAL,
    atributo1 VARCHAR(32),
    atributo2 TEXT,
    atributo3 DATE,
    atributo4 TIME,
    atributo5 numeric (5,2)    ,
    idt1 INTEGER
);

CREATE TABLE tabla3 (
    id SERIAL,
    atributo1 VARCHAR(32),
    atributo2 TEXT,
    atributo3 DATE,
    atributo4 TIME,
    atributo5 numeric (5,2),
    idt1 INTEGER);



CREATE TABLE tabla5(
id1 INTEGER,
Id2 INTEGER
);

ALTER TABLE tabla5 ADD CONSTRAINT  pk_tabla4_id1id2 PRIMARY KEY (id1,id2);

ALTER TABLE tabla2 ADD CONSTRAINT fk_tabla2_idt1_tabla1_id FOREIGN KEY (idt1) REFERENCES tabla1(id);
ALTER TABLE tabla3 ADD CONSTRAINT fk_tabla4_idt1_tabla1_id FOREIGN KEY (idt1) REFERENCES tabla1(id);

ALTER TABLE tabla5 ADD COLUMN atributo0 VARCHAR (16);
ALTER TABLE tabla5 ADD COLUMN atributo1 VARCHAR (16);

ALTER TABLE tabla5 DROP COLUMN atributo0;


ALTER TABLE tabla5 ADD COLUMN nombre VARCHAR(64);
ALTER TABLE tabla5 ADD COLUMN app VARCHAR(64);
ALTER TABLE tabla5 ADD COLUMN apm VARCHAR(64);
ALTER TABLE tabla5 ADD COLUMN atributo0 VARCHAR(64);
ALTER TABLE tabla5 DROP COLUMN app;

ALTER TABLE tabla5 ADD CONSTRAINT unq_tabla5_atributo0 UNIQUE (atributo0);


CREATE TABLE tabla6 (
    atributo1 SERIAL,
    atributo2 VARCHAR (12)
);
INSERT INTO tabla6 (atributo2) VALUES ('Erick');
INSERT INTO tabla6 (atributo2) VALUES ('Erick');

DELETE from tabla6;

SELECT * FROM tabla6;
ALTER TABLE tabla6 ADD CONSTRAINT unq_tabla6_atributo0 UNIQUE (atributo2);

ALTER SEQUENCE tabla6_atributo1_seq RESTART WITH 1;


ALTER TABLE tabla2 ADD CONSTRAINT chk_tabla2_atributo5 CHECK ( atributo5>20 );

ALTER TABLE tabla2 DROP CONSTRAINT fk_tabla2_idt1_tabla1_id;
ALTER TABLE tabla2 DROP COLUMN idt1;

ALTER TABLE tabla3 DROP COLUMN idt1;

ALTER TABLE tabla2 ALTER COLUMN atributo2 TYPE INTEGER USING (atributo2::INTEGER);
ALTER TABLE tabla3 ALTER COLUMN atributo2 TYPE INTEGER USING (atributo2::INTEGER);

ALTER TABLE tabla3 ALTER COLUMN atributo2 SET NOT NULL ;
ALTER TABLE tabla3 ALTER COLUMN atributo3 SET NOT NULL ;

ALTER TABLE tabla3 ALTER COLUMN atributo3 DROP NOT NULL ;

INSERT INTO tabla3 (atributo1, atributo2, atributo3, atributo4)
VALUES ('ORLANDO',2,NULL,NULL);

SELECT * FROM tabla3;

--Esto es un comentario de una línea
/*
 Este es un comentario multilínea
 */



/*
 SELECT:NOS PERMITE INDICAR EL LISTADO DE ATRIBUTOS QUE SE DESEAN OBTENER DE LA TABLA O RELACIÓN ESPECIFICADA EN LA
 SENTENCIA FROM.
 FROM: NOS PERMITE ESPECIFICAR LA TABLA/RELACIÓN DE DONDE EXTRAREMOS LOS DATOS
 WHERE: NOS PERMITE INDICAR RESTRICCIONES SOBRE LAS TUPLAS DE LAS TABLAS/RELACIÓN A UTILIZAR
 */

-- * permite obtener todos los atributos de la tabla o relación indicada en from
--La lista de atributos que deseo obtener de los datos
SELECT *
--origen de los datos
FROM persona;

-- Todos los atributos de las personas

SELECT  id_persona, nombre,apm,app, correo
FROM persona;

SELECT id_persona, nombre, app, apm, correo
FROM persona;

--Todas las personas con cuyo ID  es mayor o menor  a 100
SELECT id_persona, nombre, app, app,correo
FROM persona
where id_persona < 100;
--Todas las personas con cuyo ID  igual a 100
SELECT id_persona, nombre, app, app,correo
FROM persona
where id_persona = 100;

--Todas las personas con cuyo ID  es menor o igual  a 100
SELECT id_persona, nombre, app,app, correo
FROM persona
where id_persona <= 100;

SELECT *
FROM persona;

SELECT nombre,app, apm
FROM persona;

-- concatenar "cadena1 + cadena2" -> "cadena1cadena2"
-- ||
-- cadena en postgresql ''

SELECT id_aseguradora || nombre_aseguradora
FROM aseguradora;

--IDaseguradora - Nombreaseguradora
SELECT id_aseguradora ||'-' || nombre_aseguradora
FROM aseguradora;

--Nombre completo: NombreAppApm
--Nombre completo: Nombre App Apm

SELECT 'Nombre completo: ' || nombre ||' '|| app || ' 'apm
from persona;

--LIKE
-- Permite comparar valores en cadena

--LIKE->=

SELECT id_persona, nombre, app, correo
FROM persona WHERE nombre NOT LIKE 'Irina';

-- Verificar la existencia de un valor o de una cadena al principio del valor de una cadena

--CASE SENSITIVE
SELECT id_persona, nombre, correo
FROM persona
WHERE nombre LIKE 'Er%';

SELECT upper(nombre)
FROM persona;

SELECT nombre FROM persona;

SELECT id_persona,upper(nombre), correo FROM persona
WHERE upper(nombre) LIKE 'ER%';

--LIKE '%algo';
SELECT*
FROM aseguradora
WHERE nombre_aseguradora LIKE '%a';

SELECT*
FROM aseguradora
WHERE upper(nombre_aseguradora) LIKE '%A';


SELECT*
FROM aseguradora
WHERE lower(nombre_aseguradora) LIKE '%a';

--LIKE '%ALGO%'
--Todos los datos de una aseguradora quw contiene la letra n en su nombre


SELECT *
FROM aseguradora
WHERE lower(nombre_aseguradora) LIKE '%n%';

SELECT substring('ERICK'from 1 for 3);

SELECT substring(app FROM 2 for 2)
FROM persona;

SELECT id_persona, nombre, correo
FROM persona
WHERE id_persona BETWEEN 1000 and 5000;

--ORDER BY
SELECT id_persona,app,nombre
From persona
WHERE id_persona>5000
ORDER BY id_persona desc ;

SELECT id_persona,app,nombre
From persona
WHERE id_persona>5000
ORDER BY id_persona asc;

SELECT id_persona,app,nombre
From persona
WHERE id_persona>5000
ORDER BY id_persona asc;

--LIMIT
--limitar o restringir el total de tuplas que deseamos recuperar
SELECT * from persona
ORDER BY id_persona
LIMIT 5;

--TRIM FUNCIÓN PARA ELIMINAR ESPACIOS A LA IZQUIERDA Y A LA DERECHA DE UN VALOR CADENA
--FUNCIONES DE CADENA DE POSTGRES SQL
SELECT ltrim('       ERICK');

SELECT ltrim ('ERICK     ');

SELECT ltrim(NOMBRE)
FROM persona;

UPDATE persona SET nombre=ltrim(nombre);

SELECT Rtrim('       ERICK');
SELECT ltrim ('ERICK     ');

SELECT ltrim(NOMBRE)
FROM persona;

UPDATE persona SET nombre=rtrim(nombre);

SELECT trim( '     erick        ');

--OFFSET
-- Descartará las primeras n tuplas y devolverá todas las siguientes tuplas de la consulta resultado

SELECT *
FROM persona
ORDER BY id_persona ASC
OFFSET 5 ROWS;

--FETCH NEXT
-- Indicar el número de tuplas a recuperar después de un descarte

SELECT *
FROM persona
ORDER BY id_persona ASC
OFFSET 10 ROWS fetch next 5 rows only;

--Cast nos permite convertir el tipo de dato de un valor
SELECT CAST ('23' AS INTEGER);

SELECT CAST (id_persona as varchar(8))
from persona;

SELECT CAST('2020-04-06' AS DATE);

SELECT nombre,app,apm
from persona
where id_persona IN (3,5);


SELECT nombre,app,apm
from persona
where id_persona not IN (3,5);

-- CURRENT_DATE, CURRENT_TIME, DATE_PART

select CURRENT_DATE;

SELECT CURRENT_TIME;

select date_part('DAY', CAST('2020-04-06' AS DATE));

select date_part('MONTH', CAST('2020-04-06' AS DATE));

SELECT date_part('day', fecha_pago)
FROM pago;

SELECT date_part('month', fecha_pago)
FROM pago;
SELECT date_part('year', fecha_pago)
FROM pago;

SELECT 'nombre completo:', nombre, app, apm,0, CURRENT_DATE, CURRENT_TIME
FROM persona;

/*
 Subconsulta
 es una consulta cuyo resultado es necesario para que se pueda ejecutar una consulta "exterior" o principal


 SELECT *
FROM tabla
WHERE  atributo (
           SELECT
           FROM
            WHERE


           );
 */
 --Nombre y apellido de aquellas personas son agentes

SELECT *
FROM persona;

SELECT DISTINCT id_persona
From agente;

SELECT nombre, app, apm
from persona
where id_persona  in (

    SELECT DISTINCT id_persona
    FROM agente
    );

SELECT nombre, app, apm
from persona
where id_persona IN (
SELECT  id_persona
from poliza
where id_poliza > 100);

-- Nombre completo de las personas que realizaron algun pago de poliza en el año 2016


SELECT nombre, app, apm
FROM persona
where id_persona in (
-- ids de las personas que son dueñas de al menos una poliza que registró un pago en el 2016
    SELECT DISTINCT id_persona
    from poliza
    WHERE id_poliza In
          (SELECT DISTINCT id_poliza
           FROM pago
           where date_part('year', fecha_pago) = 2016
          )
);

--ID Y nombre completo separado por atributos de las personas
SELECT *
FROM (
SELECT id_persona,nombre,app,apm
FROM persona) AS T1


--

where T1.id_persona<500;

/*
 MIN, MAX, COUNT, SUM, AVG
 */

--GROUP BY
SELECT id_cgenero,nombre,COUNT(nombre)
FROM persona
GROUP BY id_cgenero, nombre;

--DE QUE GÉNERO HAY MÁS PERSONAS
SELECT MAX(total)
FROM(
SELECT id_cgenero, count(id_persona) as total
FROM persona
GROUP BY id_cgenero) T1;

SELECT genero
FROM cgenero
WHERE  id_cgenero=
(SELECT id_cgenero
FROM
(SELECT id_cgenero,COUNT(nombre) total
FROM persona
GROUP BY id_cgenero) T2
WHERE total=(SELECT MAX(total)
FROM (
SELECT id_cgenero, count(id_persona) as total
FROM persona
GROUP BY id_cgenero) T1));

-- Total de personas con un nombre especifico de cada género

(SELECT ID_CGENERO, NOMBRE, COUNT (id_persona)
FROM persona

GROUP BY ID_CGENERO, NOMBRE);

--¿Cuál es el nombre más frecuente para los hombres?
SELECT nombre,id_cgenero, total
FROM
(SELECT ID_CGENERO, NOMBRE, COUNT (id_persona) total
FROM persona
WHERE id_cgenero=(SELECT id_cgenero
    FROM cgenero
    where genero like 'Masculino' )
GROUP BY ID_CGENERO, NOMBRE) T2

WHERE T2.total= (SELECT MAX(total)
    FROM

(SELECT ID_CGENERO, NOMBRE, COUNT (id_persona) total
FROM persona
WHERE id_cgenero=(SELECT id_cgenero
    FROM cgenero
    where genero like 'Masculino'
    )
GROUP BY ID_CGENERO, NOMBRE) T1
)


SELECT min(id_persona)
FROM persona;

SELECT max(id_persona)
FROM persona;

SELECT AVG(id_persona)
FROM persona;

SELECT COUNT (correo)
FROM persona;

SELECT COUNT(id_persona)
FROM persona
WHERE correo IS NULL;

SELECT 1
UNION

SELECT 1;

SELECT 1
UNION ALL
SELECT 1;

SELECT  nombre,app
FROM persona
WHERE id_cgenero=1
UNION ALL
SELECT  nombre,app
FROM persona
WHERE id_cgenero=2;

SELECT  nombre,app,apm
FROM persona
WHERE id_cgenero=1
UNION ALL
SELECT  nombre,app,apm
FROM persona
WHERE id_cgenero=2;


SELECT nombre,app
FROM persona

INTERSECT
SELECT nombre,app
FROM persona;

--NATURAL JOIN AMBAS TABLAS, MISMO TIPO DE DATO

SELECT *
FROM persona;

SELECT *
FROM agente;

SELECT *
FROM persona NATURAL JOIN agente;
WHERE id_persona >10200;

--INNER JOIN

SELECT *
FROM persona INNER JOIN agente a on persona.id_persona = a.id_persona

SELECT *
from persona LEFT JOIN agente a on persona.id_persona = a.id_persona;


-- Saber las personas que no son agentes
SELECT *
from persona LEFT JOIN agente a on persona.id_persona = a.id_persona
WHERE id_agente IS NOT NULL;

select  *
FROM persona
WHERE
 id_persona IN (SELECT agente.id_persona FROM agente);

select  *
FROM persona
WHERE
 id_persona NOT IN (SELECT agente.id_persona FROM agente);

SELECT *
from persona RIGHT JOIN agente a on persona.id_persona = a.id_persona;

SELECT *
from agente RIGHT JOIN persona  on persona.id_persona = agente.id_persona;

--CROSS JOIN RELACIONAR TODAS LAS TUPLAS QUE EXISTEN EN LA TABLA 1 CON TODAS AQUELLAS TUPLAS DE LA TABLA 2
SELECT *
FROM persona CROSS JOIN agente;

SELECT *
FROM persona FULL OUTER JOIN agente  on persona.id_persona = agente.id_persona;

SELECT *
FROM persona LEFT OUTER JOIN agente  on persona.id_persona = agente.id_persona;

SELECT *
FROM persona RIGHT OUTER JOIN agente  on persona.id_persona = agente.id_persona;

/*
 El nombre de la persona que más polizas tiene
 */

 SELECT nombre
from PERSONA
where id_persona IN(
SELECT id_persona
from
    (SELECT  id_persona, COUNT(id_poliza) total
FROM poliza
GROUP BY  id_persona) T2
where total=(
SELECT MAX(total)
    from
(SELECT  id_persona, COUNT(id_poliza) total
FROM poliza
GROUP BY  id_persona)T1));


SELECT persona.id_persona,nombre
FROM (SELECT  id_persona, COUNT(id_poliza) total
FROM poliza
GROUP BY  id_persona) T2
    JOIN persona ON T2.id_persona=persona.id_persona
where total=(
SELECT MAX(total)
    from
(SELECT  id_persona, COUNT(id_poliza) total
FROM poliza
GROUP BY  id_persona)T1)

-- Nombre, apellidos, teléfono y total de polizas de cada tipo para cada persona
/*
 NOMBRE,TELEFONO Y TOTAL DE POLIZAS DE CADA TIPO PARA CADA PERSONA
 ERICK, 55555555,5,8,3,2
 */
--Case

 SELECT nombre, app,apm, telefono,
        CASE WHEN T1.gastos IS NULL THEN 0 ELSE T1.gastos END total_gastos,
        CASE WHEN T2.auto IS NULL THEN 0 ELSE T2.auto END total_auto,
        COALESCE(CASA,0) total_casa,
        COALESCE (vida,0) total_vida
FROM persona LEFT JOIN
--TOTAL DE POLIZAS DE GASTOS MÉDICOS POR CLIENTE
                  (SELECT id_persona, COUNT(id_poliza_ap_gm) gastos
                   FROM poliza_ap_gm JOIN poliza ON poliza_ap_gm.id_poliza = poliza.id_poliza
                   GROUP BY  id_persona) T1 ON persona.id_persona=T1.id_persona
                   LEFT JOIN
--TOTAL DE POLIZAS VEHÍcULO POR CLIENTE
                  (SELECT id_persona, COUNT(id_poliza_vehiculo) auto
                   FROM poliza_vehiculo JOIN poliza on poliza_vehiculo.id_poliza = poliza.id_poliza
                   GROUP BY  id_persona) T2 ON T2.id_persona= persona.id_persona
                   LEFT JOIN
--TOTAL DE POLIZAS Vivienda POR CLIENTE
                  (SELECT id_persona, COUNT(id_poliza_vivienda) casa
                  FROM poliza_vivienda JOIN poliza on  poliza_vivienda.id_poliza = poliza.id_poliza
                  GROUP BY  id_persona) T3 ON T3.id_persona=T1.id_persona
                  LEFT JOIN
--TOTAL DE POLIZAS VIDA POR CLIENTE
                 (SELECT id_persona, COUNT(id_poliza_vida) vida
                  FROM poliza_vida JOIN poliza on  poliza_vida.id_poliza = poliza.id_poliza
                  GROUP BY  id_persona) T4 ON T4.id_persona=T3.id_persona;

--FUNCIONES DE VENTANA
--Nombre y apellidos de los cliente, no de poliza, monto pagado por la poliza y total pagado en todas las polizas.
--CONSIDERANDO LA DE TODOS LOS CLIENTES Y MONTO DE PARCIALIDAD *

Select nombre,app,apm,poliza.id_poliza, total,(SELECT SUm(monto) FROM pago) TOTAL_GLOBAL
FROM poliza Join

         (SELECT id_poliza,Sum(monto) total
          FROM pago
          GROUP BY id_poliza) T1 ON poliza.id_poliza=T1.id_poliza
         JOIN persona ON poliza.id_persona=persona.id_persona;
/*
 Función de ventana, una consulta sin agrupación que nos permitirá agregar una función de gregacióm
  RESOLVER * LINEA 597*/

 SELECT nombre,app,apm,p.id_poliza,FECHA_PAGO, monto,SUM(monto) OVER(PARTITION BY  pago.id_poliza), SUM(monto) OVER() TOTALGLOBAL
FROM persona JOIN poliza p on persona.id_persona = p.id_persona
JOIN pago ON p.id_poliza = pago.id_poliza
ORDER BY id_poliza,fecha_pago ASC;


--¿Cuál es el color del que existen más polizas de auto?

SELECT *
FROM ccolor
WHERE id_ccolor IN
(SELECT T2.id_ccolor
FROM  (SELECT id_ccolor, COUNT(id_poliza_vehiculo) total
from poliza_vehiculo
GROUP BY id_ccolor) T2

WHERE T2.total= (SELECT MAX(total)
    FROM
(SELECT id_ccolor, COUNT(id_poliza_vehiculo) total
from poliza_vehiculo
GROUP BY id_ccolor)T1));





SELECT color
FROM  (SELECT id_ccolor, COUNT(id_poliza_vehiculo) total
from poliza_vehiculo
GROUP BY id_ccolor) T2 JOIN ccolor ON T2.id_ccolor=ccolor.id_ccolor

WHERE T2.total= (SELECT MAX(total)
    FROM
(SELECT id_ccolor, COUNT(id_poliza_vehiculo) total
from poliza_vehiculo
GROUP BY id_ccolor)T1);

WITH cte_polizasporcolor AS (
    SELECT id_ccolor, COUNT(id_poliza_vehiculo) total
from poliza_vehiculo
GROUP BY id_ccolor
)
SELECT COLOR
FROM ccolor
WHERE id_ccolor IN (
SELECT id_ccolor
FROM cte_polizasporcolor
WHERE total= (SELECT MAX(total) FROM cte_polizasporcolor));

WITH cte_polizasporcolor AS (
    SELECT id_ccolor, COUNT(id_poliza_vehiculo) total
from poliza_vehiculo
GROUP BY id_ccolor
)
SELECT color
FROM cte_polizasporcolor
JOIN ccolor ON cte_polizasporcolor.id_ccolor=ccolor.id_ccolor
WHERE total=(SELECT MAX(total) FROM cte_polizasporcolor);


--Nombre y apellidos de la persona que cuenta con más polizas de vida


WITH cte_polizasvidaporpersona AS (
SELECT id_persona, COUNT (id_poliza_vida) total
ƒROM poliza JOIN poliza_vida ON poliza.id_poliza = poliza_vida.id_poliza
GROUP BY id_persona)



SELECT  nombre,app,apm, total FROM cte_polizasvidaporpersona JOIN persona on cte_polizasvidaporpersona.id_persona=persona.id_persona
WHERE total=(SELECT max(total) from cte_polizasvidaporpersona);

-- Total de polizas por año y tipo de poliza

SELECT 'GASTOS' tipo,EXTRACT(YEAR FROM fecha_emision) ano, COUNT (id_poliza_ap_gm) total
FROM poliza join poliza_ap_gm on poliza.id_poliza = poliza_ap_gm.id_poliza
GROUP BY EXTRACT(YEAR FROM fecha_emision)
UNION ALL
SELECT 'AUTO', EXTRACT(YEAR FROM fecha_emision), COUNT (id_poliza_vehiculo) total
FROM poliza Join poliza_vehiculo on poliza.id_poliza = poliza_vehiculo.id_poliza
GROUP BY  EXTRACT(YEAR FROM fecha_emision)
UNION ALL
SELECT 'CASA', EXTRACT(YEAR FROM fecha_emision), COUNT (id_poliza_vivienda) total
FROM poliza Join poliza_vivienda on poliza.id_poliza = poliza_vivienda.id_poliza
GROUP BY  EXTRACT(YEAR FROM fecha_emision)
UNION ALL
SELECT 'VIDA', EXTRACT(YEAR FROM fecha_emision), COUNT (id_poliza_vida) total
FROM poliza Join poliza_vida on poliza.id_poliza = poliza_vida.id_poliza
GROUP BY  EXTRACT(YEAR FROM fecha_emision)
ORDER BY ano, tipo;

CREATE EXTENSION tablefunc;

--CROSSTAB CUANDO RECIBE UN PARAMETRO
--Tabla/resultado de una tabla que estará ordenada por el primer y segundo atributo
--la posición de los atributos indicarán el pivote (cada vez que cambie de valor se generara una nueva tupla),
-- la columna (cada vez que el valor cambie, se generara una nueva columna)
-- y el valor (el valor que se ubicará en el renglón, columna)

SELECT 'GASTOS' tipo,EXTRACT(YEAR FROM fecha_emision) ano, COUNT (id_poliza_ap_gm) total
FROM poliza join poliza_ap_gm on poliza.id_poliza = poliza_ap_gm.id_poliza
GROUP BY EXTRACT(YEAR FROM fecha_emision)
UNION ALL
SELECT 'AUTO', EXTRACT(YEAR FROM fecha_emision), COUNT (id_poliza_vehiculo) total
FROM poliza Join poliza_vehiculo on poliza.id_poliza = poliza_vehiculo.id_poliza
GROUP BY  EXTRACT(YEAR FROM fecha_emision)
UNION ALL
SELECT 'CASA', EXTRACT(YEAR FROM fecha_emision), COUNT (id_poliza_vivienda) total
FROM poliza Join poliza_vivienda on poliza.id_poliza = poliza_vivienda.id_poliza
GROUP BY  EXTRACT(YEAR FROM fecha_emision)
UNION ALL
SELECT 'VIDA', EXTRACT(YEAR FROM fecha_emision), COUNT (id_poliza_vida) total
FROM poliza Join poliza_vida on poliza.id_poliza = poliza_vida.id_poliza
GROUP BY  EXTRACT(YEAR FROM fecha_emision)
ORDER BY tipo,ano;




SELECT *
FROM crosstab('SELECT ''GASTOS'' tipo,EXTRACT(YEAR FROM fecha_emision) ano, COUNT (id_poliza_ap_gm) total
FROM poliza join poliza_ap_gm on poliza.id_poliza = poliza_ap_gm.id_poliza
GROUP BY EXTRACT(YEAR FROM fecha_emision)
UNION ALL
SELECT ''AUTO'', EXTRACT(YEAR FROM fecha_emision), COUNT (id_poliza_vehiculo) total
FROM poliza Join poliza_vehiculo on poliza.id_poliza = poliza_vehiculo.id_poliza
GROUP BY  EXTRACT(YEAR FROM fecha_emision)
UNION ALL
SELECT ''CASA'', EXTRACT(YEAR FROM fecha_emision), COUNT (id_poliza_vivienda) total
FROM poliza Join poliza_vivienda on poliza.id_poliza = poliza_vivienda.id_poliza
GROUP BY  EXTRACT(YEAR FROM fecha_emision)
UNION ALL
SELECT ''VIDA'', EXTRACT(YEAR FROM fecha_emision), COUNT (id_poliza_vida) total
FROM poliza Join poliza_vida on poliza.id_poliza = poliza_vida.id_poliza
GROUP BY  EXTRACT(YEAR FROM fecha_emision)
ORDER BY tipo,ano') resultado(otipo text,o2000 BIGINT,O2001 BIGINT, o2002 BIGINT, o2004 BIGINT, o2005 BIGINT,
    o2006 BIGINT, o2007 BIGINT,o2008 BIGINT, o2009 BIGINT, o2010 BIGINT,o2011 BIGINT,O2012 BIGINT, o2013 BIGINT, o2014 BIGINT, o2015 BIGINT,
    o2016 BIGINT, o2017 BIGINT, o2018 BIGINT,o2019 BIGINT, o2020 BIGINT);

SELECT *
FROM crosstab('SELECT ''GASTOS'' tipo,EXTRACT(YEAR FROM fecha_emision) ano, COUNT (id_poliza_ap_gm) total
FROM poliza join poliza_ap_gm on poliza.id_poliza = poliza_ap_gm.id_poliza
GROUP BY EXTRACT(YEAR FROM fecha_emision)
UNION ALL
SELECT ''AUTO'', EXTRACT(YEAR FROM fecha_emision), COUNT (id_poliza_vehiculo) total
FROM poliza Join poliza_vehiculo on poliza.id_poliza = poliza_vehiculo.id_poliza
GROUP BY  EXTRACT(YEAR FROM fecha_emision)
UNION ALL
SELECT ''CASA'', EXTRACT(YEAR FROM fecha_emision), COUNT (id_poliza_vivienda) total
FROM poliza Join poliza_vivienda on poliza.id_poliza = poliza_vivienda.id_poliza
GROUP BY  EXTRACT(YEAR FROM fecha_emision)
UNION ALL
SELECT ''VIDA'', EXTRACT(YEAR FROM fecha_emision), COUNT (id_poliza_vida) total
FROM poliza Join poliza_vida on poliza.id_poliza = poliza_vida.id_poliza
GROUP BY  EXTRACT(YEAR FROM fecha_emision)
ORDER BY tipo,ano','SELECT DISTINCT EXTRACT(YEAR FROM fecha_emision)ano
FROM poliza
order by ano') resultado(otipo text,o2000 BIGINT,O2001 BIGINT, o2002 BIGINT, o2004 BIGINT, o2005 BIGINT,
    o2006 BIGINT, o2007 BIGINT,o2008 BIGINT, o2009 BIGINT, o2010 BIGINT,o2011 BIGINT,O2012 BIGINT, o2013 BIGINT, o2014 BIGINT, o2015 BIGINT,
    o2016 BIGINT, o2017 BIGINT, o2018 BIGINT);

/*
 Nombre y apellidos de las personas que cuentas con polizas de vida y polizas de auto
 */
SELECT  persona.id_persona,nombre, app,apm
FROM poliza Join persona ON  poliza.id_persona = persona.id_persona
WHERE id_poliza IN (SELECT poliza_vida.id_poliza FROM poliza_vida)
OR id_poliza IN (SELECT poliza_vehiculo.id_poliza FROM poliza_vehiculo);

SELECT nombre, app, apm
FROM persona
WHERE id_persona IN (SELECT poliza.id_poliza FROM poliza_vehiculo JOIN poliza ON poliza_vehiculo.id_poliza = poliza.id_poliza)
OR id_persona IN (SELECT poliza.id_persona FROM poliza_vida JOIN poliza ON poliza_vida.id_poliza = poliza.id_poliza )

--TOTAL DE POLIZAS POR TIPO DE POLIZAS EMITIDAS DESPUÉS DEL 2014


SELECT 'VIDA' tipo, COUNT (id_poliza_vida) total
FROM poliza_vida
WHERE id_poliza IN(SELECT poliza.id_poliza FROM poliza WHERE DATE_PART ('YEAR', fecha_emision)>2014 )
UNION ALL
SELECT 'CASA', COUNT (id_poliza_vIVIENDA)
FROM poliza_vivienda
WHERE id_poliza IN(SELECT poliza.id_poliza FROM poliza WHERE DATE_PART ('YEAR', fecha_emision)>2014 )
UNION ALL
SELECT 'Gastos', COUNT (id_poliza_ap_gm)
FROM poliza_ap_gm
UNION ALL
SELECT 'AUTO', COUNT (id_poliza_vehiculo)

FROM poliza_vehiculo
WHERE id_poliza IN (SELECT poliza.id_poliza FROM poliza WHERE DATE_PART ('YEAR', fecha_emision)>2014 );


--EDADES DE LOS CLIENTES QUE TIENEN MÁS POLIZAS DE VIVIENDA QUE EL PROMEDIO DE POLIZAS DE VIVIENDA POR CLIENTE

SELECT fecha_nac
FROM persona
WHERE id_persona IN (
    SELECT DISTINCT id_persona
    FROM (
         SELECT id_persona, COUNT(id_poliza_vivienda) total
        FROM poliza
        join poliza_vivienda On poliza.id_poliza = poliza_vivienda.id_poliza
        GROUP BY id_persona
             ) T2
    where total >(SELECT AVG (totalvivienda)
    FROM (
         SELECT id_persona, COUNT (id_poliza_vivienda) totalvivienda
        FROM poliza
        JOIN poliza_vivienda ON poliza.id_poliza = poliza_vivienda.id_poliza
        GROUP BY id_persona
             )  T1 ));

/*
 Correos electrónicos de los clientes, en caso de ser nulo se debe mostrar la cadena *--*
 */
SELECT distinct CASE WHEN correo IS NULL THEN '--' ELSE correo END
FROM persona Join poliza On persona.id_persona = poliza.id_persona;


SELECT DISTINCT COALESCE(correo,'--')
FROM persona JOIN poliza on persona.id_persona=poliza.id_poliza;

/*
 Total de polizas por tipo de poliza, total de polizas y pocentaje que representa cada total de tipo
 respecto al total de pólizas
 */
SELECT tipo, totalt,CAST (TOTALt*100 AS DECIMAL)/total PORCENTAJE,total
FROM (SELECT 'CASA' TIPO, COUNT(id_poliza_vivienda) TOTALt, (SELECT COUNT(poliza.ID_POLIZA) FROM poliza) total
FROM poliza_vivienda
UNION ALL
SELECT 'AUTO', COUNT (ID_poliza_vehiculo), (SELECT COUNT(poliza.ID_POLIZA) FROM poliza)
FROM poliza_vehiculo
UNION ALL
SELECT 'VIDA', COUNT (id_poliza_vida),(SELECT COUNT(poliza.ID_POLIZA) FROM poliza)
FROM poliza_vida
UNION ALL
SELECT 'GASTOS', COUNT (id_poliza_ap_gm), (SELECT COUNT(poliza.ID_POLIZA) FROM poliza)
FROM poliza_ap_gm) T1;

/*
 TOTAL DE POLIZAS POR CLIENTE, TOTAL DE POLIZAS Y PORCENTAJE QUE REPRESENTA CADA TOTAL DE CLIENTE RESPECTO
 AL TOTAL DE POLIZAS
 */

SELECT idcliente, totalc,CAST(TOTALc *100 AS DECIMAL)/total pocernataje,TOTAL
FROM (
SELECT poliza.id_persona idcliente,COUNT(id_poliza) totalc,(SELECT COUNT (id_poliza) FROM poliza) total
FROM persona JOIN poliza ON persona.id_persona = poliza.id_persona
GROUP BY poliza.id_persona) t1;

--Una vista es una tabla virtual creada a partir de una consulta


/*
 Nuestra tabala se llamará vw_datos personas y estará definida por la consulta SELECT nombre,app, apm, correo
 FROM persona;
 -----------------------------------------

 Almacenaremos en la BD la consulta  consulta SELECT nombre,app, apm, correo
 FROM persona; y la llamaremos vw_datospersonas
 */
CREATE VIEW vw_datospersonas AS
    SELECT nombre,app,apm, correo
    FROM persona;

SELECT *
FROM vw_datospersonas;

SELECT *
FROM(SELECT nombre,app,apm, correo
    FROM persona)vw_datospersonas;

CREATE VIEW vw_datosclientes AS
    SELECT nombre,app,apm,correo, id_poliza, fecha_inicio, fecha_fin
    FROM persona Join poliza On persona.id_persona = poliza.id_persona;

SELECT *
FROM vw_datosclientes;

CREATE VIEW datospersona AS
    SELECT nombre nom, app paterno, apm materno, correo mail, rfc ID
FROM persona;

SELECT *
FROM datospersona;

CREATE VIEW datospolizacliente AS
    SELECT id_poliza id, nombre nom, app paterno, apm materno, fecha_inicio f1, fecha_fin ff
FROM poliza Join persona ON poliza.id_persona = persona.id_persona;

SELECT *
from datospolizacliente;

SELECT AGE(fecha_nac)
FROM persona;


/*
 Función:
 una rutina definida y almacenada en el esquema de la BD
 Podrá recibir valores (parámetros )
 Devolver un valor
 */
CREATE FUNCTION fnc_nombre (
pvalor1 INTEGER,
pvalor2 INTEGER
)
RETURNS INTEGER --VARCHAR,TEXT,DECIMAL,DATE,DOUBLE PRECISION
AS
$$
 BEGIN
     --RUTINA



 --¿QUÉ VA A DEVOLVER?
     RETURN -1;
END;
$$
LANGUAGE 'plpgsql' VOLATILE ;

SELECT * from fnc_nombre(1,2 );


CREATE FUNCTION fnc_nombre (
pvalor1 INTEGER,
pvalor2 varchar(8)
)
RETURNS INTEGER --VARCHAR,TEXT,DECIMAL,DATE,DOUBLE PRECISION
AS
$$
 BEGIN
     --RUTINA



 --¿QUÉ VA A DEVOLVER?
     RETURN -1;
END;
$$
LANGUAGE 'plpgsql' VOLATILE ;

SELECT * FROM fnc_nombre(1,2);
SELECT * FROM fnc_nombre(1, 'erick');

/*
 POSTGRES SQL PERMITE la sobre carga de funciones ie
 que se pueden tener tantas funciones como se deseen que tengan el mismo nombre y el mismo número de parámetros
 pero que la combinación respecto al orden de los tipos de datos de los parámetros sea diferente.
 */

 CREATE FUNCTION fnc_nombre (
pvalor1 varchar(9),
pvalor2 integer
)
RETURNS INTEGER --VARCHAR,TEXT,DECIMAL,DATE,DOUBLE PRECISION
AS
$$
 BEGIN
     --RUTINA



 --¿QUÉ VA A DEVOLVER?
     RETURN -1;
END;
$$
LANGUAGE 'plpgsql' VOLATILE ;
SELECT * FROM fnc_nombre('ERick', 9);

/*
 Total de polizas por tipo de poliza, total de polizas y porcentaje que representa cada total de tipo
 respecto al total de polizas existente
 OBTENER el porcentaje como resultado de una función
 */
SELECT TIPO,total,totalg, fnc_PORCENTAJE (Cast(total AS integer), CAST(totalg AS INTEGER)) PORCENTAJE
FROM(

 SELECT 'GASTOS' tipo,COUNT (id_poliza_ap_gm)  total, (SELECT  COUNT(POLIZA.ID_POLIZA)  FROM POLIZA) totalg
FROM poliza_ap_gm
UNION ALL
SELECT 'VIDA', COUNT (id_poliza_VIDA), (SELECT COUNT(POLIZA.ID_POLIZA) FROM POLIZA) totalg
from poliza_vida
UNION ALL
SELECT 'AUTO', COUNT (id_poliza_vehiculo), (SELECT COUNT(POLIZA.ID_POLIZA) FROM POLIZA) totalg
from poliza_vehiculo
union all
SELECT 'casa', count (id_poliza_vivienda), (SELECT COUNT(POLIZA.ID_POLIZA) FROM POLIZA) totalg
FROM poliza_vivienda) t1 ;


CREATE FUNCTION  fnc_porcentaje (
ptotal1 INTEGER,
PTOTAL2 INTEGER
)
RETURNS DECIMAL
AS $$
    DECLARE vresultado DECIMAL;
    BEGIN


    vresultado=(CAST(ptotal1*100 AS DECIMAL)/ CAST (ptotal2 AS DECIMAL));
 RETURN vresultado;

end;
$$
Language  'plpgsql' VOLATILE;

SELECT * FROM fnc_porcentaje(25, 100);
SELECT * FROM fnc_porcentaje(25, 30000);

/*
 Función que permitir+a obtener el nombre completo y id de los clientes
 */
 CREATE FUNCTION  fnc_nombrecompletoclientes()
 RETURNS TABLE(onombrecompleto TEXT, oid INTEGER)
 AS $$ BEGIN

     RETURN QUERY SELECT nombre ||'  '|| app || ' '|| apm nombrecompleto, id_poliza idclientepoliza
     FROM persona JOIN poliza ON persona.id_persona = poliza.id_persona;
     END;
     $$
LANGUAGE 'plpgsql' VOLATILE ;


SELECT *
from fnc_nombrecompletoclientes();

/*
 EJECUTAN UNA SENTENCIA EN SQL
 1.- Revisión sintáctica
 2.- Revisión semántica
 3.- Los posibles planes de ejecución
 4.- Elección del plan "óptimo"
 ---------------
 5. Ejecución
 6. Entrega del resultado


 ¿cómo podemos ir al toreo desde CU?
 1. SMBD revisa las sentencias sean de SQL
 2. SMBD revisa que la estructura de la consulta tenga sentido
 3. CU hasta toreo -->(auto, caminando, transporte público)
 4. Cuenta con un algoritmo que bajo sus criterio determina el plan óptimo de ejecución
 */

 /*
  Nombre de los clientes que cuentan con polizas con un año especifíco (el año se indicará como parámetro)
  */
CREATE VIEW vw_clientes2010 AS
     SELECT nombre
     from persona JOIN poliza On persona.id_persona=poliza.id_persona
WHERE EXTRACT(YEAR FROM fecha_emision)=2010;

SELECT * FROM vw_clientes2010;

CREATE FUNCTION fnc_recuperapolizaano (
pano INTEGER
)
RETURNS TABLE(ONOMBRE varchar(128))
AS
$$BEGIN
   RETURN QUERY SELECT nombre
    FROM persona JOIN poliza ON persona.id_persona = poliza.id_persona
    WHERE EXTRACT(YEAR FROM fecha_emision)=pano;

end;
$$

LANGUAGE 'plpgsql' volatile ;

SELECT *
from fnc_recuperapolizaano(2011);

/*
 Función que registre un nuevo agente, asumir que la persona es nueva para la base de datos
 y que nos proporcionarán el nombre de la aseguradora
 */

 -- id
SELECT *
FROM persona;

SELECT *
FROM agente;
-- Grupo Nacional Provincial, S.A.B. |id 27
SELECT *
FROM aseguradora;

SELECT * from fnc_registrapersonaagente1('Masculino',
    0,'Erick','Matla','CRUZ',
    'mace880712123', '1988-07-12', 'matla@ciencias.unam.mx', '5555555555',
    'Grupo Nacional Provincial, S.A.B.'  );






CREATE FUNCTION fnc_registrapersonaagente1(
pgenero     varchar(16),
pdireccion  INTEGER,
pnombre     varchar(32),
papp       varchar(32),
Papm        VARCHAR(32),
prfc        varchar(13),
pfecha      DATE,
pcorreo    varchar(32),
ptelefono   numeric,
paseguradora VARCHAR (50)

)

RETURNS INTEGER
AS
$$
 DECLARE vidpersona INTEGER;
         vidagente  INTEGER;
         vidgenero  INTEGER;
         vidaseguradora INTEGER;
  BEGIN
    vidpersona=((SELECT MAX(id_persona) FROM persona) + 1);

    vidgenero=(SELECT  id_cgenero FROM cgenero WHERE genero LIKE pgenero);

    INSERT INTO persona (id_persona, id_cgenero, nombre, app, apm, rfc, fecha_nac, correo, telefono)
    VALUES (vidpersona, vidgenero,pnombre, upper(PApp), upper(Papm), upper(prfc), pfecha,pcorreo, ptelefono);

    vidagente=((SELECT MAX(id_agente) FROM agente) + 1);

    vidaseguradora=(SELECT id_aseguradora FROM aseguradora WHERE nombre_aseguradora LIKE paseguradora);

    INSERT INTO  agente (id_agente, id_persona, id_aseguradora, fecha_inicio)
    VALUES(vidagente, vidpersona,CURRENT_DATE);

    RETURN  1;
end;
$$
LANGUAGE 'plpgsql' VOLATILE ;

SELECT rfc, totalcasa
FROM persona
Join (select id_persona, COUNT(id_poliza) AS totalcasa
    from poliza JOIN poliza_vivienda ON poliza.id_poliza = poliza_vivienda.id_poliza
    GROUP BY id_persona) AS T1
On persona.id_persona=T1.id_persona
WHERE totalcasa=2;

Create or replace view vw_datospersonas1 AS
    (SELECT nombre as nom,
            app as paterno,
            apm as materno
            from persona);

SELECT * from vw_datospersonas1;


SELECT * FROM poliza
where id_aseguradora=(SELECT id_aseguradora FROM aseguradora
WHERE nombre_aseguradora LIKE '%e%' );}



-- IF CASE
/*
 Devolver el id de una persona dado su correo electrónico y en caso que el correo no se encuentre,
 se devolverá un valor -1
 */

CREATE FUNCTION fnc_recuperaIDCORREO(
pcorreo varchar(50)
)
RETURNS INTEGER
AS
    $$
    DECLARE vidpersona INTEGER;
   BEGIN
    If ((SELECT id_persona FROM persona WHERE correo LIKE pcorreo) IS NOT NULL)
        THEN --se cumple la condición de if
        RETURN vidpersona;
       ELSE
        vidpersona=(select id_persona FROM persona WHERE correo LIKE pcorreo);
        -- no se cumple la condición de if
        RETURN -1;
        END IF;
   end;
    $$
LANGUAGE 'plpgsql' VOLATILE;


SELECT  * FROM fnc_recuperaIDCORREO('ematla@ciencias.unam.mx');


/*
 DEVOLVER EL TIPO DE POLIZA DADO EL ID_POLIZA
 */
 --case

 CREATE function fnc_recuperatipopoliza (
 pidpoliza INTEGER
 )
 RETURNS text
as
 $$BEGIN

    CASE
        WHEN ((SELECT id_poliza_vivienda FROM poliza_vivienda WHERE id_poliza=pidpoliza) IS NOT NULL) THEN
        RETURN 'CASA';
        WHEN ((SELECT id_poliza_vehiculo FROM poliza_vehiculo where id_poliza=pidpoliza)) then
        RETURN 'AUTO';
        WHEN ((SELECT id_poliza_vida FROM poliza_vida WHERE id_poliza=pidpoliza) IS NOT NULL) THEN
        RETURN  'VIDA';
        WHEN ((SELECT id_poliza_ap_gm FROM poliza_ap_gm WHERE id_poliza=pidpoliza)IS NOT NULL) THEN
        RETURN 'GASTOS';
        ELSE
        RETURN 'ID NO EXISTE';
     END CASE;
 end;
$$
LANGUAGE 'plpgsql' VOLATILE ;

SELECT * FROM fnc_recuperatipopoliza(2);
SELECT * FROM fnc_recuperatipopoliza(30001);

--Tablas temporales--

CREATE TEMP TABLE prueba1 AS SELECT * from persona where id_persona>5000;

SELECT * from prueba1;

DELETE FROM agente WHERE id_persona=22654;
DELETE FROM persona WHERE id_persona=22654;


/*
 SQL DINÁMICO
 La ejecución de cadenas como sentencias de SQL

cadena ----> es SQL
 */

--Actualizar el valor de cualquier atributo de tipo cadena de cualquier tupla para cualquier tabla

UPDATE  persona SET nombre='NUEVO VALOR' WHERE id_persona=100;
UPDATE agente SET id_aseguradora=4 WHERE id_agente=3;
UPDATE poliza SET fecha_emision ='2020-07-01' WHERE id_poliza=100;

'UPDATE' cualquier tabla 'SET' cualquier atributo'=' valor 'WHERE' cualquier tupla';'

CREATE OR REPLACE FUNCTION fnc_actualizacadenasi (
    ptabla VARCHAR,
    patributo VARCHAR,
    pvalor VARCHAR,
    ptupla INTEGER
     )

    RETURNS INTEGER
    AS
$$
 BEGIN
   EXECUTE 'UPDATE '  ||  ptabla || ' SET ' || patributo || ' = ''' || pvalor || ''' WHERE id_' || ptabla || ' = ' ||
           ptupla || ';';

     RETURN 1;
END
 $$

    LANGUAGE 'plpgsql'  VOLATILE;


select  *
from persona
ORDER BY id_persona ASC;

select * from fnc_actualizacadenasi('persona','nombre', 'erick orlando', 4);

select * from fnc_actualizacadenasi('aseguradora','correo', 'armour@secure.com', 5);
/*
 Recuperar el top n que cuentan con más polizas (sin repetición)
 */
 CREATE FUNCTION fnc_recuperatopsin(
 ptop integer
)
RETURNS TABLE (oid_persona INTEGER, ototal INTEGER)
as
$$
 BEGIN
     RETURN QUERY
 SELECT id_persona, total
FROM (
 SELECT poliza.id_persona, CAST( COUNT(id_poliza) AS INTEGER)total
from persona join poliza on persona.id_persona = poliza.id_persona
GROUP BY poliza.id_persona)T1
order BY total desc
LIMIT  ptop;
END;
    $$
LANGUAGE 'plpgsql' VOLATILE ;

SELECT * from fnc_recuperatopsin(11);
SELECT * from fnc_recuperatopsin(3726);

/*
 Recuperar el top n que cuentan con más polizas (con repetición)
 */
 CREATE OR REPLACE FUNCTION  fnc_recuperatoprepeticion(

 ptop INTEGER
)
RETURNS TABLE
    (
        OID integer,
        ototal INTEGER,
        orank integer
    )
as
    $$
    BEGIN
        RETURN QUERY

 with cte_toprepeticion AS(
SELECT id_persona, total, CAST( RANK() OVER(ORDER BY total DESC) AS INTEGER) RANKING
FROM (
SELECT poliza.id_persona, CAST( COUNT(id_poliza) AS INTEGER)total
from persona join poliza on persona.id_persona = poliza.id_persona
GROUP BY poliza.id_persona) T1
ORDER BY total desc)
 SELECT *
 FROM cte_toprepeticion
 WHERE ranking=(
SELECT RANKING
from cte_toprepeticion
OFFSET  (PTOP -1) ROWS FETCH NEXT 1 ROWS ONLY);
END
    $$
language 'plpgsql' VOLATILE ;



 /*
  Paginar resultados, resultaados de la página n
  */
  -- INDICES
--La creación de un índice en POSTGRES SQL

CREATE INDEX indx_persona_app ON persona (app);

SELECT * from persona
where apm LIKE 'E%';

SELECT *
FROM poliza;

CREATE INDEX indx_persona_apm ON persona (apm);

--Indices compuestos
CREATE INDEX indx_persona_app_apm ON persona(app, apm);


select *
from persona
where app LIKE '%M%' and apm LIKE '%C%';

Select *
from persona
where id_persona>=10 and id_persona<=20;

CREATE OR REPLACE FUNCTION tr_verificarnulos()
RETURNS TRIGGER AS
    $$
    BEGIN
    IF(NEW, nombre IS NULL OR new, app IS NULL)
        THEN
           RAISE EXCEPTION 'Los datos no pueden ser nulos (nombre -app)';
        ELSE
        RETURN NEW;


        end if;
end;


        $$
LANGUAGE 'plpgsql';

CREATE TRIGGER tr_verificanulos
    /*
     BEFORE----> ANTES DE LA ACCIÓN QUE LO DISPARÓ--> PRIMERO VALIDAR Y DESPUÉS EJECUTAR LA ACCIÓN
     AFTER---> DESPUÉS DE LA ACCIÓN QUE LO DISPARÓ--> PRIMERO EJECUTAR LA ACCIÓN Y DESPUÉS VALIDAMOS
     INSTEAD OF --> TOMARÁN EL CONTROL TOTAL Y SE EJECUTARÁN EN VEZ DE LA ACCIÓN
     */
    BEFORE  INSERT
    ON persona
    for each row
    EXECUTE PROCEDURE tr_verificarnulos();


SELECT *
FROM persona
ORDER BY id_persona DESC ;


INSERT INTO persona (id_persona, id_cgenero, id_direccion, nombre, app, apm, rfc, fecha_nac, correo, telefono)
VALUES (22664,2,1,'Erick','REYES','PEREZ','MACE880712000','1988-07-12','erick11garv@ciencias.unam',5555555555);

--podremos indicar si se llevan a cabo todas las operaciones o ninguna o ciertos bloques de operación
SELECT *
FROM pago
ORDER BY id_monto DESC ;

CREATE PROCEDURE sp_actualizaMonto (
pid INTEGER, --ID De la transacción
pvalor NUMERIC --Monto del pago
)
AS
    $$
    BEGIN

        UPDATE pago SET monto=pvalor WHERE id_monto=pid;

        COMMIT ;
    END;
    $$
    LANGUAGE 'plpgsql';

call sp_actualizaMonto(318104,1830.40);


CREATE OR REPLACE procedure transferencia (
pidcuenta1 INTEGER,
pidcuenta2 INTEGER,
pmonto numeric
)
AS
    $$
    begin
    UPDATE cuenta SET  saldo= saldo-pmonto where idcuenta=pidcuenta1;


    UPDATE cuenta SET saldo=saldo+pmonto where idcuenta=pidcuenta2;

    COMMIT;
    END;

    $$
language 'plpgsql';


CREATE TABLE cuenta (

    idcuenta INTEGER,
    SALDO numeric
);

INSERT INTO cuenta(idcuenta, SALDO) VALUES (1,100.00);
INSERT INTO  CUENTA (IDCUENTA, SALDO) VALUES (2,80.00);


SELECT * FROM cuenta;

CALL transferencia(1,2,40.00);

DROP PROCEDURE transferencia;