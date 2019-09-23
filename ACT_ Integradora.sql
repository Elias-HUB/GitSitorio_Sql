--1 ¿Cuál es el apellido del médico (sexo masculino) con más antigüedad de la clínica?

Select top (1) * from (
Select APELLIDO, FECHAINGRESO from MEDICOS
where SEXO = 'M' ) As Tabla
order by FECHAINGRESO Asc

--2 ¿Cuántos pacientes distintos se atendieron en turnos que duraron más que la duración promedio?

select count ( distinct IDPACIENTE) from TURNOS where DURACION > (Select avg(DURACION) from TURNOS )

--3 ¿Cuántos médicos tienen la especialidad "Gastroenterología" ó "Pediatría"?

select * from medicos where IDESPECIALIDAD in (3,4)

--4 ¿Cuáles son el/los paciente/s que se atendieron más veces? (indistintamente del sexo del paciente)

Select a.NOMBRE, APELLIDO from PACIENTES as a inner join ( 
Select TOP (1)  WITH TIES * from (
SELECT DISTINCT P.IDPACIENTE ,
(SELECT COUNT (*) FROM TURNOS WHERE P.IDPACIENTE = TURNOS.IDPACIENTE) As Cantidad FROM PACIENTES as P ) as Tabla
order by Cantidad desc ) as Tablaux
on a.IDPACIENTE = Tablaux.IDPACIENTE

--5 ¿Cuál es el costo de la consulta promedio de cualquier especialista en "Oftalmología"?

Select  avg(COSTO_CONSULTA) from MEDICOS where IDESPECIALIDAD = ( select IDESPECIALIDAD from ESPECIALIDADES where nombre = 'Oftalmología' )

--6 ¿Qué Obras Sociales cubren a pacientes que se hayan atendido en algún turno con algún médico de especialidad 'Odontología'?

Select  NOMBRE from OBRAS_SOCIALES inner join (
select PACIENTES.IDOBRASOCIAL from PACIENTES inner join (
Select TURNOS.IDPACIENTE from TURNOS inner join (
select MEDICOS.IDMEDICO from MEDICOS inner join ESPECIALIDADES on medicos.IDESPECIALIDAD = ESPECIALIDADES.IDESPECIALIDAD where ESPECIALIDADES.NOMBRE = 'Odontología') As TablaMedico
on turnos.IDMEDICO = TablaMedico.IDMEDICO ) as TablaPacientes
on TablaPacientes.IDPACIENTE = PACIENTES.IDPACIENTE ) as TablaObra
on OBRAS_SOCIALES.IDOBRASOCIAL = TablaObra.IDOBRASOCIAL


--7 ¿Cuál es la cantidad de pacientes que no se atendieron en el año 2015?

select distinct count(*) from PACIENTES where 

--8 ¿Cuántos turnos fueron atendidos por la doctora Flavia Rice?



--9¿Cuánto tuvo que pagar la consulta el paciente con el turno nro 146?

--Teniendo en cuenta que el paciente debe pagar el costo de la consulta del médico menos lo que cubre la cobertura de la obra social
--La cobertura de la obra social está expresado en un valor decimal entre 0 y 1. Siendo 0 el 0% de cobertura y 1 el 100% de la cobertura.



--10 ¿Cuántas médicas cobran sus honorarios de consulta un costo mayor a $1000?