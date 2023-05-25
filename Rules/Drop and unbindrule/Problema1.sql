 if object_id('vehiculos') is not null
	drop table vehiculos;

if object_id ('RG_patente_patron') is not null
	drop rule RG_patente_patron;
if object_id ('RG_vehiculos_tipo') is not null
	drop rule RG_vehiculos_tipo;
if object_id ('RG_vehiculos_tipo2') is not null
	drop rule RG_vehiculos_tipo2;

create table vehiculos(
	patente char(6) not null,
	tipo char(1),--'a'=auto, 'm'=moto
	horallegada datetime not null,
	horasalida datetime
);
go

create rule RG_patente_patron
as @patente like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]';
go

exec sp_bindrule RG_patente_patron, 'vehiculos.patente';
--insert into vehiculos values('FGHIJK','a','1990-02-01 18:00',null);
go

create rule RG_tipo_valores
as @tipo in ('a','m');
go

exec sp_bindrule RG_tipo_valores, 'vehiculos.tipo';
go

--insert into vehiculos values('AAA111','c','2001-10-10 10:10',NULL);
--go 

create rule RG_tipo_valores2
as @tipo in ('a','m','c');
go

exec sp_bindrule RG_tipo_valores2, 'vehiculos.tipo';
go

insert into vehiculos values('AAA111','c','2001-10-10 10:10',NULL);
go 

--drop rule RG_tipo_valores2;
--go

drop rule RG_tipo_valores;
go

exec sp_unbindrule 'vehiculos.patente';
go

exec sp_help vehiculos;

drop rule RG_patente_patron;
go








