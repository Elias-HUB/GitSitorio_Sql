use Club

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
	select * from	dbo.Socios where Legajo not between 2000 and 6000

--6) Listar todos las socios de sexo femenino.
	select * from Socios where Genero = 'M'

--7) Listar todos los socios que hayan nacido en el año 2000.
	select * From Socios where FechaNacimiento between '2000-01-01'  and '2000-12-31'
	Select Apellidos, Nombres, YEAR (FechaNacimiento)as 'Año' From Socios 
	Select Apellidos, Nombres, datepart (year,FechaNacimiento)as 'Año' From Socios 

--8) Listar todos los socios que hayan nacido luego del 01/04/1986.
	Select * From Socios where FechaNacimiento >= '1986-04-05' order by FechaNacimiento desc

--9) Listar el número de legajo, apellido y nombres y género de todos los socios ordenados
--ascendentemente por apellido.
	Select * From Socios
	order by Apellidos ASC
	Select * From Socios
	order by Apellidos DESC


--10) Listar el apellido y nombres y fecha de nacimiento de todos los socios ordenados
--descendentemente por fecha de nacimiento.
	Select Nombres, Apellidos, FechaNacimiento from Socios
	order by FechaNacimiento ASC

--11) Listar todos los socios cuyo nombre comience con vocal.
	Select * from Socios where Nombres like '[AEIOU]%'

--12) Listar todos los socios cuyo apellido empiece y termine con consonante.
	Select * from Socios where Apellidos like '[^AEIOU]%[^AEIOU]'

--13) Listar todos los socios cuyo apellido tenga seis caracteres y finalice con la A.
	Select * From Socios where Apellidos like '_____a'

--14) Listar el legajo, apellido, nombres y edad de cada socio.
	SELECT LEGAJO, APELLIDOs, NOMBREs, DATEDIFF(DAY, FechaNacimiento, GETDATE())/365.25 AS EDAD FROM Socios
	SELECT LEGAJO, APELLIDOs, NOMBREs, DATEDIFF(YEAR, 0, GETDATE() - '2000-09-09') AS EDAD, FechaNacimiento FROM Socios

	

--15) Listar todas las actividades que se realizan en la Sede 1.
	select * From Actividades where IDSede = 1 

--16) Listar la actividad menos costosa.
	Select top(1) Costo as Todo from Actividades 
	order by Costo ASC

	SELECT MIN(Costo)FROM Actividades

--17) Listar la actividad más costosa. Listar todas las que cumplan dicha condición.
	select top (1) costo as Costo from Actividades
	order by costo desc

	select MAX(costo) AS Mayor from Actividades 

--18) Listar el ID, Nombre y Costo de todas las actividades cuyo costo supere los $500 y requieran
--apto médico.
	
	select ID, Nombre, Costo from Actividades where Costo > 500 and AptoMedico = 1

--19) Listar el ID, Nombre y Costo de todas las actividades que se dicten en la Sede 2 y requieran apto
--médico o se dicten en la Sede 4 y superen los $1000.
	select ID, Nombre, Costo from Actividades where (IDSede= 2 and AptoMedico = 1) 
	or (IDsede = 4 and Costo >= 1000)
	
	

--20) Listar todas las sedes que posean teléfono.
	select * from sedes WHERE Telefono is not null

--21) Listar los domicilios de todas las sedes que no posean mail.
	select direccion, mail from sedes where Mail is not null

--22) Listar el nombre, domicilio, código postal y la información de contacto de cada sede. La
--información de contacto es el número de teléfono en primer lugar y la dirección de correo
--electrónico en caso de no poseer teléfono.
	select Nombre, Direccion, coalesce(Telefono,MAIL) as Contacto FROM sedes

--23) Listar los códigos postales de todas las sedes (sin repeticiones).
	select distinct IDLocalidad from sedes

--24) Listar el legajo, número de actividad y como Estado la palabra 'Becado' si el socio se encuentra
--becado, de lo contrario listar null en el Estado del socio.
	SELECT  Legajo, IDActividad,CASE  WHEN Becado=1 THEN 'BECADO'
	ELSE NULL END AS 'ESTADO', Becado FROM Inscripciones
	order by Legajo asc



	select * from Inscripciones