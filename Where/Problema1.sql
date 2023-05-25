if object_id('agenda') is not null
	drop table agenda;

create table agenda(
	apellido varchar(30),
	nombre varchar(20),
	domicilio varchar(30),
	telefono varchar(11)
);

exec sp_columns agenda;

insert into agenda(apellido, nombre, domicilio, telefono)
	values('Acosta','Ana','Colon 123','4234567');
insert into agenda(apellido, nombre, domicilio, telefono)
	values('Bustamante','Betina','Abellenada 135','4458787');
insert into agenda(apellido, nombre, domicilio, telefono)
	values('Lopez','Hector','Salta 545','4887788');
insert into agenda(apellido, nombre, domicilio, telefono)
	values('Lopez','Luis','Urquiza 333','4545454');
insert into agenda(apellido, nombre, domicilio, telefono)
	values('Lopez','Marisa','Urquiza 333','4545454');


select * from agenda;

select * from agenda 
	where nombre='Marisa';

select nombre, domicilio from agenda 
	where apellido='Lopez';

select nombre from agenda 
	where telefono='4545454';