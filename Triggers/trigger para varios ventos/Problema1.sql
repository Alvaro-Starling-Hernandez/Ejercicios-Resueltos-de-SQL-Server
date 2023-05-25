if object_id('empleados') is not null
	drop table empleados;
if object_id('sucursales') is not null
	drop table sucursales;
go

create table sucursales(
	codigo int identity,
	domicilio varchar(30),
	constraint PK_sucursales primary key (codigo)
);

create table empleados(
	documento char(8) not null,
	nombre varchar(30),
	domicilio varchar(30),
	sucursal int not null,
	constraint PK_empleados primary key (documento),
	constraint FK_empleados_sucursal foreign key(sucursal)
	references sucursales(codigo)
);
go

insert into sucursales values ('Colon 123');
insert into sucursales values ('Sucre 234');
insert into sucursales values ('Rivadavia 345');

insert into empleados values ('22222222','Ana Acosta','Avellaneda 1258',1);
insert into empleados values ('23333333','Betina Bustos','Bulnes 345',2);
insert into empleados values ('24444444','Carlos Caseres','Caseros 948',3);
insert into empleados values ('25555555','Fabian Fuentes','Francia 845',1);
insert into empleados values ('26666666','Gustavo Garcia','Guemes 587',2);
insert into empleados values ('27777777','Maria Morales','Maipu 643',3);
go

create trigger DIS_empleados_insertm_delete_update
	on empleados
	for insert,delete,update
	as
	if (exists(select * from inserted where sucursal=1) or
		exists(select * from deleted where sucursal=1))
		begin
			raiserror('No se pueden actualizar empleados que pertenecen a la sucursal 1',16,1)
			rollback transaction
		end
go

insert into empleados values('00000000','Alvaro','San francisco',3);
--insert into empleados values('00000001','Alvaro Starling','San francisco',1);
delete from empleados where documento='00000000';

--delete from empleados where documento='22222222';
--delete from empleados where sucursal=1;