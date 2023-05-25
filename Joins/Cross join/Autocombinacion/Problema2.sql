if object_id('equipos') is not null
	drop table equipos;

create table equipos(
	nombre varchar(30),
	barrio varchar(20),
	domicilio varchar(30),
	entrenador varchar(30)
);
go

insert into equipos values('Los tigres','Gral. Paz','Sarmiento 234','Juan Lopez');
insert into equipos values('Los leones','Centro','Colon 123','Gustavo Fuentes');
insert into equipos values('Campeones','Pueyrredon','Guemes 346','Carlos Moreno');
insert into equipos values('Cebollitas','Alberdi','Colon 1234','Luis Duarte');
go

select * from equipos as e1
	cross join equipos as e2
	where e1.nombre<>e2.nombre;
go

select * from equipos as e1
	join equipos as e2
	on e1.nombre<>e2.nombre;
go

select * from equipos as e1
	cross join equipos as e2
	where e1.nombre>e2.nombre;
go


