if object_id('medicamentos') is not null
	drop table medicamentos;

create table medicamentos(
	codigo int identity,
	nombre varchar(20),
	laboratorio varchar(20),
	precio decimal(5,2),
	cantidad tinyint,
	primary key(codigo)	
);

insert into medicamentos
	values('Sertal','Roche',5.2,100);
insert into medicamentos
	values('Buscapina','Roche',4.10,200);
insert into medicamentos
	values('Amoxidal 500','Bayer',15.60,100);
insert into medicamentos
	values('Paracetamol 500','Bago',1.90,200);
insert into medicamentos
	values('Bayaspirina','Bayer',2.10,150); 
insert into medicamentos
	values('Amoxidal jarabe','Bayer',5.10,250); 

select codigo, nombre from medicamentos
	where (laboratorio='Roche') 
	and (precio<5);

select * from medicamentos 
	where (laboratorio='Roche') 
	or (precio<5);

select * from medicamentos
	where (not laboratorio='Bayer')
	and (cantidad=100);

select * from medicamentos
	where (laboratorio='Bayer')
	and (not cantidad=100);

delete from medicamentos
	where (laboratorio='Bayer')
	and (precio>10);

update medicamentos set cantidad=200
	where (laboratorio='Roche')
	and (precio>5);

delete from medicamentos
	where (laboratorio='Bayer')
	or (precio<3);







