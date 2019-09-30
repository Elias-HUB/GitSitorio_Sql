--A) Listar todos los médicos de sexo femenino.

select * from MEDICOS where SEXO = 'F'

--B) Listar todos los médicos cuyo apellido finaliza con 'EZ'

select * from MEDICOS where APELLIDO like '%EZ'

--C) Listar todos los médicos que hayan ingresado a la clínica entre el 1/1/1995 y el 31/12/1999.

select * from MEDICOS where FECHAINGRESO between '1995-01-01' and '1999-01-01'
order by FECHAINGRESO asc

--D) Listar todos los médicos que tengan un costo de consulta mayor a $ 650.

select * from MEDICOS where COSTO_CONSULTA >= 650 and SEXO= 'F'

--E) Listar todos los médicos que tengan una antigüedad mayor a 10 años.
Select * from (
Select IDMEDICO, IDESPECIALIDAD, APELLIDO, NOMBRE, SEXO, 
DATEDIFF(YEAR,FECHAINGRESO,GETDATE()) as anioi
 from MEDICOS
 where DATEDIFF(YEAR,FECHAINGRESO,GETDATE()) > 9 
 ) as a
 order by anioi desc


--F) Listar todos los pacientes que posean la Obra social 'Dasuten'.

select * from PACIENTES where PACIENTES.IDOBRASOCIAL   = 
(select IDOBRASOCIAL from OBRAS_SOCIALES where IDOBRASOCIAL = PACIENTES.IDOBRASOCIAL and NOMBRE = 'DASUTEN')

--G) Listar todos los pacientes que hayan nacido en los meses de Enero, Febrero o Marzo.

select * from PACIENTES where MONTH(FECHANAC) in (1,2,3)

--H) Listar todos los pacientes que hayan tenido algún turno médico en los últimos 45 días.

select * from TURNOS where  DATEDIFF(day,FECHAHORA,GETDATE()) < 45

--I) Listar todos los pacientes que hayan tenido algún turno con algún médico con especialidad
--'Gastroenterología'.

Select IDPACIENTE,Nombre,Apellido from PACIENTES as P where p.IDPACIENTE =
(select IDPACIENTE from TURNOS as T where T.IDMEDICO = 
(select M.IDMEDICO from MEDICOS as M inner join ESPECIALIDADES as e 
on m.IDESPECIALIDAD = e.IDESPECIALIDAD and e.NOMBRE = 'Gastroenterología' where m.IDMEDICO = t.IDMEDICO) 
and p.IDPACIENTE = t.IDPACIENTE)

--J) Listar Apellido, nombre, sexo y especialidad de todos los médicos que tengan especialidad
--en algún tipo de 'Análisis'

select * FROM PACIENTES where IDPACIENTE IN (
SELECT t.IDPACIENTE, t.IDMEDICO from turnos as t
inner join MEDICOS on t.IDMEDICO= MEDICOS.IDMEDICO 
inner join ESPECIALIDADES as e on MEDICOS.IDESPECIALIDAD= e.IDESPECIALIDAD) as tab
where e.nombre = 'Gastroenterología'

--K) Listar Apellido, nombre, sexo y especialidad de todos los médicos que no posean la
--especialidad 'Gastroenterología', 'Oftalmologìa', 'Pediatrìa', 'Ginecología' ni 'Oncología'.

SELECT * FROM (select M.APELLIDO, M.NOMBRE, M.SEXO, E.NOMBRE AS Especialidad from MEDICOS as M INNER JOIN ESPECIALIDADES AS E 
ON E.IDESPECIALIDAD = M.IDESPECIALIDAD ) as Tabla
Where Especialidad not in ('Gastroenterología', 'Oftalmología', 'PEDIATRÍA', 'Ginecología', 'Oncología')
order by Especialidad desc

--L) Listar por cada turno, la fecha y hora, nombre y apellido del médico, nombre y apellido del
--paciente, especialidad del médico, duración del turno, costo de la consulta sin descuento, obra
--social del paciente y costo de la consulta con descuento de la obra social. Ordenar el listado de
--forma cronológica. Del último turno al primero.

