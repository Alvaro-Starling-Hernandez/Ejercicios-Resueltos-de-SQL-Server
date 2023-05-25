if object_id('empleados')  is not null
	drop table empleados;

create table empleados(
	documento char(8) not null,
	nombre varchar(30),
	fechanacimiento datetime,
	fechaingreso datetime,
	telefono char(12),
	mail varchar(50)
);
go

insert into empleados values('22222222', 'Ana Acosta', '1970/10/02', '1995/10/10', '4556677', 'anitaacosta@hotmail.com');
insert into empleados values('25555555', 'Bernardo Bustos', '1973/01/15', '1999/02/15', '4789012', null);
insert into empleados values('30000000', 'Carlos Caseros', '1980/5/25', '2001/05/05', null, null);
insert into empleados values('32222222', 'Estela Esper', '1985/02/20', '2006/12/12', null, 'estelaesper@gmail.com');
go

if object_id('f_edad') is not null
	drop function f_edad;
go

create function f_edad
	(@fechaActual datetime,
	@fecha2 datetime)
	returns tinyint
	as
	begin
		declare @edad int
		set @edad=null
		if(@fechaActual>=@fecha2)
		begin
			set @edad=datepart(year,@fechaactual)-datepart(year,@fecha2)
			if (datepart(month,@fecha2)>datepart(month,@fechaactual))
				set @edad=@edad-1
			else 
			if (datepart(month,@fecha2)=datepart(month,@fechaactual)) and 
			(datepart(day,@fecha2)>datepart(day,@fechaactual))
				set @edad=@edad-1
		end
		return @edad
	end;
go

select nombre, dbo.f_edad(getdate(),fechanacimiento) as edad from empleados;
go

declare @edad tinyint
set @edad = dbo.f_edad(getdate(),'2000/12/24')
select rtrim(@edad)+' años' as edad
go

if object_id('f_valorNulo') is not null
	drop function f_valorNulo;
go

create function f_valorNulo
	(@valor varchar(50))
	returns varchar(50)
	as
	begin
		if @valor is null
			set @valor='No tiene'
		return @valor
	end;
go

select documento,nombre,fechanacimiento,
	dbo.f_valorNulo(telefono) as telefono,
	dbo.f_valorNulo(mail) as mail
	from empleados;


