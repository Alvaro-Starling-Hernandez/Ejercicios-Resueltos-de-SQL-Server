if object_id('empleados') is not null
	drop table empleados;

create table empleados(
	documento char(8) not null,
	nombre varchar(30) not null,
	sexo char(1),
	fechanacimiento datetime,
	sueldo decimal(5,2),
	primary key(documento)
);
go

insert into empleados values ('22333111','Juan Perez','m','1970-05-10',550);
insert into empleados values ('25444444','Susana Morales','f','1975-11-06',650);
insert into empleados values ('20111222','Hector Pereyra','m','1965-03-25',510);
insert into empleados values ('30000222','Luis LUque','m','1980-03-29',700);
insert into empleados values ('20555444','Laura Torres','f','1965-12-22',400);
insert into empleados values ('30000234','Alberto Soto','m','1989-10-10',420);
insert into empleados values ('20125478','Ana Gomez','f','1976-09-21',350);
insert into empleados values ('24154269','Ofelia Garcia','f','1974-05-12',390);
insert into empleados values ('30415426','Oscar Torres','m','1978-05-02',400);
go

/*Es política de la empresa festejar cada fin de mes, los cumpleaños de todos los empleados que 
cumplen ese mes. Si los empleados son de sexo femenino, se les regala un ramo de rosas, si son de 
sexo masculino, una corbata. La secretaria de la Gerencia necesita saber cuántos ramos de rosas y 
cuántas corbatas debe comprar para el mes de mayo.*/

if exists (select * from empleados where datepart(month,fechanacimiento)=5)
	(select sexo, count(*) as cantidad 
		from empleados where datepart(month,fechanacimiento)=5
		group by sexo)
else
	select 'No hay empleados que nacieron en mayo';
