if object_id('empleados') is not null
	drop table empleados;

create table empleados(
	legajo int not null,
	documento char(7) not null,
	nombre varchar(10),
	domicilio varchar(30),
	ciudad varchar(20) default 'Buenos Aires',
	sueldo decimal(6,2),
	cantidadhijos tinyint default 0,
	primary key(legajo)
);
go

alter table empleados
alter column nombre varchar(20); 
go

exec sp_columns empleados;
go

alter table empleados
alter column documento char(8); 
go

insert into empleados values(1,'22222222','Juan Perez','Colon 123','Cordoba',500,3);
insert into empleados values(2,'30000000',null,'Sucre 456','Cordoba',600,2);
go

alter table empleados
alter column nombre varchar(30) not null;
go

delete from empleados where nombre is null;
go

alter table empleados
alter column ciudad varchar(10);
go


alter table empleados
alter column ciudad varchar(15);
go

insert into empleados values(3,'33333333','Juan Perez','Sarmiento 856',default,500,4);

--alter table empleados
--alter column legajo int identity;