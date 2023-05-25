if object_id('empleados') is not null
	drop table empleados;

create table empleados(
	documento char(8),
	nombre varchar(20),
	apellido varchar(20),
	sueldo decimal(6,2),
	cantidadhijos tinyint,
	seccion varchar(20),
	primary key(documento)
);
go

insert into empleados values('22222222','Juan','Perez',300,2,'Contaduria');
insert into empleados values('22333333','Luis','Lopez',300,0,'Contaduria');
insert into empleados values ('22444444','Marta','Perez',500,1,'Sistemas');
insert into empleados values('22555555','Susana','Garcia',400,2,'Secretaria');
insert into empleados values('22666666','Jose Maria','Morales',400,3,'Secretaria');
go

if object_id('sp_empleados_sueldo') is not null
	drop procedure sp_empleados_sueldo;
go

create procedure sp_empleados_sueldo
	@sueldo decimal(6,2)
	as
	select nombre, apellido, sueldo from empleados
	where sueldo >= @sueldo;
go

exec sp_empleados_sueldo 500;
exec sp_empleados_sueldo 400;
go

--exec sp_empleados_sueldo;

if object_id('sp_empleados_actualizar_sueldo') is not null
	drop procedure sp_empleados_actualizar_sueldo;
go

create procedure sp_empleados_actualizar_sueldo
	@sueldo decimal(6,2),
	@valor decimal(6,2)
	as
	update empleados set sueldo=@valor where sueldo=@sueldo;
go

exec sp_empleados_actualizar_sueldo 300,350;
select * from empleados;

exec sp_empleados_actualizar_sueldo @valor=300,@sueldo=350;
select * from empleados;

if object_id('sp_sueldototal') is not null
	drop procedure sp_sueldototal;
go

/*Cree un procedimiento llamado "pa_sueldototal" que reciba el documento de un empleado y 
muestre su nombre, apellido y el sueldo total (resultado de la suma del sueldo y salario por hijo,
que es de $200 si el sueldo es menor a $500 y $100, si el sueldo es mayor o igual a $500). 
Coloque como valor por defecto para el parámetro el patrón "%".*/
create procedure sp_sueldototal
	@documento varchar(8) = '%'
	as
	select nombre, apellido, 
	sueldototal=
		case
			when sueldo<500 then sueldo+(cantidadhijos*200)
			when sueldo>=500 then sueldo+(cantidadhijos*100)
		end
	from empleados
	where documento like @documento;
go

 exec sp_sueldototal '22333333';
 exec sp_sueldototal '22444444';
 exec sp_sueldototal '22666666';

 exec sp_sueldototal;