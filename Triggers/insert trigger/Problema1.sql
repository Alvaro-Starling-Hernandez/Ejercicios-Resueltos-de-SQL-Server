if object_id('empleados') is not null
	drop table empleados;
go

if object_id('secciones') is not null
	drop table secciones;
go

create table secciones(
	codigo int identity,
	nombre varchar(30),
	sueldomaximo decimal(8,2), 
	constraint PK_secciones primary key(codigo)
);

create table empleados(
	documento char(8) not null,
	nombre varchar(30) not null,
	domicilio varchar(30),
	codigoseccion int not null,
	sueldo decimal(8,2),
	constraint PK_empleados primary key(documento),
	constraint FK_empelados_seccion
	foreign key (codigoseccion) references secciones(codigo)
);
go

insert into secciones values('Administracion',1500);
insert into secciones values('Sistemas',2000);
insert into secciones values('Secretaria',1000);

insert into empleados values('22222222','Ana Acosta','Avellaneda 88',1,1100);
insert into empleados values('23333333','Bernardo Bustos','Bulnes 345',1,1200);
insert into empleados values('24444444','Carlos Caseres','Colon 674',2,1800);
insert into empleados values('25555555','Diana Duarte','Colon 873',3,1000);
go

create trigger DIS_empleados_insert
	on empleados
	for insert
	as
	declare @sueldo decimal(8,2)
	set @sueldo = (select sueldo from inserted)
	if(@sueldo>(select sueldomaximo from secciones as s
				join inserted
				on inserted.codigoseccion=s.codigo))
		begin
			raiserror('El sueldo sobrepasa la cantidad establecida en la seccion', 16,1)
			rollback transaction
		end
go

insert into empleados values ('00000000','Alvaro','Pueblo Nueno, SFM',1,1400);

select * from empleados;

--insert into empleados values ('00000001','Alvaro Luis','Pueblo Nueno, SFM',1,1600);
