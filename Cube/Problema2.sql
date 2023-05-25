if object_id('visitantes') is not null
	drop table visitantes;

create table visitantes(
	nombre varchar(30),
	edad tinyint,
	sexo char(1),
	domicilio varchar(30),
	ciudad varchar(20),
	mail varchar(30) default 'no tiene',
	montocompra decimal(6,2)
);

insert into visitantes
  values ('Susana Molina',28,'f',null,'Cordoba',null,45.50); 
 insert into visitantes
  values ('Marcela Mercado',36,'f','Avellaneda 345','Cordoba',default,22.40);
 insert into visitantes
  values ('Alberto Garcia',35,'m',default,'Alta Gracia','albertogarcia@hotmail.com',25); 
 insert into visitantes
  values ('Teresa Garcia',33,'f',default,'Alta Gracia',default,120);
 insert into visitantes
  values ('Roberto Perez',45,'m',null,'Cordoba','robertoperez@xaxamail.com',33.20);
 insert into visitantes
  values ('Marina Torres',22,'f',null,'Villa Dolores',default,95);
 insert into visitantes
  values ('Julieta Gomez',24,'f','San Martin 333','Alta Gracia','julietagomez@gmail.com',53.50);
 insert into visitantes
  values ('Roxana Lopez',20,'f','null','Alta Gracia',default,240);
 insert into visitantes
  values ('Liliana Garcia',50,'f','Paso 999','Cordoba',default,48);
 insert into visitantes
  values ('Juan Torres',43,'m','Sarmiento 876','Cordoba',null,15.30);

select sexo, ciudad, sum(montocompra) as total from visitantes
	group by sexo, ciudad
	with rollup;

select sexo, ciudad, sum(montocompra) as total from visitantes
	group by sexo, ciudad
	with cube;

select sexo, ciudad, 
	avg(edad) as promedio 
	from visitantes
	where mail is not null
	and mail <> 'no tiene'
	group by sexo, ciudad
	with rollup;

select sexo, ciudad, 
	avg(edad) as promedio 
	from visitantes
	where mail is not null
	and mail <> 'no tiene'
	group by sexo, ciudad
	with cube;

