if object_id('empleados') is not null
	drop table empleados;


create table empleados(
	nombre varchar(30),
	documento varchar(8),
	sexo varchar(1),
	domicilio varchar(30),
	sueldobasico float
);		

exec sp_columns empleados;

insert into empleados(nombre, documento, sexo, domicilio, sueldobasico)
	values ('Juan Juarez','22333444','m','Sarmiento 123',500);
insert into empleados(nombre, documento, sexo, domicilio, sueldobasico)
	values ('Ana Acosta','27888999','f','Colon 134',700);	
insert into empleados(nombre, documento, sexo, domicilio, sueldobasico)
	values ('Carlos Caceres','31222333','m','Urquiza 479', 850);
	

select * from empleados;

select nombre, documento, domicilio from empleados;

select documento, sexo, sueldobasico from empleados;	