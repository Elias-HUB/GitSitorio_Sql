--1 �Cu�l es el apellido del m�dico (sexo masculino) con m�s antig�edad de la cl�nica?

Select top (1) * from (
Select APELLIDO, FECHAINGRESO from MEDICOS
where SEXO = 'M' ) As Tabla
order by FECHAINGRESO Asc

--2 �Cu�ntos pacientes distintos se atendieron en turnos que duraron m�s que la duraci�n promedio?

select count ( distinct IDPACIENTE) from TURNOS where DURACION > (Select avg(DURACION) from TURNOS )

--3 �Cu�ntos m�dicos tienen la especialidad "Gastroenterolog�a" � "Pediatr�a"?

select * from medicos where IDESPECIALIDAD in (3,4)

--4 �Cu�les son el/los paciente/s que se atendieron m�s veces? (indistintamente del sexo del paciente)

Select a.NOMBRE, APELLIDO from PACIENTES as a inner join ( 
Select TOP (1)  WITH TIES * from (
SELECT DISTINCT P.IDPACIENTE ,
(SELECT COUNT (*) FROM TURNOS WHERE P.IDPACIENTE = TURNOS.IDPACIENTE) As Cantidad FROM PACIENTES as P ) as Tabla
order by Cantidad desc ) as Tablaux
on a.IDPACIENTE = Tablaux.IDPACIENTE

--5 �Cu�l es el costo de la consulta promedio de cualquier especialista en "Oftalmolog�a"?

Select  avg(COSTO_CONSULTA) from MEDICOS where IDESPECIALIDAD = ( select IDESPECIALIDAD from ESPECIALIDADES where nombre = 'Oftalmolog�a' )

--6 �Qu� Obras Sociales cubren a pacientes que se hayan atendido en alg�n turno con alg�n m�dico de especialidad 'Odontolog�a'?

Select  NOMBRE from OBRAS_SOCIALES inner join (
select PACIENTES.IDOBRASOCIAL from PACIENTES inner join (
Select TURNOS.IDPACIENTE from TURNOS inner join (
select MEDICOS.IDMEDICO from MEDICOS inner join ESPECIALIDADES on medicos.IDESPECIALIDAD = ESPECIALIDADES.IDESPECIALIDAD where ESPECIALIDADES.NOMBRE = 'Odontolog�a') As TablaMedico
on turnos.IDMEDICO = TablaMedico.IDMEDICO ) as TablaPacientes
on TablaPacientes.IDPACIENTE = PACIENTES.IDPACIENTE ) as TablaObra
on OBRAS_SOCIALES.IDOBRASOCIAL = TablaObra.IDOBRASOCIAL


--7 �Cu�l es la cantidad de pacientes que no se atendieron en el a�o 2015?

select distinct count(*) from PACIENTES where 

--8 �Cu�ntos turnos fueron atendidos por la doctora Flavia Rice?



--9�Cu�nto tuvo que pagar la consulta el paciente con el turno nro 146?

--Teniendo en cuenta que el paciente debe pagar el costo de la consulta del m�dico menos lo que cubre la cobertura de la obra social
--La cobertura de la obra social est� expresado en un valor decimal entre 0 y 1. Siendo 0 el 0% de cobertura y 1 el 100% de la cobertura.



--10 �Cu�ntas m�dicas cobran sus honorarios de consulta un costo mayor a $1000?