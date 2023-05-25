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
insert into empleados values('22333333','Luis','Lopez',350,0,'Contaduria');
insert into empleados values ('22444444','Marta','Perez',500,1,'Sistemas');
insert into empleados values('22555555','Susana','Garcia',null,2,'Secretaria');
insert into empleados values('22666666','Jose Maria','Morales',460,3,'Secretaria');
insert into empleados values('22777777','Andres','Perez',580,3,'Sistemas');
insert into empleados values('22888888','Laura','Garcia',400,3,'Secretaria');
go

if object_id('sp_secion') is not null
	drop proc sp_secion;
go

create proc sp_secion
	@seccion varchar(20)='%',
	@promediodesueldos decimal(6,2) output,
	@sueldo decimal(6,2) output
	as
	select @promediodesueldos = AVG(sueldo) from empleados
	where seccion like @seccion
	select @sueldo = max(sueldo) from empleados
	where seccion like @seccion;
go

declare @p decimal(6,2), @s decimal(6,2)
exec sp_secion 'Contaduria', @p output, @s output
select @p as promedio, @s as 'sueldo mayor';
go

declare @p decimal(6,2), @s decimal(6,2)
exec sp_secion default,@promediodesueldos = @p output, @sueldo = @s output
select @p as promedio, @s as 'sueldo mayor';
go

if object_id('sp_sueldototal') is not null
	drop procedure sp_sueldototal;
go

create procedure sp_sueldototal
	@documento varchar(8) = '%',
	@sueldototal decimal(6,2) output
	as
	select @sueldototal=
	case
		when sueldo<500 then sueldo+(cantidadhijos*200)
		when sueldo>=500 then sueldo+(cantidadhijos*100)
	end
	from empleados
go

declare @documento varchar(8), @sueldototal decimal(6,2);
exec sp_sueldototal '22222222',@sueldototal=@sueldototal output
select @sueldototal as 'Sueldo Total'
go

declare @documento varchar(8), @sueldototal decimal(6,2);
exec sp_sueldototal null, @sueldototal output
select @sueldototal as 'Sueldo Total'
go





	