if object_id('inscripciones') is not null
	drop table inscripciones;
if object_id('deportes') is not null
	drop table deportes;
if object_id('socios') is not null
	drop table socios;

create table deportes(
	codigo tinyint,
	nombre varchar(20),
	primary key(codigo)
);

create table socios(
	documento char(8),
	nombre varchar(30),
	primary key(documento)
);

create table inscripciones(
	documento char(8), 
	codigodeporte tinyint,
	matricula char(1),-- 's' si está paga, 'n' si no está paga
	primary key(documento,codigodeporte)
);
go

alter table inscripciones
add constraint FK_inscripciones_codigodeporte
foreign key(codigodeporte)
references deportes(codigo)
on update cascade;
go

alter table inscripciones
add constraint FK_inscripciones_documento
foreign key(documento)
references socios(documento)
on delete cascade;
go

 insert into deportes values(1,'basquet');
 insert into deportes values(2,'futbol');
 insert into deportes values(3,'natacion');
 insert into deportes values(4,'tenis');

 insert into socios values('30000111','Juan Lopez');
 insert into socios values('31111222','Ana Garcia');
 insert into socios values('32222333','Mario Molina');
 insert into socios values('33333444','Julieta Herrero');

 insert into inscripciones values ('30000111',1,'s');
 insert into inscripciones values ('33333444',1,'s');
 insert into inscripciones values ('31111222',1,'s');
 insert into inscripciones values ('32222333',3,'n');
 go

update deportes set nombre='baseball' where codigo=1;

select * from deportes;
go

