if object_id('guardias') is not null
	drop table guardias;
if object_id('tareas') is not null
	drop table tareas;

create table guardias(
	documento char(8),
	nombre varchar(30),
	sexo char(1), /* 'f' o 'm' */
	domicilio varchar(30),
	primary key (documento)
);

create table tareas(
	codigo tinyint identity,
	domicilio varchar(30),
	descripcion varchar(30),
	horario char(2), /* 'AM' o 'PM'*/
	primary key (codigo)
);
go

insert into guardias values('22333444','Juan Perez','m','Colon 123');
insert into guardias values('24333444','Alberto Torres','m','San Martin 567');
insert into guardias values('25333444','Luis Ferreyra','m','Chacabuco 235');
insert into guardias values('23333444','Lorena Viale','f','Sarmiento 988');
insert into guardias values('26333444','Irma Gonzalez','f','Mariano Moreno 111');

insert into tareas values('Colon 1111','vigilancia exterior','AM');
insert into tareas values('Urquiza 234','vigilancia exterior','PM');
insert into tareas values('Peru 345','vigilancia interior','AM');
insert into tareas values('Avellaneda 890','vigilancia interior','PM');
go

select * from guardias cross join tareas;

select * from guardias as g cross join tareas as t
	where (g.sexo = 'f' and t.descripcion='vigilancia interior')
	or (g.sexo='m' and t.descripcion='vigilancia exterior')
go