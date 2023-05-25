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
	values('Harry Potter y la piedra filosofal','Daniel R.',180);
insert into peliculas
	values('Harry Potter y la camara secreta','Daniel R.',190);
insert into peliculas
	values('Mision imposible 2','Tom Cruise',120);
insert into peliculas
	values('Mujer bonita','Richard Gere',120);
insert into peliculas
	values('Tootsie','D. Hoffman',90);
insert into peliculas
	values('Un oso rojo','Julio Chavez',100);
insert into peliculas
	values('Elsa y Fred','China Zorrilla',110);

select * from peliculas
	where actor='Tom Cruise'
	or actor='Richard Gere';

select * from peliculas
	where actor='Tom Cruise'
	and duracion<100;

update peliculas
	set duracion=200
	where actor='Daniel R.'
	and duracion='180';

delete from peliculas
	where not actor='Tom Cruise'
	and duracion<=100;
