if object_id('cuentas') is not null
	drop table cuentas;

create table cuentas(
	numero int not null,
	documento char(8) not null,
	nombre varchar(30),
	saldo money
	primary key(numero)
);

insert into cuentas(numero,documento,nombre,saldo)
	values('1234','25666777','Pedro Perez',500000.60);
insert into cuentas(numero,documento,nombre,saldo)
	values('2234','27888999','Juan Lopez',-250000);
insert into cuentas(numero,documento,nombre,saldo)
	values('3344','27888999','Juan Lopez',4000.50);
insert into cuentas(numero,documento,nombre,saldo)
	values('3346','32111222','Susana Molina',1000);

select * from cuentas where saldo>4000;

select numero, saldo from cuentas where nombre='Juan Lopez';

select * from cuentas where saldo<0;

select * from cuentas where numero>=3000;
