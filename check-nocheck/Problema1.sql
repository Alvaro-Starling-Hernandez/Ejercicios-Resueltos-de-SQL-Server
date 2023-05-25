if object_id('empleados') is not null
	drop table empleados;

create table empleados(
	documento varchar(8),
	nombre varchar(30),
	seccion varchar(20),
	sueldo decimal(6,2)
);

insert into empleados
	values ('22222222','Alberto Acosta','Sistemas',-10);
insert into empleados
	values ('33333333','Beatriz Benitez','Recursos',3000);
insert into empleados
	values ('34444444','Carlos Caseres','Contaduria',4000);

alter table empleados
with nocheck
add constraint CK_empleados_sueldo_positivos
check(sueldo>=0);

insert into empleados values ('35555555','Daniel Duarte','Administracion',-2000);

alter table empleados
nocheck constraint CK_empleados_sueldo_positivos;

alter table empleados
add constraint CK_empleados_seccion_valores
check(seccion in('Sistemas','Administracion','Contaduria'));

alter table empleados
with nocheck
add constraint CK_empleados_seccion_valores
check(seccion in('Sistemas','Administracion','Contaduria'));

exec sp_helpconstraint empleados;

alter table empleados
check constraint CK_empleados_sueldo_positivos;

update empleados set seccion='Recursos'
	where nombre='Carlos Caseres';

alter table empleados
nocheck constraint CK_empleados_seccion_valores;


