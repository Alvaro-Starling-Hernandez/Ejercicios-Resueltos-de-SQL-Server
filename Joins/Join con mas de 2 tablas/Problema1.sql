if object_id('socios') is not null
	drop table socios;
if object_id('deportes') is not null
	drop table deportes;
if object_id('inscriptos') is not null
	drop table inscriptos;

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
	anio char(4),
	matricula char(1),--'s'=paga, 'n'=impaga
	primary key(documento,codigodeporte,anio)
);
go

--3- ingrese algunos socios
 insert into socios values('22222222','Ana Acosta','Avellaneda 111');
 insert into socios values('23333333','Betina Bustos','Bulnes 222');
 insert into socios values('24444444','Carlos Castro','Caseros 333');
 insert into socios values('25555555','Daniel Duarte','Dinamarca 44');
--4- Ingrese algunos registros en "deportes":
 insert into deportes values('basquet','Juan Juarez');
 insert into deportes values('futbol','Pedro Perez');
 insert into deportes values('natacion','Marina Morales');
 insert into deportes values('tenis','Marina Morales');

--5- Inscriba a varios socios en el mismo deporte en el mismo año:
 insert into inscriptos values ('22222222',3,'2006','s');
 insert into inscriptos values ('23333333',3,'2006','s');
 insert into inscriptos values ('24444444',3,'2006','n');

--6- Inscriba a un mismo socio en el mismo deporte en distintos años:
 insert into inscriptos values ('22222222',3,'2005','s');
 insert into inscriptos values ('22222222',3,'2007','n');

--7- Inscriba a un mismo socio en distintos deportes el mismo año:
 insert into inscriptos values ('24444444',1,'2006','s');
 insert into inscriptos values ('24444444',2,'2006','s');

go

 insert into inscriptos values ('26666666',0,'2006','s');

 select s.nombre, d.nombre, i.anio
	from socios as s
	join inscriptos as i
	on s.documento=i.documento
	left join deportes as d
	on i.codigodeporte = d.codigo
go

select i.documento, i.matricula, i.anio, d.nombre as 'deporte'
	from inscriptos as i
	full join deportes as d
	on i.codigodeporte=d.codigo
	full join socios as s
	on i.documento = s.documento
go

select s.nombre, i.anio, i.matricula, d.nombre
	from socios as s
	join inscriptos as i
	on s.documento=i.documento
	join deportes as d
	on i.codigodeporte=d.codigo
	where s.documento='22222222';
go