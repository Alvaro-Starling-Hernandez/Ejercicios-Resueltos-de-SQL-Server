if object_id('clientes') is not null
	drop table clientes;
if object_id('provincias') is not null
	drop table provincias;


 create table clientes (
	codigo int identity,
	nombre varchar(30),
	domicilio varchar(30),
	ciudad varchar(20),
	codigoprovincia tinyint,
	primary key(codigo)
 );

 create table provincias(
	codigo tinyint,
	nombre varchar(20),
	primary key (codigo)
 );
go

insert into provincias values(1,'Cordoba');
insert into provincias values(2,'Santa Fe');
insert into provincias values(3,'Misiones');
insert into provincias values(4,'Rio Negro');

insert into clientes values('Perez Juan','San Martin 123','Carlos Paz',1);
insert into clientes values('Moreno Marcos','Colon 234','Rosario',2);
insert into clientes values('Acosta Ana','Avellaneda 333','Posadas',3);
go


alter table clientes
add constraint FK_clientes_codigoprovincia
foreign key (codigoprovincia)
references provincias(codigo)
on delete no action
on update cascade;
go



