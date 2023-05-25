--Un videoclub almacena informaci�n sobre sus pel�culas en una tabla llamada "peliculas".
--1- Elimine la tabla si existe:
 if object_id('peliculas') is not null
  drop table peliculas;

--2- Cr�ela definiendo un campo "codigo" autoincrementable y como clave primaria:
 create table peliculas(
  codigo int identity,
  titulo varchar(40),
  actor varchar(20),
  duracion int,
  primary key(codigo)
 );

--3- Ejecute el procedimiento almacenado para visualizar la estructura de la tabla:
 exec sp_columns peliculas;

--4- Ingrese los siguientes registros:
 insert into peliculas (titulo,actor,duracion)
  values('Mision imposible','Tom Cruise',120);
 insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la piedra filosofal','Daniel R.',180);
 insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la camara secreta','Daniel R.',190);
 insert into peliculas (titulo,actor,duracion)
  values('Mision imposible 2','Tom Cruise',120);
 insert into peliculas (titulo,actor,duracion)
  values('La vida es bella','zzz',220);

--5- Seleccione todos los registros y verifique la carga autom�tica de los c�digos:
 select * from peliculas;

--6- Intente actualizar el codigo de una pel�cula (aparece un mensaje de error)
update peliculas set codigo=5 where titulo='La vida es bella';
--7- Elimine la pel�cula "La vida es bella".
delete from peliculas where titulo='La vida es bella';
--8- Ingrese un nuevo registro.
insert into peliculas(titulo, actor,duracion)
	values('The Balck Phone','Unknow',120);
--9- Visualice los registros para ver el valor almacenado en codigo (valor 6):
 select * from peliculas;
