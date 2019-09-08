Use FRGP_Labo
Insert into dbo.Provincia (Nombre)
Values	('Buenos Aires'),
		('Capital Federal'),
		('Catamarca'),
		('Chaco'),
		('Córdoba'),
		('Corrientes'),
		('Entre Rios'),
		('Formosa'),
		('Jujuy'),
		('La Pampa'),
		('La Rioja'),
		('Mendoza'),
		('Misiones'),
		('Neuquén'),
		('Río Negro'),
		('Salta'),
		('San Juan'),
		('San Luis'),
		('Santa Cruz'),
		('Santa Fe'),
		('Santiago Del Estero'),
		('Tierra Del Fuego'),
		('Tucumán');
go
Insert Into dbo.Localidad (CodPos_PK,NombreLoc,IDCodProv)
Values	(1111,'San Fernando',1),
		(2222,'Lanús',23),
		(3333,'Tigre',1),
		(4444,'Pilar',1);
go
Insert into Dbo.Sede (Nombre,Direccion,Mail,Telefono,IDCodPos)
values	('Norte',			'Presidente Simón 4400',	'norte@lab3.com.ar',14141414,	1111),
		('Sur',				'Dr Kloster 1080',			'sur@lab3.com.ar',	15151515,	2222),
		('Microestadio',	'Virrey Calabuig 1350',		'micro@lab3.com.ar',NULL,			3333),
		('Microestadio II',	'Almirante De Amos 3200',	'',					13131313 ,	4444),
		('Norte II',		'Av. CodeBlocks 1712',		'',					90909090,	1111);
go
insert into Dbo.Actividades (Nombre,BoolAptoMed,Costo,IDSede)
Values	('Ajedrez',			'No',250	,1),
		('Voley',			'Si',450	,3),
		('Handball',		'Si',450	,3),
		('Fútbol',			'Si',500	,4),
		('Natación',		'Si',1850	,4),
		('Yoga',			'Si',500	,2),
		('Taller Literario','No',100	,1),
		('Fortnite',		'No',1850	,1),
		('Programación',	'No',1400	,1),
		('Doom',			'No',500	,2);
go
INSERT INTO DBO.Socios (Legajo,Nombre,Apellido,FechaNac,Genero)
VALUES	(1000,'Javier','Angelelli','1990/01/01','M'),
		(2000,'Belén','Baires','1998/02/02','F'),
		(3000,'Juan','Corrionero','2004/03/03','M'),
		(5000,'Oriana','Garcia','1986/04/04','F'),
		(6000,'Kevin','Kusters','2000/05/05','M'),
		(7000,'Ignacio','Lacioppa','2000/06/06','M'),
		(8000,'Federico','Rocca','1960/07/07','M'),
		(9000,'Magalí','Albornoz','1997/08/08','F');
go
insert into Inscripciones (ID_Legajo,ID_Actividades_PK,Beca)
values	(1000,1,0),
		(1000,3,0),
		(1000,2,0),
		(2000,1,0),
		(3000,3,0),
		(3000,2,1),
		(5000,4,1),
		(6000,1,0),
		(6000,3,1),
		(6000,2,0),
		(7000,4,0),
		(8000,10,1),
		(9000,NULL,0);
go
insert into Horarios (ID_Actividades_PK,Dia,HoraInicio,HoraFin)
Values	
(1,	1,	'7:00',	'8:30'),
(2,	2,	'19:00','21:00'),
(3,	3,	'21:00','23:00'),
(4,	4,	'18:00','22:00'),
(5,	5,	'20:00','22:00'),
(6,	6,	'14:00','15:00'),
(7,	7,	'10:00','10:45'),
(8,	1,	'21:00','22:30'),
(9,	2,	'8:00',	'12:00'),
(10,3,	'10:00','12:00'),
(1,	4,	'21:00','22:00'),
(2,	5,	'18:00','20:00');