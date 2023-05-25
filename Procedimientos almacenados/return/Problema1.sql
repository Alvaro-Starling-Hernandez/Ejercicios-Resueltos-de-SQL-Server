if object_id('empleados') is not null
	drop table empleados;

create table empleados(
	documento char(8),
	nombre varchar(20),
	apellido varchar(20),
	cantidadhijos tinyint,
	seccion varchar(20),
	primary key(documento)
);
go

 insert into empleados values('22222222','Juan','Perez',2,'Contaduria');
 insert into empleados values('22333333','Luis','Lopez',0,'Contaduria');
 insert into empleados values ('22444444','Marta','Perez',NULL,'Sistemas');
 insert into empleados values('22555555','Susana','Garcia',2,'Secretaria');
 insert into empleados values('22666666','Jose Maria','Morales',1,'Secretaria');
 insert into empleados values('22777777','Andres','Perez',3,'Sistemas');
 insert into empleados values('22888888','Laura','Garcia',3,'Secretaria');
go

if object_id('sp_empleados_seccion') is not null
	drop proc sp_empleados_seccion;
go

create proc sp_empleados_seccion
	@seccion varchar(20) = null
	as
	if (@seccion) is null
	begin
		select 'Debe ingresar una seccion'
		return
	end
	select * from empleados where seccion=@seccion;
go

exec sp_empleados_seccion 'Sistemas';
go

exec sp_empleados_seccion null;

if object_id('sp_actualizarhijos') is not null
	drop proc sp_actualizarhijos;
go

create procedure sp_actualizarhijos
	@documento char(8),
	@hijosnuevos tinyint
	as
	if (@documento is null) or (@hijosnuevos is null)
		return 0
	else
		begin
			update empleados set cantidadhijos=@hijosnuevos	
			where documento=@documento
			return 1
		end
go

declare @retorno int 
exec @retorno=sp_actualizarhijos '22222222',6
select @retorno as 'hijos actualizados'
go

declare @retorno int
exec @retorno=sp_actualizarhijos '22222222',6
if @retorno=1 select 'Registro actualizado'
 else select 'Registro no actualizado, se necesita un documento y la cantidad de hijos';