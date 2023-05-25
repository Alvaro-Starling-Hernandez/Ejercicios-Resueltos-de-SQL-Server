if object_id('clientes') is not null
	drop table clientes;

create table clientes(
	codigo int not null,
	nombre varchar(30),
	domicilio varchar(30),
	ciudad varchar(20),
	referenciadopor int,
	primary key(codigo)
);
go

insert into clientes values (50,'Juan Perez','Sucre 123','Cordoba',null);
insert into clientes values(90,'Marta Juarez','Colon 345','Carlos Paz',null);
insert into clientes values(110,'Fabian Torres','San Martin 987','Cordoba',50);
insert into clientes values(125,'Susana Garcia','Colon 122','Carlos Paz',90);
go

alter table clientes
add constraint FK_clientes_referenciadopor
foreign key(referenciadopor)
references clientes(codigo);
go

insert into clientes values(135,'S
usana Garcia','Colon 122','Carlos Paz',110);
go

update clientes set codigo=145 where codigo=135;
go 

delete from clientes 
where codigo=145
go

