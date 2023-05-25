if object_id('articulos') is not null
	drop table articulos
go

create table articulos(
	codigo int identity,
	tipo varchar(30),
	descripcion varchar(40),
	precio decimal(8,2),
	stock int,
	constraint PK_articulos primary key (codigo)
);
go

insert into articulos values ('impresora','Epson Stylus C45',400,100);
insert into articulos values ('impresora','Epson Stylus C85',500,200);
insert into articulos values ('impresora','Epson Stylus Color 600',400,0);
insert into articulos values ('monitor','Samsung 14',900,0);
insert into articulos values ('monitor','Samsung 17',1200,0);
insert into articulos values ('monitor','xxx 15',1500,0);
insert into articulos values ('monitor','xxx 17',1600,0);
insert into articulos values ('monitor','zzz 15',1300,0);
go

create trigger Dis_articulos_deleted
	on articulos
	for delete
	as
	if(select stock from deleted)>0
	begin
	raiserror('Este articulo todavia esta en stock',16,1)
	rollback transaction
	end
go

delete from articulos where precio=1500;

--delete from articulos where codigo=1;


--delete from articulos where codigo>=7;

--delete from articulos where codigo>=2;