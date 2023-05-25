if object_id('prestamos') is not null
	drop table prestamos;

create table prestamos(
	titulo varchar(40) not null,
	documento char(8) not null,
	fechaprestamo datetime not null,
	fechadevolucion datetime,
	devuelto char(1) default 'n'
);

insert into prestamos (titulo,documento,fechaprestamo,fechadevolucion)
	values ('Manual de 1 grado','23456789','2006-12-15','2006-12-18');
insert into prestamos (titulo,documento,fechaprestamo)
	values ('Alicia en el pais de las maravillas','23456789','2006-12-16');
insert into prestamos (titulo,documento,fechaprestamo,fechadevolucion)
	values ('El aleph','22543987','2006-12-16','2006-08-19');
insert into prestamos (titulo,documento,fechaprestamo,devuelto)
	values ('Manual de geografia 5 grado','25555666','2006-12-18','s');

select * from prestamos;

insert into prestamos
	values ('El mundo de colores', '45698753', '3-7-2023',default, default);

select * from prestamos;

--insert into prestamos default values;
--select * from prestamos;

