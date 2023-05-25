if object_id('consultas') is not null
	drop table consultas;
if object_id('medicos') is not null
	drop table medicos;

create table medicos(
	documento char(8) not null,
	nombre varchar(30),
	constraint PK_medicos 
	primary key clustered (documento)
);

create table consultas(
	fecha datetime,
	medico char(8) not null,
	paciente varchar(30),
	constraint PK_consultas
	primary key (fecha,medico),
	constraint FK_consultas_medico
	foreign key (medico)
	references medicos(documento)
	on update cascade
	on delete cascade
);
go

insert into medicos values('22222222','Alfredo Acosta');
insert into medicos values('23333333','Pedro Perez');
insert into medicos values('24444444','Marcela Morales');

insert into consultas values('2007/03/26 8:00','22222222','Juan Juarez');
insert into consultas values('2007/03/26 8:00','23333333','Gaston Gomez');
insert into consultas values('2007/03/26 8:30','22222222','Nora Norte');
insert into consultas values('2007/03/28 9:00','22222222','Juan Juarez');
insert into consultas values('2007/03/29 8:00','24444444','Nora Norte');
insert into consultas values('2007/03/24 8:30','22222222','Hector Huerta'); 
insert into consultas values('2007/03/24 9:30','23333333','Hector Huerta');
go

if object_id('f_nombreDia') is not null
	drop function f_nombreDia;
go

create function f_nombreDia
	(@fecha varchar (25))
	returns varchar(25)
	as
	begin
		declare @nombre varchar(25)
		set @nombre='Fecha invalida'
		if(isdate(@fecha)=1)
			begin
				set @fecha=cast(@fecha as datetime)
				set @nombre=
				case datename(weekday,@fecha)
				when 'Monday' then 'Lunes'
				when 'Tuesday' then 'Martes'
				when 'Wednesday' then 'Miercoles'
				when 'Thursday' then 'Jueves'
				when 'Friday' then 'Viernes'
				when 'Saturday' then 'Sabado'
				when 'Sunday' then 'Domingo'
				end
			end
		return @nombre
	end;
go

if object_id('f_horario') is not null
	drop function f_horario;
go

create function f_horario
	(@fecha varchar (30))
	returns varchar (10)
	as
	begin
		declare @nombre varchar(20)
		set @nombre='Fecha invalida'
		if(isdate(@fecha)=1)
		begin
			set @fecha=cast(@fecha as datetime)
			set @nombre=rtrim(cast(datepart(hour,@fecha) as char(2)))+':'
			set @nombre=@nombre+rtrim(cast(datepart(minute,@fecha) as char(2)))
		end
		return @nombre
	end;
go

if object_id('f_fecha') is not null
	drop function f_fecha
go

create function f_fecha
	(@fecha varchar(30))
	returns varchar(15)
	as
	begin
		declare @nombre varchar(30)
		set @nombre='Fecha invalida'
		if (isdate(@fecha)=1)
		begin
			set @fecha=cast(@fecha as datetime)
			set @nombre=rtrim(cast(datepart(day,@fecha) as char(2)))+'/'
			set @nombre=@nombre+rtrim(cast(datepart(month,@fecha) as char(2)))+'/'
			set @nombre=@nombre+rtrim(cast(datepart(year,@fecha) as char(4)))
		end
		return @nombre
	end;
go

select dbo.f_nombreDia(fecha) as Dia, dbo.f_fecha(fecha) as Fecha,
	dbo.f_horario(fecha) as Horario, paciente
	from consultas as c
	join medicos as m
	on c.medico=m.documento
	where m.nombre='Alfredo Acosta';

go

select dbo.f_fecha(fecha) as fecha, nombre
	from consultas as c
	join medicos as m
	on m.documento=c.medico
	where dbo.f_nombreDia(fecha)='Sabado'
go

declare @valor char(30)
set @valor=getdate()
select dbo.f_nombreDia(@valor) as 'Dia de hoy';
go