if object_id('articulos') is not null
	drop table articulos;

create table articulos(
	codigo int identity,
	nombre varchar(20),
	descripcion varchar(30),
	precio smallmoney,
	cantidad tinyint default 0,
	primary key (codigo)
);

insert into articulos (nombre, descripcion, precio,cantidad)
	values ('impresora','Epson Stylus C45',400.80,20);
insert into articulos (nombre, descripcion, precio)
	values ('impresora','Epson Stylus C85',500);
insert into articulos (nombre, descripcion, precio)
	values ('monitor','Samsung 14',800);
insert into articulos (nombre, descripcion, precio,cantidad)
	values ('teclado','ingles Biswal',100,50);

update articulos set precio=precio+(precio*0.15);

select * from articulos;

select nombre+', '+descripcion from articulos;

update articulos set cantidad=cantidad-5 where nombre='teclado';

select * from articulos;

