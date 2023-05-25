if object_id('cuentas') is not null
	drop table cuentas;

create table cuentas(
	numero int identity,
	documento char(8) not null,
	nombre varchar(30),
	saldo money
);

--insert into cuentas values(1,'25666777','Alvaro Hernandez', 50000.56);
insert into cuentas values('25666777','Alvaro Hernandez', 50000.56);
--julia 829-366-3862
--insert into cuentas values('25666778','Emely Hernandez');

--insert into cuentas (numero,documento,nombre,saldo)
--	values (5,'28999777','Luis Lopez',34000);

--insert into cuentas(documento, nombre, saldo) values('25666778','Emely Hernandez',52155,644);

--insert into cuentas(nombre, saldo) values('Emely Hernandez',52155);

select * from cuentas;