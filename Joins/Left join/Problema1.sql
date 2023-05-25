if (object_id('clientes')) is not null
	drop table clientes;
if (object_id('provincias')) is not null
	drop table provincias;

create table clientes (
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

insert into provincias (nombre) values('Cordoba');
insert into provincias (nombre) values('Santa Fe');
insert into provincias (nombre) values('Corrientes');

insert into clientes values ('Lopez Marcos','Colon 111','Córdoba',1);
insert into clientes values ('Perez Ana','San Martin 222','Cruz del Eje',1);
insert into clientes values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
insert into clientes values ('Perez Luis','Sarmiento 444','Rosario',2);
insert into clientes values ('Gomez Ines','San Martin 666','Santa Fe',2);
insert into clientes values ('Torres Fabiola','Alem 777','La Plata',4);
insert into clientes values ('Garcia Luis','Sucre 475','Santa Rosa',5);
go

select c.nombre, c.domicilio, c.ciudad, p.nombre
	from clientes as c
	left join provincias as p
	on c.codigoprovincia = p.codigo;
go


select c.nombre, c.domicilio, c.ciudad, p.nombre
	from provincias as p
	left join clientes as c
	on c.codigoprovincia = p.codigo;
go


select c.nombre, c.domicilio, c.ciudad, p.nombre
	from clientes as c
	left join provincias as p
	on c.codigoprovincia = p.codigo
	where p.codigo is not null
go


select c.nombre, c.domicilio, c.ciudad, p.nombre
	from clientes as c
	left join provincias as p
	on c.codigoprovincia = p.codigo
	where p.codigo is null
	order by c.nombre;
go

select c.nombre, c.domicilio, c.ciudad, p.nombre
	from clientes as c
	left join provincias as p
	on c.codigoprovincia = p.codigo
	where p.nombre='Cordoba';
go