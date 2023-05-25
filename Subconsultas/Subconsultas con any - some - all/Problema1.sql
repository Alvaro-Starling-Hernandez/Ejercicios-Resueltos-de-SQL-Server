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

select s.numero, s.nombre, i.deporte
	from inscriptos as i
	left join socios as s
	on i.numerosocio=s.numero;

select nombre 
	from socios
	where numero = some
	(select numerosocio from inscriptos where deporte='tenis' 
	or deporte ='natacion');
go

select deporte
	from inscriptos
	where numerosocio=1 and deporte=any
	(select deporte from inscriptos where numerosocio=2);
	
select i1.deporte,i2.numerosocio,i1.numerosocio
	from inscriptos as i1
	join inscriptos as i2
	on i1.deporte=i2.deporte
	where i1.numerosocio=1
	and i2.numerosocio=2;
go

select deporte
	from inscriptos
	where numerosocio=2 and cuotas>any
	(select cuotas from inscriptos where numerosocio=1);


select deporte
	from inscriptos
	where numerosocio=2 and cuotas>all
	(select cuotas from inscriptos where numerosocio=1);

delete from inscriptos 
	where numerosocio=any
	(select numerosocio from inscriptos where cuotas=0);

select * from inscriptos;
	