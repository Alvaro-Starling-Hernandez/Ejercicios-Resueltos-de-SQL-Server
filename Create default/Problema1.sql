if object_id('clientes') is not null
	drop table clientes;

if object_id ('VP_legajo_patron') is not null
	drop default VP_legajo_patron;
if object_id ('RG_legajo_patron') is not null
	drop rule RG_legajo_patron;
if object_id ('RG_legajo') is not null
	drop rule RG_legajo;
if object_id ('VP_datodesconocido') is not null
	drop default VP_datodesconocido;
if object_id ('VP_fechaactual') is not null
	drop default VP_fechaactual;


create table clientes(
	legajo char(4),
	nombre varchar(30),
	domicilio varchar(30),
	ciudad varchar(15),
	provincia varchar(20) default 'Cordoba',
	fechaingreso datetime
);

go

create rule RG_legajo_patron
as @legajo like '[A-Z][A-Z][0-9][0-9]';
go 

create default VP_legajo_patron
as 'AA00';
go 

exec sp_bindrule RG_legajo_patron, 'clientes.legajo';
exec sp_bindefault VP_legajo_patron, 'clientes.legajo';
go

create default VP_datodesconocido
as '??';
go

exec sp_bindefault VP_datodesconocido, 'clientes.domicilio';
go

exec sp_bindefault VP_datodesconocido, 'clientes.ciudad';
go


create default VP_fechaactual
as getdate();
go

exec sp_bindefault VP_fechaactual, 'clientes.fechaingreso';
go

insert into clientes values(default,'Alvaro', default,'jdjf', 'Duarte', getdate());
select * from clientes;




