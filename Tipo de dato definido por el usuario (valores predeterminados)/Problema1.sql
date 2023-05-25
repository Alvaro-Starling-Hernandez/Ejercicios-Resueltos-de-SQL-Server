if object_id('empleados') is not null
	drop table empleados;
if object_id('clientes') is not null
	drop table clientes;

if exists (select name from systypes
	where name='tipo_year')
	exec sp_droptype tipo_year;
go

exec sp_addtype tipo_year,'int', 'null';
go

exec sp_help tipo_year;
go 

create table empleados(
	documento char(8),
	nombre varchar(30),
	yearingreso tipo_year
);
go

if object_id('VP_yearactual') is not null
	drop default VP_yearactual;
go

create default VP_yearactual
as datepart(year,getdate());
go

exec sp_bindefault VP_yearactual,'tipo_year', 'futureonly';
go

exec sp_helpconstraint empleados;
go

create table clientes(
	nombre varchar(30),
	yearingreso tipo_year,
	domicilio varchar(30)
);
go 

exec sp_helpconstraint clientes;
go

insert into empleados default values;
select * from empleados;
go

insert into clientes default values;
select * from clientes;
go

if object_id('VP_year2000') is not null
	drop default VP_year2000;
go

create default VP_year2000
as 2000;
go

exec sp_bindefault VP_year2000, 'tipo_year';
go

exec sp_helpconstraint empleados;
exec sp_helpconstraint clientes;
go

insert into empleados default values;
select * from empleados;
insert into clientes default values;
select * from clientes;
go

exec sp_help tipo_year;
go

/*alter table empleados
add constraint DF_yearingreso
default 1999
for yearingreso;
go*/

exec sp_unbindefault tipo_year;
go

alter table empleados
add constraint DF_yearingreso
default 1999
for yearingreso;
go

exec sp_bindefault VP_yearactual, 'tipo_year';
go

exec sp_help tipo_year;
go

exec sp_helpconstraint clientes;
go

exec sp_helpconstraint empleados;
go


