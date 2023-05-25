if object_id('inscriptos') is not null
	drop table inscriptos;
if object_id('socios') is not null
	drop table socios;
if object_id('morosos') is not null
	drop table morosos;
go

create table socios(
	documento char(8) not null,
	nombre varchar(30),
	domicilio varchar(30),
	constraint PK_socios primary key (documento)
);

create table inscriptos(
	documento char(8) not null,
	deporte varchar(30) not null,
	matricula char(1),
	constraint CK_inscriptos check (matricula in ('s','n')),
	constraint PK_inscriptos primary key (documento,deporte),
	constraint FK_inscriptos_documento foreign key(documento)
	references socios (documento)
);

create table morosos(
	documento char(8) not null
);
go


insert into socios values ('22222222','Ana Acosta','Avellaneda 800');
insert into socios values ('23333333','Bernardo Bustos','Bulnes 234');
insert into socios values ('24444444','Carlos Caseros','Colon 321');
insert into socios values ('25555555','Mariana Morales','Maipu 483');

insert into inscriptos values ('22222222','tenis','s');
insert into inscriptos values ('22222222','natacion','n');
insert into inscriptos values ('23333333','tenis','n');
insert into inscriptos values ('24444444','tenis','s');
insert into inscriptos values ('24444444','futbol','s');

insert into morosos values ('22222222');
insert into morosos values ('23333333');
go

create trigger DIS_inscripciones_insert
	on inscriptos
	for insert
	as
	declare @id char(8)
	set @id = (select documento from inserted)
	if(@id in (select documento from morosos))
	--otra solucion posible seria
	-- if exists (select *from morosos where documento=@doc)
	begin
		raiserror('Este socio tiene una matricula pendiente',16,1)
		rollback transaction 
	end
go

insert into inscriptos values ('24444444','baseball','s');
select * from inscriptos;


insert into inscriptos values ('22222222','baseball','s');
select * from inscriptos;
go

create trigger DIS_inscriptos_insert2
	on inscriptos
	for insert
	as
	declare @matricula char(1)
	set @matricula=(select matricula from inserted)
	if(@matricula='n')
	begin
		insert morosos
		select documento from inserted
	end
go

insert into inscriptos values ('24444444','boleyball','s');
select * from inscriptos;

insert into inscriptos values ('24444444','softball','n');
select * from inscriptos;


select * from morosos;
go

create trigger DIS_socios_insert
	on socios
	for insert
	as
	raiserror('No se puede agregar nuevos socios', 16, 1)
	rollback transaction
go

--insert into socios values ('0000000','Alvaro','Los mameyes');