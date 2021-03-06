/****** Script for SelectTopNRows command from SSMS  ******/
SELECT *  FROM [FRGP_Labo].[dbo].[Socios] 

--1) La cantidad de socios.
	SELECT COUNT (Legajo)  FROM [FRGP_Labo].[dbo].[Socios] 
--2) La cantidad de socios que se identifican con el sexo femenino (XLS).
--3) La cantidad de socios que nacieron en el año 1990.
--4) El promedio de los importes de todos los pagos.
--5) El promedio de los importes de todos los pagos realizados este año (XLS).
--6) La sumatoria de importes de todos los pagos.
--7) La sumatoria de importes de todos los pagos con estado 2 y 3 (XLS).
		select * from pagos
--8) El importe máximo entre todos los pagos (XLS).
--9) La cantidad de actividades que requieran apto médico en la sede 2.
--10) El costo promedio de las actividades que no requieren apto médico.
--11) El costo mínimo entre todas las actividades (XLS).
--12) La cantidad de actividades por sede. Listar el nombre de la sede y la cantidad de actividades
--realizadas allí. (XLS)
--13) La sumatoria de importes pagados por cada socio. Listar el apellido y nombres de todos los
--socios y el total abonado. (XLS)
--14) El importe abonado por cada socio en cada año. Listar el apellido y nombres de todos los socios
--y el total abonado por cada año.
--15) La cantidad de actividades realizadas por socio. Listar el apellido y nombres de todos los socios
--y la cantidad de actividades en las que se encuentra inscripto. Si un socio no se encuentra
--inscripto a ninguna actividad debe figurar en el listado contabilizando 0. (XLS)
--16) El costo de actividad más alto por cada sede. Listar el nombre de la sede y el importe de la
--actividad más cara que se realiza allí (XLS).
--17) La cantidad de becados por género. Listar el género y la cantidad de becados de cada género.
--18) Por cada socio la cantidad de sedes distintas a las que asiste. Indicar el apellido y nombre del
--socio y la cantidad calculada (XLS).
--19) La cantidad de pagos de distinto importe registrados.
--20) La sumatoria de importes abonados por cada socio. Listar el apellido y nombres de los socios y
--el total abonado. Sólo listar los socios que hayan abonado más de $3000 en total. (XLS)
--21) La sumatoria de importes menores a $1000 abonados por cada socio. Listar el apellido y
--nombres de los socios y el total abonado. Sólo listar los socios que hayan abonado más de
--$3000. (XLS)
--22) La cantidad de actividades realizadas por socio. Listar el apellido y nombres de todos los socios
--y la cantidad de actividades en las que se encuentra inscripto. Sólo listar los socios que realicen
--más de una actividad.
--23) La cantidad de socios por actividad. Listar el nombre de la actividad y la cantidad de socios
--inscriptos a ella.
--24) Las actividades que no posean socios inscriptos. Listar el nombre de la actividad.