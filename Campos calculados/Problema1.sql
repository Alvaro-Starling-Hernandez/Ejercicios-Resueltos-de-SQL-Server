if object_id('articulos') is not null
	drop table articulos;

create table articulos(
	codigo int identity,
	descripcion varchar(30),
	precio decimal(5,2) not null,
	cantidad smallint not null default 0,
	montototal as precio *cantidad
);

insert into articulos values('refresco',100,6);
insert into articulos values('birome',1.5,100);
insert into articulos values('cuaderno 12 hojas',4.8,150);
insert into articulos values('lapices x 12',5,200);

select * from articulos;

update articulos set precio=500 where descripcion='refresco';
select * from articulos;

update articulos set cantidad=10 where descripcion='refresco';
select * from articulos;

--update articulos set montototal=500 where descripcion='refresco';