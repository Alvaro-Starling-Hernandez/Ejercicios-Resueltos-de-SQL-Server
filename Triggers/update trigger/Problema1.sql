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
	constraint PK_socios primary key(documento)
);

create table inscriptos(
	numero int identity,
	documento char(8) not null,
	deporte varchar(20),
	matricula char(1),
	constraint FK_inscriptos_documento
	foreign key (documento)
	references socios(documento),
	constraint CK_inscriptos_matricula check (matricula in ('s','n')),
	constraint PK_inscriptos primary key(documento,deporte)
);
 
create table morosos(
	documento char(8) not null
);
go

insert into socios values('22222222','Ana Acosta','Avellaneda 800');
insert into socios values('23333333','Bernardo Bustos','Bulnes 345');
insert into socios values('24444444','Carlos Caseros','Colon 382');
insert into socios values('25555555','Mariana Morales','Maipu 234');

insert into inscriptos values('22222222','tenis','s');
insert into inscriptos values('22222222','natacion','n');
insert into inscriptos values('23333333','tenis','n');
insert into inscriptos values('24444444','futbol','s');
insert into inscriptos values('24444444','natacion','s');

insert into morosos values('22222222');
insert into morosos values('23333333');
go

create trigger DIS_inscriptos_update
	on inscriptos
	for update
	as
	if(select count(*) from inserted)>1
	begin
		raiserror('No se permite actualizar mas de un registro',16,1)
		rollback transaction
	end
go

create trigger DIS_inscritos_update
	on inscriptos
	for update
	as
	if update(matricula)
	begin
		if(select matricula from inserted)='s' and (select matricula from deleted)='n'
			delete from morosos where documento=(select documento from inserted)
		if(select matricula from deleted)='s' and (select matricula from inserted)='n'
		begin
			raiserror('No se puede actualizar una matricula paga',16,1)
			rollback transaction
		end
	end
go

update inscriptos set deporte='Softball' where deporte='futbol';

select * from inscriptos;
go

--update inscriptos set deporte='Softball' where deporte='tenis';

update inscriptos set matricula='s' where documento='23333333';

select * from morosos;