Select FECHAHORA, 
(Select M.Nombre from Medicos as M where M.IDMEDICO = t.IDMEDICO) As 'Nombre Med',
(Select M.APELLIDO from Medicos as M where M.IDMEDICO = t.IDMEDICO) As 'Apellido Med',
(Select M.NOMBRE from PACIENTES as M where M.IDPACIENTE = t.IDPACIENTE) As 'Nombre Pac',
(Select M.APELLIDO from PACIENTES as M where M.IDPACIENTE = t.IDPACIENTE) As 'Apellido Pac',
DURACION,
(Select MEd.COSTO_CONSULTA from MEDICOS as MED where med.IDMEDICO = t.IDMEDICO) as 'consulta sin descuento',
(Select Obra.Nombre from OBRAS_SOCIALES as Obra inner join PACIENTES as P on p.IDOBRASOCIAL = obra.IDOBRASOCIAL where p.IDPACIENTE = t.IDPACIENTE) as 'Obra Social',
((1-(Select Obra.COBERTURA from OBRAS_SOCIALES as Obra inner join PACIENTES as P on p.IDOBRASOCIAL = obra.IDOBRASOCIAL where p.IDPACIENTE = t.IDPACIENTE))*(Select MEd.COSTO_CONSULTA from MEDICOS as MED where med.IDMEDICO = t.IDMEDICO)) AS 'consulta con descuento'
 from turnos as T
order by FECHAHORA asc

--M) Listar todos los pacientes que no se hayan atendido con ningún médico.

Select * from PACIENTES as P left join turnos 
on P.IDPACIENTE = TURNOS.IDPACIENTE  where TURNOS.IDPACIENTE is null

--N) Listar por cada año, mes y paciente la cantidad de turnos solicitados. Del paciente mostrar
--Apellido y nombre.

Select YEAR(t.FECHAHORA) as Anio,MONTH (t.FECHAHORA) as Mes, count (t.IDPACIENTE) as 'Cantidad de turnos' , PACIENTES.NOMBRE , PACIENTES.APELLIDO from TURNOS AS t left join PACIENTES
on PACIENTES.IDPACIENTE = T.IDPACIENTE where PACIENTES.IDPACIENTE is not null
group by YEAR(t.FECHAHORA) ,MONTH (t.FECHAHORA), PACIENTES.NOMBRE , PACIENTES.APELLIDO



--Ñ) Listar el/los paciente que haya tenido el turno con mayor duración.

Select top (1) with ties t.DURACION, P.NOMBRE, p.APELLIDO from PACIENTES as P inner join TURNOS as T
on t.IDPACIENTE = p.IDPACIENTE
order by t.DURACION desc

--O) Listar el promedio de duración de un turno que pertenezcan a médicos con especialidad
--'Pediatría'.

SElect AVG (DURACION) from TURNOS as T inner join MEDICOS as M on M.IDMEDICO = t.IDMEDICO inner join ESPECIALIDADES as e on e.IDESPECIALIDAD = m.IDESPECIALIDAD
where e.NOMBRE ='Pediatría'

--P) Listar por cada médico, el total facturado (sin descuentos) agrupado por año. Listar apellido
--y nombre del médico.



--Q) Listar por cada especialidad la cantidad de turnos que se solicitaron en total. Listar nombre
--de la especialidad.

select e.NOMBRE , 
(SElect count (*) from TURNOS inner join MEDICOS on MEDICOS.IDMEDICO = turnos.IDMEDICO where MEDICOS.IDESPECIALIDAD = e.IDESPECIALIDAD) AS A
 from ESPECIALIDADES as e

--R) Listar por cada obra social, la cantidad de turnos

select e.NOMBRE , 
(SElect count (*) from TURNOS inner join PACIENTES on PACIENTES.IDPACIENTE = turnos.IDPACIENTE where PACIENTES.IDOBRASOCIAL= e.IDOBRASOCIAL) AS A
 from OBRAS_SOCIALES as e

--S) Listar todos los médicos que nunca atendieron a pacientes con Obra Social 'Dasuten'.

Select * from MEDICOS as MED where med.IDMEDICO not in (
Select m.IDMEDICO from MEDICOS as M inner join TURNOS as T on t.IDMEDICO = m.IDMEDICO inner join PACIENTES as P
on p.IDPACIENTE = t.IDPACIENTE inner join OBRAS_SOCIALES as O on O.IDOBRASOCIAL = p.IDOBRASOCIAL
where o.NOMBRE = 'DASUTEN' )

--T) Listar todos los pacientes que no se atendieron durante todo el año 2015.
Select * from PACIENTES AS PA where PA.IDPACIENTE not in (
Select distinct p.IDPACIENTE from PACIENTES as p inner join TURNOS as T on t.IDPACIENTE = p.IDPACIENTE
where Year(t.FECHAHORA) = 2015)

--U) Listar para cada paciente la cantidad de turnos solicitados con médicos que realizan
--"Análisis" y la cantidad de turnos solicitados con médicos de otras especialidades.
¨|


