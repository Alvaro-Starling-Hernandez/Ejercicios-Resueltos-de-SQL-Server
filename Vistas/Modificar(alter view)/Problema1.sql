if object_id('inscriptos') is not null
	drop table inscriptos;
if object_id('socios') is not null
	drop table socios;
if object_id('cursos') is not null
	drop table cursos;

create table socios(
	documento char(8) not null,
	nombre varchar(40),
	domicilio varchar(30),
	constraint PK_socios_documento
	primary key (documento)
);

create table cursos(
	numero tinyint identity,
	deporte varchar(20),
	dia varchar(15),
	constraint CK_inscriptos_dia check (dia in('lunes','martes','miercoles','jueves','viernes','sabado')),
	profesor varchar(20),
	constraint PK_cursos_numero
	primary key (numero)
);

create table inscriptos(
	documentosocio char(8) not null,
	numero tinyint not null,
	matricula char(1),
	constraint PK_inscriptos_documento_numero
	primary key (documentosocio,numero),
	constraint FK_inscriptos_documento
	foreign key (documentosocio)
	references socios(documento)
	on update cascade,
	constraint FK_inscriptos_numero
	foreign key (numero)
	references cursos(numero)
	on update cascade
);
go

 insert into socios values('30000000','Fabian Fuentes','Caseros 987');
 insert into socios values('31111111','Gaston Garcia','Guemes 65');
 insert into socios values('32222222','Hector Huerta','Sucre 534');
 insert into socios values('33333333','Ines Irala','Bulnes 345');

 insert into cursos values('tenis','lunes','Ana Acosta');
 insert into cursos values('tenis','martes','Ana Acosta');
 insert into cursos values('natacion','miercoles','Ana Acosta');
 insert into cursos values('natacion','jueves','Carlos Caseres');
 insert into cursos values('futbol','sabado','Pedro Perez');
 insert into cursos values('futbol','lunes','Pedro Perez');
 insert into cursos values('basquet','viernes','Pedro Perez');

 insert into inscriptos values('30000000',1,'s');
 insert into inscriptos values('30000000',3,'s');
 insert into inscriptos values('30000000',6,null);
 insert into inscriptos values('31111111',1,'n');
 insert into inscriptos values('31111111',4,'s');
 insert into inscriptos values('32222222',1,'n');
 insert into inscriptos values('32222222',7,'n');
go


--Cree la vista "vista_deudores" que muestre el documento y nombre del socio, el deporte, el día y 
--la matrícula, de todas las inscripciones no pagas colocando "with check option".

if object_id('vista_deudores') is not null
	drop view vista_deudores;
go

create view vista_deudores as
	select s.documento, s.nombre, c.deporte, c.dia, i.matricula 
	from inscriptos as i
	join socios as s
	on s.documento=i.documentosocio
	join cursos as c
	on c.numero=i.numero
	where i.matricula='n'
	with check option;
go

select * from vista_deudores;

exec sp_helptext vista_deudores;

update vista_deudores set documento='41111111' where documento='31111111';

select * from socios;
select * from inscriptos;
go

alter view vista_deudores with encryption 
	as
	select s.documento, s.nombre, s.domicilio, c.deporte, c.dia, i.matricula 
	from inscriptos as i
	join socios as s
	on s.documento=i.documentosocio
	join cursos as c
	on c.numero=i.numero
	where i.matricula='n';
go

select * from vista_deudores;

exec sp_helptext vista_deudores;

update inscriptos set matricula='s' where documentosocio='32222222';

select * from vista_deudores;

select * from inscriptos;


if object_id('vista_socios') is not null
	drop view vista_socios;
go

create view vista_socios as
	select * from socios
go

select * from vista_socios;

alter table socios
add edad tinyint;
go

alter view vista_socios as
	select * from socios;
go

select * from vista_socios;
