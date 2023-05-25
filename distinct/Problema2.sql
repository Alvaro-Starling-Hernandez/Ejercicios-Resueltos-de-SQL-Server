if object_id('inmuebles') is not null
	drop table inmuebles;

create table inmuebles(
	documento varchar(8) not null,
	apellido varchar(30),
	nombre varchar(30),
	domicilio varchar(20),
	barrio varchar(20),
	ciudad varchar(20),
	tipo char(1),--b=baldio, e: edificado
	superficie decimal (8,2)
);

insert into inmuebles
  values ('11000000','Perez','Alberto','San Martin 800','Centro','Cordoba','e',100);
 insert into inmuebles
  values ('11000000','Perez','Alberto','Sarmiento 245','Gral. Paz','Cordoba','e',200);
 insert into inmuebles
  values ('12222222','Lopez','Maria','San Martin 202','Centro','Cordoba','e',250);
 insert into inmuebles
  values ('13333333','Garcia','Carlos','Paso 1234','Alberdi','Cordoba','b',200);
 insert into inmuebles
  values ('13333333','Garcia','Carlos','Guemes 876','Alberdi','Cordoba','b',300);
 insert into inmuebles
  values ('14444444','Perez','Mariana','Caseros 456','Flores','Cordoba','b',200);
 insert into inmuebles
  values ('15555555','Lopez','Luis','San Martin 321','Centro','Carlos Paz','e',500);
 insert into inmuebles
  values ('15555555','Lopez','Luis','Lopez y Planes 853','Flores','Carlos Paz','e',350);
 insert into inmuebles
  values ('16666666','Perez','Alberto','Sucre 1877','Flores','Cordoba','e',150);

select * from inmuebles;

select distinct apellido from inmuebles;

select distinct documento from inmuebles;

select count(distinct documento) as cantidad from inmuebles
	where ciudad='Cordoba';

select count(distinct ciudad) as cantidad
	from inmuebles
	where domicilio like '%San Martin%';

select distinct nombre, apellido from inmuebles;

select documento, 
	count(distinct barrio) as cantidad
	from inmuebles
	group by documento;