--V) Listar todos los médicos que no atendieron nunca por la mañana. Horario de 08:00 a 12:00.



--W) Listar el paciente que más veces se atendió para una misma especialidad.



--X) Listar las obras sociales que tengan más de 10 afiliados en la clínica.

select o.IDOBRASOCIAL, o.NOMBRE, COUNT (*) from OBRAS_SOCIALES as O inner join
PACIENTES on PACIENTES.IDOBRASOCIAL = o.IDOBRASOCIAL
group by o.IDOBRASOCIAL, o.NOMBRE
having COUNT (*) > 10


--Y) Listar todos los pacientes que se hayan atendido con médicos de otras especialidades pero
--no se hayan atendido con médicos que realizan "Análisis".
Select * from (
Select IDPACIENTE from  PACIENTES where IDPACIENTE not in (
Select p.IDPACIENTE from PACIENTES as P inner join TURNOS as T on t.IDPACIENTE = p.IDPACIENTE
inner join MEDICOS as M on m.IDMEDICO = t.IDMEDICO inner join ESPECIALIDADES as e on m.IDESPECIALIDAD = e.IDESPECIALIDAD 
 where e.NOMBRE like '%Análisis%' )) As Tabla inner join TURNOS as Tu on tu.IDPACIENTE = Tabla.IDPACIENTE
 

--Z) Listar todos los pacientes cuyo promedio de duración por turno sea mayor a 20 minutos.

select distinct IDPACIENTE , avg (DURACION) from TURNOS
group by (IDPACIENTE)
having avg (DURACION) > 20

--¿Cuántos pacientes distintos se atendieron en turnos que duraron más que la duración promedio?

Select * from PACIENTES
Select  * from TURNOS where duracion > (Select avg(DURACION) from TURNOS)  
Select count(distinct idpaciente) from TURNOS where duracion > (Select avg(DURACION) from TURNOS)  
--¿Cuánto tuvo que pagar la consulta el paciente con el turno nro 146?

--Teniendo en cuenta que el paciente debe pagar el costo de la consulta del médico menos lo que
--cubre la cobertura de la obra social. La cobertura de la obra social está expresado en un valor decimal entre 0 y 1. 
--Siendo 0 el 0% de cobertura y 1 el 100% de la cobertura.

--Si la cobertura de la obra social es 0.2, entonces el paciente debe pagar el 80% de la consulta.

Select Idturno,
((Select COSTO_CONSULTA from MEDICOS where turnos.IDMEDICO = MEDICOS.IDMEDICO)*
(-(select COBERTURA from OBRAS_SOCIALES inner join PACIENTES 
 on PACIENTES.IDOBRASOCIAL = OBRAS_SOCIALES.IDOBRASOCIAL where PACIENTES.IDPACIENTE = TURNOS.IDPACIENTE)+1))
 from TURNOS where IDTURNO = 146

select * from TURNOS where IDTURNO = 146
select * from MEDICOS where IDMEDICO =42
select * from PACIENTES where IDPACIENTE = 79
select * from OBRAS_SOCIALES where IDOBRASOCIAL = 9


--¿Cuáles son el/los paciente/s que se atendieron más veces? (indistintamente del sexo del paciente)

Select NOMBRE, APELLIDO ,
(Select count(*) from TURNOS inner join PACIENTES on TURNOS.IDPACIENTE = PACIENTES.IDPACIENTE)
 from PACIENTES 

 select idpaciente, COUNT(idpaciente) as A from TURNOS
 group by IDPACIENTE
 order by A desc

 Select * from PACIENTES where IDPACIENTE in ( 136, 191,149,156 )
 select * from TURNOS where IDPACIENTE = 1

 --¿Qué Obras Sociales cubren a pacientes que se hayan atendido en algún turno con algún médico de especialidad 'Odontología'?
select * from TURNOS where IDMEDICO = 98
select * from MEDICOS 
select * from PACIENTES 
select * from ESPECIALIDADES  where NOMBRE like 'Odontología' 
select * from OBRAS_SOCIALES 
3
select * from MEDICOS where IDESPECIALIDAD = 6
select * from MEDICOS where IDESPECIALIDAD in (3,4)
select * from PACIENTES where IDPACIENTE in (150,38,90,108,175,159,76)
select * from OBRAS_SOCIALES where IDOBRASOCIAL in (13,8,4,1,7,9,2)


select count(*) from TURNOS where year (FECHAHORA) <> 2015

select * from TURNOS where IDMEDICO = 41
select * from MEDICOS		