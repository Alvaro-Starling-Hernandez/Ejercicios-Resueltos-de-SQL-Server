if object_id('facturas') is not null
	drop table facturas;
if object_id('clientes') is not null
	drop table clientes;

create table clientes(
	codigo int identity,
	nombre varchar(30),
	domicilio varchar(30),
	primary key(codigo)
);

create table facturas(
	numero int not null,
	fecha datetime,
	codigocliente int not null,
	total decimal(6,2),
	primary key(numero),
	constraint FK_facturas_cliente
	foreign key (codigocliente)
	references clientes(codigo)
	on update cascade
);
go

 insert into clientes values('Juan Lopez','Colon 123');
 insert into clientes values('Luis Torres','Sucre 987');
 insert into clientes values('Ana Garcia','Sarmiento 576');
 insert into clientes values('Susana Molina','San Martin 555');

 insert into facturas values(1200,'2007-01-15',1,300);
 insert into facturas values(1201,'2007-01-15',2,550);
 insert into facturas values(1202,'2007-01-15',3,150);
 insert into facturas values(1300,'2007-01-20',1,350);
 insert into facturas values(1310,'2007-01-22',3,100);

if object_id ('clientespref') is not null
	drop table clientespref;

create table clientespref(
	nombre varchar(30),
	domicilio varchar(30)
);

insert into clientespref	
	select nombre, domicilio
	from clientes
	where codigo in
	(select f.codigocliente
	from clientes as c
	join facturas as f
	on f.codigocliente=c.codigo
	group by codigocliente
	having sum(total)>500);

select * from clientespref;



