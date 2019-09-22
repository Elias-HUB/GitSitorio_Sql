use Club
--1) Listar para cada actividad, todos los datos de la sede donde se realiza la actividad.
		SELECT  Actividades.Nombre, Sedes.* FROM Actividades 
		inner JOIN   Sedes
		ON Actividades.IDSede = Sedes.ID

--2) Listar el nombre y el costo de las actividades y la dirección, código postal y teléfono donde se
--realiza la actividad. (XLS)
		Select A.*, B.Direccion, B.IDLocalidad, B.Telefono from Actividades as A
		inner join sedes as B
		on A.IDSede = B.ID

--3) Listar el nombre y costo de todas las actividades que se realicen en el Código Postal 1111.
		select  A.Nombre, A.Costo, Sedes.IDLocalidad from Actividades as A
		Inner join Sedes 
		on A.IDSede = Sedes.ID where Sedes.IDLocalidad=1111 
--4) Listar el nombre, dirección y nombre de la localidad de todas las sedes. Incluir en el listado
--aquellas localidades que no tengan una sede asociada completando con NULL los campos de la
--sede que no pudo asociarse a la localidad. (XLS).
		Select sedes.Nombre, Sedes.Direccion, Localidades.Nombre from Sedes
		left join Localidades
		on Sedes.IDLocalidad= Localidades.ID
		
--5) Listar el apellido y nombre y género de los socios que se encuentren becados (XLS).
		SELECT DISTINCT  S.APELLIDOS, s.NOMBRES,S.GENERO, S.Legajo, I.Legajo FROM Socios AS S
		INNER JOIN Inscripciones AS I
		ON S.Legajo =  I.Legajo
		 
		SELECT * FROM SOCIOS
		SELECT * FROM Inscripciones order by Legajo asc
		select * from Actividades

--6) Listar el nombre de todas las actividades que realiza el socio con Legajo 1000.
		select distinct  a.Nombre from Actividades as a
		inner join inscripciones as I
		on a.ID = i.IDActividad and i.Legajo = 1000 
		 
--7) Listar el nombre de todas las actividades que tengan algún inscripto en el año 2019 (sin
--repeticiones).
--8) Listar el nombre, apellido, código de inscripción y fecha de inscripción de las inscripciones que
--haya realizado un socio. Incluir en el listado a los socios que no poseen inscripciones
--completando con NULL los campos de la inscripción que no pudo asociarse al socio. (XLS)
--9) Listar el nombre y apellido de los socios que no realicen ninguna actividad (que no posean
--inscripciones) (XLS).
		
		Select   Socios.Nombres, Socios.Apellidos, Socios.Legajo,i.IDInscripcion, i.IDActividad
		from Socios 
		left JOIN Inscripciones as i
		on Socios.Legajo = i.Legajo where i.Legajo is NULL
--10) Listar el nombre y apellido del socio, nombre de actividad y costo de la actividad de todos los
--socios de sexo femenino que realicen actividades que requieren apto médico. (XLS)
--11) Listar nombre y apellido del socio, nombre de la actividad y nombre de la sede donde la realiza
--de aquellos socios que se encuentren becados en dicha actividad.
--12) Listar el nombre de la actividad y el nombre de la localidad donde se realiza ordenado
--ascendentemente por el nombre de la actividad.
--13) Listar el apellido y nombres de todos los socios (sin repeticiones) que realicen alguna actividad
--en San Fernando o Tigre.
--14) Listar el socio que haya pagado la cuota más cara indicando el apellido y nombre del socio, el
--período (Mes+Año) y el importe.
		Select S.Apellidos, s.Nombres, p.mes + '-' + p.Anio from pagos as p
		right join Socios as S
		on 


--15) Listar el nombre de la actividad más cara que posea algún becado.
--16) Listar nombre y apellido del socio, nombre de la actividad y la cantidad de días transcurridos
--desde que se inscribió a dicha actividad. Ordenarlo por cantidad de días de manera descendente.