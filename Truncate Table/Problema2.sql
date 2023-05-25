if object_id('articulos') is not null
	drop table articulos;

create table articulos(
	codigo integer identity,
	nombre varchar(20),
	descripcion varchar(30),
	precio float
);

insert into articulos (nombre, descripcion, precio)
	values ('impresora','Epson Stylus C45',400.80);
insert into articulos (nombre, descripcion, precio)
	values ('impresora','Epson Stylus C85',500);

truncate table articulos;

insert into articulos (nombre, descripcion, precio)
	values ('monitor','Samsung 14',800);
insert into articulos (nombre, descripcion, precio)
	values ('teclado','ingles Biswal',100);
insert into articulos (nombre, descripcion, precio)
	values ('teclado','español Biswal',90);

select * from articulos;

delete from articulos;

insert into articulos (nombre, descripcion, precio)
	values ('monitor','Samsung 14',800);
insert into articulos (nombre, descripcion, precio)
	values ('teclado','ingles Biswal',100);
insert into articulos (nombre, descripcion, precio)
	values ('teclado','español Biswal',90);

 select * from articulos;