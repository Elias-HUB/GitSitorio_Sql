--1) La cantidad de socios.
select count (legajo) as 'CantSocios'from Socios
--2) La cantidad de socios que se identifican con el sexo femenino 
select count (legajo) as 'Socias' from Socios where Genero='f'
--3) La cantidad de socios que nacieron en el año 1990.
select count (legajo) as 'Socios1990' from Socios where YEAR(FechaNacimiento)='1990' 
--4) El promedio de los importes de todos los pagos.
select AVG(Importe) as 'PromedioPagos' from Pagos
--5) El promedio de los importes de todos los pagos realizados este año (XLS).
select AVG(Importe) as 'PromedioPagos' from Pagos where YEAR(fecha)='2019'
--6) La sumatoria de importes de todos los pagos.
select SUM (importe) as 'TotalRecaudado' from Pagos
--7) La sumatoria de importes de todos los pagos con estado 2 y 3 
select sum (importe) as 'E2E3' from pagos where estado=2 or estado=3
select sum (importe) as 'E2E3' from pagos where estado in ('2','3')
--8) El importe máximo entre todos los pagos 
select MAX(importe) as 'PagoMaximo' from Pagos 
--9) La cantidad de actividades que requieran apto médico en la sede 2.
select count (id) as 'ActSede2' from Actividades where AptoMedico=1 and IDSede=2
--10) El costo promedio de las actividades que no requieren apto médico.
select AVG(costo) as 'Promedio' from Actividades where AptoMedico=0;
--11) El costo mínimo entre todas las actividades 
select min (costo) from Actividades
--12) La cantidad de actividades por sede. Listar el nombre de la sede y la cantidad de actividades
--realizadas allí. 
select count (Actividades.id) as 'ActXSede', Sedes.Nombre from Sedes
inner join Actividades on Sedes.ID=Actividades.IDSede 
group by (Sedes.Nombre)
--13) La sumatoria de importes pagados por cada socio. Listar el apellido y nombres de todos los
--socios y el total abonado. (XLS)
select * from Pagos where Legajo = 6000
Select  sum(pagos.Importe) , Pagos.Legajo from Pagos
group by (pagos.Legajo)

--14) El importe abonado por cada socio en cada año. Listar el apellido y nombres de todos los socios
--y el total abonado por cada año.
select Nombres,Apellidos, sum(pagos.importe), pagos.Anio from Socios 
inner join Pagos on Socios.Legajo = Pagos.Legajo 
group by Nombres,Apellidos, Anio

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
--24) Las actividades que no posean socios inscriptos. Listar el nombre de la actividad