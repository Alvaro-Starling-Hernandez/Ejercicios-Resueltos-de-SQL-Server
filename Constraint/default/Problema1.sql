if object_id('visitantes') is not null
 drop table visitantes;

 create table visitantes(
	numero int identity,
	nombre varchar(30),
	edad tinyint,
	domicilio varchar(30),
	ciudad varchar(20),
	montocompra decimal (6,2) not null
 );

alter table visitantes
add constraint DF_visitantes_ciudad
default 'Cordoba'
for ciudad;

alter table visitantes
add constraint DF_visitante_montocompra
default 0
for montocompra;

insert into visitantes
	values (
	'Susana Molina',35,'Colon 123',default,59.80);
insert into visitantes (nombre,edad,domicilio)
	values ('Marcos Torres',29,'Carlos Paz');
insert into visitantes
	values ('Mariana Juarez',45,'Carlos Paz',null,23.90);

select * from visitantes;

exec sp_helpconstraint visitantes;


/*alter table visitantes
add constraint DF_visitantes_ciudad
default 'Cordoba'
for ciudad;*/


/*alter table visitantes
add constraint DF_visitantes_numero
default 0
for numero;*/



