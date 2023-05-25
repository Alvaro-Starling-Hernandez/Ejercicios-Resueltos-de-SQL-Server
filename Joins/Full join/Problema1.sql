if (object_id('deportes')) is not null
	drop table deportes;
if (object_id('inscriptos')) is not null
	drop table inscriptos;

create table deportes(
	codigo tinyint identity,
	nombre varchar(30),
	profesor varchar(30),
	primary key (codigo)
);

create table inscriptos(
	documento char(8),
	codigodeporte tinyint not null,
	matricula char(1) --'s'=paga 'n'=impaga
);
go

insert into deportes values('tenis','Marcelo Roca');
insert into deportes values('natacion','Marta Torres');
insert into deportes values('basquet','Luis Garcia');
insert into deportes values('futbol','Marcelo Roca');
 
insert into inscriptos values('22222222',3,'s');
insert into inscriptos values('23333333',3,'s');
insert into inscriptos values('24444444',3,'n');
insert into inscriptos values('22222222',2,'s');
insert into inscriptos values('23333333',2,'s');
insert into inscriptos values('22222222',4,'n'); 
insert into inscriptos values('22222222',5,'n');
go

select ins.documento, ins.matricula, d.nombre
	from inscriptos as ins
	join deportes as d
	on ins.codigodeporte=d.codigo;
go

select ins.documento, ins.matricula, d.nombre
	from inscriptos as ins
	left join deportes as d
	on ins.codigodeporte=d.codigo;
go

select ins.documento, ins.matricula, d.nombre
	from deportes as d
	right join inscriptos as ins
	on ins.codigodeporte=d.codigo;
go


select i.documento, i.matricula, d.nombre
	from inscriptos as i
	left join deportes as d
	on i.codigodeporte=d.codigo
	where d.codigo is null;
go

select i.documento, d.nombre
	from deportes as d
	right join inscriptos as i
	on i.codigodeporte=d.codigo
	where d.codigo is null;
go

select ins.documento, ins.matricula, d.nombre
	from inscriptos as ins
	full join deportes as d
	on ins.codigodeporte=d.codigo;
go



