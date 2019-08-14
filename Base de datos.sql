USE [master]
GO
/****** Object:  Database [FRGP_LABO]    Script Date: 13/08/2019 22:17:13 ******/
CREATE DATABASE [FRGP_LABO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FRGP_LABO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.FRGP_LABO\MSSQL\DATA\FRGP_LABO.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FRGP_LABO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.FRGP_LABO\MSSQL\DATA\FRGP_LABO_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FRGP_LABO] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FRGP_LABO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FRGP_LABO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FRGP_LABO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FRGP_LABO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FRGP_LABO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FRGP_LABO] SET ARITHABORT OFF 
GO
ALTER DATABASE [FRGP_LABO] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FRGP_LABO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FRGP_LABO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FRGP_LABO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FRGP_LABO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FRGP_LABO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FRGP_LABO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FRGP_LABO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FRGP_LABO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FRGP_LABO] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FRGP_LABO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FRGP_LABO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FRGP_LABO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FRGP_LABO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FRGP_LABO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FRGP_LABO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FRGP_LABO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FRGP_LABO] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FRGP_LABO] SET  MULTI_USER 
GO
ALTER DATABASE [FRGP_LABO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FRGP_LABO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FRGP_LABO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FRGP_LABO] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FRGP_LABO] SET DELAYED_DURABILITY = DISABLED 
GO
USE [FRGP_LABO]
GO
/****** Object:  Table [dbo].[Actividades]    Script Date: 13/08/2019 22:17:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Actividades](
	[Actividades_PK] [tinyint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[BoolAptoMed] [varchar](2) NOT NULL,
	[Costo] [money] NOT NULL,
	[IDSede] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Actividades_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ActSedeXSocio]    Script Date: 13/08/2019 22:17:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActSedeXSocio](
	[ID_Legajo] [int] NOT NULL,
	[ID_Actividades_PK] [tinyint] NULL,
	[Beca] [bit] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Localidad]    Script Date: 13/08/2019 22:17:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Localidad](
	[CodPos_PK] [int] NOT NULL,
	[NombreLoc] [varchar](50) NOT NULL,
	[IDCodProv] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CodPos_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 13/08/2019 22:17:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Provincia](
	[CodProv_PK] [tinyint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CodProv_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sede]    Script Date: 13/08/2019 22:17:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sede](
	[Sede_PK] [tinyint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[Mail] [varchar](40) NULL,
	[Telefono] [int] NULL,
	[IDCodPos] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Sede_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Socios]    Script Date: 13/08/2019 22:17:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Socios](
	[Legajo] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[FechaNac] [date] NOT NULL,
	[Genero] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Legajo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Actividades] ON 

INSERT [dbo].[Actividades] ([Actividades_PK], [Nombre], [BoolAptoMed], [Costo], [IDSede]) VALUES (1, N'Ajedrez', N'No', 250.0000, 1)
INSERT [dbo].[Actividades] ([Actividades_PK], [Nombre], [BoolAptoMed], [Costo], [IDSede]) VALUES (2, N'Voley', N'Si', 450.0000, 3)
INSERT [dbo].[Actividades] ([Actividades_PK], [Nombre], [BoolAptoMed], [Costo], [IDSede]) VALUES (3, N'Handball', N'Si', 450.0000, 3)
INSERT [dbo].[Actividades] ([Actividades_PK], [Nombre], [BoolAptoMed], [Costo], [IDSede]) VALUES (4, N'Fútbol', N'Si', 500.0000, 4)
INSERT [dbo].[Actividades] ([Actividades_PK], [Nombre], [BoolAptoMed], [Costo], [IDSede]) VALUES (5, N'Natación', N'Si', 1850.0000, 4)
INSERT [dbo].[Actividades] ([Actividades_PK], [Nombre], [BoolAptoMed], [Costo], [IDSede]) VALUES (6, N'Yoga', N'Si', 500.0000, 2)
INSERT [dbo].[Actividades] ([Actividades_PK], [Nombre], [BoolAptoMed], [Costo], [IDSede]) VALUES (7, N'Taller Literario', N'No', 100.0000, 1)
INSERT [dbo].[Actividades] ([Actividades_PK], [Nombre], [BoolAptoMed], [Costo], [IDSede]) VALUES (8, N'Fortnite', N'No', 1850.0000, 1)
INSERT [dbo].[Actividades] ([Actividades_PK], [Nombre], [BoolAptoMed], [Costo], [IDSede]) VALUES (9, N'Programación', N'No', 1400.0000, 1)
INSERT [dbo].[Actividades] ([Actividades_PK], [Nombre], [BoolAptoMed], [Costo], [IDSede]) VALUES (10, N'Doom', N'No', 500.0000, 2)
SET IDENTITY_INSERT [dbo].[Actividades] OFF
INSERT [dbo].[ActSedeXSocio] ([ID_Legajo], [ID_Actividades_PK], [Beca]) VALUES (1000, 1, 0)
INSERT [dbo].[ActSedeXSocio] ([ID_Legajo], [ID_Actividades_PK], [Beca]) VALUES (1000, 3, 0)
INSERT [dbo].[ActSedeXSocio] ([ID_Legajo], [ID_Actividades_PK], [Beca]) VALUES (1000, 2, 0)
INSERT [dbo].[ActSedeXSocio] ([ID_Legajo], [ID_Actividades_PK], [Beca]) VALUES (2000, 1, 0)
INSERT [dbo].[ActSedeXSocio] ([ID_Legajo], [ID_Actividades_PK], [Beca]) VALUES (3000, 3, 0)
INSERT [dbo].[ActSedeXSocio] ([ID_Legajo], [ID_Actividades_PK], [Beca]) VALUES (3000, 2, 1)
INSERT [dbo].[ActSedeXSocio] ([ID_Legajo], [ID_Actividades_PK], [Beca]) VALUES (5000, 4, 1)
INSERT [dbo].[ActSedeXSocio] ([ID_Legajo], [ID_Actividades_PK], [Beca]) VALUES (6000, 1, 0)
INSERT [dbo].[ActSedeXSocio] ([ID_Legajo], [ID_Actividades_PK], [Beca]) VALUES (6000, 3, 1)
INSERT [dbo].[ActSedeXSocio] ([ID_Legajo], [ID_Actividades_PK], [Beca]) VALUES (6000, 2, 0)
INSERT [dbo].[ActSedeXSocio] ([ID_Legajo], [ID_Actividades_PK], [Beca]) VALUES (7000, 4, 0)
INSERT [dbo].[ActSedeXSocio] ([ID_Legajo], [ID_Actividades_PK], [Beca]) VALUES (8000, 10, 1)
INSERT [dbo].[ActSedeXSocio] ([ID_Legajo], [ID_Actividades_PK], [Beca]) VALUES (9000, NULL, 0)
INSERT [dbo].[Localidad] ([CodPos_PK], [NombreLoc], [IDCodProv]) VALUES (5, N'a', 1)
INSERT [dbo].[Localidad] ([CodPos_PK], [NombreLoc], [IDCodProv]) VALUES (1111, N'San Fernando', 1)
INSERT [dbo].[Localidad] ([CodPos_PK], [NombreLoc], [IDCodProv]) VALUES (2222, N'Lanús', 23)
INSERT [dbo].[Localidad] ([CodPos_PK], [NombreLoc], [IDCodProv]) VALUES (3333, N'Tigre', 1)
INSERT [dbo].[Localidad] ([CodPos_PK], [NombreLoc], [IDCodProv]) VALUES (4444, N'Pilar', 1)
SET IDENTITY_INSERT [dbo].[Provincia] ON 

INSERT [dbo].[Provincia] ([CodProv_PK], [Nombre]) VALUES (1, N'Buenos Aires')
INSERT [dbo].[Provincia] ([CodProv_PK], [Nombre]) VALUES (2, N'Capital Federal')
INSERT [dbo].[Provincia] ([CodProv_PK], [Nombre]) VALUES (3, N'Catamarca')
INSERT [dbo].[Provincia] ([CodProv_PK], [Nombre]) VALUES (4, N'Chaco')
INSERT [dbo].[Provincia] ([CodProv_PK], [Nombre]) VALUES (5, N'Córdoba')
INSERT [dbo].[Provincia] ([CodProv_PK], [Nombre]) VALUES (6, N'Corrientes')
INSERT [dbo].[Provincia] ([CodProv_PK], [Nombre]) VALUES (7, N'Entre Rios')
INSERT [dbo].[Provincia] ([CodProv_PK], [Nombre]) VALUES (8, N'Formosa')
INSERT [dbo].[Provincia] ([CodProv_PK], [Nombre]) VALUES (9, N'Jujuy')
INSERT [dbo].[Provincia] ([CodProv_PK], [Nombre]) VALUES (10, N'La Pampa')
INSERT [dbo].[Provincia] ([CodProv_PK], [Nombre]) VALUES (11, N'La Rioja')
INSERT [dbo].[Provincia] ([CodProv_PK], [Nombre]) VALUES (12, N'Mendoza')
INSERT [dbo].[Provincia] ([CodProv_PK], [Nombre]) VALUES (13, N'Misiones')
INSERT [dbo].[Provincia] ([CodProv_PK], [Nombre]) VALUES (14, N'Neuquén')
INSERT [dbo].[Provincia] ([CodProv_PK], [Nombre]) VALUES (15, N'Río Negro')
INSERT [dbo].[Provincia] ([CodProv_PK], [Nombre]) VALUES (16, N'Salta')
INSERT [dbo].[Provincia] ([CodProv_PK], [Nombre]) VALUES (17, N'San Juan')
INSERT [dbo].[Provincia] ([CodProv_PK], [Nombre]) VALUES (18, N'San Luis')
INSERT [dbo].[Provincia] ([CodProv_PK], [Nombre]) VALUES (19, N'Santa Cruz')
INSERT [dbo].[Provincia] ([CodProv_PK], [Nombre]) VALUES (20, N'Santa Fe')
INSERT [dbo].[Provincia] ([CodProv_PK], [Nombre]) VALUES (21, N'Santiago Del Estero')
INSERT [dbo].[Provincia] ([CodProv_PK], [Nombre]) VALUES (22, N'Tierra Del Fuego')
INSERT [dbo].[Provincia] ([CodProv_PK], [Nombre]) VALUES (23, N'Tucumán')
SET IDENTITY_INSERT [dbo].[Provincia] OFF
SET IDENTITY_INSERT [dbo].[Sede] ON 

INSERT [dbo].[Sede] ([Sede_PK], [Nombre], [Direccion], [Mail], [Telefono], [IDCodPos]) VALUES (1, N'Norte', N'Presidente Simón 4400', N'norte@lab3.com.ar', 14141414, 1111)
INSERT [dbo].[Sede] ([Sede_PK], [Nombre], [Direccion], [Mail], [Telefono], [IDCodPos]) VALUES (2, N'Sur', N'Dr Kloster 1080', N'sur@lab3.com.ar', 15151515, 2222)
INSERT [dbo].[Sede] ([Sede_PK], [Nombre], [Direccion], [Mail], [Telefono], [IDCodPos]) VALUES (3, N'Microestadio', N'Virrey Calabuig 1350', N'micro@lab3.com.ar', NULL, 3333)
INSERT [dbo].[Sede] ([Sede_PK], [Nombre], [Direccion], [Mail], [Telefono], [IDCodPos]) VALUES (4, N'Microestadio II', N'Almirante De Amos 3200', N'', 13131313, 4444)
INSERT [dbo].[Sede] ([Sede_PK], [Nombre], [Direccion], [Mail], [Telefono], [IDCodPos]) VALUES (5, N'Norte II', N'Av. CodeBlocks 1712', N'', 90909090, 1111)
INSERT [dbo].[Sede] ([Sede_PK], [Nombre], [Direccion], [Mail], [Telefono], [IDCodPos]) VALUES (7, N'Belgrano', N'a', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Sede] OFF
INSERT [dbo].[Socios] ([Legajo], [Nombre], [Apellido], [FechaNac], [Genero]) VALUES (1000, N'Javier', N'Angelelli', CAST(N'1990-01-01' AS Date), N'M')
INSERT [dbo].[Socios] ([Legajo], [Nombre], [Apellido], [FechaNac], [Genero]) VALUES (2000, N'Belén', N'Baires', CAST(N'1998-02-02' AS Date), N'F')
INSERT [dbo].[Socios] ([Legajo], [Nombre], [Apellido], [FechaNac], [Genero]) VALUES (3000, N'Juan', N'Corrionero', CAST(N'2004-03-03' AS Date), N'M')
INSERT [dbo].[Socios] ([Legajo], [Nombre], [Apellido], [FechaNac], [Genero]) VALUES (5000, N'Oriana', N'Garcia', CAST(N'1986-04-04' AS Date), N'F')
INSERT [dbo].[Socios] ([Legajo], [Nombre], [Apellido], [FechaNac], [Genero]) VALUES (6000, N'Kevin', N'Kusters', CAST(N'2000-05-05' AS Date), N'M')
INSERT [dbo].[Socios] ([Legajo], [Nombre], [Apellido], [FechaNac], [Genero]) VALUES (7000, N'Ignacio', N'Lacioppa', CAST(N'2000-06-06' AS Date), N'M')
INSERT [dbo].[Socios] ([Legajo], [Nombre], [Apellido], [FechaNac], [Genero]) VALUES (8000, N'Federico', N'Rocca', CAST(N'1960-07-07' AS Date), N'M')
INSERT [dbo].[Socios] ([Legajo], [Nombre], [Apellido], [FechaNac], [Genero]) VALUES (9000, N'Magalí', N'Albornoz', CAST(N'1997-08-08' AS Date), N'F')
ALTER TABLE [dbo].[Actividades]  WITH CHECK ADD FOREIGN KEY([IDSede])
REFERENCES [dbo].[Sede] ([Sede_PK])
GO
ALTER TABLE [dbo].[ActSedeXSocio]  WITH CHECK ADD FOREIGN KEY([ID_Actividades_PK])
REFERENCES [dbo].[Actividades] ([Actividades_PK])
GO
ALTER TABLE [dbo].[ActSedeXSocio]  WITH CHECK ADD FOREIGN KEY([ID_Legajo])
REFERENCES [dbo].[Socios] ([Legajo])
GO
ALTER TABLE [dbo].[Localidad]  WITH CHECK ADD FOREIGN KEY([IDCodProv])
REFERENCES [dbo].[Provincia] ([CodProv_PK])
GO
ALTER TABLE [dbo].[Sede]  WITH CHECK ADD FOREIGN KEY([IDCodPos])
REFERENCES [dbo].[Localidad] ([CodPos_PK])
GO
ALTER TABLE [dbo].[Actividades]  WITH CHECK ADD CHECK  (([BoolAptoMed]='si' OR [BoolAptoMed]='no' OR [BoolAptoMed]='No' OR [BoolAptoMed]='Si'))
GO
ALTER TABLE [dbo].[Actividades]  WITH CHECK ADD CHECK  (([costo]>(0)))
GO
ALTER TABLE [dbo].[Socios]  WITH CHECK ADD CHECK  (([FechaNac]<'2010-01-01'))
GO
ALTER TABLE [dbo].[Socios]  WITH CHECK ADD CHECK  (([Genero]='f' OR [Genero]='F' OR [Genero]='m' OR [Genero]='M'))
GO
USE [master]
GO
ALTER DATABASE [FRGP_LABO] SET  READ_WRITE 
GO
