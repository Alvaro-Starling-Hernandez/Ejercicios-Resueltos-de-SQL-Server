if object_id('empleados') is not null
	drop table empleados;

create table empleados(
	documento varchar(8) not null,
	nombre varchar(30),
	seccion varchar(20)
);

go

insert into empleados
	values ('22222222','Alberto Lopez','Sistemas');
insert into empleados
	values ('23333333','Beatriz Garcia','Administracion');
insert into empleados
	values ('24444444','Carlos Fuentes','Administracion');

alter table empleados
add constraint PK_empleados_documentos
primary key(documento);

--update empleados set documento='23333333'
--	where nombre='Alberto Lopez'; 



--alter table empleados
--add constraint PK_empleados_nombre
--primary key(nombre);

alter table empleados
add constraint DF_empleados_documento
default '00000000'
for documento;

insert into empleados values (default,'Alvaro Fuentes','Sistemas');

select * from empleados;

exec sp_helpconstraint empleados;
