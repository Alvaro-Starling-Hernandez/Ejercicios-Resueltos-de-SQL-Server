if object_id('vehiculos') is not  null
	drop table vehiculos;

create table vehiculos(
	numero int identity,
	patente char(6),
	tipo char(4),
	fechahoraentrada datetime,
	fechahorasalida datetime
);

insert into vehiculos values('AIC124','auto','2007/01/17 8:05','2007/01/17 12:30');
insert into vehiculos values('CAA258','auto','2007/01/17 8:10',null);
insert into vehiculos values('DSE367','moto','2007/01/17 8:30','2007/01/17 18:00');

alter table vehiculos
add constraint CK_vehiculos_patente_patron
check(patente like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]');

--insert into vehiculos values('AB1234','auto',getdate(),null);

alter table vehiculos
add constraint CK_vehiculos_tipo_valores
check(tipo in('auto','moto'));

/*update vehiculos
	set tipo='bici'
	where patente='AIC124';*/

alter table vehiculos
add constraint DF_vehiculos_tipo
default 'bici'
for tipo;

--insert into vehiculos values('SDF134',default,null,null);

alter table vehiculos
add constraint CK_vehiculos_fechahoraentrada_actual
check(fechahoraentrada<=fechahorasalida);

--insert into vehiculos values('ABC123','auto','2007/05/05 10:10',null);

--update vehiculos set fechahorasalida='2007/01/17 7:30'
--   where patente='CAA258';

exec sp_helpconstraint vehiculos;

alter table vehiculos
add constraint DF_vehiculos_fechahoraentrada
default getdate()
for fechahoraentrada;

insert into vehiculos values('DFR156','moto',default,default);

select * from vehiculos;

exec sp_helpconstraint vehiculos;

