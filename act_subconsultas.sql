--A) Abrir el archivo Subconsultas.xls y realizar manualmente los listados que figuran en (B) que se
--encuentran marcados con XLS.
--B) Realizar las siguientes consultas de selección utilizando lenguaje SQL. Utilizar las cláusulas
--vistas en el TP 1, 2 y 3, en conjunto con las funciones de resumen.

--1) Las actividades con el mayor costo.
		select * from actividades where costo = (
		select MAX(costo) from Actividades)

--2) Los pagos con el menor importe.
		Select * from Pagos where Importe = (
		select min (importe) from pagos)

--3) Las actividades cuyo precio sea mayor al precio promedio (XLS).
		SELECT * FROM Actividades WHERE Costo >(
		SELECT AVG(COSTO) FROM Actividades)

--4) Los socios que no se inscribieron a ninguna actividad (XLS).
		SELECT * FROM Socios WHERE Legajo NOT IN (
			SELECT DISTINCT Legajo FROM Inscripciones
		)


--5) Las actividades que no registran ningún socio inscripto.


--6) Las actividades que no registran ningún socio becado (XLS).


--7) Las actividades cuyo costo sea mayor a alguna actividad que requiera Apto Médico (XLS).
		SELECT * FROM Actividades WHERE Costo > ANY (
		SELECT Costo FROM Actividades
		WHERE AptoMedico = 1
													)

		SELECT * FROM Actividades WHERE Costo >  (
		SELECT min (Costo) FROM Actividades
		WHERE AptoMedico = 1
													)

--8) Las actividades cuyo costo sea menor a TODA actividad que requiera Apto Médico (XLS).
		SELECT * FROM Actividades WHERE Costo < all (
		SELECT Costo FROM Actividades
		WHERE AptoMedico = 1
													)

--9) Las actividades cuyo costo sea mayor a cualquier actividad que se realice en la Sede 2.


--10) Por cada actividad, el nombre y la cantidad de inscriptos de personas de género masculino y la cantidad de
--inscriptos de personas de género femenino.
		Select A.Nombre,
		(Select count (*) from Inscripciones as I		inner join Socios as S 
		on i.Legajo = s.Legajo 		where i.IDActividad = A.ID and s.Genero = 'M') as Masculino,
		(Select count (*) from Inscripciones as I		inner join Socios as S 
		on i.Legajo = s.Legajo 		where i.IDActividad = A.ID and s.Genero = 'F') as Femenino
		from Actividades as A
		
		select * from (
		Select A.Nombre,
		(Select count (*) from Inscripciones as I		inner join Socios as S 
		on i.Legajo = s.Legajo 		where i.IDActividad = A.ID and s.Genero = 'M') as Masculino,
		(Select count (*) from Inscripciones as I		inner join Socios as S 
		on i.Legajo = s.Legajo 		where i.IDActividad = A.ID and s.Genero = 'F') as Femenino
		from Actividades as A) as a
		where a.Masculino > a.Femenino and a.Femenino > 0

		select * from Inscripciones

--11) Por cada socio, la cantidad de actividades que requieren apto médico que realiza y la cantidad de
--actividades que no requieren apto médico (XLS).
		sELECT s.Legajo, s.APElLIDOS, S.NOMBRES,
		(select count (*) from Inscripciones as I
		inner join Actividades as a
		 on i.IDActividad = a.ID where a.AptoMedico = 1 and i.Legajo = s.Legajo) AS Requiere,
		(select count (*) from Inscripciones as I
		inner join Actividades as a
		 on i.IDActividad = a.ID where a.AptoMedico = 0 and i.Legajo = s.Legajo) AS NoRequiere
		from socios as s

--12) La cantidad de actividades que registraron la misma cantidad de socios de género masculino
--que socios de género femenino.


--13) El porcentaje de inscripciones realizadas en el año actual con respecto al total de inscripciones.


--14) Las actividades que registran la misma cantidad de socios de género masculino que socios de
--género femenino.


--15) Los socios que realizan únicamente actividades que no requiere apto médico.

			
			
			Select * from Inscripciones order by IDActividad asc
			select * from Socios
			select * from Actividades 
--16) Los socios que realicen más actividades que requieren apto médico que actividades que no lo
--requieran y que al menos realicen una actividad que no requiera apto médico (XLS).

