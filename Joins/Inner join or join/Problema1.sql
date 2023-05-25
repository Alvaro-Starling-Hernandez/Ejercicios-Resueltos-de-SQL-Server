if object_id('clientes') is not null
	drop table clientes;
if (object_id('provincias')) is not null
	drop table provincias;

create table clientes(
	codigo int identity,
	nombre varchar(30),
	domicilio varchar(30),
	ciudad varchar(20),
	codigoprovincia tinyint not null,
	primary key(codigo)
);

create table provincias(
	codigo tinyint identity,
	nombre varchar(20),
	primary key (codigo)
);

go


insert into provincias (nombre) values('Cordoba');
insert into provincias (nombre) values('Santa Fe');
insert into provincias (nombre) values('Corrientes');

insert into clientes values ('Lopez Marcos','Colon 111','Córdoba',1);
insert into clientes values ('Perez Ana','San Martin 222','Cruz del Eje',1);
insert into clientes values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
insert into clientes values ('Perez Luis','Sarmiento 444','Rosario',2);
insert into clientes values ('Pereyra Lucas','San Martin 555','Cruz del Eje',1);
insert into clientes values ('Gomez Ines','San Martin 666','Santa Fe',2);
insert into clientes values ('Torres Fabiola','Alem 777','Ibera',3);
go 

select c.nombre, c.domicilio, c.ciudad, p.nombre
	from clientes as c
	join provincias as p
	on c.codigoprovincia = p.codigo;
go

select c.nombre, c.domicilio, c.ciudad, p.nombre
	from clientes as c
	join provincias as p
	on c.codigoprovincia = p.codigo
	order by p.nombre;
go


select c.nombre, c.ciudad, c.domicilio
	from clientes as c
	join provincias as p
	on c.codigoprovincia = p.codigo
	where p.nombre='Santa Fe';
go



