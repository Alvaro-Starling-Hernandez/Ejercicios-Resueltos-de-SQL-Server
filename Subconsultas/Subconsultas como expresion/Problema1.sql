if object_id('alumnos') is not null
	drop table alumnos;

create table alumnos(
	documento char(8),
	nombre varchar(30),
	nota decimal(4,2),
	primary key(documento),
	constraint CK_alumnos_nota_valores check(nota>=0 and nota<=10)
);
go

insert into alumnos values('30111111','Ana Algarbe',5.1);
insert into alumnos values('30222222','Bernardo Bustamante',3.2);
insert into alumnos values('30333333','Carolina Conte',4.5);
insert into alumnos values('30444444','Diana Dominguez',9.7);
insert into alumnos values('30555555','Fabian Fuentes',8.5);
insert into alumnos values('30666666','Gaston Gonzalez',9.70);

select * 
	from alumnos
	where nota=
	(select max(nota) from alumnos);
go


--select * from alumnos
	--where nota=(select max(nota),nombre from alumnos);
--go

select *, 
	(nota-(select avg(nota) from alumnos)) as diferencia 
	from alumnos 
	where nota<
	(select avg(nota) from alumnos);
go

update alumnos set nota=4
	where nota=
	(select min(nota) from alumnos);

select * from alumnos;

delete from alumnos 
	where nota<
	(select avg(nota) from alumnos);
go

select * from alumnos;
go