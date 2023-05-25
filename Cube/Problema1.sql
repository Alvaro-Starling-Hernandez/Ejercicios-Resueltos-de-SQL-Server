if object_id('ventas') is not null
	drop table ventas;

create table ventas(
	numero int identity,
	montocompra decimal(6,2),
	tipopago char(1),--c=contado, t=tarjeta
	vendedor varchar(30),
	primary key (numero)
);

 insert into ventas
  values(100.50,'c','Marisa Perez');
 insert into ventas
  values(200,'c','Marisa Perez');
 insert into ventas
  values(50,'t','Juan Lopez');
 insert into ventas
  values(220,'c','Juan Lopez');
 insert into ventas
  values(150,'t','Marisa Perez');
 insert into ventas
  values(550.80,'c','Marisa Perez');
 insert into ventas
  values(300,'t','Juan Lopez');
 insert into ventas
  values(25,'c','Marisa Perez');

select tipopago, vendedor, count(*) as cantidad from ventas
	group by tipopago, vendedor
	with rollup;

select tipopago, vendedor, count(*) as cantidad from ventas
	group by tipopago, vendedor
	with cube;