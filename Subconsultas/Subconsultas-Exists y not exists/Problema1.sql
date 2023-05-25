if object_id('inscriptos') is not null
	drop table inscriptos;
if object_id('socios') is not null
	drop table socios;

create table socios(
	numero int identity,
	documento char(8),
	nombre varchar(30),
	domicilio varchar(30),
	primary key (numero)
);
 
create table inscriptos (
	numerosocio int not null,
	deporte varchar(20) not null,
	cuotas tinyint
	constraint CK_inscriptos_cuotas
	check (cuotas>=0 and cuotas<=10)
	constraint DF_inscriptos_cuotas default 0,
	primary key(numerosocio,deporte),
	constraint FK_inscriptos_socio
	foreign key (numerosocio)
	references socios(numero)
	on update cascade
	on delete cascade,
);
go

 insert into socios values('23333333','Alberto Paredes','Colon 111');
 insert into socios values('24444444','Carlos Conte','Sarmiento 755');
 insert into socios values('25555555','Fabian Fuentes','Caseros 987');
 insert into socios values('26666666','Hector Lopez','Sucre 344');

 insert into inscriptos values(1,'tenis',1);
 insert into inscriptos values(1,'basquet',2);
 insert into inscriptos values(1,'natacion',1);
 insert into inscriptos values(2,'tenis',9);
 insert into inscriptos values(2,'natacion',1);
 insert into inscriptos values(2,'basquet',default);
 insert into inscriptos values(2,'futbol',2);
 insert into inscriptos values(3,'tenis',8);
 insert into inscriptos values(3,'basquet',9);
 insert into inscriptos values(3,'natacion',0);
 insert into inscriptos values(4,'basquet',10);
 go


select s.* from socios as s
	where exists (
		select * from inscriptos as i
			where s.numero=i.numerosocio
			and i.deporte='natacion'
);


select s.* from socios as s
	where not exists (
		select * from inscriptos as i
			where s.numero=i.numerosocio
			and i.deporte='natacion'
);


select s.* from socios as s
	where exists (
		select * from inscriptos as i
			where s.numero=i.numerosocio
			and i.cuotas=10
);

