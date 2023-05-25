if object_id('empleados') is not null
	drop table empleados;

create table empleados(
	documento char(8) not null,
	nombre varchar(10),
	domicilio varchar(30),
	ciudad varchar(20) default 'Buenos Aires'
);

alter table empleados
add legajo int identity
constraint PK_empleados_legajo primary key;

alter table empleados
add hijos tinyint
constraint CK_empleados_hijos check (hijos<=30);

alter table empleados
add sueldo decimal(6,2) not null
constraint CK_empleados_sueldo check (sueldo>=0)
constraint DF_empleados_sueldo default 0;