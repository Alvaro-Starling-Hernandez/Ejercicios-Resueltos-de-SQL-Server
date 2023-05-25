if object_id('peliculas') is not null
	drop table peliculas;

create table peliculas(
	nombre varchar(50),
	actor varchar(50),
	duracion integer,
	cantidad integer
);

exec sp_columns peliculas;

insert into peliculas(nombre, actor, duracion, cantidad)
	values('Mision Imosible','Ton Cruise', 128,3);


insert into peliculas(nombre, actor, duracion, cantidad)
	values('Mision Imosible 2','Ton Cruise', 130,2);


insert into peliculas(nombre, actor, duracion, cantidad)
	values('Mujer Bonita','Julia Roberts', 118, 3);


insert into peliculas(nombre, actor, duracion, cantidad)
	values('Elsa y Fred','China Rodriguez', 110, 2);

select * from peliculas;