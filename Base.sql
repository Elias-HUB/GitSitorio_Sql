
Create database FRGP_Labo
go
use FRGP_Labo
go
CREATE TABLE Provincia(
CodProv_PK TINYINT NOT NULL PRIMARY KEY IDENTITY (1,1),
Nombre VARCHAR (50) NOT NULL,
)
go
CREATE TABLE Localidad(
CodPos_PK INT NOT NULL PRIMARY KEY,
NombreLoc VARCHAR (50) NOT NULL,
IDCodProv TINYINT NOT NULL FOREIGN KEY REFERENCES Provincia(CodProv_PK),
)
go
CREATE TABLE Sede(
Sede_PK TINYINT NOT NULL PRIMARY KEY IDENTITY (1,1),
Nombre VARCHAR (50) NOT NULL,
Direccion VARCHAR (50) NOT NULL,
Mail varchar(40) NULL,
Telefono INT  NULL,
IDCodPos INT not null FOREIGN KEY REFERENCES Localidad(CodPos_PK),
)
go
CREATE TABLE Actividades (
Actividades_PK TINYINT NOT NULL PRIMARY KEY IDENTITY (1,1),
Nombre VARCHAR (50) NOT NULL ,
BoolAptoMed VARCHAR (2) NOT NULL check (BoolAptoMed in ('Si','No','no','si')),
Costo MONEY NOT NULL check (costo > 0),
IDSede TINYINT NOT NULL FOREIGN KEY REFERENCES Sede(Sede_PK),
)
go
CREATE TABLE Socios(
Legajo INT NOT NULL PRIMARY KEY,
Nombre VARCHAR (50) NOT NULL,
Apellido VARCHAR (50) NOT NULL,
FechaNac DATE  NOT NULL CHECK (FechaNac < '2010-01-01'),
Genero VARCHAR (10) NULL CHECK (Genero in ('M','m','F','f')),
) 
go
Create table Inscripciones (
ID_Legajo int not null foreign key references Socios(Legajo),
ID_Actividades_PK TINYINT NULL foreign key  references Actividades (Actividades_PK),
Beca bit not null,
FechaInsc Date  null,
)
go
create table Pagos(
ID_Pago bigINT NOT NULL PRIMARY KEY IDENTITY (1,1),
ID_Socio int not null foreign key references Socios(Legajo),
Importe float not null check (Importe >=0),
FechaPago date null,
Periodo Date null,
UNIQUE  (ID_Socio,Periodo),
)
go
create table Horarios(
ID_Horario bigINT NOT NULL PRIMARY KEY IDENTITY (1,1),
ID_Actividades_PK TINYINT NULL foreign key  references Actividades (Actividades_PK),
Dia int not null check (Dia >0 and Dia <8), 
HoraInicio time not null check (HoraInicio Between '07:00' and '23:00'),
HoraFin time not null check (Horafin Between '08:00' and '23:00'),
UNIQUE (ID_Actividades_PK,HoraInicio,Dia)
)

