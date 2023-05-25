if object_id('agenda') is not null
	drop table agenda;

create table agenda(
	apellido varchar(30),
	nombre varchar(20),
	domicilio varchar(30),
	telefono varchar(11)
);

insert into agenda(apellido, nombre, domicilio, telefono)
	values('Alvarez','Alberto','Colon 123','4234567');
insert into agenda(apellido, nombre, domicilio, telefono)
	values('Juarez','Juan','Avellaneda 135','4458787');
insert into agenda(apellido, nombre, domicilio, telefono)
	values('Lopez','Jose','Urquiza 333','4545454');
insert into agenda(apellido, nombre, domicilio, telefono)
	values('Lopez','Maria','Urquiza 333','4545454');
insert into agenda(apellido, nombre, domicilio, telefono)
	values('Salas','Susana Gral.','Paz 1234','4123456');

delete from agenda where nombre='Juan';

delete from agenda where telefono='4545454';

select * from agenda;

delete from agenda;

select * from agenda;