if object_id('inscriptos') is not null  
	drop table inscriptos;
if object_id('socios') is not null  
	drop table socios;
if object_id('profesores') is not null  
	drop table profesores; 
if object_id('cursos') is not null  
	drop table cursos;

create table socios(
	documento char(8) not null,
	nombre varchar(40),
	domicilio varchar(30),
	constraint PK_socios_documento
	primary key (documento)
);

create table profesores(
	documento char(8) not null,
	nombre varchar(40),
	domicilio varchar(30),
	constraint PK_profesores_documento
	primary key (documento)
);

create table cursos(
	numero tinyint identity,
	deporte varchar(20),
	dia varchar(15),
	constraint CK_inscriptos_dia check (dia in('lunes','martes','miercoles','jueves','viernes','sabado')),
	documentoprofesor char(8),
	constraint PK_cursos_numero
	primary key (numero),
);

create table inscriptos(
	documentosocio char(8) not null,
	numero tinyint not null,
	matricula char(1),
	constraint CK_inscriptos_matricula check (matricula in('s','n')),
	constraint PK_inscriptos_documento_numero
	primary key (documentosocio,numero)
);
go

insert into socios values('30000000','Fabian Fuentes','Caseros 987');
insert into socios values('31111111','Gaston Garcia','Guemes 65');
insert into socios values('32222222','Hector Huerta','Sucre 534');
insert into socios values('33333333','Ines Irala','Bulnes 345');

insert into profesores values('22222222','Ana Acosta','Avellaneda 231');
insert into profesores values('23333333','Carlos Caseres','Colon 245');
insert into profesores values('24444444','Daniel Duarte','Sarmiento 987');
insert into profesores values('25555555','Esteban Lopez','Sucre 1204');

insert into cursos values('tenis','lunes','22222222');
insert into cursos values('tenis','martes','22222222');
insert into cursos values('natacion','miercoles','22222222');
insert into cursos values('natacion','jueves','23333333');
insert into cursos values('natacion','viernes','23333333');
insert into cursos values('futbol','sabado','24444444');
insert into cursos values('futbol','lunes','24444444');
insert into cursos values('basquet','martes','24444444');

insert into inscriptos values('30000000',1,'s');
insert into inscriptos values('30000000',3,'n');
insert into inscriptos values('30000000',6,null);
insert into inscriptos values('31111111',1,'s');
insert into inscriptos values('31111111',4,'s');
insert into inscriptos values('32222222',8,'s');
go

if object_id('vista_club') is not null
	drop view vista_club;
go

create view vista_club(nombre,documento,deporte, dia, nombreProfesor,matricula) as 
	select s.nombre, s.documento, c.deporte, c.dia, p.nombre, i.matricula
		from socios as s
		full join inscriptos as i
		on s.documento=i.documentosocio
		full join cursos as c
		on i.numero=c.numero
		full join profesores as p
		on p.documento=c.documentoprofesor
go

select * from vista_club;

select deporte, count(*) as cantidad 
	from vista_club
	where deporte is not null
	group by deporte
	order by cantidad asc;

select deporte, dia 
	from vista_club
	where nombre is null
	and deporte is not null;

select nombre from vista_club
	where deporte is null
	and nombre is not null;

select nombreProfesor from vista_club
		where deporte is null
		and nombreProfesor is not null;

select nombre,documento from vista_club
	where matricula<>'s'
	and deporte is not null

select distinct nombreProfesor,dia from vista_club
	where nombreProfesor is not null

select distinct nombreProfesor,dia from vista_club
	where nombreProfesor is not null
	order by dia;

select nombre,deporte,dia from vista_club
	where deporte='tenis' and dia='lunes';

go

if object_id('vista_inscriptos') is not null
	drop view vista_insciptos;
go

create view vista_inscriptos as
	select deporte,dia,
	(select count(*) from inscriptos as i
	where i.numero=c.numero)as cantidad
	from cursos as c;
go

select * from vista_inscriptos;
go