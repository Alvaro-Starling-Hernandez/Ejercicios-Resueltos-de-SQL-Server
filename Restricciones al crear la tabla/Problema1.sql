if object_id('inscriptos') is not null
	drop table inscriptos;
if object_id('socios') is not null
	drop table socios;
if object_id('profesores') is not null
	drop table profesores;
if object_id('deportes') is not null
	drop table deportes;

create table profesores(
	documento char(8) not null,
	nombre varchar(30),
	domicilio varchar(30),
	constraint CK_profesores_documento_patron check (documento like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	constraint PK_profesores_documento
	primary key (documento)
);

create table deportes(
	codigo tinyint identity,
	nombre varchar(20) not null,
	dia varchar(30)
	constraint DF_deportes_dia default('sabado'),
	profesor char(8),--documento del profesor
	constraint CK_deportes_dia_lista check (dia in ('lunes','martes','miercoles','jueves','viernes','sabado')),
	constraint PK_deportes_codigo
	primary key (codigo)
);

create table socios(
	numero int identity,
	documento char(8),
	nombre varchar(30),
	domicilio varchar(30),
	constraint CK_documento_patron check (documento like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	constraint PK_socios_numero
	primary key nonclustered(numero),
	constraint UQ_socios_documento
	unique clustered(documento)
);

create table inscriptos(
	numerosocio int not null,
	codigodeporte tinyint,
	matricula char(1),
	constraint PK_inscriptos_numerodeporte
	primary key clustered (numerosocio,codigodeporte),
	constraint FK_inscriptos_deporte
	foreign key (codigodeporte)
	references deportes(codigo)
	on update cascade,
	constraint FK_inscriptos_socios
	foreign key (numerosocio)
	references socios(numero)
	on update cascade
	on delete cascade,
	constraint CK_matricula_valores check (matricula in ('s','n'))
);
go

insert into profesores values('21111111','Andres Acosta','Avellaneda 111');
insert into profesores values('22222222','Betina Bustos','Bulnes 222');
insert into profesores values('23333333','Carlos Caseros','Colon 333');
go

insert into deportes values('basquet','lunes',null);
insert into deportes values('futbol','lunes','23333333');
insert into deportes values('natacion',null,'22222222');
insert into deportes values('padle',default,'23333333');
insert into deportes (nombre,dia) values('tenis','jueves');
go

insert into socios values('30111111','Ana Acosta','America 111');
insert into socios values('30222222','Bernardo Bueno','Bolivia 222');
insert into socios values('30333333','Camila Conte','Caseros 333');
insert into socios values('30444444','Daniel Duarte','Dinamarca 444');
go

insert into inscriptos values(1,3,'s');
insert into inscriptos values(1,5,'s');
insert into inscriptos values(2,1,'s');
insert into inscriptos values(4,1,'n');
insert into inscriptos values(4,4,'s');
go

select s.*, d.nombre, d.dia, p.nombre
	from socios as s
	join inscriptos as i
	on s.numero=i.numerosocio
	join deportes as d
	on i.codigodeporte=d.codigo
	left join profesores as p
	on d.profesor=p.documento;
go

select s.*, d.nombre, d.dia, p.nombre
	from socios as s
	join inscriptos as i
	on s.numero=i.numerosocio
	full join deportes as d
	on i.codigodeporte=d.codigo
	left join profesores as p
	on d.profesor=p.documento;
go

select p.*, d.nombre, d.dia 
	from profesores as p
	left join deportes as d
	on p.documento=d.profesor;
go

select d.nombre, count(i.codigodeporte) as 'cantidad de inscriptos' 
	from deportes as d
	left join inscriptos as i
	on d.codigo=i.codigodeporte
	group by d.nombre;
go

exec sp_helpconstraint socios;
exec sp_helpconstraint deportes;
exec sp_helpconstraint profesores;
exec sp_helpconstraint inscriptos;