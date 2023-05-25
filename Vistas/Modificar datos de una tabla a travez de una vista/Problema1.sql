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
	primary key (numero),
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
 insert into inscriptos values('30000000',3,'n');
 insert into inscriptos values('30000000',6,null);
 insert into inscriptos values('31111111',1,'s');
 insert into inscriptos values('31111111',4,'s');
 insert into inscriptos values('32222222',1,'s');
 insert into inscriptos values('32222222',7,'s');
 go


select s.nombre,s.domicilio,i.documentosocio,i.numero,i.matricula,c.deporte,c.dia,c.profesor
	from inscriptos as i
	join socios as s
	on i.documentosocio=s.documento
	join cursos as c
	on i.numero=c.numero;
go

if object_id('vista_curso') is not null
	drop view vista_curso;
go

create view vista_curso as
	select numero, deporte, dia from cursos
go

select * from vista_curso order by deporte;
go

insert into vista_curso values ('Tiro de arco','Viernes');

select * from cursos;

update vista_curso set dia='Miercoles' where deporte='tenis' and dia='Lunes';
select * from cursos;

select * from vista_curso;

delete from vista_curso where numero=2;

--Elimine la vista "vista_inscriptos" si existe y créela para que muestre el documento y nombre 
--del socio, el numero de curso, el deporte y día de los cursos en los cuales está inscripto.
if object_id('vista_inscriptos') is not null
	drop view vista_inscriptos;
go

create view vista_inscriptos as
	select s.documento, s.nombre, c.numero, c.deporte, c.dia
	from inscriptos as i
	join socios as s
	on i.documentosocio=s.documento
	join cursos as c 
	on c.numero=i.numero
go

select * from vista_inscriptos;