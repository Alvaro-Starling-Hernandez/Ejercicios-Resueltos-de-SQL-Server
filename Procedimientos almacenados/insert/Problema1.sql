 if object_id('alumnos') is not null
  drop table alumnos;

 create table alumnos(
  documento char(8),
  nombre varchar(40),
  nota decimal(4,2),
  primary key(documento)
 );

 insert into alumnos values ('22222222','Pedro Lopez',5);
 insert into alumnos values ('23333333','Ana Lopez',4);
 insert into alumnos values ('24444444','Maria Juarez',8);
 insert into alumnos values ('25555555','Juan Garcia',5.6);
 insert into alumnos values ('26666666','Karina Torres',2);
 insert into alumnos values ('27777777','Nora Torres',7.5);
 insert into alumnos values ('28888888','Mariano Herrero',3.5);

 if object_id('aprobados') is not null
  drop table aprobados;

 create table aprobados(
  documento char(8),
  nombre varchar(40),
  nota decimal(4,2)
 );

 if object_id('desaprobados') is not null
  drop table desaprobados;

 create table desaprobados(
  documento char(8),
  nombre varchar(40)
 );

 if object_id('pa_aprobados') is not null
  drop procedure pa_aprobados;
go

 create proc pa_aprobados
  as
  select *
   from alumnos
   where nota>=4;

 insert into aprobados exec pa_aprobados;

 select * from aprobados;

 if object_id('pa_desaprobados') is not null
  drop procedure pa_desaprobados;
  go
 create proc pa_desaprobados
  as
  select documento,nombre
   from alumnos
   where nota<4;

 insert into desaprobados exec pa_desaprobados;

 select * from desaprobados;
