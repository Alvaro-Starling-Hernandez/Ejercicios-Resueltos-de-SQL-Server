if object_id('visitantes') is not null
	drop table visitantes;

create table visitantes(
	nombre varchar(30),
	edad tinyint,
	sexo char(1) default 'f',
	domicilio varchar(30),
	ciudad varchar(20) default 'Cordoba',
	telefono varchar(11),
	mail varchar(30) default 'no tiene',
	montocompra decimal (6,2)
);

 insert into visitantes
  values ('Susana Molina',35,default,'Colon 123',default,null,null,59.80);
 insert into visitantes
  values ('Marcos Torres',29,'m',default,'Carlos Paz',default,'marcostorres@hotmail.com',150.50);
 insert into visitantes
  values ('Mariana Juarez',45,default,default,'Carlos Paz',null,default,23.90);
 insert into visitantes (nombre, edad,sexo,telefono, mail)
  values ('Fabian Perez',36,'m','4556677','fabianperez@xaxamail.com');
 insert into visitantes (nombre, ciudad, montocompra)
  values ('Alejandra Gonzalez','La Falda',280.50);
 insert into visitantes (nombre, edad,sexo, ciudad, mail,montocompra)
  values ('Gaston Perez',29,'m','Carlos Paz','gastonperez1@gmail.com',95.40);
 insert into visitantes
  values ('Liliana Torres',40,default,'Sarmiento 876',default,default,default,85);
 insert into visitantes
  values ('Gabriela Duarte',21,null,null,'Rio Tercero',default,'gabrielaltorres@hotmail.com',321.50);


select ciudad, count(*) as visitantes from visitantes group by ciudad;
select ciudad, count(telefono) as visitantes from visitantes group by ciudad;

select sexo, sum(montocompra) as monto from visitantes group by sexo;

select sexo, ciudad, max(montocompra) as maximo, min(montocompra) as minimo
	from visitantes
	group by sexo, ciudad;

select ciudad, avg(montocompra) as promedio from visitantes group by ciudad;

select ciudad, count(mail) as mail from visitantes 
	where mail is not null
	and mail <> 'no tiene'
	group by ciudad;

select ciudad, count(mail) as mail from visitantes 
	where mail is not null
	and mail <> 'no tiene'
	group by all ciudad;