--Parte 1 - (15 puntos)  Utilizando el lenguaje T-SQL crear una base de datos, tablas y restricciones
-- que permitan  representar una relación de Muchos a Muchos con las siguientes entidades:  Pizza → Ingrediente    
-- Sabiendo que:  
-- - La pizza se identifica con un código autonumérico.  
-- - El ingrediente se identifica con un código autonumérico.  
-- - Las pizzas deben registrar el precio de venta y un nombre comercial.  
-- - Los ingredientes deben registrar un nombre.  
-- - Para cada ingrediente de una pizza se debe registrar la cantidad utilizada en formato  
-- Decimal (6, 2) y un tipo de ingrediente que debe estar relacionado con la tabla Tipos  Ingredientes



create database  PIZZERIA
go
Use PIZZERIA
go

Create Table Pizza
(
IdPizza int not null primary key identity (1,1),
Nombre varchar (50) Not null,
Precio money Not null check ( Precio >= 0 )
)
go
Create table Ingredientes
(
IdIngredientes int not null primary key identity (1,1),
Nombre varchar (50) not null
IdTipoIngredientes int not null foreign key references TiposIngredientes (Id)
)
go
Create table TiposIngredientes
(
ID  int not null primary key identity (1,1),
Nombre varchar (50) not null 
)
go
create table Recetas (
IdPizza int not null foreign key references PIZZA (IdPizza),
IdIngredientes int not null foreign key references Ingredientes (IdIngredientes),
Cantidad Decimal (6,2) not null check ( cantidad > 0 ),
Primary key (IdPizza,IdIngredientes)
)



1) - Por cada vecino, listar el apellido y nombre y la cantidad total de propiedades de distinto tipo  que posea. (10 puntos) 

--Select Nombres, apellidos, count(distint IDtipo) from Propiedades inner join  Tipos_Propiedades
--on IDtipo = Tipos_Propiedades.ID )
--from Vecinos 
--group by Nombres, apellidos

select v.apellidp, v.nombre from propiedades



2) - Listar todos los datos de los vecinos que no tengan Casas de más de 80m2 de superficie  construida. (20 puntos) 
 NOTA: Tipo de propiedad = 'Casa'    

 select * from Vecinos where Dni = 
(
select distinct dni from Popiedades where  
)

3) - Listar por cada vecino el apellido y nombres, la cantidad de propiedades sin superficie  construida y la cantidad de propiedades con superficie construida que posee. (25 puntos)    

select Apellidos, nombres ,
(Select Count (*) from Propiedades where superficie_construida = 0 and Propiedades.DNI = V.DNI) as PropSinSuper,
(Select Count (*) from Propiedades where superficie_construida > 0 and Propiedades.DNI = V.DNI) as PropConSuper
from Vecinos as V

4) - Listar por cada tipo de propiedad el tipo y valor promedio. Sólo listar aquellos registros cuyo  valor promedio supere los $900000. (15 puntos)    

select Tipo , 
( select AVG (VALOR) from Propiedades as P where 

5) - Por cada vecino, listar apellido y nombres y el total acumulado en concepto de propiedades. Si  un vecino no posee propiedades deberá figurar acumulando 0. (15 puntos)

isnull(sum(p.valor,0))

gateadd