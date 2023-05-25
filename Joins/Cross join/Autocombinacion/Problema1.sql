if object_id('clientes') is not null
	drop table clientes

create table clientes(
	nombre varchar(30),
	sexo char(1),--'f'=femenino, 'm'=masculino
	edad int,
	domicilio varchar(30)
);
go

insert into clientes values('Maria Lopez','f',45,'Colon 123');
insert into clientes values('Liliana Garcia','f',35,'Sucre 456');
insert into clientes values('Susana Lopez','f',41,'Avellaneda 98');
insert into clientes values('Juan Torres','m',44,'Sarmiento 755');
insert into clientes values('Marcelo Oliva','m',56,'San Martin 874');
insert into clientes values('Federico Pereyra','m',38,'Colon 234');
insert into clientes values('Juan Garcia','m',50,'Peru 333');
go

select * from clientes as c1
	cross join clientes as c2
	where c1.sexo='m' and c2.sexo='f';
go

select * from clientes as c1
	join clientes as c2
	on c1.nombre<>c2.nombre
	where c1.sexo='m' and c2.sexo='f';
go

select * from clientes as c1
	join clientes as c2
	on c1.nombre<>c2.nombre
	where (c1.sexo='m' and c2.sexo='f')
	and (c1.edad-c2.edad between -5 and 5);
go