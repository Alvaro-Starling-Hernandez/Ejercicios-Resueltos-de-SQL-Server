if object_id('empleados') is not null
	drop table empleados;

create table empleados(
	nombre varchar(30),
	documento char(8),
	domicilio varchar(30),
	seccion varchar(20),
	sueldo decimal(6,2),
	cantidadhijos tinyint,
	fechaingreso datetime,
	primary key(documento)
);

 insert into empleados
  values('Juan Perez','22333444','Colon 123','Gerencia',5000,2,'1980-05-10');
 insert into empleados
  values('Ana Acosta','23444555','Caseros 987','Secretaria',2000,0,'1980-10-12');
 insert into empleados
  values('Lucas Duarte','25666777','Sucre 235','Sistemas',4000,1,'1985-05-25');
 insert into empleados
  values('Pamela Gonzalez','26777888','Sarmiento 873','Secretaria',2200,3,'1990-06-25');
 insert into empleados
  values('Marcos Juarez','30000111','Rivadavia 801','Contaduria',3000,0,'1996-05-01');
 insert into empleados
  values('Yolanda Perez','35111222','Colon 180','Administracion',3200,1,'1996-05-01');
 insert into empleados
  values('Rodolfo Perez','35555888','Coronel Olmedo 588','Sistemas',4000,3,'1996-05-01');
 insert into empleados
  values('Martina Rodriguez','30141414','Sarmiento 1234','Administracion',3800,4,'2000-09-01');
 insert into empleados
  values('Andres Costa','28444555',default,'Secretaria',null,null,null);

select seccion, count(*) as cantidad from empleados group by seccion;

select seccion, avg(cantidadhijos) as 'promedio de hijos' from empleados group by seccion;

select datepart(year,fechaingreso), count(*) as cantidad 
	from empleados 
	group by datepart(year,fechaingreso);

select seccion, avg(sueldo) as promedio
	from empleados
	where cantidadhijos>0
	and cantidadhijos is not null
	group by seccion;

select seccion, avg(sueldo) as promedio
	from empleados
	where cantidadhijos>0
	and cantidadhijos is not null
	group by all seccion;