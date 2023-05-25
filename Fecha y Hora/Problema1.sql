if object_id('alumnos') is not null
	drop table alumnos;

create table alumnos(
	apellido varchar(30),
	nombre varchar(30),
	documento char(8),
	domicilio varchar(30),
	fechaingreso datetime,
	fechanacimiento datetime
);

set dateformat 'dmy';

insert into alumnos values('Gonzalez','Ana','22222222','Colon 123','10-08-1990','15/02/1972');
insert into alumnos values('Juarez','Bernardo','25555555','Sucre 456','3-3-91','15/02/1972');
insert into alumnos values('Perez','Laura','26666666','Bulnes 345','03-03-91',null);
--insert into alumnos values('Lopez','Carlos','27777777','Sarmiento 1254','03-15-1990',null);

select * from alumnos where fechaingreso<'1-1-91';
select * from alumnos where fechanacimiento is null;
set dateformat 'mdy';

insert into alumnos values('Lopez','Carlos','27777777','Sarmiento 1254','03-15-1990',null);
