if object_id('empleados') is not null
	drop table empleados;

create table empleados(
	documento varchar(8) not null,
	nombre varchar(30),
	estadocivil char(1),--c=casado, s=soltero,v=viudo
	seccion varchar(20)
);

go

 insert into empleados
  values ('22222222','Alberto Lopez','c','Sistemas');
 insert into empleados
  values ('23333333','Beatriz Garcia','c','Administracion');
 insert into empleados
  values ('24444444','Carlos Fuentes','s','Administracion');
 insert into empleados
  values ('25555555','Daniel Garcia','s','Sistemas');
 insert into empleados
  values ('26666666','Ester Juarez','c','Sistemas');
 insert into empleados
  values ('27777777','Fabian Torres','s','Sistemas');
 insert into empleados
  values ('28888888','Gabriela Lopez',null,'Sistemas');
 insert into empleados
  values ('29999999','Hector Garcia',null,'Administracion');

select top 5 * from empleados;

select top 4 with ties nombre, seccion from empleados
	order by seccion;

select top 4 nombre, estadocivil, seccion from empleados
	order by estadocivil, seccion;

select top 4 with ties nombre, estadocivil, seccion from empleados
	order by estadocivil, seccion;

