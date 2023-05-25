if object_id('medicamentos') is not null
	drop table medicamentos;

create table medicamentos(
	codigo int identity,
	nombre varchar(20),
	laboratorio varchar(20),
	precio decimal(6,2),
	cantidad tinyint,
	fechavencimiento datetime not null,
	numerolote int default null,
	primary key(codigo)
);

insert into medicamentos
	values('Sertal','Roche',5.2,1,'2015-02-01',null);
insert into medicamentos 
	values('Buscapina','Roche',4.10,3,'2016-03-01',null);
insert into medicamentos 
	values('Amoxidal 500','Bayer',15.60,100,'2017-05-01',null);
insert into medicamentos
	values('Paracetamol 500','Bago',1.90,20,'2018-02-01',null);
insert into medicamentos 
	values('Bayaspirina',null,2.10,null,'2019-12-01',null); 
insert into medicamentos 
	values('Amoxidal jarabe','Bayer',null,250,'2019-12-15',null);


select count(*) from medicamentos;

select count(laboratorio) from medicamentos;

select count(precio) as precios, count(cantidad) as cantidades from medicamentos;

select count(numerolote) as numeroLote from medicamentos;