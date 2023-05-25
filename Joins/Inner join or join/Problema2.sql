if object_id('inscriptos') is not null
	drop table inscriptos;

if object_id('inasistencias') is not null
	drop table inasistencias;

create table inscriptos(
	nombre varchar(30),
	documento char(8),
	deporte varchar(15),
	matricula char(1), --'s'=paga 'n'=impaga
	primary key(documento,deporte)
);

create table inasistencias(
	documento char(8),
	deporte varchar(15),
	fecha datetime
);
go

insert into inscriptos values('Juan Perez','22222222','tenis','s');
insert into inscriptos values('Maria Lopez','23333333','tenis','s');
insert into inscriptos values('Agustin Juarez','24444444','tenis','n');
insert into inscriptos values('Marta Garcia','25555555','natacion','s');
insert into inscriptos values('Juan Perez','22222222','natacion','s');
insert into inscriptos values('Maria Lopez','23333333','natacion','n');

insert into inasistencias values('22222222','tenis','2006-12-01');
insert into inasistencias values('22222222','tenis','2006-12-08');
insert into inasistencias values('23333333','tenis','2006-12-01');
insert into inasistencias values('24444444','tenis','2006-12-08');
insert into inasistencias values('22222222','natacion','2006-12-02');
insert into inasistencias values('23333333','natacion','2006-12-02');
go

select ins.nombre, ins.deporte, ina.fecha
	from inscriptos as ins
	join inasistencias as ina
	on ins.documento = ina.documento
	and ins.deporte = ina.deporte
	order by ins.nombre, ins.deporte;
go

select ins.nombre, ins.deporte, ina.fecha
	from inscriptos as ins
	join inasistencias as ina
	on ins.documento = ina.documento
	and ins.deporte = ina.deporte
	where ina.deporte = 'tenis'
	and ins.nombre = 'Juan Perez'
	order by ins.nombre, ins.deporte;
go

select ins.nombre, ins.deporte, ina.fecha
	from inscriptos as ins
	join inasistencias as ina
	on ins.documento = ina.documento
	and ins.deporte = ina.deporte
	where ins.matricula = 's'
	order by ins.nombre, ins.deporte;
go


