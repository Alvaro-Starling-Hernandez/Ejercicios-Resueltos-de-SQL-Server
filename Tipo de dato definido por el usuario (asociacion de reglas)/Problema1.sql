if object_id('empleados') is not null
	drop table empleados;
if object_id('clientes ') is not null
	drop table clientes;

if exists (select name from systypes
	where name='tipo_year')
	exec sp_droptype tipo_year;
go

exec sp_addtype tipo_year, 'int','null';

exec sp_help tipo_year;
go

create table empleados(
	docuemnto char(8),
	nombre varchar(30),
	yearingreso tipo_year
);
go

if object_id('RG_year') is not null
	drop rule RG_year;
go

create rule RG_year
as @yearingreso between 1990 and datepart(year,getdate());
go

exec sp_bindrule RG_year, 'tipo_year', 'futureonly';
go

exec sp_helpconstraint empleados;
go

create table clientes(
	documento char(8),
	yearingreso tipo_year,
	domicilio varchar(30)
);
go

exec sp_helpconstraint clientes;
go

insert into empleados values('22222222','Juan Perez',1989);
select * from empleados;
go


--insert into clientes values('22222222',1989,'Cordoba');
--select * from clientes;
--go

exec sp_unbindrule 'tipo_year';
go

exec sp_helpconstraint clientes;
go

exec sp_bindrule RG_year, 'tipo_year ';
go

--insert into empleados values('33333333','Romina Guzman',1900);

exec sp_help tipo_year;
go

if object_id('RG_yearnegativo') is not null
	drop rule RG_yearnegativo;
go

create rule RG_yearnegativo
as @year between -2000 and-1;
go

exec sp_bindrule RG_yearnegativo, 'clientes.yearingreso';
go

exec sp_helpconstraint clientes;
go

exec sp_help tipo_year;
go

insert into clientes values('44444444',-1900,'Pedro Perez');
select * from clientes;
 go


--insert into empleados values('44444444','Pedro Perez',-1900);
--select * from empleados;
--go