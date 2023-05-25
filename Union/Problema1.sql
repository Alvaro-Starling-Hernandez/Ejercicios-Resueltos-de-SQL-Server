if object_id('clientes') is not null
	drop table clientes;
if object_id('proveedores') is not null
	drop table proveedores;
if object_id('empleados') is not null
	drop table empleados;

create table proveedores(
	codigo int identity,
	nombre varchar (30),
	domicilio varchar(30),
	primary key(codigo)
);

create table clientes(
	codigo int identity,
	nombre varchar (30),
	domicilio varchar(30),
	primary key(codigo)
);

create table empleados(
	documento char(8) not null,
	nombre varchar(20),
	apellido varchar(20),
	domicilio varchar(30),
	primary key(documento)
);
go

insert into proveedores values('Bebida cola','Colon 123');
insert into proveedores values('Carnes Unica','Caseros 222');
insert into proveedores values('Lacteos Blanca','San Martin 987');
go

insert into clientes values('Supermercado Lopez','Avellaneda 34');
insert into clientes values('Almacen Anita','Colon 987');
insert into clientes values('Garcia Juan','Sucre 345');
go

insert into empleados values('23333333','Federico','Lopez','Colon 987');
insert into empleados values('28888888','Ana','Marquez','Sucre 333');
insert into empleados values('30111111','Luis','Perez','Caseros 956');
go

select nombre, domicilio from proveedores
union
select nombre, domicilio from empleados
union 
select nombre, domicilio from clientes
go


select nombre, domicilio, 'proveedor' as rol from proveedores
union
select nombre, domicilio, 'empleado' from empleados
union 
select nombre, domicilio, 'cliente'from clientes
order by rol;
go
