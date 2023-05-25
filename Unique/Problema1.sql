if object_id('remis') is not null
	drop table remis;

create table remis(
	numero tinyint identity,
	patente char(6),
	marca varchar(15),
	modelo char(4)
);

insert into remis values('ABC123','Renault clio','1990');
insert into remis values('DEF456','Peugeot 504','1995');
insert into remis values('DEF456','Fiat Duna','1998');
insert into remis values('GHI789','Fiat Duna','1995');
insert into remis values(null,'Fiat Duna','1995');

delete from remis
	where marca='Peugeot 504';

alter table remis
add constraint UQ_remis_patente
unique (patente);

--insert into remis values('ABC123','Toyota','2000');


--insert into remis values(null,'Toyota','2000');

exec sp_helpconstraint remis;
