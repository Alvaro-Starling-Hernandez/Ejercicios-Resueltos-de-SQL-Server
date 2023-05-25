if object_id('visitantes') is not null
	drop table visitantes;

if object_id('ciudades') is not null
	drop table ciudades;

create table visitantes(
	nombre varchar(30),
	edad tinyint,
	sexo char(1) default 'f',
	domicilio varchar(30),
	codigociudad tinyint not null,
	mail varchar(30),
	montocompra decimal (6,2)
);

create table ciudades(
	codigo tinyint identity,
	nombre varchar(20)
);
GO


insert into ciudades values('Cordoba');
insert into ciudades values('Carlos Paz');
insert into ciudades values('La Falda');
insert into ciudades values('Cruz del Eje');

insert into visitantes values 
	('Susana Molina', 35,'f','Colon 123', 1, null,59.80);
insert into visitantes values 
	('Marcos Torres', 29,'m','Sucre 56', 1, 'marcostorres@hotmail.com',150.50);
insert into visitantes values 
	('Mariana Juarez', 45,'f','San Martin 111',2,null,23.90);
insert into visitantes values 
	('Fabian Perez',36,'m','Avellaneda 213',3,'fabianperez@xaxamail.com',0);
insert into visitantes values 
	('Alejandra Garcia',28,'f',null,2,null,280.50);
insert into visitantes values 
	('Gaston Perez',29,'m',null,5,'gastonperez1@gmail.com',95.40);
insert into visitantes values 
	('Mariana Juarez',33,'f',null,2,null,90);
go


select c.nombre, count(*) as 'cantidad de visistas'
	from ciudades as c
	join visitantes as v
	on v.codigociudad=c.codigo
	group by c.nombre;
go

select c.nombre,v.sexo, avg(v.montocompra) as 'promedio de compra'
	from ciudades as c
	join visitantes as v
	on v.codigociudad=c.codigo
	group by c.nombre,v.sexo;
go

select c.nombre, count(v.mail) as 'cantidad de mail'
	from ciudades as c
	join visitantes as v
	on v.codigociudad=c.codigo
	group by c.nombre;
go

select c.nombre, max(v.montocompra) as 'Monto mas alto'
	from ciudades as c
	join visitantes as v
	on v.codigociudad=c.codigo
	group by c.nombre;
go
