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
 
 exec sp_helpindex alumnos;
 go

create index I_alumnos_apellido
on alumnos(nombre, apellido)
with drop_existing;
go

alter table alumnos
add constraint UQ_alumnos_documento
unique(documento );
go

create nonclustered index I_alumnos_legajo
on alumnos(legajo);
go

create clustered index I_alumnos_legajo
on alumnos(legajo)
with drop_existing;
go

--no se puede convertir un index clustered en uno nonclustered----

create unique clustered index I_alumnos_legajo
on alumnos(legajo)
with drop_existing;
go

create clustered index I_alumnos_legajo
on alumnos(legajo)
with drop_existing;
go

exec sp_helpindex alumnos;
go





 

