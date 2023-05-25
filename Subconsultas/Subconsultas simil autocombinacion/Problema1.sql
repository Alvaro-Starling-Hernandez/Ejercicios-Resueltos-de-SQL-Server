if object_id('deportes') is not null
	drop table deportes;

create table deportes(
	nombre varchar(15),
	profesor varchar(30),
	dia varchar(10),
	cuota decimal(5,2),
);
go

 insert into deportes values('tenis','Ana Lopez','lunes',20);
 insert into deportes values('natacion','Ana Lopez','martes',15);
 insert into deportes values('futbol','Carlos Fuentes','miercoles',10);
 insert into deportes values('basquet','Gaston Garcia','jueves',15);
 insert into deportes values('padle','Juan Huerta','lunes',15);
 insert into deportes values('handball','Juan Huerta','martes',10);
 go

select distinct d1.profesor from deportes as d1
	where d1.profesor in (
		select d2.profesor from deportes as d2
			where d1.nombre<>d2.nombre
);

select distinct d1.profesor
	from deportes as d1
	join deportes as d2
	on d1.profesor=d2.profesor
	where d1.nombre<>d2.nombre;

select distinct d1.profesor
	from deportes as d1
	join deportes as d2
	on d1.profesor=d2.profesor
	where d1.nombre<>d2.nombre;

select nombre
  from deportes
  where nombre<>'natacion' and
  dia =
   (select dia
     from deportes
     where nombre='natacion');

 select d1.nombre
  from deportes as d1
  join deportes as d2
  on d1.dia=d2.dia
  where d2.nombre='natacion' and
  d1.nombre<>d2.nombre;


