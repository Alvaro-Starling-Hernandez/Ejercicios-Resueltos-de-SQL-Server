if object_id('medicamentos') is not null
  drop table medicamentos;

create table medicamentos(
	codigo integer identity(10,1),
	nombre varchar(20) not null,
	laboratorio varchar(20),
	precio float,
	cantidad integer
);


insert into medicamentos (nombre, laboratorio,precio,cantidad)
   values('Sertal','Roche',5.2,100);
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Buscapina','Roche',4.10,200);
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Amoxidal 500','Bayer',15.60,100);

select * from medicamentos;

insert into medicamentos(codigo,nombre, laboratorio,precio,cantidad)
	values(5,'Aceptaminophen','Bayer',5.00,100);

set identity_insert medicamentos on;

 insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Amoxilina 500','Bayer',15.60,100);

 insert into medicamentos (codigo,nombre, laboratorio,precio,cantidad)
  values(3,'Amoxilina 1000','Bayer',20.5,100);

select ident_seed('medicamentos');

select ident_incr('medicamentos');
