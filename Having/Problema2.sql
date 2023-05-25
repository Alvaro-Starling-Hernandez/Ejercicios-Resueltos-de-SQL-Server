if object_id('visitantes') is not null
	drop table visitantes;

create table visitantes(
	nombre varchar(30),
	edad tinyint,
	sexo char(1),
	domicilio varchar(30),
	ciudad varchar(20),
	telefono varchar(11),
	montocompra decimal(6,2) not null
);

 insert into visitantes
  values ('Susana Molina',28,'f',null,'Cordoba',null,45.50); 
 insert into visitantes
  values ('Marcela Mercado',36,'f','Avellaneda 345','Cordoba','4545454',22.40);
 insert into visitantes
  values ('Alberto Garcia',35,'m','Gral. Paz 123','Alta Gracia','03547123456',25); 
 insert into visitantes
  values ('Teresa Garcia',33,'f',default,'Alta Gracia','03547123456',120);
 insert into visitantes
  values ('Roberto Perez',45,'m','Urquiza 335','Cordoba','4123456',33.20);
 insert into visitantes
  values ('Marina Torres',22,'f','Colon 222','Villa Dolores','03544112233',95);
 insert into visitantes
  values ('Julieta Gomez',24,'f','San Martin 333','Alta Gracia',null,53.50);
 insert into visitantes
  values ('Roxana Lopez',20,'f','null','Alta Gracia',null,240);
 insert into visitantes
  values ('Liliana Garcia',50,'f','Paso 999','Cordoba','4588778',48);
 insert into visitantes
  values ('Juan Torres',43,'m','Sarmiento 876','Cordoba',null,15.30);


select ciudad, sexo, sum(montocompra) as total from visitantes
	group by ciudad, sexo
	having sum(montocompra)>50

select ciudad, sexo, sum(montocompra) as total from visitantes
	where montocompra>5 and telefono is not null
	group by ciudad, sexo
	having ciudad <> 'Cordoba'
	order by ciudad

select ciudad, max(montocompra) as montoMayor from visitantes
	where sexo='f' and domicilio is not null
	group by ciudad
	having max(montocompra)>50

select ciudad, sexo, count(*) as visitantes, sum(montocompra) as total, avg(montocompra) as promedio
	from visitantes
	group by ciudad,sexo
	having avg(montocompra)>30
	order by total;
	