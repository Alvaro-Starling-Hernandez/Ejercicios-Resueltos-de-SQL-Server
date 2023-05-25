if object_id('alumnos') is not null
	drop table alumnos;

create table alumnos(
	legajo char(5) not null,
	documento char(8) not null,
	apellido varchar(30),
	nombre varchar(30),
	notafinal decimal(4,2)
);

create index I_alumnos_apellido
on alumnos(apellido);
go

alter table alumnos
add constraint PK_alumnos_legajo
primary key clustered (legajo);

exec sp_helpindex alumnos;

--drop index I_alumnos_legajo;
--drop index I_alumnos_apellido;

drop index alumnos.I_alumnos_apellido;

if exists (select name from sysindexes
	where name='I_alumnos_apellido')
	drop index alumnos.I_alumnos_apellido;

alter table alumnos
drop constraint PK_alumnos_legajo;

