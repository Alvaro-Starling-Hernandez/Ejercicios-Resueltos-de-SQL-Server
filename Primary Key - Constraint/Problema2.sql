if object_id('remis') is not null
	drop table remis;

create table remis(
	numero tinyint identity,
	patente char(6),
	marca varchar(15),
	modelo char(4)
);

 insert into remis values('ABC123','Renault 12','1990');
 insert into remis values('DEF456','Fiat Duna','1995');

--alter table remis
--add constraint PK_remis_patente
--primary key (patente);

alter table remis
add constraint PK_remis_numero
primary key (numero);

exec sp_helpconstraint remis;





