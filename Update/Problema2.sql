if object_id('libros') is not null
	drop table libros;
	
create table libros(
	titulo varchar(30),
	autor varchar(20),
	editorial varchar(15),
	precio float
);

insert into libros(titulo, autor, editorial, precio)
	values('El aleph','Borges','Emece',25.00);
insert into libros(titulo, autor, editorial, precio)
	values('Matin Fierro','Jose Hernandez','Planeta',35.00);
insert into libros(titulo, autor, editorial, precio)
	values('Aprenda PHP','Mario Molina','Emece',45.50);
insert into libros(titulo, autor, editorial, precio)
	values('Cervantes y Quijote','Borges','Emece',25);
insert into libros(titulo, autor, editorial, precio)
	values('Matematica estas ahi','Paenza','Siglo XXI',15);

select * from libros;

update libros set autor='Adrian Paenza' where autor='Paenza';
select * from libros;
update libros set autor='Adrian Paenza' where autor='Paenza';
select * from libros;
update libros set precio=27 where autor='Mario Molina';
select * from libros;
update libros set editorial='Emece S.A.' where editorial='Emece';
select * from libros;
