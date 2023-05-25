if object_id('consultas') is not null
	drop table consultas;

create table consultas(
	fechayhora datetime not null,
	medico varchar(30) not null, 
	documento char(8) not null, 
	paciente varchar(30), 
	obrasocial varchar(30),
	primary key (fechayhora, medico)
);


insert into consultas
	values ('2006/11/05 8:00','Lopez','12222222','Acosta Betina','PAMI');

insert into consultas
	values ('2006/11/05 8:30','Lopez','23333333','Fuentes Carlos','PAMI');

insert into consultas
	values ('2006/11/05 8:00','Perez','34444444','Garcia Marisa','IPAM');

insert into consultas
	values ('2006/11/05 8:00','Duarte','45555555','Pereyra Luis','PAMI');

insert into consultas
	values ('2006/11/05 8:00','Perez','23333333','Fuentes Carlos','PAMI');