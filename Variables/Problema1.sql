if object_id('alumnos') is not null
	drop table alumnos;
if object_id('notas') is not null
	drop table notas;

create table alumnos(
	documento char(8) not null
	constraint CK_alumnos_documento check (documento like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	nombre varchar(30),
	constraint PK_alumnos
	primary key(documento)	
);

create table notas(
	documento char(8) not null,
	nota decimal(4,2)
	constraint CK_notas_nota check (nota between 0 and 10),
	constraint FK_notas_documento
	foreign key(documento)
	references alumnos(documento)
	on update cascade
);
go

 insert into alumnos values('30111111','Ana Algarbe');
 insert into alumnos values('30222222','Bernardo Bustamante');
 insert into alumnos values('30333333','Carolina Conte');
 insert into alumnos values('30444444','Diana Dominguez');
 insert into alumnos values('30555555','Fabian Fuentes');
 insert into alumnos values('30666666','Gaston Gonzalez');

 insert into notas values('30111111',5.1);
 insert into notas values('30222222',7.8);
 insert into notas values('30333333',4);
 insert into notas values('30444444',2.5);
 insert into notas values('30666666',9.9);
 insert into notas values('30111111',7.3);
 insert into notas values('30222222',8.9);
 insert into notas values('30444444',6);
 insert into notas values('30666666',8);
 go

 declare @doumento varchar(8);
 select @doumento;

 select @doumento=documento from notas
	where nota=(select max(nota) from notas);
go

declare @documento char(8)
	select @documento=documento from notas
	where nota=(select max(nota) from notas);

select nombre from alumnos where documento=@documento;