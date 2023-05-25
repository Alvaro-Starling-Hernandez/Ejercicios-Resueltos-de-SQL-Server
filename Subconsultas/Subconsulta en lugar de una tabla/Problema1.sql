if object_id('inscriptos') is not null
	drop table inscriptos;
if object_id('socios') is not null
	drop table socios;
if object_id('deportes') is not null
	drop table deportes;


 create table socios(
	documento char(8) not null, 
	nombre varchar(30),
	domicilio varchar(30),
	primary key(documento)
 );
 create table deportes(
	codigo tinyint identity,
	nombre varchar(20),
	profesor varchar(15),
	primary key(codigo)
 );
 create table inscriptos(
	documento char(8) not null, 
	codigodeporte tinyint not null,
	año char(4),
	matricula char(1),--'s'=paga, 'n'=impaga
	primary key(documento,codigodeporte,año),
	constraint FK_inscriptos_socio
	foreign key (documento)
	references socios(documento)
	on update cascade
	on delete cascade
 );
 go

 insert into socios values('22222222','Ana Acosta','Avellaneda 111');
 insert into socios values('23333333','Betina Bustos','Bulnes 222');
 insert into socios values('24444444','Carlos Castro','Caseros 333');
 insert into socios values('25555555','Daniel Duarte','Dinamarca 44');

 insert into deportes values('basquet','Juan Juarez');
 insert into deportes values('futbol','Pedro Perez');
 insert into deportes values('natacion','Marina Morales');
 insert into deportes values('tenis','Marina Morales');

 insert into inscriptos values ('22222222',3,'2006','s');
 insert into inscriptos values ('23333333',3,'2006','s');
 insert into inscriptos values ('24444444',3,'2006','n');
 insert into inscriptos values ('22222222',3,'2005','s');
 insert into inscriptos values ('22222222',3,'2007','n');
 insert into inscriptos values ('24444444',1,'2006','s');
 insert into inscriptos values ('24444444',2,'2006','s');
 go

 select i.*,d.nombre as 'deporte',d.profesor 
	from inscriptos as i
	join deportes as d
	on d.codigo=i.codigodeporte;


select s.nombre,td.deporte as 'deporte',td.año,td.profesor,td.matricula
	from socios as s
	join(select i.*,d.nombre as 'deporte',d.profesor 
		from inscriptos as i
		join deportes as d
		on d.codigo=i.codigodeporte) as td
	on td.documento=s.documento;