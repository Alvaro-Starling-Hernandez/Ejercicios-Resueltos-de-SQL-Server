if object_id('notas') is not null
	drop table notas;

create table notas(
	documento char(8) not null,
	materia varchar(30),
	nota decimal(4,2)
);

insert into notas values ('22333444','Programacion',8);
insert into notas values ('22333444','Programacion',9);
insert into notas values ('22333444','Ingles',8);
insert into notas values ('22333444','Ingles',7);
insert into notas values ('22333444','Ingles',6);
insert into notas values ('22333444','Sistemas de datos',10);
insert into notas values ('22333444','Sistemas de datos',9);

insert into notas values ('23444555','Programacion',5);
insert into notas values ('23444555','Programacion',4);
insert into notas values ('23444555','Programacion',3);
insert into notas values ('23444555','Ingles',9);
insert into notas values ('23444555','Ingles',7);
insert into notas values ('23444555','Sistemas de datos',9);

insert into notas values ('24555666','Programacion',1);
insert into notas values ('24555666','Programacion',3.5);
insert into notas values ('24555666','Ingles',4.5);
insert into notas values ('24555666','Sistemas de datos',6);

select documento, materia, avg(nota) as promedio from notas
	group by documento, materia
	with rollup;

select documento, avg(nota) as notas from notas
	group by documento
	with rollup;

select documento, materia, count(nota) as cantidad from notas
	group by documento, materia;

select documento, materia, count(nota) as cantidad from notas
	group by documento, materia
	with rollup;

select documento, max(nota) as mayor, min(nota) as menor from notas
	group by documento
	with rollup;

