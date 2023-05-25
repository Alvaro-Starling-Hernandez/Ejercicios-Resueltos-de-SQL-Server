if object_id('clientes') is not null
	drop table clientes;

create table clientes(
	codigo int identity,
	nombre varchar(30) not null,
	domicilio varchar(30),
	ciudad varchar(20),
	provincia varchar (20),
	primary key(codigo)	
);

insert into clientes
values ('Lopez Marcos','Colon 111','Cordoba','Cordoba');
insert into clientes
values ('Perez Ana','San Martin 222','Cruz del Eje','Cordoba');
insert into clientes
values ('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba');
insert into clientes
values ('Perez Luis','Sarmiento 444','Rosario','Santa Fe');
insert into clientes
values ('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba');
insert into clientes
values ('Gomez Ines','San Martin 666','Santa Fe','Santa Fe');
insert into clientes
values ('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba');
insert into clientes
values ('Lopez Carlos',null,'Cruz del Eje','Cordoba');
insert into clientes
values ('Ramos Betina','San Martin 999','Cordoba','Cordoba');
insert into clientes
values ('Lopez Lucas','San Martin 1010','Posadas','Misiones');


select distinct provincia from clientes;

select count(distinct provincia) as cantidad 
	from clientes;

select distinct ciudad 
	from clientes;

select count(distinct ciudad) as cantidadCiudades
	from clientes;

select distinct ciudad 
	from clientes
	where provincia='Cordoba';

select provincia, 
	count(distinct ciudad) as cantidad 
	from clientes
	group by provincia;



