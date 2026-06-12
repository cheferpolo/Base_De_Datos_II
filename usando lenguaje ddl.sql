--comentario
/*
Este es un comentario multilinea


*/
-- crear base de datos
-- usar lenguaje de definición de datos
if DB_ID('Gestion_Turistica') is not null
drop database Gestion_Turistica_CPV

go

create database Gestion_Turistica_CPV
go
--CREAR UNA TABLA
create table Usuario (
id int,
pass varchar(40)

)
create table cliente(
idcliente int primary key,
nombrecliente varchar(50),
Ap_Paterno varchar(50),
Ap_Materno varchar(50),
telefono varchar (9),
direccion varchar(150),
zip varchar(5),
fechaNac date
)