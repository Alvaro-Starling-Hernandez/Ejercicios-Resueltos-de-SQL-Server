if object_id('ciudades') is not null
	drop table ciudades;

if object_id('clientes') is not null
	drop table clientes;

create table ciudades(
	codigo tinyint identity,
	nombre varchar(20),
	primary key (codigo)
);

create table clientes(
	codigo int identity,
	nombre varchar(30),
	domicilio varchar(30),
	codigociudad tinyint not null,
	primary key(codigo),
	constraint FK_clientes_codigociudad
	foreign key(codigociudad)
	references ciudades(codigo)
	on update cascade
);
go


insert into ciudades (nombre) values('Cordoba');
insert into ciudades (nombre) values('Cruz del Eje');
insert into ciudades (nombre) values('Carlos Paz');
insert into ciudades (nombre) values('La Falda');
insert into ciudades (nombre) values('Villa Maria');

insert into clientes values ('Lopez Marcos','Colon 111',1);
insert into clientes values ('Lopez Hector','San Martin 222',1);
insert into clientes values ('Perez Ana','San Martin 333',2);
insert into clientes values ('Garcia Juan','Rivadavia 444',3);
insert into clientes values ('Perez Luis','Sarmiento 555',3);
insert into clientes values ('Gomez Ines','San Martin 666',4);
insert into clientes values ('Torres Fabiola','Alem 777',5);
insert into clientes values ('Garcia Luis','Sucre 888',5);
go

select nombre 
	from ciudades
	where codigo in
	(select codigociudad from clientes where domicilio like 'San Martin%');
go

select c.nombre
	from ciudades as c
	left join clientes as cl
	on c.codigo=cl.codigociudad
	where cl.domicilio like 'San Martin%';

select nombre
	from ciudades
	where codigo not in
	(select codigociudad from clientes where nombre like 'G%');

select codigociudad from clientes 
	where nombre like 'G%'
go