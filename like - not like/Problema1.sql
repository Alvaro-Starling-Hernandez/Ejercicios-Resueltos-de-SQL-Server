if object_id('empleados') is not null
	drop table empleados;

create table empleados(
	nombre varchar(30),
	documento char(8),
	domicilio varchar(30),
	fechaingreso datetime,
	seccion varchar(20),
	sueldo decimal(6,2),
	primary key(documento)
);


insert into empleados
	values('Juan Perez','22333444','Colon 123','1990-10-08','Gerencia',900.50);
insert into empleados
	values('Ana Acosta','23444555','Caseros 987','1995-12-18','Secretaria',590.30);
insert into empleados
	values('Lucas Duarte','25666777','Sucre 235','2005-05-15','Sistemas',790);
insert into empleados
	values('Pamela Gonzalez','26777888','Sarmiento 873','1999-02-12','Secretaria',550);
insert into empleados
	values('Marcos Juarez','30000111','Rivadavia 801','2002-09-22','Contaduria',630.70);
insert into empleados
	values('Yolanda Perez','35111222','Colon 180','1990-10-08','Administracion',400);
insert into empleados
	values('Rodolfo Perez','35555888','Coronel Olmedo 588','1990-05-28','Sistemas',800);


select * from empleados
	where nombre like '%Perez%';

select * from empleados
	where domicilio like 'Co%8%';

select * from empleados
	where documento like '%[02468]';

select * from empleados
	where documento
	like '[^13]%'
	and nombre like '%ez';

select nombre from empleados
	where nombre like '%[yj]%';

select nombre,seccion from empleados
  where seccion like '[SG]_______';

select nombre, seccion from empleados
	where seccion like '[^SG]%';

select nombre, sueldo from empleados	
	where sueldo not like '%.00';

select * from empleados 
	where fechaingreso like '%1990%';