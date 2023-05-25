if object_id('empleados') is not null
	drop table empleados;

create table empleados(
	apellido varchar(20),
	nombre varchar(20),
	domicilio varchar(30),
	fechaingreso datetime
);

insert into empleados(apellido,nombre) values ('Rodriguez','Pablo');
go

alter table empleados
add sueldo decimal(5,2);

exec sp_columns empleados;

alter table empleados
add codigo int identity;

alter table empleados
add documento char(8) not null
default '00000000';

exec sp_columns empleados;

alter table empleados
drop column sueldo;

exec sp_columns empleados;

alter table empleados
drop column documento;

alter table empleados
drop column codigo, fechaingreso;

exec sp_columns empleados;