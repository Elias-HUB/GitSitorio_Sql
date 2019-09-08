--1) Listar el socio con el legajo 1000.
  select * from dbo.Socios where Legajo = 1000

--2) Listar los socios con los legajos 2000, 6000 y 3000.
	Select * From dbo.Socios where Legajo = 2000 or Legajo = 6000 or Legajo = 3000
	select * From dbo.Socios where Legajo in (2000, 6000, 3000)

--3) Listar todos los socios que posean legajos entre en el 2000 y 6000 (ambos inclusive).
	select * from dbo.Socios where Legajo between 2000 and 6000

--4) Listar todos los socios que no posean los legajos 2000, 6000, y 3000.
	select * from dbo.Socios where Legajo <>  2000 and Legajo <> 3000 and Legajo <> 6000 
	select * from dbo.Socios where Legajo not in (2000, 6000, 3000)

--5) Listar todos los socios que no posean los legajos entre el 2000 y 6000 (ambos inclusive).

--6) Listar todos las socios de sexo femenino.
--7) Listar todos los socios que hayan nacido en el año 2000.
	select * From Socios where FechaNac between '2000-01-01'  and '2000-12-31'
	Select Apellido, Nombre, YEAR (FechaNac)as 'Año' From Socios 
	Select Apellido, Nombre, datepart (year,FechaNac)as 'Año' From Socios 
--8) Listar todos los socios que hayan nacido luego del 01/04/1986.
	Select * From Socios where FechaNac >= '1986-04-05' order by FechaNac desc
--9) Listar el número de legajo, apellido y nombres y género de todos los socios ordenados
--ascendentemente por apellido.
--10) Listar el apellido y nombres y fecha de nacimiento de todos los socios ordenados
--descendentemente por fecha de nacimiento.
--11) Listar todos los socios cuyo nombre comience con vocal.
--12) Listar todos los socios cuyo apellido empiece y termine con consonante.
--13) Listar todos los socios cuyo apellido tenga seis caracteres y finalice con la A.
--14) Listar el legajo, apellido, nombres y edad de cada socio.
--15) Listar todas las actividades que se realizan en la Sede 1.
--16) Listar la actividad menos costosa.
--17) Listar la actividad más costosa. Listar todas las que cumplan dicha condición.
--18) Listar el ID, Nombre y Costo de todas las actividades cuyo costo supere los $500 y requieran
--apto médico.
--19) Listar el ID, Nombre y Costo de todas las actividades que se dicten en la Sede 2 y requieran apto
--médico o se dicten en la Sede 4 y superen los $1000.
--20) Listar todas las sedes que posean teléfono.
--21) Listar los domicilios de todas las sedes que no posean mail.
--22) Listar el nombre, domicilio, código postal y la información de contacto de cada sede. La
--información de contacto es el número de teléfono en primer lugar y la dirección de correo
--electrónico en caso de no poseer teléfono.
--23) Listar los códigos postales de todas las sedes (sin repeticiones).
--24) Listar el legajo, número de actividad y como Estado la palabra 'Becado' si el socio se encuentra
--becado, de lo contrario listar null en el Estado del socio.