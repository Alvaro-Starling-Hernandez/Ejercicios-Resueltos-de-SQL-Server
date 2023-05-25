if object_id('empleados') is not null
	drop table empleados;
go

if exists (select name from systypes
	where name='tipo_legajo')
	exec sp_droptype tipo_legajo;
go

exec sp_addtype tipo_legajo, 'char(4)', 'not null';
go

exec  sp_help tipo_legajo;
go

create table empleados(
	legajo tipo_legajo,
	documento char(8),
	nombre varchar(30)
);

insert into empleados values('4848','22222222','Alvaro Satrling');
select * from empleados;

