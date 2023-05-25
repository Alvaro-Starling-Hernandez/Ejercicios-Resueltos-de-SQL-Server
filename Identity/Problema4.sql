if object_id('peliculas') is not null
	drop table peliculas;

create table peliculas(
	codigo integer identity(50,3),
	titulo varchar(40),
	actor varchar(20),
	duracion int
);

insert into peliculas (titulo,actor,duracion)
  values('Mision imposible','Tom Cruise',120);
 insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la piedra filosofal','Daniel R.',180);
 insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la camara secreta','Daniel R.',190);

select * from peliculas;

set identity_insert peliculas on;

insert into peliculas(codigo,titulo,actor,duracion)
	values(49,'Perico Ripiao', 'Fausto Mata', 120);

insert into peliculas(codigo,titulo,actor,duracion)
	values(58,'Perico Ripiao 2', 'Fausto Mata', 180);

select IDENT_SEED('peliculas');

select IDENT_INCR('peliculas');

--Error por activar el identity_insert
insert into peliculas(titulo,actor,duracion)
	values('Perico Ripiao 3', 'Fausto Mata', 160);

set identity_insert peliculas off;

insert into peliculas(titulo,actor,duracion)
	values('Perico Ripiao 3', 'Fausto Mata', 160);

select * from peliculas;
