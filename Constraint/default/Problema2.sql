if object_id('vehiculos') is not null
	drop table vehiculos;

create table vehiculos(
	patente char(6) not null,
	tipo char(1),--'a'=auto, 'm'=moto
	horallegada datetime,
	horasalida datetime
);

alter table vehiculos
add constraint DF_vehiculos_tipo
default 'a'
for tipo;

insert into vehiculos values('BVB111',default,default,null);

select * from vehiculos;

/*alter table vehiculos
add constraint DF_vehiculos_tipo
default 'M'
for tipo;*/

alter table vehiculos
add constraint DF_vehiculos_horallegada
default getdate()
for horallegada;

insert into vehiculos (patente,tipo) values('CAA258','a');

select * from vehiculos;

exec sp_helpconstraint vehiculos;




