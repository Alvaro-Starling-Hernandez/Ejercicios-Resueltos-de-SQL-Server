if object_id('inscriptos') is not null
	drop table inscriptos;

create table inscriptos(
	documento char(8) not null, 
	nombre varchar(30),
	deporte varchar(15) not null,
	año datetime,
	matricula char(1),
	primary key(documento,deporte,año)
);

insert into inscriptos
  values ('12222222','Juan Perez','tenis','2005','s');
 insert into inscriptos
  values ('23333333','Marta Garcia','tenis','2005','s');
 insert into inscriptos
  values ('34444444','Luis Perez','tenis','2005','n');

 insert into inscriptos
  values ('12222222','Juan Perez','futbol','2005','s');
 insert into inscriptos
  values ('12222222','Juan Perez','natacion','2005','s');
 insert into inscriptos
  values ('12222222','Juan Perez','basquet','2005','n');

insert into inscriptos
  values ('12222222','Juan Perez','tenis','2006','s');
 insert into inscriptos
  values ('12222222','Juan Perez','tenis','2007','s');


insert into inscriptos
	values ('12222222','Juan Perez','tenis','2005','s');

 update inscriptos set deporte='tenis'
  where documento='12222222' and
  deporte='futbol' and
  año='2005';