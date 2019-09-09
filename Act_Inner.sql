--1) Listar para cada actividad, todos los datos de la sede donde se realiza la actividad.

select * from sede 
select * from Actividades

SELECT  Actividades.Nombre, Sede.* FROM Actividades 
inner JOIN   Sede
ON Actividades.IDSede = Sede.sede_pk

--2) Listar el nombre y el costo de las actividades y la direcci�n, c�digo postal y tel�fono donde se
--realiza la actividad. (XLS)

		Select A.*, B.Direccion, B.IDCodPos, B.Telefono from Actividades as A
	inner join sede as B
	on A.IDSede = B.Sede_PK
--3) Listar el nombre y costo de todas las actividades que se realicen en el C�digo Postal 1111.
		select  A.Nombre, A.Costo, Sede.IDCodPos from Actividades as A
		Inner join Sede 
		on A.IDSede = Sede.sede_pk where Sede.IDCodPos=1111 
--4) Listar el nombre, direcci�n y nombre de la localidad de todas las sedes. Incluir en el listado
--aquellas localidades que no tengan una sede asociada completando con NULL los campos de la
--sede que no pudo asociarse a la localidad. (XLS).
		Select Sede.Nombre, Sede.Direccion, Localidad.CodPos_PK ,Localidad.NombreLoc from sede
		inner join Localidad
		on Sede.IDCodPos = Localidad.CodPos_PK
--5) Listar el apellido y nombre y g�nero de los socios que se encuentren becados (XLS).
--6) Listar el nombre de todas las actividades que realiza el socio con Legajo 1000.
--7) Listar el nombre de todas las actividades que tengan alg�n inscripto en el a�o 2019 (sin
--repeticiones).
--8) Listar el nombre, apellido, c�digo de inscripci�n y fecha de inscripci�n de las inscripciones que
--haya realizado un socio. Incluir en el listado a los socios que no poseen inscripciones
--completando con NULL los campos de la inscripci�n que no pudo asociarse al socio. (XLS)
--9) Listar el nombre y apellido de los socios que no realicen ninguna actividad (que no posean
--inscripciones) (XLS).
		select *from Socios
		delete from Inscripciones where ID_Legajo = 9000
		
		Select   Socios.Nombre, Socios.Apellido, Socios.Legajo, Inscripciones.ID_Legajo, Inscripciones.ID_Actividades_PK
		from Socios left JOIN Inscripciones
		on Socios.Legajo = Inscripciones.ID_Legajo where Inscripciones.ID_Legajo is NULL
--10) Listar el nombre y apellido del socio, nombre de actividad y costo de la actividad de todos los
--socios de sexo femenino que realicen actividades que requieren apto m�dico. (XLS)
--11) Listar nombre y apellido del socio, nombre de la actividad y nombre de la sede donde la realiza
--de aquellos socios que se encuentren becados en dicha actividad.
--12) Listar el nombre de la actividad y el nombre de la localidad donde se realiza ordenado
--ascendentemente por el nombre de la actividad.
--13) Listar el apellido y nombres de todos los socios (sin repeticiones) que realicen alguna actividad
--en San Fernando o Tigre.
--14) Listar el socio que haya pagado la cuota m�s cara indicando el apellido y nombre del socio, el
--per�odo (Mes+A�o) y el importe.
--15) Listar el nombre de la actividad m�s cara que posea alg�n becado.
--16) Listar nombre y apellido del socio, nombre de la actividad y la cantidad de d�as transcurridos
--desde que se inscribi� a dicha actividad. Ordenarlo por cantidad de d�as de manera descendente.