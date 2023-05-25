if object_id('visitantes') is not null
	drop table visitantes;

create table visitantes(
	nombre varchar(30),
	edad tinyint,
	sexo char(1) default 'f',
	domicilio varchar(30),
	ciudad varchar(20) default 'Cordoba',
	telefono varchar(11),
	mail varchar(30) default 'no tiene',
	montocompra decimal (6,2)	
);

exec sp_columns visitantes;

insert into visitantes(nombre, domicilio, montocompra)
	values ('Susana Molina','Colon 123',59.80);
insert into visitantes(nombre, edad, ciudad, mail)
	values ('Marcos Torres',29,'Carlos Paz','marcostorres@hotmail.com');

select * from visitantes;

insert into visitantes
	values ('Alvaro Starling Hernandez',22,default,'Joboban',default, '58564181', default, 20);

insert into visitantes default values;

select * from visitantes;