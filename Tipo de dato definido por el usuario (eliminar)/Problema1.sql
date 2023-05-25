if object_id('empleados') is not null
	drop table empleados;

if exists (select name from systypes
	where name='tipo_year')
	exec sp_droptype tipo_year;

exec sp_addtype tipo_year,'int', 'null';
go

if object_id('RG_year') is not null
	drop rule RG_year;
go

create rule RG_year
as @year between 1990 and datepart(year,getdate());
go

exec sp_bindrule RG_year, 'tipo_year';
go

create table empleados(
	documento char(8),
	nombre varchar(30),
	yearingreso tipo_year
);
go

--insert into empleados values('22222222','Juan Lopez',1980);

insert into empleados values('22222222','Juan Lopez',2000);

--drop rule RG_year;

exec sp_unbindrule tipo_year;
go

exec sp_helpconstraint empleados;

exec sp_help tipo_year;

drop rule RG_year;
go

--exec sp_help RG_year;

insert into empleados values('22222222','Juan Lopez',1980);
go

--exec sp_droptype tipo_year;

drop table empleados;
go

exec sp_help tipo_year;
go

exec sp_droptype tipo_year;
go

--exec sp_help tipo_year;