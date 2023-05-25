if object_id('entradas') is not null
	drop table entradas;

create table entradas(
	sala tinyint,
	fechahora datetime,
	capacidad smallint,
	entradasvendidas smallint,
	primary key(sala,fechahora)
);
go

insert into entradas values(1,'2006-05-10 20:00',300,50);
insert into entradas values(1,'2006-05-10 23:00',300,250);
insert into entradas values(2,'2006-05-10 20:00',400,350);
insert into entradas values(2,'2006-05-11 20:00',400,380);
insert into entradas values(2,'2006-05-11 23:00',400,400);
insert into entradas values(3,'2006-05-12 20:00',350,350);
insert into entradas values(3,'2006-05-12 22:30',350,100);
insert into entradas values(4,'2006-05-12 20:00',250,0);
go

/*Muestre, si existen, todas las funciones para la cuales hay entradas disponibles, sino un mensaje 
que indique que están agotadas.*/
select * from entradas;

if exists(select * from entradas where entradasvendidas<capacidad)
	(select * from entradas where entradasvendidas<capacidad)
else
	select 'No hay entradas disponibles';