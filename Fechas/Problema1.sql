if object_id('empleados') is not null
	drop table empleados;

create table empleados(
	nombre varchar(30) not null,
	apellido varchar(20) not null,
	documento char(8),
	fechanacimiento datetime,
	fechaingreso datetime,
	sueldo decimal(6,2),
	primary key(documento)
);

insert into empleados values('Ana','Acosta','22222222','1970/10/10','1995/05/05',228.50);
insert into empleados values('Carlos','Caseres','25555555','1978/02/06','1998/05/05',309);
insert into empleados values('Francisco','Garcia','26666666','1978/10/15','1998/10/02',250.68);
insert into empleados values('Gabriela','Garcia','30000000','1985/10/25','2000/12/22',300.25);
insert into empleados values('Luis','Lopez','31111111','1987/02/10','2000/08/21',350.98);

select nombre+SPACE(1)+upper(apellido) as nombre,
	 'DNI Nº '+documento as documento,
	 '$ '+str(sueldo,len(sueldo),2) as sueldo
	 from empleados;

select documento, stuff(ceiling(sueldo),1,0,'$') from empleados;

select documento, nombre from empleados where datename(month,fechanacimiento)='october';

select  nombre, apellido from empleados where datepart(year,fechaingreso)='1998';
