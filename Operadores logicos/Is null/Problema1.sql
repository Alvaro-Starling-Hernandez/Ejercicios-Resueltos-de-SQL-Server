if object_id('peliculas') is not null
	drop table peliculas;

create table peliculas(
	codigo int identity,
	titulo varchar(40) not null,
	actor varchar(20),
	duracion tinyint,
	primary key (codigo)
);

insert into peliculas
	values('Mision imposible','Tom Cruise',120);
insert into peliculas
	values('Harry Potter y la piedra filosofal','Daniel R.',null);
insert into peliculas
	values('Harry Potter y la camara secreta','Daniel R.',190);
insert into peliculas
	values('Mision imposible 2','Tom Cruise',120);
insert into peliculas
	values('Mujer bonita',null,120);
insert into peliculas
	values('Tootsie','D. Hoffman',90);
insert into peliculas (titulo)
	values('Un oso rojo');


select * from peliculas
	where actor is null;

update peliculas set duracion=0
	where duracion is null;

delete from peliculas
	where actor is null
	and duracion=0;

