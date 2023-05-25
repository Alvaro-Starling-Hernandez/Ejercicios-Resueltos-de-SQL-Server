if object_id('vehiculos') is not null
	drop table vehiculos;


if object_id ('RG_patente_patron') is not null
	drop rule RG_patente_patron;
if object_id ('RG_horallegada') is not null
	drop rule RG_horallegada;
if object_id ('RG_vehiculos_tipo') is not null
	drop rule RG_vehiculos_tipo;
if object_id ('RG_vehiculos_tipo2') is not null
	drop rule RG_vehiculos_tipo2;
if object_id ('RG_menor_fechaactual') is not null
	drop rule RG_menor_fechaactual;

create table vehiculos(
	patente char(6) not null,
	tipo char(1),--'a'=auto, 'm'=moto
	horallegada datetime not null,
	horasalida datetime
);

insert into vehiculos values ('AAA111','a','1990-02-01 08:10',null);
insert into vehiculos values ('BCD222','m','1990-02-01 08:10','1990-02-01 10:10');
insert into vehiculos values ('BCD222','m','1990-02-01 12:00',null);
insert into vehiculos values ('CC1234','a','1990-02-01 12:00',null);

go
create rule RG_patente_patron 
	as @patente like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]';
go

exec sp_help;

exec sp_helpconstraint vehiculos;

exec sp_bindrule RG_patente_patron, 'vehiculos.patente';

select * from vehiculos;

--insert into vehiculos values ('CC1234','a','1990-02-01 12:00',null);
go

create rule RG_tipo_valores
as @tipo in('a','m');
go

exec sp_bindrule RG_tipo_valores, 'vehiculos.tipo';


--update vehiculos set tipo='r'
	--where patente='AAA111';
go

create rule RG_tipo_valores2
as @tipo in('a','m','c');
go
exec sp_bindrule RG_tipo_valores2, 'vehiculos.tipo';

update vehiculos set tipo='c' where patente='AAA111';
go


create rule RG_menor_fechaactual
as @fecha <= getdate();
go

exec sp_bindrule RG_menor_fechaactual, 'vehiculos.horallegada';
exec sp_bindrule RG_menor_fechaactual, 'vehiculos.horasalida';

 insert into vehiculos values ('NOP555','a','1990-02-01 10:10','1990-02-01 08:30');

 alter table vehiculos
 add constraint CK_horallegadda_posterior
 check(horallegada<=horasalida);

 delete from vehiculos where patente='NOP555';

 alter table vehiculos
 add constraint DF_vehiculos_tipo
 default 'b'
 for tipo;


--insert into vehiculos values ('STU456',default,'1990-02-01 10:10','1990-02-01 15:30');

exec sp_helpconstraint vehiculos;



