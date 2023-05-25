if object_id('vehiculos') is not null
	drop table vehiculos;

create table vehiculos(
	patente char(6) not null,
	tipo char(1),--'a'=auto, 'm'=moto
	horallegada datetime not null,
	horasalida datetime
);

alter table vehiculos
add constraint CK_vehiculos_tipo_valores
check(tipo in('a','m'));

alter table vehiculos
add constraint DF_vehiculos_tipo
default 'a'
for tipo;

alter table vehiculos
add constraint CK_vehiculos_patente_patron
check(patente like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]');

--alter table vehiculos
--add constraint PK_vehiculos_patente_horallegada
--primary key (patente, horallegada);

insert into vehiculos values('SDR456','a','2005/10/10 10:10',null);

--insert into vehiculos values('SDR456','m','2005/10/10 10:10',null);

insert into vehiculos values('SDR456','m','2005/10/10 12:10',null);

exec sp_helpconstraint vehiculos;

alter table vehiculos
drop constraint DF_vehiculos_tipo;

exec sp_helpconstraint vehiculos;

alter table vehiculos
drop constraint PK_vehiculos_patente_horallegada;


alter table vehiculos
drop constraint CK_vehiculos_tipo_valores;

exec sp_helpconstraint vehiculos;