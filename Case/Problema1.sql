if object_id('empleados') is not null
	drop table empleados;

create table empleados(
	documento char(8) not null,
	nombre varchar(30) not null,
	sexo char(1),
	fechanacimiento datetime,
	fechaingreso datetime,
	cantidadhijos tinyint,
	sueldo decimal(5,2),
	primary key(documento)
);
go

insert into empleados 
	values ('22333111','Juan Perez','m','1970-05-10','1987-04-05',2,550);
insert into empleados 
	values ('25444444','Susana Morales','f','1975-11-06','1990-04-06',0,650);
insert into empleados 
	values ('20111222','Hector Pereyra','m','1965-03-25','1997-04-12',3,510);
insert into empleados 
	values ('30000222','Luis LUque','m','1980-03-29','1999-11-06',1,700);
insert into empleados 
	values ('20555444','Laura Torres','f','1965-12-22','2003-11-06',3,400);
insert into empleados 
	values ('30000234','Alberto Soto','m','1989-10-10','1999-11-06',2,420);
insert into empleados 
	values ('20125478','Ana Gomez','f','1976-09-21','1998-11-06',3,350);
insert into empleados 
	values ('24154269','Ofelia Garcia','f','1974-05-12','1990-11-06',0,390);
insert into empleados 
	values ('30415426','Oscar Torres','m','1978-05-02','1997-11-06',1,400);
go

/*Es pol�tica de la empresa festejar cada fin de mes, los cumplea�os de todos los empleados que 
cumplen ese mes. Si los empleados son de sexo femenino, se les regala un ramo de rosas, si son de 
sexo masculino, una corbata. La secretaria de la Gerencia necesita saber cu�ntos ramos de rosas y 
cu�ntas corbatas debe comprar para el mes de mayo.*/
select * from empleados;

select sexo, count(*) as cantidad, 
	regalo = 
	case
		when sexo='m' then 'corbata'
		else 'rosas'
	end
	from empleados 
	where datepart(month,fechanacimiento)=5
	group by sexo;

/*Adem�s, si el empleado cumple 10,20,30,40... a�os de servicio, se le regala una placa 
recordatoria. La secretaria de Gerencia necesita saber la cantidad de a�os de servicio que cumplen 
los empleados que ingresaron en el mes de abril para encargar dichas placas.*/

select *,(datepart(year,getdate())-datepart(YEAR,fechaingreso)) as anosDeServicio,
	tienePlaca =
	case (datepart(year,getdate())-datepart(YEAR,fechaingreso)) % 10
		when 0  then 'si'
		else 'no'
	end
	from empleados
	where datepart(month,fechaingreso)=4;

/*La empresa paga un sueldo adicional por hijos a cargos. Para un sueldo menor o igual a $500 el 
salario familiar por hijo es de $200, para un sueldo superior, el monto es de $100 por hijo. Muestre 
el nombre del empleado, el sueldo b�sico, la cantidad de hijos a cargo, el valor del salario por 
hijo, el valor total del salario familiar y el sueldo final con el salario familiar incluido de 
todos los empleados.*/
select nombre, sueldo, cantidadhijos, porhijo=
	case
		when sueldo<=500 then 200
		else 100
	end,
	salariofamiliar=
	case
		when sueldo<=500 then 200*cantidadhijos
		else 100*cantidadhijos
	end,
	salariototal=
	case
		when sueldo<=500 then sueldo+(200*cantidadhijos)
		else sueldo+(100*cantidadhijos)
	end
	from empleados
	order by salariototal;

