if object_id('empleados') is not null
	drop table empleados;
if object_id('sucursales') is not null
	drop table sucursales;

create table sucursales(
	codigo int identity,
	ciudad varchar(30) not null,
	primary key(codigo)
);

create table empleados(
	documento char(8) not null,
	nombre varchar(30) not null,
	domicilio varchar(30),
	seccion varchar(20),
	sueldo decimal(6,2),
	codigosucursal int,
	primary key(documento),
	constraint FK_empleados_sucursal
	foreign key (codigosucursal)
	references sucursales(codigo)
	on update cascade
);
go

 insert into sucursales values('Cordoba');
 insert into sucursales values('Villa Maria');
 insert into sucursales values('Carlos Paz');
 insert into sucursales values('Cruz del Eje');

 insert into empleados values('22222222','Ana Acosta','Avellaneda 111','Secretaria',500,1);
 insert into empleados values('23333333','Carlos Caseros','Colon 222','Sistemas',800,1);
 insert into empleados values('24444444','Diana Dominguez','Dinamarca 333','Secretaria',550,2);
 insert into empleados values('25555555','Fabiola Fuentes','Francia 444','Sistemas',750,2);
 insert into empleados values('26666666','Gabriela Gonzalez','Guemes 555','Secretaria',580,3);
 insert into empleados values('27777777','Juan Juarez','Jujuy 777','Secretaria',500,4);
 insert into empleados values('28888888','Luis Lopez','Lules 888','Sistemas',780,4);
 insert into empleados values('29999999','Maria Morales','Marina 999','Contaduria',670,4);
 go

 select * from sucursales;
 select * from empleados;
 go

 select e.*, s.ciudad
	from empleados as e
	join sucursales as s
	on e.codigosucursal=s.codigo;
go

if object_id('secciones') is not null
	drop table secciones;

select distinct seccion into secciones from empleados;
go

select * from secciones;
go

if object_id('sueldosxseccion') is not null
	drop table sueldosxseccion;

select seccion, sum(sueldo) as total into sueldosxseccion
	from empleados
	group by seccion;

select * from sueldosxseccion;
go

if object_id('maximossueldos') is not null
	drop table maximossueldos;

select top 3 * into maximossueldos
	from empleados
	order by sueldo desc;

select * from maximossueldos;
go

if object_id('sucursalcordoba') is not null
	drop table sucursalcordoba;

select e.nombre, e.seccion into sucursalcordoba
	from empleados as e
	join sucursales as s
	on e.codigosucursal=s.codigo
	where s.ciudad='Cordoba';

select * from sucursalcordoba;
go