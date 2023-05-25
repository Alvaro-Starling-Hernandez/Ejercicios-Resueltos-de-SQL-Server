if object_id('inscriptos') is not null
	drop table inscriptos;
if object_id('socios') is not null
	drop table socios;
if object_id('cursos') is not null
	drop table cursos;
go

create table socios(
	documento char(8) not null,
	nombre varchar(30),
	domicilio varchar(30),
	constraint PK_socios primary key(documento)
);
create table cursos(
	numero tinyint identity,
	deporte char(20),
	cantidadmaxima tinyint,
	constraint PK_cursos primary key(numero)
);

create table inscriptos(
	documento char(8) not null,
	numerocurso tinyint,
	fecha datetime,
	constraint PK_inscriptos primary key(documento,numerocurso),
	constraint FK_inscriptos_documento
	foreign key (documento)
	references socios(documento),
	constraint FK_inscriptos_curso
	foreign key (numerocurso)
	references cursos(numero)
);
go

if object_id('condicionales') is not null
	drop table condicionales;
go

create table condicionales(
	documento char(8) not null,
	codigocurso tinyint not null,
	fecha datetime,
	constraint PK_condicionales
	primary key(documento,codigocurso)
);
go

insert into socios values('22222222','Ana Acosta','Avellaneda 800');
insert into socios values('23333333','Bernardo Bustos','Bulnes 345');
insert into socios values('24444444','Carlos Caseros','Colon 382');
insert into socios values('25555555','Mariana Morales','Maipu 234');
insert into socios values('26666666','Patricia Palacios','Paru 587');

insert into cursos values('tenis',4);
insert into cursos values('natacion',6);
insert into cursos values('basquet',20);
insert into cursos values('futbol',20);

insert into inscriptos values('22222222',1,getdate());
insert into inscriptos values('22222222',2,getdate());
insert into inscriptos values('23333333',1,getdate());
insert into inscriptos values('23333333',3,getdate());
insert into inscriptos values('24444444',1,getdate());
insert into inscriptos values('24444444',4,getdate());
insert into inscriptos values('25555555',1,getdate());
go

create trigger DIS_inscriptos_insert
	on inscriptos
	instead of insert
	as
	declare @curso tinyint
	declare @limite tinyint
	declare @inscriptos tinyint
	set @curso = (select numero from cursos
					join inserted
					on inserted.numerocurso=cursos.numero)
	set @limite = (select cantidadmaxima from cursos where numero=@curso)
	set @inscriptos = (select count(*) from inscriptos where numerocurso=@curso)
	if(@inscriptos<@limite)
	begin
		insert inscriptos
		select * from inserted
		select 'Inscripcion Normal'
	end
	if(@limite=@inscriptos)
		begin
			insert condicionales
			select documento,numerocurso,GETDATE() from inserted
			select 'Inscripcion condicional'
		end
go

insert into inscriptos values('26666666',1,getdate());
select *from inscriptos;
select *from condicionales;

insert into inscriptos values('26666666',2,getdate());
select *from inscriptos;
select *from condicionales;
