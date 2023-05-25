if object_id('alumnos') is not null
	drop table alumnos;

create table alumnos(
	legajo char(5) not null,
	documento char(8) not null,
	apellido varchar(30),
	nombre varchar(30),
	notafinal decimal(4,2)
);
go


insert into alumnos values ('A123','22222222','Perez','Patricia',5.50);
insert into alumnos values ('A234','23333333','Lopez','Ana',9);
insert into alumnos values ('A345','24444444','Garcia','Carlos',8.5);
insert into alumnos values ('A348','25555555','Perez','Daniela',7.85);
insert into alumnos values ('A457','26666666','Perez','Fabian',3.2);
insert into alumnos values ('A589','27777777','Gomez','Gaston',6.90);
go

--create unique clustered index I_alumnos_apellido
--on alumnos(apellido);

create nonclustered index I_alumnos_apellido_noagrupado
on alumnos(apellido);
go

alter table alumnos
add constraint PK_alumnos_legajo
primary key clustered(legajo);

alter table alumnos
add constraint PK_alumnos_legajo
primary key nonclustered(legajo);

exec sp_helpindex alumnos; 

exec sp_helpconstraint alumnos;

create nonclustered index I_alumnos_documento
on alumnos(documento);

--insert into alumnos values ('A589','27777777','Hernandez','Alvaro',6.90);

exec sp_helpindex alumnos;

create index I_alumnos_nombreapellido
on alumnos(nombre, apellido);

select name from sysindexes
	where name like '%alumnos%';
go

alter table alumnos
add constraint UQ_alumnos_documento
unique (documento);

exec sp_helpconstraint alumnos;

exec sp_helpindex alumnos;

select name from sysindexes
	where name like '%alumnos%';
go

select name from sysindexes
	where name like 'I_%';
go